#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#
library(shiny)
library(dplyr)
library(datasets)




shinyServer(function(input, output) {
  
  
  
  # Show the cars that correspond to the filters
  
  output$table <- renderDataTable({
    
    display <- seq(from = input$disp[1], to = input$disp[2], by = 0.1)
    
    horsepower <- seq(from = input$hp[1], to = input$hp[2], by = 1)
    
    data <- transmute(mtcars, Car = rownames(mtcars), MilesPerGallon = mpg, 
                      
                      GasolineExpenditure = input$dis/mpg*input$cost,
                      
                      Cylinders = cyl, Displacement = disp, Horsepower = hp, 
                      
                      Transmission = am)
    
    data <- filter(data, GasolineExpenditure <= input$gas, Cylinders %in% input$cyl, 
                   
                   Displacement %in% display, Horsepower %in% horsepower, Transmission %in% input$am)
    
    data <- mutate(data, Transmission = ifelse(Transmission==0, "Automatic", "Manual"))
    
    data <- arrange(data, GasolineExpenditure)
    
    data
    
  }, options = list(lengthMenu = c(5, 15, 20), pageLength = 20))
  
})