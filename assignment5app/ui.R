#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)
library(shinydashboard)
library(shinyWidgets)
data <- read.csv("DIG-1.csv")

sidebar <- dashboardSidebar(
  sidebarMenu(
    menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
    menuItem("Widgets", tabName = "widgets", icon = icon("th")),
    menuItem("Charts", tabName = "charts", icon = icon("chart-line")), 
    menuItem("Raw data", tabName = "raw_data", icon = icon("table"))
    
  )
)

body <- dashboardBody(
  tabItems(
    tabItem(tabName = "dashboard",
            h2("Dashboard tab content")
            ),
    tabItem(tabName = "widgets",
            h2("Widgets tab content")
            ),
    tabItem(tabName = "charts",
            h2("Charts tab content")
            ),
    tabItem(tabName = "raw_data",
            h2("Raw data tab content")
            )
  )
  
)

dashboardPage(
  skin = "purple",
  dashboardHeader(title = "Data analysis of digioxin treatment trial", titleWidth = 450),
  sidebar,
  body
)
