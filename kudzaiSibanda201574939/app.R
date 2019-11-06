

library(shiny)
library(shinydashboard)
library(dplyr)
library(DT)
library(ggplot2)



ui <- dashboardPage(
  
  dashboardHeader(),
  dashboardSidebar(
    selectInput(inputId = 'crime',label = 'select category',selected = unique(data()$Category),choices = data()$Category)
    
    
  ),

  dashboardBody(
    
    fluidRow()
    
    
    
    
    
    
  )
  
)



shinyApp(ui = ui, server = server)

