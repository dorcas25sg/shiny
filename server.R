library(shiny)
library(leaflet)

function(input, output) {
  
  data <- eventReactive(input$go, {
    # do a search based on input
    # within bounding box of philly and prioritizing by closest distance to our classroom first (see boundary.rect and focus.point)
    # replaces spaces in input with %20 - just a convention for it to work
    # readLines then reads the geojson file
    searching2 <- readLines(gsub(" ","%20",paste0("http://search.mapzen.com/v1/search?api_key=mapzen-RbHXgXe&text=", input$popup,"&boundary.rect.min_lat=39.8670043945&boundary.rect.min_lon=-75.2802810669&boundary.rect.max_lat=40.1379623413&boundary.rect.max_lon=-74.9558258057&focus.point.lat=39.949487.215281&focus.point.lon=-75.199285")))
  })
  
  # Empty map before search results are plotted
  output$map <- renderLeaflet({
    leaflet() %>%
    addTiles() %>%
      setView(lat = 39.9526, lng = -75.1652, zoom = 11)
  })
  
  # This is a reactive expression    
  output$fish <- renderText(input$popup)

  output$download <- downloadHandler(
    filename = function() {
      paste0("search-", input$popup, Sys.Date(), ".txt")
    },
    content = function(temp) {
      writeLines(c(data()), temp)
    }
  )
  
  # Plot Results
  observe({
    if(!is.null(input$popup)){
      leafletProxy("map") %>% 
        addGeoJSON(data())
    }
  })
}

