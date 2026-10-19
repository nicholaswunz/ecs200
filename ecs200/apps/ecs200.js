// ecs200.js -------------------------------------------------------------------
// Small statistics helpers used by the interactive apps in the ECS200 workshop.
// The apps run directly in the reader's browser (Observable JS), so they load
// instantly and do not need an R server. Students do NOT need to read this file.
// -----------------------------------------------------------------------------

// ---- Colours used across the site ------------------------------------------
export const red = "#e12744";
export const grey = "#8c8c8c";
export const dark = "#222322";
export const blue = "#3e7c99";

// ---- Random numbers (seeded so "Resample" gives repeatable sequences) -------
export function rng(seed) {
  let a = (seed >>> 0) || 1;
  return function () {
    a |= 0; a = (a + 0x6d2b79f5) | 0;
    let t = Math.imul(a ^ (a >>> 15), 1 | a);
    t = (t + Math.imul(t ^ (t >>> 7), 61 | t)) ^ t;
    return ((t ^ (t >>> 14)) >>> 0) / 4294967296;
  };
}

export function rnorm(r, n, mean = 0, sd = 1) {
  const out = new Array(n);
  for (let i = 0; i < n; i++) {
    let u = 0, v = 0;
    while (u === 0) u = r();
    while (v === 0) v = r();
    out[i] = mean + sd * Math.sqrt(-2 * Math.log(u)) * Math.cos(2 * Math.PI * v);
  }
  return out;
}

export function runif(r, n, min = 0, max = 1) {
  return Array.from({ length: n }, () => min + (max - min) * r());
}

export function rexp(r, n, rate = 1) {
  return Array.from({ length: n }, () => -Math.log(1 - r()) / rate);
}

function rgamma1(r, shape) {
  // Marsaglia & Tsang (2000)
  if (shape < 1) return rgamma1(r, shape + 1) * Math.pow(r(), 1 / shape);
  const d = shape - 1 / 3, c = 1 / Math.sqrt(9 * d);
  for (;;) {
    let x, v;
    do { x = rnorm(r, 1)[0]; v = 1 + c * x; } while (v <= 0);
    v = v * v * v;
    const u = r();
    if (u < 1 - 0.0331 * x * x * x * x) return d * v;
    if (Math.log(u) < 0.5 * x * x + d * (1 - v + Math.log(v))) return d * v;
  }
}

export function rpois1(r, lambda) {
  if (lambda <= 0) return 0;
  if (lambda > 60) return Math.max(0, Math.round(lambda + Math.sqrt(lambda) * rnorm(r, 1)[0]));
  const L = Math.exp(-lambda);
  let k = 0, p = 1;
  do { k++; p *= r(); } while (p > L);
  return k - 1;
}

export function rpois(r, n, lambda) {
  return Array.from({ length: n }, () => rpois1(r, lambda));
}

// Negative binomial with mean mu and "size" k (smaller k = more overdispersed)
export function rnbinom1(r, mu, k) {
  return rpois1(r, rgamma1(r, k) * mu / k);
}

// ---- Descriptive helpers -----------------------------------------------------
export const sum = (x) => x.reduce((a, b) => a + b, 0);
export const mean = (x) => sum(x) / x.length;
export function variance(x) {
  const m = mean(x);
  return sum(x.map((v) => (v - m) ** 2)) / (x.length - 1);
}
export const sd = (x) => Math.sqrt(variance(x));
export function cor(x, y) {
  const mx = mean(x), my = mean(y);
  let sxy = 0, sxx = 0, syy = 0;
  for (let i = 0; i < x.length; i++) {
    sxy += (x[i] - mx) * (y[i] - my);
    sxx += (x[i] - mx) ** 2;
    syy += (y[i] - my) ** 2;
  }
  return sxy / Math.sqrt(sxx * syy);
}
export const fmt = (x, d = 2) => (Number.isFinite(x) ? x.toFixed(d) : "–");
// p-value with its sign, e.g. "= 0.032" or "< 0.001"
export function fmtp(p) {
  if (!Number.isFinite(p)) return "–";
  return p < 0.001 ? "< 0.001" : "= " + p.toFixed(3);
}

// ---- Distribution functions ---------------------------------------------------
function lngamma(z) {
  const g = 7;
  const c = [0.99999999999980993, 676.5203681218851, -1259.1392167224028,
    771.32342877765313, -176.61502916214059, 12.507343278686905,
    -0.13857109526572012, 9.9843695780195716e-6, 1.5056327351493116e-7];
  if (z < 0.5) return Math.log(Math.PI / Math.sin(Math.PI * z)) - lngamma(1 - z);
  z -= 1;
  let x = c[0];
  for (let i = 1; i < g + 2; i++) x += c[i] / (z + i);
  const t = z + g + 0.5;
  return 0.5 * Math.log(2 * Math.PI) + (z + 0.5) * Math.log(t) - t + Math.log(x);
}

