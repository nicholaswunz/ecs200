# ECS200 workshop update (2027): notes for Nicholas

## What is in this folder

- `ecs200/`: the updated Quarto project. Copy it over your project folder. To keep
  the download small, it contains only **new or renamed images**
  (`images/blasco2019_fig1.jpeg` and `images/islands_plants.png` are renamed copies,
  and 7 more images come from your GitHub repo). Keep all your existing images.
  The unused `bat_data.csv`, `Data_pitfall...xlsx` and `Three_example_bats.sql` are
  also left out, so keep your copies if you need them. You can delete the old
  `week*.qmd` files with the old names (see the file name list below).
- `answer_sheets/` (separate zip): marking keys. **Do not put these in the Quarto
  project or on GitHub.**

## Before you render

1. Keep these files from your own project. They were not in the zip, so they are not
   included here:
   - `bib/references.bib` and `bib/the-journal-of-experimental-biology.csl`
   - `_fathom.html`
   - `images/MU_CREST_Red.png` (favicon)
2. New references are in `bib/references_2027.bib`, which `_quarto.yml` now loads
   alongside `references.bib`. Your existing keys (Blasco2019, Makin2019, Juice2006,
   Peters2004, Farkas2025, Ross2019) are still used.
3. Install the packages listed in `README.md`.
4. Run `quarto render`, then `quarto publish quarto-pub`. `freeze: auto` is switched
   on, so later renders only re-run pages you have changed. Week 9 downloads data
   from the ALA on its first render, which needs your registered email and an
   internet connection.

## Main changes

- **New order and file names.** Weeks 1–13 now follow your list. Old file → new file:
  `week1_getting_started` → `week01_quality_check`, `week2_tidy_data` → `week02_tidy_data`,
  `week4_descriptive_stats` → `week03_descriptive_stats`, `week3_diversity_index` →
  `week04_diversity`, `week5_inference` → `week05_inference`, `week7_time_series` →
  `week06_time_series`, `week8_multivariate` → `week07_regression`, `week11_GLM` →
  `week11_glm_binary`, `week12_random_effects` → `week12_mixed_models`. New pages:
  `week08_glm_counts` and `week13_survival`.
- **Content that moved or was dropped.** `week6_nonparametric` is gone. The
  Wilcoxon and Kruskal–Wallis tests are now the "when it's not appropriate"
  alternatives in Week 5, and the chi-square material was dropped. Simple regression
  moved from Week 5 to Week 7, and two-way ANOVA moved from the old Week 8 to Week 5.
- **Five-step structure** (Background → Visualise → Check assumptions → Model →
  Interpret) in Weeks 5, 7, 8, 11, 12 and 13. Each "Check assumptions" step has a
  collapsible "when is this NOT appropriate?" table with alternatives. Results
  sentences use inline R, so the numbers always match the data.
- **Interactive apps rebuilt** in Observable JS (built into Quarto) instead of
  shinylive. They run instantly in the browser, with no R download, and resize with
  the page, so there is no scrolling inside the boxes. There are 17 apps across
  Weeks 3, 4, 5, 7, 8, 11, 12, 13 and Research Design. They share the helper file
  `apps/ecs200.js`, and its statistics were checked against R. The `shinylive`
  filter was removed from `_quarto.yml`.
- **Assessments**: each assessed week has a downloadable R script template
  (`assessments/`), a download button for its data, and the marking rubric (shared
  in `_assessment_rubric.qmd`). The hidden answer chunks were removed from the pages.
- **New datasets** (`data-raw/make_datasets.R` creates them; change the seeds for a new
  year): lizard sprint speed (temperature × population), stream mayflies, pollinator
  visits, frog ponds, coral bleaching, repeated lizard trials, seagrass meadows, woylie
  survival and ant heat knockdown. `pie_crab.csv` was exported from `lterdatasampler`.
  The existing invaded/altitude/foraging/island/coral reef/foraging_shrub data are now
  assessment datasets.
- **Research Design appendix**: images are now centred with consistent sizes. New
  sections cover the scope of inference, the scale of replication, randomisation in
  R, BACI, a "design → analysis" table, power analysis
  (`power.t.test()`, `power.anova.test()`, simulation, and an interactive power app),
  survey effort (repeat visits, species accumulation) and reporting. The zeros list is
  now a table, and the shiny apps are rebuilt as fast apps in tabs.
- **Code style**: every add-on package function now has the `package::function()`
  prefix, and code is spaced and annotated throughout. There are fewer packages:
  `cowplot`, `broom`, `GGally`, `psych`, `EcoData`, `tsibble`, `feasts` and
  `ggpointdensity` are gone. The new packages are `performance`/`see` (assumption
  plots), `ggeffects`, `patchwork`, `lme4`/`lmerTest`, `ggsurvfit` and, for optional
  Week 10, `geosphere`.

## Corrections to check

- **Units**: the old pages multiplied the leaf + stem mass by 1000 and called it
  "grams". The masses are already in grams, so the column is now `total_mass_mg`
  (milligrams).
- Fixed: `plant_data` undefined in Week 1; the *Litoria peronii*/*moorei* mismatch,
  "NSW" maps and a broken link in Week 9; the personal file paths in Week 10 (it now
  reads `data/gps_study/` directly); the `Islands_plants.png` case mismatch; and the
  diversity assessment summing the `block`/`month` columns as species.
- **Schedule dates** on the Welcome page are carried over from 2026. Please confirm
  them for 2027.

## What was and wasn't tested

Every page except Week 9 was rendered in R 4.5 with current CRAN packages, and every
interactive app was opened and checked. Week 9 needs the ALA API and `sf`, which were
not available here. Its code parses correctly, but please render it once yourself
before publishing. The density map now uses `ggplot2::geom_bin_2d()` instead of
`ggpointdensity`.
