library(shiny)
actor_list <- read.csv("CopyOfActor_List.csv")
shinyServer(
    function(input, output) {
        output$choose_actor <- renderUI({
          selectInput("actor", "Actor", as.vector(actor_list$Actor))})
      
    }
)