
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)

shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Demonstration of the OPTICS method"),
  
  # Sidebar with a slider input for number of bins
  sidebarPanel(
    h5("Distance between points which should be in same cluster.", align = "center"),
    sliderInput("eps",
                HTML("&epsilon;"),
                min = 0.01,
                max = 0.50,
                value = 0.20),
    h5("Input coil", align = "center"),
    uiOutput('coilList')
  ),
  
  # Show a plot of the generated distribution
  mainPanel(
    h3("Visualisation of the clusters", align = "center"),
    plotOutput("clustPlot"),
    h3("Reachability plot", align = "center"),
    plotOutput("distPlot")
  )
))
