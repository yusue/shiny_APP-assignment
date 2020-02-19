#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
# Define server logic to plot various variables against mpg ----
server <- function(input, output) {

    # Compute the formula text ----
    # This is in a reactive expression since it is shared by the
    # output$caption and output$mpgPlot functions
    formulaText <- reactive({
        paste("mpg ~", input$variable)
    })

    # Return the formula text for printing as a caption ----
    output$caption <- renderText({
        formulaText()
    })

    # Generate a plot of the requested variable against mpg ----
    # and only exclude outliers if requested
    output$mpgPlot <- renderPlot({
        boxplot(as.formula(formulaText()),
                data = mtcars,
                outline = input$outliers,
                col = "red", pch = 19)
    })

}
