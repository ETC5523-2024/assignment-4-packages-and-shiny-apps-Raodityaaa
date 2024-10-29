#' Bob Ross Painting Dataset
#'
#' This dataset contains detailed information about the paintings from Bob Ross's television show *The Joy of Painting*.
#' Each row corresponds to one painting and includes metadata such as the season, episode, number of colors used,
#' and links to the painting images and YouTube videos.
#'
#' @format A data frame with 403 rows and 26 variables:
#' \describe{
#'   \item{img_src}{Character. URL link to the image of the painting.}
#'   \item{painting_title}{Character. The title of the painting.}
#'   \item{season}{Numeric. The season number in which the painting was created.}
#'   \item{episode}{Numeric. The episode number within the season.}
#'   \item{num_colors}{Numeric. The total number of colors used in the painting.}
#'   \item{youtube_src}{Character. URL link to the YouTube video of the episode where the painting was made.}
#'   \item{colors}{Character. List of colors used in the painting.}
#'   \item{color_hex}{Character. List of hexadecimal values for the colors used in the painting.}
#'   \item{Black_Gesso}{Logical. Whether the color "Black Gesso" was used in the painting.}
#'   \item{Bright_Red}{Logical. Whether the color "Bright Red" was used in the painting.}
#'   \item{Burnt_Umber}{Logical. Whether the color "Burnt Umber" was used in the painting.}
#'   \item{Cadmium_Yellow}{Logical. Whether the color "Cadmium Yellow" was used in the painting.}
#'   \item{Dark_Sienna}{Logical. Whether the color "Dark Sienna" was used in the painting.}
#'   \item{Indian_Red}{Logical. Whether the color "Indian Red" was used in the painting.}
#'   \item{Indian_Yellow}{Logical. Whether the color "Indian Yellow" was used in the painting.}
#'   \item{Liquid_Black}{Logical. Whether the color "Liquid Black" was used in the painting.}
#'   \item{Liquid_Clear}{Logical. Whether the color "Liquid Clear" was used in the painting.}
#'   \item{Midnight_Black}{Logical. Whether the color "Midnight Black" was used in the painting.}
#'   \item{Phthalo_Blue}{Logical. Whether the color "Phthalo Blue" was used in the painting.}
#'   \item{Phthalo_Green}{Logical. Whether the color "Phthalo Green" was used in the painting.}
#'   \item{Prussian_Blue}{Logical. Whether the color "Prussian Blue" was used in the painting.}
#'   \item{Sap_Green}{Logical. Whether the color "Sap Green" was used in the painting.}
#'   \item{Titanium_White}{Logical. Whether the color "Titanium White" was used in the painting.}
#'   \item{Van_Dyke_Brown}{Logical. Whether the color "Van Dyke Brown" was used in the painting.}
#'   \item{Yellow_Ochre}{Logical. Whether the color "Yellow Ochre" was used in the painting.}
#'   \item{Alizarin_Crimson}{Logical. Whether the color "Alizarin Crimson" was used in the painting.}
#' }
#'
#' @source Data collected from Bob Ross's *The Joy of Painting*, extracted from
#' \url{https://www.twoinchbrush.com/} and \url{https://www.youtube.com/}.
"bob_ross"
