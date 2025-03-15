library(shiny)

shinyServer(function(input, output) {
    model <- lm(mpg ~ I(wt * 1000), data = mtcars)  # Adjust regression model to use 1000 * wt
    
    output$regressionPlot <- renderPlot({
        # Plot all data points
        plot(mtcars$wt * 1000, mtcars$mpg, pch = 16, col = rgb(0, 0, 0, 0.5), 
             xlab = "Weight (lbs)", ylab = "Mileage (mpg)", 
             main = "Regression Line and Data Points")
        
        # Add regression line
        abline(model, col = "blue", lwd = 2)
        
        # Add predicted point
        predicted_mpg <- predict(model, newdata = data.frame(wt = input$wt / 1000))
        points(input$wt, predicted_mpg, col = "pink", pch = 16, cex = 1.5)
    })
    
    output$predictedMpg <- renderText({
        predicted_mpg <- predict(model, newdata = data.frame(wt = input$wt / 1000))
        paste("Predicted mileage for weight", input$wt, "lbs is", round(predicted_mpg, 2), "mpg")
    })
})
