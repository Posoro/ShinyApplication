# Diamond Prices  

####

library(shiny)


# Define UI for dataset viewer application
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel(
    
    h1("Diamond Prices by Property", align="center",style = "color:red"),
    br()
   
    
),
  
             
  
  sidebarPanel(
    
    selectInput("diamondProperty", "Choose a property:", 
                choices = c("cut","clarity",'color')), 
    
    h4("User Instructions"),
    div("This application uses the R diamond dataset and shows the variation of diamond price per the diamond property.
    Review the prices by varying the property using the lookup list above.If you are interested in the average and median price lists per diamond property, 
        then click on the tab labelled 'averages'", style = "color:blue")
    
  ),
  
  
  mainPanel(
    tabsetPanel(
      tabPanel("Distribution", plotOutput("priceDistribution")),
      tabPanel("Averages", tableOutput("averagesTable"))
      )
  )
))

