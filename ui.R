#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
data("mtcars")

# Data pre-processing ----
# Tweak the "am" variable to have nicer factor labels -- since this
# doesn't rely on any user inputs, we can do this once at startup
# and then use the value throughout the lifetime of the app

mtcars$vs <- factor(mtcars$vs, labels = c("V-shape", "straight"))
mtcars$am <- factor(mtcars$am, labels = c("Automatic", "Manual"))


# Define UI for miles per gallon app ----
ui <- fluidPage(

    # App title ----
    titlePanel("Miles Per Gallon"),

    # Sidebar layout with input and output definitions ----
    sidebarLayout(

        # Sidebar panel for inputs ----
        sidebarPanel(

            # Input: Selector for variable to plot against mpg ----
            selectInput("variable", "Variable:",
                        c("Cylinders" = "cyl",
                          "Engine" = "vs",
                          "Transmission" = "am",
                          "Gears" = "gear")),

            # Input: Checkbox for whether outliers should be included ----
            checkboxInput("outliers", "Show outliers", TRUE)

        ),

        # Main panel for displaying outputs ----
        mainPanel(

            # Output: Formatted text for caption ----
            h3(textOutput("caption")),

            # Output: Plot of the requested variable against mpg ----
            plotOutput("mpgPlot")

        )
    )
)
