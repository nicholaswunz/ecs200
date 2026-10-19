# ECS200 - Research Methods in Ecology

Materials for [ECS200](https://handbook.murdoch.edu.au/units/07/ecs200) Research
Methods in Ecology at Murdoch University.

Access the workshops here: https://nicholaswunz.github.io/ecs200/

The practicals will take place in [450.2.001](https://maps.murdoch.edu.au/?sharepoi=145022.001) at 13:30–16:30.


| Week | Date   | Teacher | Topic                                                                                         |
|:----:|:------:|:-------:|:---------------------------------------------------------------------------------------------:|
| 1    | 25-Feb | N Wu    | [Data quality check](https://nicholaswunz.github.io/ecs200/week01_quality_check.html)         |
| 2    | 04-Mar | N Wu    | [Tidy data and clean code](https://nicholaswunz.github.io/ecs200/week02_tidy_data.html)       | 
| 3    | 11-Mar | N Wu    | [Descriptive statistics](https://nicholaswunz.github.io/ecs200/week03_descriptive_stats.html) |
| 4    | 18-Mar | N Wu    | [Diversity indices](https://nicholaswunz.github.io/ecs200/week04_diversity.html)              | 
| 5    | 25-Mar | A Rea   | [t-test, ANOVA](https://nicholaswunz.github.io/ecs200/week05_inference.html)                  |
| 6    | **Study Week**                                                                                                   |
| 7    | 08-Apr | A Rea   | [Linear regression](https://nicholaswunz.github.io/ecs200/week07_regression.html)             |
| 8    | 15-Apr | A Rea   | [GLM: count data](https://nicholaswunz.github.io/ecs200/week08_glm_counts.html)               |
| 9    | **Study Week**                                                                                                   |    
| 10   | 29-Apr |                                                                                                         | 
| 11   | 06-May | A Rea   | [GLM: binary data](https://nicholaswunz.github.io/ecs200/week11_glm_binary.html)              |
| 12   | 13-May | A Rea   | [Mixed effects models](https://nicholaswunz.github.io/ecs200/week12_mixed_models.html)        |
| 13   | 20-May | A Rea   | [Survival analysis](https://nicholaswunz.github.io/ecs200/week13_survival.html)               |


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
