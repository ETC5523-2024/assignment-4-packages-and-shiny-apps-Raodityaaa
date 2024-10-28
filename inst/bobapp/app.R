# Load Shiny library
library(shiny)

# Define UI for the application
ui <- fluidPage(

  # Application title
  titlePanel("Simple Shiny App Example"),

  # Sidebar layout with input and output definitions
  sidebarLayout(

    # Sidebar panel for inputs
    sidebarPanel(
      # Slider input to select number of bins
      sliderInput("bins",
                  "Number of bins:",
                  min = 1,
                  max = 50,
                  value = 30)
    ),

    # Main panel for displaying the plot
    mainPanel(
      # Output plot
      plotOutput("distPlot")
    )
  )
)

# Define server logic required to draw the histogram
server <- function(input, output) {

  output$distPlot <- renderPlot({
    # Generate bins based on input$bins from UI slider
    x <- faithful$waiting
    bins <- seq(min(x), max(x), length.out = input$bins + 1)

    # Draw the histogram with the specified number of bins
    hist(x, breaks = bins, col = 'darkgray', border = 'white',
         xlab = 'Waiting time to next eruption (in mins)',
         main = 'Histogram of Waiting Times')
  })
}

# Run the application
shinyApp(ui = ui, server = server)
