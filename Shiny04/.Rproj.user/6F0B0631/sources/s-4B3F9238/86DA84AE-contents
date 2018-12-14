#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinydashboard)
library(glue)
library(jsonlite)


myJSON <- fromJSON("C:/Users/frank/OneDrive/CUNEF - MDS/Técnicas de Visualización en DS/Shiny04/html/info.JSON")
type <- myJSON$appinfo$widget$type
mainurl <- myJSON$appinfo$widget$mainUrl

chartWhite <- myJSON$appinfo$themes$chartWhite
chartDark <- myJSON$appinfo$themes$chartDark
chartAdvanced <- myJSON$appinfo$themes$advanced

chart <- myJSON$appinfo$internalURL$chart
advanced <- myJSON$appinfo$internalURL$advanced

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   useShinyjs()
  
  values <- reactiveValues(id_video = 0)
  
  `%--%` <- function(x, y) {
    
    do.call(sprintf, c(list(x), y))
    
  }
  
  
  #react <- eventReactive(input$play, {
    #values$id_video <- input$idvideo
  #})
  
  
  output$htmlvideo <- renderUI({
    #Llamamos a todo al pulsar este botón
    #react()
    #invalidateLate(ms)
    cc <- 'BTC'
    #Todo lo que se escriba aque se va a completar en la ui en la parte de abajo de ui htmlvideo
    #Se pueden devolver todas las cosas que se quieran
    #Para devolver muchas cosas se tiene que crear una lista si o si
    list(
      #tags$head(tags$script(type = "text/javascript", "(function (){baseUrl = 'https://widgets.cryptocompare.com/';var scripts = document.getElementsByTagName('script');var embedder = scripts[ scripts.length - 1 ];var appName = encodeURIComponent(window.location.hostname);if(appName==''){appName='local';}var s = document.createElement('script');s.type = 'text/javascript';s.async = true;var theUrl = baseUrl+'serve/v1/coin/chart?fsym=BTC&tsym=USD';s.src = theUrl + ( theUrl.indexOf('?') >= 0 ? '&' : '?') + 'app=' + appName;embedder.parentNode.appendChild(s);})();"))     
      #tags$head(tags$script(HTML("function changeColor(x,y){x.style.backgroundColor = y;}")))
      tags$script(type = type, HTML(mainurl %--% c(chartAdvanced, advanced %--% c('BTC', 'EUR'))))
    )
  })
  
})


###<script type="text/javascript">
