# Diamond Prices  

####This application uses the R diamond dataset and shows the variation of diamond price per the diamond property

library(shiny)
library(ggplot2)
library(plyr)

shinyServer(function(input,output){
  
  output$priceDistribution <- renderPlot({
    p  <- ggplot(diamonds) +
            geom_density(aes_string(x = "price", fill = input$diamondProperty), alpha=0.3) +
              scale_x_log10()
    title <- paste("price by ",input$diamondProperty)
    print(p + ggtitle(title))
    
  })
  
  output$averagesTable <- renderTable({
    ddply(diamonds,c(input$diamondProperty),summarise, averagePrice=mean(price), medianPrice=median(price))    
    
  })
}

  
)