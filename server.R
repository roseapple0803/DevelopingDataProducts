library(shiny)
library(lubridate)
library(ggplot2)
#require(reshape2)


banting <- read.csv("API_Banting.csv")
banting$Date <- as.Date(banting$Date)


shinyServer(function(input, output, clientData, session) {
  
  dropdownResult<- reactive({
    x <- switch(input$theYear,
           "2015" = 1:2,
           "2014" = 1:12,
           "2013" = 8:12) 
    as.character(x)
  })
  
  
  
  observe({
    month_list <- dropdownResult()

    updateSelectInput(session, "theMonth", choices = month_list)
  })
  
  
  output$myplot <- renderPlot({
    selected.data <- banting[as.character(year(banting$Date)) == input$theYear & as.character(month(banting$Date)) == input$theMonth, ]  
    ggplot(data=selected.data, aes(x=Hour, y=API))+stat_smooth(method = "loess", color= "red")+labs(x="Hour", y="API")
  })
  
  
})
