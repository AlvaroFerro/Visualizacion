library(shiny)

shinyUI(
  fluidPage(
    titlePanel(h2("Mi primer dashboard")),
    sidebarLayout(
      sidebarPanel(
        textInput("tamanio", label = "Tamaño de la muestra", value = "10"),
        textInput('correlacion', label = 'Correlacion', value = 'Nivel de correlacion...'),
        actionButton("generar", label = "Generar", icon('calendar')),
        
        textInput('orden', label = 'Orden del polinomio', value = 'Orden polinomial...'),
        actionButton('modelo', label = 'Añadir modelo')
      ),
      
      mainPanel(
        plotOutput('grafica')
      )
    
    )
  )
)

### Interfaz así, sidebar con tamaño (numeric input), correlacion (numeric input), boton (generar)
#Diagrama de dispersion normal de 2 variables con correlacion - lo buscamos
#Modelo lm

#Hay otra seccion abajo
#Orden (numeric - polinomial)
#Boton añadir modelo