function betacf(a, b, x) {
  const MAXIT = 300, EPS = 3e-14, FPMIN = 1e-300;
  let qab = a + b, qap = a + 1, qam = a - 1, c = 1, d = 1 - qab * x / qap;
  if (Math.abs(d) < FPMIN) d = FPMIN;
  d = 1 / d;
  let h = d;
  for (let m = 1; m <= MAXIT; m++) {
    const m2 = 2 * m;
    let aa = m * (b - m) * x / ((qam + m2) * (a + m2));
    d = 1 + aa * d; if (Math.abs(d) < FPMIN) d = FPMIN;
    c = 1 + aa / c; if (Math.abs(c) < FPMIN) c = FPMIN;
    d = 1 / d; h *= d * c;
    aa = -(a + m) * (qab + m) * x / ((a + m2) * (qap + m2));
    d = 1 + aa * d; if (Math.abs(d) < FPMIN) d = FPMIN;
    c = 1 + aa / c; if (Math.abs(c) < FPMIN) c = FPMIN;
    d = 1 / d;
    const del = d * c;
    h *= del;
    if (Math.abs(del - 1) < EPS) break;
  }
  return h;
}

// Regularised incomplete beta function I_x(a, b)
export function ibeta(x, a, b) {
  if (x <= 0) return 0;
  if (x >= 1) return 1;
  const bt = Math.exp(lngamma(a + b) - lngamma(a) - lngamma(b) + a * Math.log(x) + b * Math.log(1 - x));
  if (x < (a + 1) / (a + b + 2)) return bt * betacf(a, b, x) / a;
  return 1 - bt * betacf(b, a, 1 - x) / b;
}

// Two-sided p-value for a t statistic
export function pt2(t, df) {
  return ibeta(df / (df + t * t), df / 2, 0.5);
}
// Upper-tail p-value for an F statistic
export function pf_upper(F, df1, df2) {
  if (!(F > 0)) return 1;
  return ibeta(df2 / (df2 + df1 * F), df2 / 2, df1 / 2);
}
// Upper-tail p-value for a chi-square statistic (df = 1 or 2 used here)
export function pchisq_upper(x, df) {
  if (!(x > 0)) return 1;
  // regularised upper incomplete gamma via series / continued fraction
  const a = df / 2, xx = x / 2;
  const gln = lngamma(a);
  if (xx < a + 1) {
    let ap = a, s = 1 / a, del = s;
    for (let n = 0; n < 500; n++) { ap += 1; del *= xx / ap; s += del; if (Math.abs(del) < Math.abs(s) * 1e-14) break; }
    return 1 - s * Math.exp(-xx + a * Math.log(xx) - gln);
  }
  let b = xx + 1 - a, c = 1e300, d = 1 / b, h = d;
  for (let i = 1; i < 500; i++) {
    const an = -i * (i - a); b += 2;
    d = an * d + b; if (Math.abs(d) < 1e-300) d = 1e-300;
    c = b + an / c; if (Math.abs(c) < 1e-300) c = 1e-300;
    d = 1 / d; const del = d * c; h *= del;
    if (Math.abs(del - 1) < 1e-14) break;
  }
  return Math.exp(-xx + a * Math.log(xx) - gln) * h;
}

export function pnorm(z) {
  // Abramowitz-Stegun 7.1.26 via erf, accurate to ~1e-7
  const t = 1 / (1 + 0.3275911 * Math.abs(z) / Math.SQRT2);
  const y = 1 - (((((1.061405429 * t - 1.453152027) * t) + 1.421413741) * t - 0.284496736) * t + 0.254829592) * t * Math.exp(-z * z / 2);
  return z >= 0 ? 0.5 * (1 + y) : 0.5 * (1 - y);
}

