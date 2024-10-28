#' Loading the Rshiny app
#'
#' @description
#' This function launches the RShiny app which allows the user to explore the "Joy of Painting: Bob Ross'
#' data for analysis and research purposes.
#'
#' @export
loadbob <- function() {
  app_dir <- system.file("bobapp", package = "BobRoss")
  shiny::runApp(app_dir, display.mode = "normal")
}

