library(shiny)
library(leaflet)

navbarPage("Philadelphia Locator", theme = "bootstrap.min.css",
  tabPanel("Map",
      sidebarPanel(
        tags$img(height=120, width=120, style="display: block; margin-left: auto; margin-right: auto;", src="locating.png"),
        h4(style = "text-align: center","Try the App!"),
        p(" "),
        textInput("popup", "Search for a place here:"),
        p("e.g. 'Houston Hall' "),
      actionButton(inputId = "go", label = "Search Now!"),
      p(" ", tags$br()),
      p("You can even download the search result GeoJson here:"),
      downloadButton("download", "Download Now")
      ),
      mainPanel(
        leafletOutput("map"),
        h4("Searching For:"),
        textOutput("fish")
      )
    ),
  tabPanel("About",
           sidebarLayout(
             sidebarPanel(
               h2("About the App")
             ),
             mainPanel(
               h3("How does the Philadelphia Locator Work?"),
               p("Using the Mapzen Search API, your search is connected to open-source tools and data, geocoded, to give you relevant places in the Philadelphia region"),
               p("The search bounding box is set to"),
               tags$ol(
                 tags$li("Min Lat: 39.8670043945"), 
                 tags$li("Min Long:-75.2802810669"), 
                 tags$li("Max Lat: 40.1379623413"),
                 tags$li("Max Long: -74.9558258057")
               ),
              p("Search results are then prioritized based on closest distance to Stephen A. Levin Building.")
             )
           )
  ),
  tabPanel("Resources",
           sidebarLayout(
             sidebarPanel(
               h2("Resources"),
               tags$ol(
                 tags$li("Shiny"), 
                 tags$li("Bootswatch"),
                 tags$li("Leaflet"),
                 tags$li("Mapzen Search"), 
                 tags$li("Webalys Freebies")
               )
             ),
             mainPanel(
               h3("Shiny"),
               p("Used as the web application framework for R to build this site!"),
               tags$a(href="http://shiny.rstudio.com/", "Read more on Shiny"),
               h3("Bootswatch"),
               p("Used one of its free CSS!"),
               tags$a(href="http://bootswatch.com/", "Read more on Bootswatch"),
               h3("Leaflet"),
               p("For maps and markers!"),
               tags$a(href="https://rstudio.github.io/leaflet/", "Read more on Leaflet for R"),
               h3("Mapzen Search"),
               p("An API for the search function!"),
               tags$a(href="http://mapzen.com/documentation/search/search/", "Read more on Mapzen"),
               h3("Webalys Freebies"),
               p("For the logo!"),
               p("Icons made by", a(href="http://www.flaticon.com/authors/webalys-freebies", "Webalys Freebies"), "from", a(href="http://www.flaticon.com", "www.flaticon.com"), "is licensed by", a(href="http://creativecommons.org/licenses/by/3.0/", "CC 3.0 BY"))
             )
           )
           
  ),
  tabPanel("Source Code",
           sidebarLayout(
             sidebarPanel(
               h3("Source Code")
             ),
             mainPanel(
               h4("Github"),
               p("Source code used for the app may be found on", a(href="https://github.com/dorcas25sg/shiny", "this repository"))
             )
           )
           
  )
)