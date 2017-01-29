#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(markdown)



shinyUI(navbarPage("Car Selection for your Trip",
                   
                   tabPanel("Table",
                            
                            
                            
                            # Sidebar
                            
                            sidebarLayout(
                              
                              sidebarPanel(
                                
                                helpText("Enter information about your trip and the car that you want"),
                                helpText("Based on the parameters you provided, the app will list the cars that best fit your needs"),
                                
                                
                          
                                numericInput('dis', 'Distance (in miles):', 50, min = 1, max = 1000),
                                
                                numericInput('cost', 'Gasoline Price:', 2.29, min = 2, max = 5, step=0.05),
                                
                                numericInput('gas', 'Expenditure on fuel:', 50, min=1, max=1000),
                                
                                checkboxGroupInput('cyl', 'Number of cylinders:', c("Four"=4, "Six"=6, "Eight"=8), selected = c(4,6,8)),
                                
                                sliderInput('disp', 'Displacement', min=50, max=560, value=c(50,560), step=5),
                                
                                sliderInput('hp', 'Horsepower', min=50, max=370, value=c(50,370), step=15),
                                
                                checkboxGroupInput('am', 'Transmission:', c("Automatic"=0, "Manual"=1), selected = c(0,1))
                                
                              ),
                              
                            
                              mainPanel(
                                
                                dataTableOutput('table')
                                
                              )
                              
                            )
                            
                   )
                   
                   
                   
                   
                   
)

)   