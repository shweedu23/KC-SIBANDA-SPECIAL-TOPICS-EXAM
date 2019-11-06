

library(shiny)
library(shinydashboard)
library(dplyr)
library(DT)
library(ggplot2)



ui <- dashboardPage(
  
  dashboardHeader(title = 'South African Crime Analytics'),
  dashboardSidebar(
    uiOutput('crime'),
    uiOutput('button')
   ),
    

  dashboardBody(
    tabsetPanel(type='tab',
                tabPanel(title='Plot&Description',
                         fluidRow(
                           column(width = 10,'plot',plotOutput(outputId = 'Bar')),
                           column(width = 2,'text',textOutput(outputId = 'text')))),
                         
                tabPanel(title = 'Table',
                         DT::dataTableOutput(outputId = 'table'),
                         plotOutput(outputId = 'scatter')
                         )
      
                )

    )
    
  )
  
server <- function(input , output){
  
  
  data <- reactive ({
    
    read.csv('C:/Users/MG-Lab-PC/Desktop/SPECIAL TOPICS EXAM WORK/KC-SIBANDA-SPECIAL-TOPICS-EXAM/crime.csv')
 
  })

  output$crime <- renderUI({
    
    selectInput(inputId = 'category',label = 'select category',choices = unique(x = data()$Category))
    
    
  })
  

  df2 <- reactive({
    
    data()$Province %% data()$Category %% data()$x2015.x2016
  })

  output$Bar <- renderPlot({
    
      ggplot(data(),aes(x = Province,y= Category))+geom_bar(stat = 'identity',data = data()$x2015.x2016)
    
    
  })
  
  output$text <- renderText({
    
    print ("The dashboard allows the user to view the crime details categorized per province  between 2015 and 2016")
    
  })
  
  output$button <- renderUI({
    
    select(data()$Province)
    
    
  })
  
  output$table <- DT::renderDataTable({
    data()
    
  })
   
  output$scatter <- renderPlot({
    
    plot (x = data()$Category , y = data()$x2015.x2016)
    
    
  })
  

  
  
}

shinyApp(ui = ui, server = server)

