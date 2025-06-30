# Pipeline definition
library(targets)

tar_option_set(
  packages = c("readr", "dplyr", "ggplot2", "broom")  # automate library load
)

list(
  tar_target(
    data_file,
    "data/species.csv",
    format = "file"
  ),

  tar_target(
    raw_data,
    readr::read_csv(data_file, show_col_types = FALSE)
  ),

  tar_target(
    model,
    glm(count ~ temperature, data = raw_data, family = poisson)
  ),

  tar_target(
    model_summary,
    broom::tidy(model)
  ),

  tar_target(
    summary_csv,
    {
      dir.create("output", showWarnings = FALSE)
      write.csv(model_summary, "output/model_summary.csv", row.names = FALSE)
      "output/model_summary.csv"
    },
    format = "file"
  )
)
