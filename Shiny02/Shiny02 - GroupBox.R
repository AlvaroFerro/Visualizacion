library(shiny)
library(shinyBS)
library(ggplot2)
library(plotly)

ui <- shinyUI(
  #Se ensancha tanto como el navegador del ordenador
  fluidPage(
    titlePanel(h2("Mi primer dashboard")),
    sidebarLayout(
      sidebarPanel(
        selectInput('selectinputX',
                    label = "Variable X", 
                    choices = names(mtcars), 
                    multiple = FALSE),
        selectInput('selectinputY',
                    label = "Variable Y", 
                    choices = names(mtcars), 
                    multiple = FALSE),
        selectInput('selectinputfacet',
                    label = 'Facet',
                    choices = names(mtcars),
                    multiple = FALSE),
        radioButtons("radio", label = NULL,
                     choices = c("Por filas" = 1, "Por columnas" = 2), 
                     selected = 1),
        selectInput('selectinputcolor',
                    label = 'Color',
                    choices = names(mtcars),
                    multiple = FALSE),
        sliderInput("sliderAlpha", label = "Valor Alpha", min = 0, 
                    max = 1, value = 1, step = 0.1, animate = TRUE),
        sliderInput("sliderTamano", label = "Tamaño de los puntos", min = 3, 
                    max = 8, value = 3, step = 0.5, animate = TRUE),
        
        checkboxInput('cbInput', 
                      label = 'Convertir a PlotLy',
                      value = FALSE),
        checkboxGroupInput('cbGroupInput', 
                           label = NULL, 
                           c('Facet', 'Ponme color')),

        bsTooltip('selectinputX', 'Variable que se va a usar para el eje X', placement = 'right'),
        bsTooltip('selectinputY', 'Variable que se va a usar para el eje Y', placement = 'right'),
        bsTooltip('selectinputfacet', 'Variable que se va a usar para el facet', placement = 'right'),
        bsTooltip('selectinputcolor', 'Variable que se va a usar para el color', placement = 'right'),
        bsTooltip('sliderAlpha', 'Nivel de transparencia de la representación', placement = 'right'),
        bsTooltip('cbInput', 'Hace la gráfica interactiva', placement = 'right'),
        bsTooltip('sliderTamano', 'Tamaño de los puntos en la gráfica', placement = 'right')
        ),
      
      mainPanel(h1("Gráfica"), ("Esta es la gráfica de Mtcars"),
                conditionalPanel(
                  condition = "input.cbInput",
                  plotlyOutput("graficaPlotLy")
                ),
                conditionalPanel(
                  condition = "!input.cbInput",
                  plotOutput('grafica')
                )
      )
      )
  )
  )

server <- function(input, output, session) {
  
  output$graficaPlotLy <- renderPlotly({
   
    #Declaracion de condiciones
    facet      <- "Facet"           %in% input$cbGroupInput
    color      <- "Ponme color"     %in% input$cbGroupInput
    
    #Declaracion de variables
    basicPlot <- ggplot(mtcars, aes_string(x = input$selectinputX,y = input$selectinputY))
    gp_color <- geom_point(size = as.numeric(input$sliderTamano), aes_string(color = input$selectinputcolor), alpha = input$sliderAlpha)
    fGrid <- 0
    gp_normal <- geom_point(size = as.numeric(input$sliderTamano), alpha = input$sliderAlpha)
    scaleColor <- scale_color_gradientn(colors = rainbow(5))
    
    #Facet por filas o columnas segun disponga el usuario
    if (input$radio == 2){
      fGrid <- facet_grid(as.formula(paste(". ~", input$selectinputfacet)))
    }
    else{
      fGrid <- facet_grid(as.formula(paste(input$selectinputfacet, "~ .")))
    }
    
    
    if (facet & color){
      ggplotly(basicPlot + gp_color + fGrid + scaleColor)
    }
    else if (facet){
      ggplotly(basicPlot + gp_normal + fGrid)
    }
    else if (color){
      ggplotly(basicPlot + gp_color + scaleColor)
    }
    else{
      ggplotly(basicPlot + gp_normal)
    }
    
  })
  
  output$grafica <- renderPlot({
    
    #Declaracion de condiciones
    facet      <- "Facet"       %in% input$cbGroupInput
    color      <- "Ponme color"     %in% input$cbGroupInput
    
    #Declaracion de variables
    basicPlot <- ggplot(mtcars, aes_string(x = input$selectinputX,y = input$selectinputY))
    gp_color <- geom_point(aes_string(color = input$selectinputcolor), size = as.numeric(input$sliderTamano), alpha = input$sliderAlpha)
    gp_normal <- geom_point(size = as.numeric(input$sliderTamano), alpha = input$sliderAlpha)
    fGrid <- 0
    scaleColor <- scale_color_gradientn(colors = rainbow(5))
    
    #Facet por filas o columnas según disponga el usuario
    if (input$radio == 2){
      fGrid <- facet_grid(as.formula(paste(". ~", input$selectinputfacet)))
    }
    else{
      fGrid <- facet_grid(as.formula(paste(input$selectinputfacet, "~ .")))
    }
    
    if (facet & color){
      basicPlot + gp_color + fGrid + scaleColor
    }
    else if (facet){
      basicPlot + gp_normal + fGrid
    }
    else if (color){
      basicPlot + gp_color + scaleColor
    }
    else{
      basicPlot + gp_normal
    }  
  })
}

shinyApp(ui, server)