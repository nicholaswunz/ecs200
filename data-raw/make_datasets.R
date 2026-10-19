# make_datasets.R --------------------------------------------------------------
# Creates the simulated teaching and assessment datasets used in the ECS200
# workshops (weeks 5, 7, 8, 11, 12 and 13). Run once from the project folder:
#   source("data-raw/make_datasets.R")
# The CSV files are written to the data/ folder. Only base R is used so that the
# values are identical on any computer. Change the seeds to make new versions of
# the assessment datasets for a new year.
# ------------------------------------------------------------------------------

out_dir <- "data"

# ---- Week 5 (teaching): lizard sprint speed experiment -----------------------
# 72 lizards from two populations were each raced once at one of three test
# temperatures (between-subjects design, 12 lizards per combination).
set.seed(2027)
lizard_means <- expand.grid(temperature = c(20, 28, 36),
                            population  = c("coastal", "inland"))
lizard_means$mu <- c(1.30, 1.85, 1.55,   # coastal at 20, 28, 36 C
                     1.10, 1.80, 1.95)   # inland at 20, 28, 36 C
lizard_sprint <- lizard_means[rep(seq_len(nrow(lizard_means)), each = 12), ]
lizard_sprint$sprint_speed <- round(rnorm(nrow(lizard_sprint), lizard_sprint$mu, 0.25), 2)
lizard_sprint$mass_g <- round(rnorm(nrow(lizard_sprint), 12, 2), 1)
lizard_sprint$lizard_id <- sprintf("L%02d", sample(seq_len(nrow(lizard_sprint))))
lizard_sprint <- lizard_sprint[order(lizard_sprint$lizard_id),
                               c("lizard_id", "population", "temperature", "mass_g", "sprint_speed")]
write.csv(lizard_sprint, file.path(out_dir, "lizard_sprint.csv"), row.names = FALSE)

# ---- Week 8 (teaching): mayfly nymph counts in streams -----------------------
set.seed(808)
n <- 60
stream_mayflies <- data.frame(
  stream_id    = sprintf("S%02d", 1:n),
  land_use     = rep(c("forest", "agriculture"), each = n / 2),
  canopy_cover = round(c(runif(n / 2, 30, 95), runif(n / 2, 0, 60)))
)
mu <- exp(1.2 + 0.025 * stream_mayflies$canopy_cover -
            0.6 * (stream_mayflies$land_use == "agriculture"))
stream_mayflies$mayflies <- rnbinom(n, mu = mu, size = 2.5)
write.csv(stream_mayflies, file.path(out_dir, "stream_mayflies.csv"), row.names = FALSE)

# ---- Week 8 (assessment): pollinator visits -----------------------------------
set.seed(818)
n <- 80
pollinator_visits <- data.frame(
  plant_id = sprintf("P%02d", 1:n),
  habitat  = rep(c("urban_garden", "bushland"), each = n / 2),
  flowers  = round(runif(n, 2, 40))
)
mu <- exp(-0.1 + 0.045 * pollinator_visits$flowers +
            0.55 * (pollinator_visits$habitat == "bushland"))
pollinator_visits$visits <- rnbinom(n, mu = mu, size = 1.8)
write.csv(pollinator_visits, file.path(out_dir, "pollinator_visits.csv"), row.names = FALSE)

# ---- Week 11 (teaching): frog occupancy in farm dams --------------------------
set.seed(33)
n <- 90
frog_ponds <- data.frame(
  pond_id   = sprintf("D%02d", 1:n),
  veg_cover = round(runif(n, 0, 100)),
  fish      = sample(c("absent", "present"), n, replace = TRUE, prob = c(0.55, 0.45))
)
p <- plogis(-1.2 + 0.045 * frog_ponds$veg_cover - 1.8 * (frog_ponds$fish == "present"))
frog_ponds$frog_present <- rbinom(n, 1, p)
write.csv(frog_ponds, file.path(out_dir, "frog_ponds.csv"), row.names = FALSE)

# ---- Week 11 (assessment): coral bleaching ------------------------------------
set.seed(1121)
n <- 150
coral_bleaching <- data.frame(
  colony_id = sprintf("C%03d", 1:n),
  dhw       = round(runif(n, 0, 12), 1),     # degree heating weeks
  depth_m   = round(runif(n, 1, 15), 1)
)
p <- plogis(-2.5 + 0.55 * coral_bleaching$dhw - 0.18 * coral_bleaching$depth_m)
coral_bleaching$bleached <- rbinom(n, 1, p)
write.csv(coral_bleaching, file.path(out_dir, "coral_bleaching.csv"), row.names = FALSE)

# ---- Week 12 (teaching): repeated sprint trials on the same lizards -----------
set.seed(1212)
n_liz <- 16
temps <- c(18, 22, 26, 30)
lizard_u <- rnorm(n_liz, 0, 0.25)             # each lizard's own "baseline" speed
lizard_mass <- round(12 + 6 * lizard_u + rnorm(n_liz, 0, 0.8), 1)
lizard_repeated <- expand.grid(temperature = temps, lizard = seq_len(n_liz))
lizard_repeated$lizard_id <- sprintf("L%02d", lizard_repeated$lizard)
lizard_repeated$mass_g <- lizard_mass[lizard_repeated$lizard]
lizard_repeated$sprint_speed <- round(0.40 + 0.045 * lizard_repeated$temperature +
                                        lizard_u[lizard_repeated$lizard] +
                                        rnorm(nrow(lizard_repeated), 0, 0.10), 2)
