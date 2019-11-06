

library(shiny)
library(shinydashboard)
library(dplyr)
library(DT)
library(ggplot2)



ui <- dashboardPage(
  
  dashboardHeader(),
  dashboardSidebar(),
  dashboardBody()
  
)



shinyApp(ui = ui, server = server)

