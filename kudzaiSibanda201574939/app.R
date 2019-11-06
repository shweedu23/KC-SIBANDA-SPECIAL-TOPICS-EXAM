

library(shiny)
library(shinydashboard)
library(dplyr)
library(DT)
library(ggplot2)



ui <- dashboardPage(
  
  dashboardHeader(),
  dashboardSidebar(
    selectInput(inputId = 'crime',label = 'select category',selected = unique(data()$Category))
    
    
  ),

  dashboardBody()
  
)



shinyApp(ui = ui, server = server)

