library(shiny)

fluidPage(
  titlePanel("Banting - Air Pollutant Index 2013 - 2015"),
  sidebarLayout(
    sidebarPanel(
      selectInput(
      inputId = "year", label="Select Year", selected=2014, choices=c(2013, 2014, 2015)),
      selectInput(
      inputId = "month", label="Select Month", selected=1, choices=c(1,2,3,4,5,6,7,8,9,10,11,12)),
      h6("Please note there's no data being captured before August, 2013 and after February, 2015")),
mainPanel(
  h3("API 2013 - 2015"),
  plotOutput("plot1")
  )
)
)
