library(shiny)
library(ggplot2)

shinyServer(function(input, output){
  
  output$grafica <- renderPlot({
    
    input$generar
    tamanio <- isolate(input$tamanio)
    distribucion <- isolate(input$correlacion)
    
    orden <- isolate(input$orden)
    
    plot(as.numeric(tamanio), cor(as.numeric(tamanio)))
    #ggplot(tamanio, aes(x=tamanio, y = cor(tamanio))) + geom_point() + geom_smooth(method=lm, se=FALSE)
  })
  

})


#Orden polinomial 1/2/3, orden 1 es una linea
#Cuando se pulsa añadir se añade una linea
#Genero aparecen, pulso orden y aparecen
#Orden 2 en ggplot