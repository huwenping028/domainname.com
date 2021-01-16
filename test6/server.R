library(shiny)
library(quantmod)
source("E:/desktop/MyShinyApp/test5/helpers.R")

source("E:/desktop/MyShinyApp/test6/help/helpfunction.R")

#  server.R
server<-function(input,output){
  observeEvent(input$submit,{
    withProgress(message = "Steps:",value = 0,{
      incProgress(1/7,detail = paste0("Waitting","1"))
      text_area_input <- input$text_area_list
      df<-as.data.frame(matrix(unlist(stringr::str_split(text_area_input,"\n")),ncol=1))
      print(class(text_area_input))
      print(text_area_input)
      incProgress(2/7,detail = paste0("Waitting","2"))
      output$gene_number_info<-renderText({
        paste0("A","B")
      })
      output$gene_number_info_table<-DT::renderDataTable({
        DT::datatable(df)
      })
    })
  })
  dataInput <- reactive({
    getSymbols(input$symb, src = "yahoo",
               from = input$dates[1],
               to = input$dates[2],
               auto.assign = FALSE)
  })
  
  output$plot <- renderPlot({
    
    chartSeries(dataInput(), theme = chartTheme("white"),
                
                type = "line", log.scale = input$log, TA = NULL)
  })
  
  output$results <- renderText(
    paste("This is your results:", input$inputsomething)
  )
  
  output$wordresult <- renderText(
    paste("This is your results:", youdaoTranslate(input$inputword))
  )
    
}