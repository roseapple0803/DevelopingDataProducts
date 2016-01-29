library(shiny)
library(lubridate)
library(ggplot2)
require(reshape2)

banting <- read.csv("API_Banting.csv")
banting$Date <- as.Date(banting$Date)

function(input, output){
    output$plot1<-renderPlot({
    selected.data <- banting[as.character(year(banting$Date)) == input$year & as.character(month(banting$Date)) == input$month, ]  
    ggplot(data=selected.data, aes(x=Hour, y=API))+stat_smooth(method = "loess", color= "red")+labs(x="Hour", y="API")
  })}