lizard_repeated <- lizard_repeated[, c("lizard_id", "mass_g", "temperature", "sprint_speed")]
write.csv(lizard_repeated, file.path(out_dir, "lizard_repeated.csv"), row.names = FALSE)

# ---- Week 12 (assessment): seagrass shoot length across meadows ---------------
set.seed(1222)
n_mead <- 8
n_quad <- 12
meadow_u <- rnorm(n_mead, 0, 6)
seagrass_meadows <- data.frame(
  meadow  = rep(paste0("M", 1:n_mead), each = n_quad),
  quadrat = rep(1:n_quad, times = n_mead),
  depth_m = round(runif(n_mead * n_quad, 0.5, 6), 1)
)
seagrass_meadows$shoot_length_cm <- round(46 - 3.5 * seagrass_meadows$depth_m +
                                            meadow_u[rep(1:n_mead, each = n_quad)] +
                                            rnorm(n_mead * n_quad, 0, 4), 1)
write.csv(seagrass_meadows, file.path(out_dir, "seagrass_meadows.csv"), row.names = FALSE)

# ---- Week 13 (teaching): survival of translocated woylies ---------------------
set.seed(1313)
n <- 60
woylie_survival <- data.frame(
  woylie_id    = sprintf("W%02d", 1:n),
  release_site = rep(c("fenced", "unfenced"), each = n / 2),
  mass_g       = round(rnorm(n, 1300, 150))
)
rate <- ifelse(woylie_survival$release_site == "fenced", 1 / 700, 1 / 160) *
  0.8^((woylie_survival$mass_g - 1300) / 100)
death_day  <- rexp(n, rate)
collar_off <- rexp(n, 1 / 1200)                 # random collar failures
study_end  <- 365
woylie_survival$days   <- ceiling(pmin(death_day, collar_off, study_end))
woylie_survival$status <- as.integer(death_day <= pmin(collar_off, study_end))
write.csv(woylie_survival, file.path(out_dir, "woylie_survival.csv"), row.names = FALSE)

# ---- Week 13 (assessment): heat knockdown time of ants ------------------------
set.seed(1323)
n <- 80
ant_knockdown <- data.frame(
  ant_id     = sprintf("A%02d", 1:n),
  origin     = rep(c("rural", "urban"), each = n / 2),
  head_width = round(rnorm(n, 1.2, 0.15), 2)   # mm
)
rate <- ifelse(ant_knockdown$origin == "urban", 1 / 45, 1 / 22) *
  exp(-1.5 * (ant_knockdown$head_width - 1.2))
knock <- rexp(n, rate)
ant_knockdown$knockdown_min <- round(pmin(knock, 60), 1)
ant_knockdown$status        <- as.integer(knock < 60)   # 1 = knocked down, 0 = still standing at 60 min
write.csv(ant_knockdown, file.path(out_dir, "ant_knockdown.csv"), row.names = FALSE)

message("Datasets written to ", normalizePath(out_dir))

## Week 6 (optional): a "bad" temperature logger file for the cleaning example ##
# Hourly air temperature for 7 days, with the problems seen in real logger files:
# an overlapping download (exact duplicate rows), a double reading (same time,
# different value), a 9-hour gap when the battery failed (rows missing), two blank
# readings (NA) and one spike when the sun hit the sensor.
set.seed(606)
times <- seq(as.POSIXct("2023-07-10 00:00", tz = "UTC"), by = "1 hour", length.out = 7 * 24)
hr    <- as.numeric(format(times, "%H"))
temp  <- 12 + 6 * sin((hr - 9) / 24 * 2 * pi) + cumsum(rnorm(length(times), 0, 0.15)) +
         rnorm(length(times), 0, 0.3)
logger <- data.frame(date_time = times, air_temp = round(temp, 1))
logger$air_temp[c(40, 121)] <- NA                       # blank readings
logger$air_temp[87]         <- 47.3                     # sun on the sensor
logger <- logger[-(100:108), ]                          # battery failure (9 h missing)
double <- logger[logger$date_time == as.POSIXct("2023-07-12 06:00", tz = "UTC"), ]
double$air_temp <- double$air_temp + 0.8                # second reading at the same time
overlap <- logger[logger$date_time >= as.POSIXct("2023-07-13 00:00", tz = "UTC") &
                  logger$date_time <  as.POSIXct("2023-07-13 06:00", tz = "UTC"), ]
logger <- rbind(logger, double, overlap)                # appended, like a second download
logger <- logger[order(logger$date_time), ]
logger$date_time <- format(logger$date_time, "%d/%m/%Y %H:%M")
write.csv(logger, file.path(out_dir, "logger_bad.csv"), row.names = FALSE)
