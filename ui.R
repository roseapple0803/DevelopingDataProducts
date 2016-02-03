shinyUI(fluidPage(
  titlePanel("Banting - Air Pollutant Index 2013 - 2015"),
  
  fluidRow(
    column(6, wellPanel(
              selectInput("theYear", "Select Year", 
                      choices=c("2015", "2014", "2013"))
          )
    ),

    column(6, wellPanel(             
              selectInput("theMonth", "Select Month", "") 
           )
    )
    
  ),
  
  
  
  fluidRow(
    column(12, wellPanel(  
    h5("API 2013 - 2015", style="text-align:center"),
    plotOutput("myplot")
  ))
    
)
  
 
  
))