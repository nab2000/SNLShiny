shinyUI(pageWithSidebar(
    headerPanel("Interactive SNLvDS Graphics"),
    sidebarPanel(
        uiOutput("choose_actor"),
        submitButton('Submit')
    ),
    mainPanel(
        h3('Actor'),
        verbatimTextOutput("nm")
        
    )
))