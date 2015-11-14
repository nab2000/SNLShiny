library(shiny)
library(ggplot2)
actor_list <- read.csv("Actor_Score.csv")
shinyServer(
    function(input, output) {
        output$choose_actor <- renderUI({
          selectInput("actor", "", as.vector(actor_list$Actor))})
        
        output$fig <- renderPlot({
                actor <- input$actor
        
                actor_list$Years <- actor_list$EndYear - actor_list$BegYear + 1
                g <- ggplot(aes(x = Years, y = RT_Mean, col = Show), data = actor_list)
                g <- g+ geom_point() + ylab("Mean Rotten Tomatoe Score") + xlab("Years on the Show")
                g <- g + geom_point(data = actor_list[actor_list$Actor == actor,], 
                                    aes(x = Years, y = RT_Mean, col = actor), col = "green", size = 7)
                g
        }
        )
        output$tble <- renderTable({
                actor <- input$actor    
                sub_data <- actor_list[actor_list$Actor == actor, 1:8]
                sub_data$Actor <- factor(sub_data$Actor)
                rownames(sub_data) <- rep("", nrow(sub_data))
                sub_data
        })
                
        
    }
)