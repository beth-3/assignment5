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

data_dig$SEX <- factor(data_dig$SEX, levels = c(1,2), labels = c("Male", "Female"))
data_dig$RACE <- factor(data_dig$RACE, levels = c(1,2), labels = c("White", "Nonwhite"))
data_dig$TRTMT <- factor(data_dig$TRTMT, levels = c(0,1), labels = c("Placebo", "Digoxin"))
data_dig$ANGINA <- factor(data_dig$ANGINA, levels = c(0,1), labels = c("No", "Yes"))
data_dig$PREVMI <- factor(data_dig$PREVMI, levels = c(0,1 ), labels = c("No", "Yes"))
data_dig$DIABETES <- factor(data_dig$DIABETES, levels = c(0,1 ), labels = c("No", "Yes"))
data_dig$HYPERTEN <- factor(data_dig$HYPERTEN, levels = c(0,1 ), labels = c("No", "Yes"))
data_dig$DIGUSE <- factor(data_dig$DIGUSE, levels = c(0,1 ), labels = c("No", "Yes"))
data_dig$DIURETK <- factor(data_dig$DIURETK, levels = c(0,1 ), labels = c("No", "Yes"))
data_dig$DIURET <- factor(data_dig$DIURET, levels = c(0,1 ), labels = c("No", "Yes"))
data_dig$KSUPP <- factor(data_dig$KSUPP, levels = c(0,1 ), labels = c("No", "Yes"))
data_dig$ACEINHIB <- factor(data_dig$ACEINHIB, levels = c(0,1 ), labels = c("No", "Yes"))
data_dig$NITRATES <- factor(data_dig$NITRATES, levels = c(0,1 ), labels = c("No", "Yes"))
data_dig$HYDRAL <-factor(data_dig$HYDRAL, levels = c(0,1 ), labels = c("No", "Yes"))
data_dig$VASOD <- factor(data_dig$VASOD, levels = c(0,1 ), labels = c("No", "Yes"))
data_dig$DEATH <- factor(data_dig$DEATH, levels = c(0,1 ), labels = c("Alive", "Death"))

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
            h2("Dashboard"),
            fluidRow(
            box(title = "Background information",status = "success", solidHeader = T,"The Digitalis Investigation Group (DIG) dataset consists of baseline and outcome data from the main DIG trial. In the main trial, heart failure patients meeting the eligibility criterion and whose ejection fraction was 45% or less were randomized to receive either a placebo or digoxin. Outcomes assessed in the trial included: cardiovascular mortality, hospitalization or death from worsening heart failure, hospitalization due to other cardiovascular causes and hospitalization due to non-cardiovascular causes." ) )
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