export function qnorm(p) {
  // Acklam's algorithm
  const a = [-3.969683028665376e+01, 2.209460984245205e+02, -2.759285104469687e+02, 1.383577518672690e+02, -3.066479806614716e+01, 2.506628277459239e+00];
  const b = [-5.447609879822406e+01, 1.615858368580409e+02, -1.556989798598866e+02, 6.680131188771972e+01, -1.328068155288572e+01];
  const c = [-7.784894002430293e-03, -3.223964580411365e-01, -2.400758277161838e+00, -2.549732539343734e+00, 4.374664141464968e+00, 2.938163982698783e+00];
  const d = [7.784695709041462e-03, 3.224671290700398e-01, 2.445134137142996e+00, 3.754408661907416e+00];
  const pl = 0.02425;
  let q, r;
  if (p < pl) { q = Math.sqrt(-2 * Math.log(p)); return (((((c[0] * q + c[1]) * q + c[2]) * q + c[3]) * q + c[4]) * q + c[5]) / ((((d[0] * q + d[1]) * q + d[2]) * q + d[3]) * q + 1); }
  if (p <= 1 - pl) { q = p - 0.5; r = q * q; return (((((a[0] * r + a[1]) * r + a[2]) * r + a[3]) * r + a[4]) * r + a[5]) * q / (((((b[0] * r + b[1]) * r + b[2]) * r + b[3]) * r + b[4]) * r + 1); }
  q = Math.sqrt(-2 * Math.log(1 - p));
  return -(((((c[0] * q + c[1]) * q + c[2]) * q + c[3]) * q + c[4]) * q + c[5]) / ((((d[0] * q + d[1]) * q + d[2]) * q + d[3]) * q + 1);
}

// Quantile of the t distribution (bisection on pt2), used for confidence intervals
export function qt975(df) {
  let lo = 0, hi = 50;
  for (let i = 0; i < 80; i++) {
    const mid = (lo + hi) / 2;
    if (pt2(mid, df) > 0.05) lo = mid; else hi = mid;
  }
  return (lo + hi) / 2;
}

// Power of a two-sided, two-sample t-test (equal n, equal SD), as in power.t.test()
export function powerT(n, delta, sdv, alpha = 0.05) {
  const df = 2 * n - 2;
  if (df < 1) return NaN;
  // critical t
  let lo = 0, hi = 60;
  for (let i = 0; i < 80; i++) { const mid = (lo + hi) / 2; if (pt2(mid, df) > alpha) lo = mid; else hi = mid; }
  const tc = (lo + hi) / 2;
  const ncp = (delta / sdv) * Math.sqrt(n / 2);
  // integrate over the chi-square distribution of the variance estimate
  const steps = 400, vmax = df + 12 * Math.sqrt(2 * df) + 10;
  const h = vmax / steps;
  const lnc = -(df / 2) * Math.log(2) - lngamma(df / 2);
  let total = 0;
  for (let i = 1; i <= steps; i++) {
    const v = (i - 0.5) * h;
    const dens = Math.exp(lnc + (df / 2 - 1) * Math.log(v) - v / 2);
    const s = tc * Math.sqrt(v / df);
    total += dens * (1 - pnorm(s - ncp) + pnorm(-s - ncp)) * h;
  }
  return Math.min(1, total);
}

// ---- Models -------------------------------------------------------------------

// Welch two-sample t-test
export function welch(a, b) {
  const ma = mean(a), mb = mean(b), va = variance(a), vb = variance(b);
  const na = a.length, nb = b.length;
  const se = Math.sqrt(va / na + vb / nb);
  const t = (mb - ma) / se;
  const df = (va / na + vb / nb) ** 2 / ((va / na) ** 2 / (na - 1) + (vb / nb) ** 2 / (nb - 1));
  return { t, df, p: pt2(t, df), diff: mb - ma, se };
}

// One-way ANOVA from an array of groups (each group an array of numbers)
export function anova1(groups) {
  const all = groups.flat();
  const gm = mean(all);
  let ssb = 0, ssw = 0;
  groups.forEach((g) => {
    const m = mean(g);
    ssb += g.length * (m - gm) ** 2;
    g.forEach((v) => (ssw += (v - m) ** 2));
  });
  const df1 = groups.length - 1, df2 = all.length - groups.length;
  const F = (ssb / df1) / (ssw / df2);
  return { F, df1, df2, p: pf_upper(F, df1, df2), ssb, ssw };
}

