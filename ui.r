library(shiny)

shinyUI(fluidPage(
    titlePanel("Regression Line and Prediction: Weight vs Mileage"),
    sidebarLayout(
        sidebarPanel(
            h4("About this App"),
            p("This application demonstrates the relationship between car weight (in lbs) and mileage (in mpg) using the mtcars dataset."),
            p("You can enter a car's weight in the input box below, and the app will predict the mileage based on a regression model."),
            numericInput("wt", "Enter weight (lbs):", value = 2000, min = min(mtcars$wt)*1000, max = max(mtcars$wt)*1000, step = 20)
        ),
        mainPanel(
            h4("Instructions"),
            p("1. Enter a weight value in the input box on the left."),
            p("2. View the regression plot below, which shows the data points, regression line, and the predicted point."),
            p("3. The predicted mileage for the entered weight will also be displayed below the plot."),
            plotOutput("regressionPlot"),
            textOutput("predictedMpg")
        )
    )
))
