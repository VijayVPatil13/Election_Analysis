# Election Analysis

A collection of R scripts for exploring election results through visualizations
and a basic party-classification example.

## Data

The scripts read CSV files from the project directory:

- `party_distribution_2024.csv` — candidate, party, state, vote, and margin data.
- `historical_election_by_region.csv` — historical seats won by year, region, and party.
- `Pre_Post_poll.csv` — pre- and post-poll data used by the line chart.
- `USA_election_2016.csv` — 2016 U.S. candidate data.

## Requirements

Install R, then install the packages used by the scripts:

```r
install.packages(c(
  "caret", "corrplot", "dplyr", "e1071", "GGally", "ggplot2",
  "readr", "reshape2", "tidyr", "treemap", "tidyverse"
))
```

## Run

Open `election_analysis.Rproj` in RStudio, or run a script from the project
directory so its relative CSV paths resolve. For example:

```sh
Rscript bar-chart.R
```

Each script runs independently. The plotting scripts create charts, and
`confusion-matrix.R` trains a Random Forest model and prints a confusion matrix.

## Scripts

- `bar-chart.R`, `boxplot.R`, `histogram.R`, `line-chart.R`, `pie-chart.R`,
  `scatter_plot.R`, and `treemap.R` create individual charts.
- `advanced_plots.R`, `correlation_matrix.R`, `heatmap.R`, and `pair_plot.R`
  provide additional visualizations.
- `confusion-matrix.R` demonstrates party classification using historical results.
