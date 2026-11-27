#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#
library(DT)
library(table1)
library(shiny)
library(shinydashboard)
library(shinyWidgets)
library(tidyverse)
library(plotly)

# Define server logic required to draw a histogram
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
data_digTRTMT <- data_dig_clean %>% 
  group_by(Treatment) %>% 
  summarise(Proportion_Patients = n()) %>% 
  mutate(Proportion = round((Proportion_Patients / sum(Proportion_Patients) * 100), 2))

function(input, output, session){
  output$rawtable = DT::renderDataTable(data_dig, server = F, selection = 'single', options = list(scrollX = T))
  output$genderplot = renderPlotly({
    a <- ggplot(data_dig_clean, aes(x = Treatment, fill = Sex)) + 
    labs(title = "Gender counts by treatment group", x = "Treatment", y = "Count") + 
      facet_wrap(~Sex) +
      geom_bar(position = "dodge", na.rm = T) +
      scale_fill_manual(values = c("pink", "paleturquoise3")) +
      theme_grey()
    ggplotly(a)
  
  })
  output$test = renderPlotly({
    p <- ggplot(data_digTRTMT, aes(x = Treatment, y = Proportion, fill = Treatment)) +
      geom_col() +
      labs(title = "Proportion of patients in each treatment group") +
      scale_fill_manual(values = c("royalblue2", "plum3")) +
      theme_grey()
    
    
  ggplotly(p)
  }  )
  output$baseline = DT::renderDataTable({ 
    req(input$selected_variale)
    selectedcol <- data_dig_clean[[input$selected_variale]]
    if (is.numeric(selectedcol)) {
      data_dig_clean %>%
        group_by(Treatment) %>%
        summarise(
          Mean = round(mean(.data[[input$selected_variale]], na.rm = TRUE), 2),
          SD = round(sd(.data[[input$selected_variale]], na.rm = TRUE), 2),
          Range = round(
            max(.data[[input$selected_variale]], na.rm = TRUE) -
              min(.data[[input$selected_variale]], na.rm = TRUE), 2),
          IQR = round(IQR(.data[[input$selected_variale]], na.rm = TRUE), 2),
          .groups = "drop"
        )}
      else {
        data_dig_clean %>%
          drop_na(Treatment, .data[[input$selected_variale]]) %>%
          count(Treatment, Level = .data[[input$selected_variale]], name = "N") %>%
          group_by(Treatment) %>%
          mutate(Percent = round(N / sum(N) * 100, 1)) %>%
          ungroup()
      }
    
  }, options = list(searching = F, paging = F))
   output$treatment_plot = renderPlotly({
     req(input$selecte_variale)
     selected_v <- data_dig_clean[[input$selecte_variale]]
     if (is.numeric(selected_variale)) {
       l <- ggplot(data_dig_clean, aes(x = Treatment, y = .data[[input$selecte_variale]], 
                       fill = Treatment)) +
                     geom_boxplot(alpha = 0.8, na.rm = T) +
                     theme_grey() +
                     scale_fill_manual(values = c("green", "pink")) +
                       labs(title = "Variable vs Treatment", x = "Treatment Type", y = input$selecte_variale)
       ggplotly(l)
     }
     else{
       l <- ggplot(data_dig_clean, aes(x = Treatment, fill = .data[[input$selecte_variale]])) +
                     geom_bar(position = "dodge", na.rm = T) +
                     theme_grey() +
                     scale_fill_viridis_d(option = "magma") +
                                         labs(title = "Variable vs Treatment", x = "Treatment Type", y = input$selecte_variale)
                   
       
       ggplotly(l) }
         
     
  })

}