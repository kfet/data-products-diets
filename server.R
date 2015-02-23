library(shiny)

library(MASS)

data(ChickWeight)

endDayDF <- ChickWeight[ChickWeight$Time == 21,]
mw <- mean(endDayDF$weight)

shinyServer(
    function(input, output) {
        output$dietHist <- renderPlot(
                {
                    diet <- input$diet
                    selectedDF <- endDayDF[endDayDF$Diet == diet,]
                    hist(selectedDF$weight, xlab='Chicken weight (gm)', xlim=c(50,400), col='lightblue', main='Histogram')

                    selectedMean <- mean(selectedDF$weight)
                    lines(c(mw, mw), c(0, 100), col='red', lwd=5)
                    lines(c(selectedMean, selectedMean), c(0, 100), col='blue', lwd=5)                    
                }
            )
    }
)