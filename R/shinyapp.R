#' Loading the Rshiny app
#'
#' @description
#' This function launches the RShiny app which allows the user to explore the "Joy of Painting: Bob Ross'
#' data for analysis and research purposes.
#'
#' @export
load_app <- function() {
  app_dir <- system.file("inst", package = "bobrossshiny")
  shiny::runApp(app_dir, display.mode = "normal")
}
