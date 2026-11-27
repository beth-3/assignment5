#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#
library(DT)
library(plotly)
library(table1)
library(shiny)
library(shinydashboard)
library(shinyWidgets)
library(tidyverse)
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
data_dig$CVD <- factor(data_dig$CVD, levels = c(0,1 ), labels = c("No", "Yes"))
data_dig$WHF <- factor(data_dig$WHF, levels = c(0,1 ), labels = c("No", "Yes"))
data_dig$DIG <- factor(data_dig$DIG, levels = c(0,1 ), labels = c("No", "Yes"))
data_dig$MI <- factor(data_dig$MI, levels = c(0,1 ), labels = c("No", "Yes"))
data_dig$UANG <- factor(data_dig$UANG, levels = c(0,1 ), labels = c("No", "Yes"))
data_dig$STRK <- factor(data_dig$STRK, levels = c(0,1 ), labels = c("No", "Yes"))
data_dig$SVA <- factor(data_dig$SVA, levels = c(0,1 ), labels = c("No", "Yes"))
data_dig$VENA <- factor(data_dig$VENA, levels = c(0,1 ), labels = c("No", "Yes"))
data_dig$CREV <- factor(data_dig$CREV, levels = c(0,1 ), labels = c("No", "Yes"))
data_dig$OCVD <- factor(data_dig$OCVD, levels = c(0,1 ), labels = c("No", "Yes"))
data_dig$RINF <- factor(data_dig$RINF, levels = c(0,1 ), labels = c("No", "Yes"))
data_dig$OTH <- factor(data_dig$OTH, levels = c(0,1 ), labels = c("No", "Yes"))
data_dig$HOSP <- factor(data_dig$HOSP, levels = c(0,1 ), labels = c("No", "Yes"))
data_dig$DWHF <- factor(data_dig$DWHF, levels = c(0,1 ), labels = c("No", "Yes"))
data_dig$REASON <- factor(data_dig$REASON, levels = c(1, 2, 3, 4, 5 ))
data_dig$EJFMETH <- factor(data_dig$EJFMETH, levels = c(1, 2, 3 ))
data_dig$RALES <- factor(data_dig$RALES, levels = c(0, 1, 2, 3 ))
data_dig$ELEVJVP <- factor(data_dig$ELEVJVP, levels = c(0, 1, 2, 3 ))
data_dig$PEDEMA <- factor(data_dig$PEDEMA, levels = c(0, 1, 2, 3 ))
data_dig$RESTDYS <- factor(data_dig$RESTDYS, levels = c(0, 1, 2, 3 ))
data_dig$EXERTDYS <- factor(data_dig$EXERTDYS, levels = c(0, 1, 2, 3 ))
data_dig$ACTLIMIT <- factor(data_dig$ACTLIMIT, levels = c(0, 1, 2, 3 ))
data_dig$S3 <- factor(data_dig$S3, levels = c(0, 1, 2, 3 ))
data_dig$PULCONG <- factor(data_dig$PULCONG, levels = c(0, 1, 2, 3 ))
data_dig$NSYM <- factor(data_dig$NSYM, levels = c(0, 1, 2, 3, 4 ))
data_dig$FUNCTCLS <- factor(data_dig$FUNCTCLS, levels = c( 1, 2, 3, 4 ))
data_dig$CHFETIOL <- factor(data_dig$CHFETIOL, levels = c( 1, 2, 3, 4, 5, 6 ))

