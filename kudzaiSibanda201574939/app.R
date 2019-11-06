

library(shiny)
library(shinydashboard)
library(dplyr)
library(DT)
library(ggplot2)



ui <- dashboardPage(
  
  dashboardHeader(title = 'South African Crime Analytics'),
  dashboardSidebar(
    selectInput(inputId = 'crime',label = 'select category',choices = unique(data(),x = data()$Category))
    
    
    
  ),

  dashboardBody(
    
    
    fluidRow(
      column(width = 10),
      column(width = 2)
      
      
    )
    
  )
  
)





server <- function(input , output){
  
  
  data <- reactive ({
    
    read.csv('C:/Users/MG-Lab-PC/Desktop/SPECIAL TOPICS EXAM WORK/KC-SIBANDA-SPECIAL-TOPICS-EXAM/crime.csv')
    
    
  })
  
  
  output$crime <- renderDataTable({
    
    data()$Category
    
  })
  
  
  
  
  
  
  
  
  
  
  
  
  
  
}

shinyApp(ui = ui, server = server)

