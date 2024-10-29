#' BobRoss: Analyze Bob Ross's Paintings with a Shiny App
#'
#' The **BobRoss** package provides an interactive Shiny app to explore and analyze the colors used in Bob Ross's *The Joy of Painting* series.
#' It includes detailed color information for each painting and provides tools to visualize color trends over time. The package also provides access
#' to a dataset containing metadata on the paintings, such as the season, episode, and color details.
#'
#' @section Key Functions:
#' - \code{\link{loadbob}}: Launches the Shiny app for exploring Bob Ross's painting colors.
#' - \code{\link{bob_ross}}: Accesses the dataset containing information about the paintings and their colors.
#'
#' @section Dataset Overview:
#' The dataset includes information on over 400 paintings, covering variables such as:
#' - **img_src**: URL to the image of the painting.
#' - **painting_title**: Title of the painting.
#' - **season**: Season number.
#' - **episode**: Episode number within the season.
#' - **num_colors**: Number of colors used in the painting.
#' - **youtube_src**: URL to the YouTube video of the episode.
#' - **colors**: List of colors used in the painting.
#' - **color_hex**: Hexadecimal values for the colors used.
#'
#' @section How to Use the Package:
#' 1. Install the package:
#'   ```r
#'   devtools::install_github("ETC5523-2024/assignment-4-packages-and-shiny-apps-Raodityaaa/BobRoss")
#'   ```
#' 2. Load the package:
#'   ```r
#'   library(BobRoss)
#'   ```
#' 3. Launch the Shiny app to explore Bob Ross's paintings:
#'   ```r
#'   loadbob()
#'   ```
#' 4. Access the painting dataset for custom analysis:
#'   ```r
#'   data <- bob_ross()
#'   head(data)
#'   ```
#'
#' @section Author:
#' Aditya Rao
#'
#' @docType package
#' @name BobRoss
NULL
