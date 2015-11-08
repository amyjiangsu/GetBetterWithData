library(shiny)
library(ggplot2)

load("selction_list.Rdata")
shinyUI(bootstrapPage(theme = "bootstrap.min.css",
    titlePanel(windowTitle = "Getting Better with Data", title = HTML("<div class=\"title\"><div class=\"line1\">Health Data Prediction</div><div class=\"line2\">How much does it cost?</div></div>")),
    tabsetPanel(
      tabPanel("Prediction", 
               h5("Conditions:"),
               HTML('<div class = "box"><br/>'),
               fluidRow(
                   column(3,
                          radioButtons("gender","Gender:", gender),
                          selectInput('type_admission', 'Type of Admission:', type.admission),
                          selectInput('disease_description', 'Disease:', disease.desc)
                   ),
                   column(1, ""),
                   column(3,
                          radioButtons("age_group","Age Group:", age.group),
                          selectInput('procedure', 'Procedure:', procedure.desc),
                          selectInput('med_surg_desc', 'Medical/Surgical Desc.:', med.surg.desc)
                   ),
                   column(1, ""),
                   column(3,
                          radioButtons("race","Race:", race),
                          selectInput('patient_disp', 'Patient Disposition', patient.disp),
                          selectInput('payment', 'Source of Payment', source.of.payment),
                          submitButton('Predict')
                   )
               ),
              verbatimTextOutput("textOutput"),
              HTML("</div>")
              ),
      tabPanel("Exploratory Analysis",
               HTML('<br/><div class = "box">
                   <img src="distribution_total_charged.png">
                   <img src="admissions_by_gender_and_age.png">
                   <img src="lasso.png">
                   </div>'
                   )
               ),
      tabPanel("About Us", HTML('<br/><div class = \'box\'><table>
            <tr><td><image src=\'Amy_Pic.png\', width = \'200\', height = \'200\'></td><td class=\'txt\'>
                Amy Jiang<br />
                M.S. Applied Statistics<br />
                Fordham University
            </td></tr>
            <tr><td>&nbsp;</td></tr>
            <tr><td><image src=\'liz.jpg\', width = \'200\', height = \'200\'></td><td class=\'txt\'>
                Elizabeth Cutrone<br />
                PhD Student,  Cognition and Perception, <br /> 
            Department of Psychology, New York University 
            </td></tr>
            <tr><td>&nbsp;</td></tr>
            <tr><td><image src=\'tom.png\', width = \'200\', height = \'200\'></td><td class=\'txt\'>
                Thomas Vincent<br /> 
                Ph.D. in BioStatistics, <br />
                Data Scientist at Dow Jones. Strong background in Whiskey      
            </td></tr>
            <tr><td>&nbsp;</td></tr>
            <tr><td><image src=\'ross.png\', width = \'200\', height = \'200\'></td><td class=\'txt\'>
                Ross Fadely <br />
                Astronomy PhD Rutgers University <br />
                NYU Postdoctoral Researcher 
            </td></tr>
            <tr><td>&nbsp;</td></tr>
            <tr><td><image src=\'darin.png\', width = \'200\', height = \'200\'></td><td class=\'txt\'>
                Darin Comeau <br />
                Center for Atmosphere Ocean Science, <br />
                Courant Institute of Mathematical Sciences, <br />
                New York University 
            </td></tr>
            <table></div><br/><br/>'))
  )
))