library(shiny)
library(ggplot2)


diabetesRisk<-function(glucose) glucose/200

shinyServer(
  function(input,output){
    output$inputValue<-renderPrint({input$glucose})
    output$prediction<-renderPrint({diabetesRisk(input$glucose)})
  }
)