data_dig_clean <- data_dig %>%
  rename( Dose_of_Digoxin_or_Placebo_Prescribed = DIGDOSE, Age = AGE, Race = RACE, Body_Mass_Index = BMI, Sex = SEX, History_of_Hypertension = HYPERTEN,  Chest_Xray = CHESTX,  Treatment = TRTMT, Ejection_Fraction_Percent = EJF_PER, Ejection_Fraction_Method = EJFMETH , Serum_Potassium = KLEVEL, Serum_Creatinine = CREAT, Heart_Rate = HEARTRTE,  Diastolic_BP = DIABP, Systolic_BP = SYSBP, Previous_Myocardial = PREVMI, Current_Angina = ANGINA, History_of_Diabetes = DIABETES , Recommended_Digoxin_Dose = DIGDOSER, Rales = RALES, Elevated_Jugular_Venous_Pressure = ELEVJVP, Peripheral_Edema = PEDEMA, Dyspnea_at_Rest = RESTDYS, Dyspnea_on_Exertion = EXERTDYS, Limitation_of_Activity = ACTLIMIT, S3_Gallop = S3, Pulmonary_Congestion = PULCONG,  Duration_of_CHF = CHFDUR, NYHA_Functional_Class = FUNCTCLS, CHF_Etiology = CHFETIOL, Digoxin_Within_Past_Week = DIGUSE, Potassium_Sparing_Diuretics = DIURETK, Other_Diuretics = DIURET, Potassium_Supplements = KSUPP, Ace_Inhibitors = ACEINHIB, Nitrates = NITRATES, Hydralazine = HYDRAL, Other_Vasodilators = VASOD, Dose_of_Digoxin_or_Placebo_Prescribed = DIGDOSE, Cardiovascular_Disease_Hosp = CVD, Worsening_Heart_Failure_Hosp  = WHF, Digoxin_Toxicity_Hosp = DIG, Myocardial_Infartion_Hosp = MI, Unstable_Angina_Hosp = UANG, Stroke_Hosp = STRK, Supraventricular_Arrhythmia_Hosp = SVA, Ventricular_Arrhythmia_Hosp = VENA, Coronary_Revascularization_Hosp = CREV, Other_Cardiovascular_Event_Hosp = OCVD, Respiratory_Infection_Hosp = RINF, Other_Noncardiac_Nonvascular_Hosp = OTH, Any_Hospitalization_Hosp = HOSP, Number_of_Hospitalizations = NHOSP, Death_Status = DEATH, Days_Till_Last_Followup_or_Death = DEATHDAY, Primary_Endpoint_Death_or_Hosp_From_HF = DWHF, Cause_of_Death = REASON)

table_pro <- table1(~Treatment, data = data_dig_clean, overall = "Overall")
table_base <- table1(~Sex + Race + Age + Body_Mass_Index + History_of_Hypertension + Chest_Xray + Ejection_Fraction_Percent + Serum_Potassium +Serum_Creatinine + Heart_Rate + Diastolic_BP + Systolic_BP + Previous_Myocardial + Current_Angina + History_of_Diabetes+ Nitrates + Dose_of_Digoxin_or_Placebo_Prescribed + Pulmonary_Congestion + Rales + Limitation_of_Activity + Peripheral_Edema + Duration_of_CHF + Elevated_Jugular_Venous_Pressure + Ace_Inhibitors  +  Other_Vasodilators  + Dyspnea_at_Rest + Dyspnea_on_Exertion| Treatment, data = data_dig_clean, overall = "Overall" )
dft <- as.data.frame(table_pro)
base_df <- as.data.frame(table_base)

sidebar <- dashboardSidebar(
  width = 300,
  sidebarMenu(
    menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
    menuItem("Univariate Analysis", tabName = "univariate_analysis", icon = icon("chart-line")),
    menuItem("Bivariate Analysis", tabName = "bivariate_analysis", icon = icon("chart-bar")), 
    menuItem("Baseline characteristics comparison", tabName = "treatment_groups", icon = icon("table-columns")),
    menuItem("Raw data", tabName = "raw_data", icon = icon("table"))
    
  )
)

