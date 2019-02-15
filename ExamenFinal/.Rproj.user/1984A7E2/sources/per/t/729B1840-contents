library(shiny)

shinyUI(fluidPage(
  
  titlePanel("Examen de Alvaro Ferro Perez"),
  
  sidebarLayout(
    sidebarPanel(
       selectInput(inputId ='color',
                  label = 'Elige el color que quieras',
                  choices = c('grey' = 'grey', 'red' = 'red', 'blue' = 'blue'),
                  selected = 'grey'),
       sliderInput("elements",
                   "Numero de elementos",
                   min = 1,
                   max = 50,
                   value = 20,
                   step = 1),
       actionButton('boton', 'Nuevo dataset')
    ),
    
    mainPanel(
       plotOutput("barras"),
       plotOutput("aleatoria")
    )
  )
))