// Simple linear regression y = b0 + b1 x, with diagnostics
export function lm1(x, y) {
  const n = x.length, mx = mean(x), my = mean(y);
  let sxx = 0, sxy = 0;
  for (let i = 0; i < n; i++) { sxx += (x[i] - mx) ** 2; sxy += (x[i] - mx) * (y[i] - my); }
  const b1 = sxy / sxx, b0 = my - b1 * mx;
  const fitted = x.map((v) => b0 + b1 * v);
  const resid = y.map((v, i) => v - fitted[i]);
  const sse = sum(resid.map((e) => e * e));
  const sst = sum(y.map((v) => (v - my) ** 2));
  const s2 = sse / (n - 2);
  const se1 = Math.sqrt(s2 / sxx);
  const t = b1 / se1;
  const hat = x.map((v) => 1 / n + (v - mx) ** 2 / sxx);
  const stdres = resid.map((e, i) => e / Math.sqrt(s2 * (1 - hat[i])));
  const cook = stdres.map((r, i) => (r * r / 2) * hat[i] / (1 - hat[i]));
  return { b0, b1, fitted, resid, stdres, hat, cook, r2: 1 - sse / sst, se1, t, p: pt2(t, n - 2), n, s: Math.sqrt(s2) };
}

// Multiple regression with two predictors (returns slopes only), used for collinearity app
export function lm2(x1, x2, y) {
  const n = y.length;
  const m1 = mean(x1), m2 = mean(x2), my = mean(y);
  let s11 = 0, s22 = 0, s12 = 0, s1y = 0, s2y = 0;
  for (let i = 0; i < n; i++) {
    const a = x1[i] - m1, b = x2[i] - m2, c = y[i] - my;
    s11 += a * a; s22 += b * b; s12 += a * b; s1y += a * c; s2y += b * c;
  }
  const det = s11 * s22 - s12 * s12;
  const b1 = (s22 * s1y - s12 * s2y) / det;
  const b2 = (s11 * s2y - s12 * s1y) / det;
  return { b1, b2 };
}

// Theoretical normal quantiles for a Q-Q plot
export function qqpoints(values) {
  const n = values.length;
  const sorted = [...values].sort((a, b) => a - b);
  return sorted.map((v, i) => ({ theoretical: qnorm((i + 1 - 0.5) / n), sample: v }));
}

// Lowess-like smoother (running mean over neighbours) for residual plots
export function smooth(x, y, span = 0.4) {
  const pts = x.map((v, i) => [v, y[i]]).sort((a, b) => a[0] - b[0]);
  const k = Math.max(3, Math.round(span * pts.length));
  const out = [];
  for (let i = 0; i < pts.length; i++) {
    const lo = Math.max(0, i - Math.floor(k / 2)), hi = Math.min(pts.length, lo + k);
    const win = pts.slice(lo, hi);
    out.push({ x: pts[i][0], y: mean(win.map((p) => p[1])) });
  }
  return out;
}

export const logistic = (z) => 1 / (1 + Math.exp(-z));

// Kaplan-Meier estimate. times = array, status = 1 (event) or 0 (censored)
export function kaplanMeier(times, status) {
  const d = times.map((t, i) => ({ t, s: status[i] })).sort((a, b) => a.t - b.t);
  let atRisk = d.length, surv = 1;
  const steps = [{ time: 0, surv: 1 }];
  const censored = [];
  let i = 0;
  while (i < d.length) {
    const t = d[i].t;
    let events = 0, cens = 0;
    while (i < d.length && d[i].t === t) { if (d[i].s === 1) events++; else cens++; i++; }
    if (events > 0) { surv *= 1 - events / atRisk; steps.push({ time: t, surv }); }
    if (cens > 0) censored.push({ time: t, surv });
    atRisk -= events + cens;
  }
  return { steps, censored };
}

// Log-rank test for two groups
export function logrank(timesA, statusA, timesB, statusB) {
  const all = [
    ...timesA.map((t, i) => ({ t, s: statusA[i], g: 0 })),
    ...timesB.map((t, i) => ({ t, s: statusB[i], g: 1 })),
  ].sort((a, b) => a.t - b.t);
  let nA = timesA.length, nB = timesB.length, O = 0, E = 0, V = 0, i = 0;
  while (i < all.length) {
    const t = all[i].t;
    let dA = 0, dB = 0, cA = 0, cB = 0;
    while (i < all.length && all[i].t === t) {
      const r = all[i];
      if (r.s === 1) { if (r.g === 0) dA++; else dB++; } else { if (r.g === 0) cA++; else cB++; }
      i++;
    }
    const dd = dA + dB, nn = nA + nB;
    if (dd > 0 && nn > 1) {
      O += dA; E += dd * nA / nn;
      V += dd * (nA / nn) * (1 - nA / nn) * (nn - dd) / (nn - 1);
    }
    nA -= dA + cA; nB -= dB + cB;
  }
  const chisq = V > 0 ? (O - E) ** 2 / V : 0;
  return { chisq, p: pchisq_upper(chisq, 1) };
}
