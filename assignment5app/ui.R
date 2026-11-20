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
data_dig <- read.csv("DIG-1.csv")

sidebar <- dashboardSidebar(
  width = 300,
  sidebarMenu(
    menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
    menuItem("Widgets", tabName = "widgets", icon = icon("th")),
    menuItem("Charts", tabName = "charts", icon = icon("chart-line")), 
    menuItem("Treatment groups comparison", tabName = "treatment_groups", icon = icon("table-columns")),
    menuItem("Raw data", tabName = "raw_data", icon = icon("table"))
    
  )
)

body <- dashboardBody(
  tabItems(
    tabItem(tabName = "dashboard",
            h2("Dashboard")
            ),
    tabItem(tabName = "widgets",
            h2("Widgets")
            ),
    tabItem(tabName = "charts",
            h2("Charts")
            ),
    tabItem(tabName = "treatment_groups",
            h2("Treatment groups baseline characteristics comparison"),
            ),
    tabItem(tabName = "raw_data",
            h2("Raw data"),
            numericInput("maxrows", "Rows to show", value = 25, min = 1, max = 6800),
            verbatimTextOutput("rawtable")
            )
  )
  
)

dashboardPage(
  skin = "purple",
  dashboardHeader(title = "Data analysis of digioxin treatment trial", titleWidth = 450),
  sidebar,
  body
)
