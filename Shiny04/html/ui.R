#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinyjs)
library(jsonlite)


myJSON <- fromJSON("C:/Users/frank/OneDrive/CUNEF - MDS/Técnicas de Visualización en DS/Shiny04/html/info.JSON")
type <- myJSON$appinfo$widget$type
url <- myJSON$appinfo$widget$mainUrl

jsVideo <- "<iframe width='560' height='315' src='https://www.youtube.com/embed/jo7mkwvlR9I' frameborder='0' allow='accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture' allowfullscreen></iframe>"

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  useShinyjs(),
  
  # Application title
  titlePanel("Old Faithful Geyser Data"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       sliderInput("bins",
                   "Number of bins:",
                   min = 1,
                   max = 50,
                   value = 30),
       textInput('idvideo', label = 'ID del video', value = 'oSbhjlJ_Ou4')
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       #Esta mierda va a sacar interfaz desde el server, pudiendo usar inputs en el server
       uiOutput('htmlvideo')
       #tags$script(src = 'test.js')
       #tags$script(jsfile)
    )
  )
))

