library(shiny)

shinyUI(fluidPage(
    titlePanel("Regression Line and Prediction: Weight vs Mileage"),
    sidebarLayout(
        sidebarPanel(
            numericInput("wt", "Enter weight (lbs):", value = 2000, min = min(mtcars$wt)*1000, max = max(mtcars$wt)*1000, step = 20)
        ),
        mainPanel(
            plotOutput("regressionPlot"),
            textOutput("predictedMpg")
        )
    )
))
