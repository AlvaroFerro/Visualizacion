library(shiny)
library(ggplot2)

shinyServer(function(input, output) {
   
  resultados <- reactiveValues()
  
  output$barras <- renderPlot({
    ggplot(mpg, aes(x = cyl)) + geom_histogram(fill = input$color)
  })
  
  #Esta es una opción, se observaría el evento y se actualizaría la gráfica en el valor reactivo
  observeEvent(input$boton, {
    randomX <- as.data.frame(rnorm(input$elements))
    randomY <- as.data.frame(rnorm(input$elements))
    dataframe <- cbind(randomX, randomY)
    
    names(dataframe) <- c('ejeX', 'ejeY')
    resultados$grafica <- ggplot(dataframe) + geom_point(aes(ejeX, ejeY))
  })
  
  output$aleatoria <- renderPlot({
    
    #Poniendo aqui el input se actualizaría directamente el resultado, sería otra opción.
    #input$boton
    
    randomX <- as.data.frame(rnorm(input$elements))
    randomY <- as.data.frame(rnorm(input$elements))
    dataframe <- cbind(randomX, randomY)
    
    names(dataframe) <- c('ejeX', 'ejeY')
  
    resultados$grafica <- ggplot(dataframe) + geom_point(aes(ejeX, ejeY))
    resultados$grafica
  
    })
  
})
