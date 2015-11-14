library(shiny)
shinyUI(pageWithSidebar(
    headerPanel("Saturday Night Live v Daily Show: Interactive Graphic"),
    sidebarPanel(
        h3("Select the Actor to show their data"),
        uiOutput("choose_actor"),
        tags$div(class="header", checked=NA,
                 tags$p("For more details on how this data was acquired visit the 
                        github page"),
                 tags$a(href="http://nab2000.github.io/DSvSNL.html", "SNLvDS"))
    ),
    mainPanel(
            tableOutput('tble'),
            plotOutput('fig')
    )
))