body <- dashboardBody( tags$head(tags$style(HTML('
     .main-header  .logo{
        font-family: "TT Chocolates", "ttchocolate", sans-serif;
        font-weight: bold;
        font-size: 22px;
     }                                          
  
'))
  
),
  tabItems(
    tabItem(tabName = "dashboard",
            h2("Dashboard"),
            fluidRow(
              column( width = 6,
                      box(title = "Background information",status = "info", solidHeader = T, width = 12, "The Digitalis Investigation Group (DIG) dataset consists of baseline and outcome data from the main DIG trial. In the main trial, heart failure patients meeting the eligibility criterion and whose ejection fraction was 45% or less were randomized to receive either a placebo or digoxin. Outcomes assessed in the trial included: cardiovascular mortality, hospitalization or death from worsening heart failure, hospitalization due to other cardiovascular causes and hospitalization due to non-cardiovascular causes." ),
                      box(title = "Gender split between the two treatment groups", background = "yellow",  width = 12, solidHeader = T, plotlyOutput("genderplot")),
            ),
            column( width = 6,
                    box(title = "Proportion of patients in each treatment group",background = "olive",  width = 12, solidHeader = T, plotlyOutput("test") )
            )
            )),
    tabItem(tabName = "univariate_analysis",
            h2("Univariate analysis"),
            fluidRow(
              box(title = "Table", status = "info", width = 12, solidHeader = T),
              box(title = "Graph", background = "maroon", width = 12, solidHeader = T)
              
            )
            ),
    tabItem(tabName = "bivariate_analysis",
            h2("Bivariate analysis"),
            fluidRow(
              box(title = "Table", status = "info", width = 12, solidHeader = T),
              box(title = "Graph", background = "maroon", width = 12, solidHeader = T)
            )
            ),
    tabItem(tabName = "treatment_groups",
            h2("Treatment groups baseline characteristics comparison"),
            fluidRow(
            box( title =  "Table of baseline characteristics", status = "info",width = 12, solidHeader = T , selectInput(inputId = "selected_variale", label = "Select Baseline Charateristic to Compare", choices = c("Age", "Sex", "Body_Mass_Index", "Race", 'History_of_Hypertension', 'Chest_Xray', 'Ejection_Fraction_Percent', 'Serum_Potassium', 'Serum_Creatinine', 'Heart_Rate', 'Diastolic_BP', 'Systolic_BP', 'Previous_Myocardial',  'Current_Angina',  'History_of_Diabetes', "Nitrates",  "Dose_of_Digoxin_or_Placebo_Prescribed",  "Pulmonary_Congestion", "Rales", "Limitation_of_Activity", "Peripheral_Edema", "Duration_of_CHF",  "Elevated_Jugular_Venous_Pressure", "Ace_Inhibitors", "Other_Vasodilators", "Dyspnea_at_Rest", "Dyspnea_on_Exertion")), hr(),  DT::dataTableOutput("baseline")),
            box(title = "Analysis of Baseline Charaterisitcs Between Treatment Group",  width = 12,background = "maroon", selectInput(inputId = "selecte_v", label = "Select Baseline Charateristic to Compare", choices = c("Age", "Sex", "Body_Mass_Index", "Race", 'History_of_Hypertension', 'Chest_Xray', 'Ejection_Fraction_Percent', 'Serum_Potassium', 'Serum_Creatinine', 'Heart_Rate', 'Diastolic_BP', 'Systolic_BP', 'Previous_Myocardial',  'Current_Angina',  'History_of_Diabetes', 'Nitrates',  'Dose_of_Digoxin_or_Placebo_Prescribed',  'Pulmonary_Congestion', 'Rales', 'Limitation_of_Activity', 'Peripheral_Edema', "Duration_of_CHF",  "Elevated_Jugular_Venous_Pressure", "Ace_Inhibitors", "Other_Vasodilators", "Dyspnea_at_Rest", "Dyspnea_on_Exertion")), solidHeader = T, plotlyOutput("treatment_plot")),
            )
          
            ),
    tabItem(tabName = "raw_data",
            h2("Raw data table"),
            hr(),
            DT::dataTableOutput("rawtable"),
            )
  )
  
)

dashboardPage(
  skin = "purple",
  dashboardHeader(title = "Data analysis of digioxin treatment trial", titleWidth = 450),
  sidebar,
  body
)
