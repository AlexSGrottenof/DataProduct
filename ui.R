library(shiny)

shinyUI(pageWithSidebar(
  headerPanel("MTVS Score Conveter"),
  
  sidebarPanel(  tabsetPanel(
    tabPanel("Documentation", "This application coverts your MTVS score into a letter grade, based
on a normal curve. The MTVS was a method developed at a local High
             School to quantify the amount of quality TV programming that students watched per week. The scores followed a normal distribution with a known average and standard deviation. The scale is from 30 to 100, where a 30 means a student watched more than 90 hours of TV a week with 95% or more of it being of poor quality content, and where a 100 means a student watched less than 6 hours of TV a week with 95% or more of it being of high quality content.
             
             Input a score by moving the slider. The corresponding letter grade will be displayed along with the score entered next to the blue horizontal line over the Normal curve .")
    )
    
    
    ),
  mainPanel(
    
   
   plotOutput('Bcurve'),
   sliderInput('stscr', label = "Select score below",
               value = 50, min = 30,
               max=100, step = 1)
   
    )
  ))