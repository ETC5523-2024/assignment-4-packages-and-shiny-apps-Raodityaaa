# Load necessary libraries
library(shiny)
library(ggplot2)
library(plotly)
library(shinyWidgets)
library(shinyBS)
library(shinythemes)
library(dplyr)
library(tidyr)

# Load the dataset (replace with correct package if necessary)
data(bob_ross)

# Exclude specific columns as per user's request
exclude_columns <- c("episode", "season", "num_colors", "img_src", "painting_title", "youtube_src", "colors", "color_hex")

# Ensure the data contains only valid color columns (removing excluded columns)
valid_colors <- bob_ross %>%
  select(-one_of(exclude_columns)) %>%
  select(where(is.logical))  # Keep only the color columns

# Define UI
ui <- fluidPage(

  # Application title
  titlePanel("Bob Ross Paintings Analysis"),

  # Custom theme for improved aesthetics
  theme = shinythemes::shinytheme("flatly"),  # Flatly theme for modern look

  # Sidebar layout with input controls and main display panel
  sidebarLayout(

    # Sidebar panel for the dropdown and slider
    sidebarPanel(
      # Select input for choosing the color to analyze (excluding excluded columns)
      selectInput("colorInput",
                  "Select a Color:",
                  choices = colnames(valid_colors),
                  selected = colnames(valid_colors)[1]),

      # Slider for selecting the year (season)
      sliderInput("yearInput",
                  "Select a Season (Year):",
                  min = min(bob_ross$season, na.rm = TRUE),
                  max = max(bob_ross$season, na.rm = TRUE),
                  value = min(bob_ross$season, na.rm = TRUE),
                  step = 1)
    ),

    # Main panel for displaying the table and plots stacked vertically
    mainPanel(
      # Frequency Table at the top with toggle switch
      h4("Top 5 and Bottom 5 Colors by Frequency"),
      p("This table displays the top 5 and bottom 5 colors used in Bob Ross paintings by season. Use the toggle below to switch between highest and lowest frequencies."),

      # Toggle switch for highest/lowest frequency
      switchInput(inputId = "frequencyToggle",
                  label = "Show Highest/Lowest Frequency",
                  onLabel = "Highest",
                  offLabel = "Lowest"),

      # Static table output (without dynamic features)
      tableOutput("colorFreqTable"),

      br(),

      # Plot 1 (Color Frequency with scroll option)
      h4("Plot 1: Frequency of Selected Color Across Paintings"),
      p("This plot shows the frequency of the selected color across all paintings in the selected season."),
      div(style = 'overflow-x: scroll;', plotlyOutput("colorFreqPlot")),

      br(),

      # Plot 2 (Number of Colors per Painting with scroll option)
      h4("Plot 2: Number of Colors Used per Painting"),
      p("This plot shows how many colors are used per painting, with each point representing a different painting in the selected season."),
      div(style = 'overflow-x: scroll;', plotlyOutput("numColorsPlot"))
    )
  )
)

# Define server logic
server <- function(input, output) {

  # Reactive expression to filter data by selected year (season)
  filteredData <- reactive({
    bob_ross %>% filter(season == input$yearInput)
  })

  # Reactive expression for the color frequency table (based on selected season)
  output$colorFreqTable <- renderTable({
    # Filter data for the selected season
    filtered_data <- filteredData()

    # Summarize frequency for valid color columns in the selected season
    color_usage <- filtered_data %>%
      select(-one_of(exclude_columns)) %>%
      summarise_all(~sum(. == TRUE, na.rm = TRUE)) %>%
      pivot_longer(cols = everything(), names_to = "Color", values_to = "Frequency") %>%
      arrange(if (input$frequencyToggle) desc(Frequency) else Frequency)

    # Return top 5 and bottom 5 colors
    top_5 <- head(color_usage, 5)
    bottom_5 <- tail(color_usage, 5)
    rbind(top_5, bottom_5)
  })

  # Plot 1: Frequency of the selected color in Bob Ross paintings
  output$colorFreqPlot <- renderPlotly({
    # Get all the paintings for the selected season
    season_data <- filteredData() %>% filter(!is.na(painting_title))

    p1 <- ggplot(season_data, aes_string(x = "painting_title", fill = input$colorInput)) +
      geom_bar(stat = "count") +
      labs(x = "Painting", y = "Frequency", fill = "Color Usage") +
      theme_minimal() +
      theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5)) +
      theme(plot.margin = unit(c(1, 1, 2, 1), "cm"))  # Add spacing to make the plot clearer

    # Convert ggplot to plotly for interactivity
    ggplotly(p1) %>%
      layout(title = paste("Frequency of", input$colorInput, "in All Paintings (Season", input$yearInput, ")"),
             margin = list(l = 50, r = 50, b = 150, t = 50))  # Add margins for better readability
  })

  # Plot 2: Number of colors used per painting
  output$numColorsPlot <- renderPlotly({
    # Get all the paintings for the selected season
    season_data <- filteredData() %>% filter(!is.na(painting_title))

    p2 <- ggplot(season_data, aes(x = painting_title, y = num_colors)) +
      geom_point(aes(text = painting_title), size = 2, color = "blue") +
      labs(x = "Painting", y = "Number of Colors Used") +
      theme_minimal() +
      theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5)) +
      theme(plot.margin = unit(c(1, 1, 2, 1), "cm"))  # Add spacing to make the plot clearer

    # Convert ggplot to plotly for interactivity
    ggplotly(p2) %>%
      layout(margin = list(l = 50, r = 50, b = 150, t = 50))  # Only margins to avoid title-related errors
  })
}

# Run the application
shinyApp(ui = ui, server = server)
