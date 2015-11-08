library(shiny)
library(ggplot2)

source("LoadModel1.R")

shinyServer(
  function(input, output) {
    
    output$textOutput <- renderText({
        pred <- predict.cost(c(input$age_group,
                       input$gender,
                       input$race,
                       input$disease_description,
                       input$type_admission, 
                       input$patient_disp,
                       input$procedure, 
                       input$med_surg_desc, 
                       input$payment))
        paste0("$", round(pred,2))
    })
  }
)
