# ECS200 - Research Methods in Ecology

Materials for [ECS200](https://handbook.murdoch.edu.au/units/07/ecs200) Research
Methods in Ecology at Murdoch University.

Access the workshops here: https://nicholaswu.quarto.pub/ecs200/

## Packages

Install these once before the first workshop:

```r
install.packages(c("tidyverse", "visdat", "patchwork", "vegan", "performance",
                   "see", "ggeffects", "lme4", "lmerTest", "ggsurvfit"))
```

Optional workshops (time series, spatial and movement data) also use:

```r
install.packages(c("lterdatasampler", "galah", "sf", "ozmaps", "leaflet", "geosphere"))
```

## Folder structure

- `*.qmd`: workshop pages (Quarto book; chapters are listed in `_quarto.yml`)
- `data/`: datasets used in the workshops and assessments
- `data-raw/make_datasets.R`: code that simulates the teaching and assessment datasets
- `assessments/`: R script templates students download and submit
- `apps/ecs200.js`: helper functions for the interactive apps (Observable JS, run in the browser)
- `images/`: figures and photos
- `bib/`: references
