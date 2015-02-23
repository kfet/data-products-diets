library(shiny)

shinyUI(
    pageWithSidebar(
        headerPanel('Comparing diet effects on chicken'),
        sidebarPanel(
            h5('Choose a diet to display a histogram of the resulting chicken weights.'),
            selectInput('diet', 'Select:', c('Diet 1' = 1, 'Diet 2' = 2, 'Diet 3' = 3, 'Diet 4' = 4))
        ),
        mainPanel(
            h5('Based on the "ChickWeight" dataset in the "MASS" R package.'),
            h5('The red line denotes the mean chicken weight for all diets, the blue one the mean for the selected diet. The farther the blue line is to the right of the red line, the more effective is the diet in terms of chicken gaining more weight.'),
            plotOutput('dietHist'),
            h6('GitHub repo: '),
            a('https://github.com/kfet/data-products-diets', href='https://github.com/kfet/data-products-diets')
        )
    )
)