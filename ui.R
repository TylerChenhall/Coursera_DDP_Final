library(shiny)
shinyUI(fluidPage(
  titlePanel("Running Data Dashboard"),
  h3("April 4, 2019"),
  sidebarLayout(
    sidebarPanel(
      h3("Overview"),
      p(
        "This shiny application provides a visualization of my running data from November 2018 - March 2019. You can use the radio button options below to examine time, distance, and run pace on a daily, weekly, or monthly basis. There are also options to check for trends using a linear or log trend line."
      ),
      
      # Options for the plot and table
      # Aggregation, value, curve fit options
      h3("Summary Options"),
      radioButtons(
        "grouping",
        "Aggregation level:",
        c(
          "Daily" = "daily",
          "Weekly" = "weekly",
          "Monthly" = "monthly"
        )
      ),
      radioButtons(
        "plot_value",
        "Data type:",
        c(
          "Time (minutes)" = "time",
          "Distance (miles)" = "distance",
          "Pace (min/mile)" = "pace"
        )
      ),
      checkboxGroupInput(
        "curves",
        "Curve fits:",
        c(
          "Linear fit (y = a + bx)" = "linear",
          "Exponential fit (y = a + b exp(x))" = "exp"
        )
      )
    ),
    mainPanel(tabsetPanel(
      type = "tabs",
      tabPanel("Plot", plotOutput("run_plot")),
      tabPanel(
        "Table",
        br(),
        textOutput("table_label"),
        br(),
        tableOutput("run_table")
      )
    ))
  )
))
