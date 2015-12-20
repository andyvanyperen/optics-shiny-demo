
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

# library(shiny)
# 
# shinyServer(function(input, output) {
#    
#   output$distPlot <- renderPlot({
#     
#     # generate bins based on input$bins from ui.R
#     x    <- faithful[, 2] 
#     bins <- seq(min(x), max(x), length.out = input$bins + 1)
#     
#     # draw the histogram with the specified number of bins
#     hist(x, breaks = bins, col = 'darkgray', border = 'white')
#     
#   })
#   
# })


library(shiny)
library(dbscan)

shinyServer(function(input, output) {
  
  data(iris)
  iris <- as.matrix(iris[, 1:2])
  
  output$coilList <- renderUI({
    listCoil <- c("coil 1","coil 2", "coil 3")
    selectInput("coilID","Coil ID:",listCoil)
  })
  
  
  #  res <- dbscan(iris, eps = .2, minPts = 4)
  res <- optics(iris, eps = 0.50, eps_cl = 0.20, minPts = 4)
  
  
  output$distPlot <- renderPlot({
    res2 <- optics_cut(res, eps_cl = input$eps)
    plot(res2)
    abline(h = input$eps)
  })
  
  output$clustPlot <- renderPlot({
    res2 <- optics_cut(res, eps_cl = input$eps)
    plot(iris, col = res2$cluster + 1L)
  })
  
  
})