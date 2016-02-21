library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("DDP Assigment DS Specialization"),
  sidebarPanel( 
    h3('Triangle side lenghts'),
    h4('Please introduce lengths for the rectangle triangle'),
    sliderInput('a', 'Length side a', 1, min = 0.1, max = 100, step = 0.1),
    sliderInput('b', 'Length side b', 1, min = 0.1, max = 100, step = 0.1)
  ),
  mainPanel(
    h3('Pitagoras Equation'),
    h2(code('c = sqrt(a^2 + b^2)')),
    h1(),
    h2(tableOutput('c')),
    plotOutput('polygon')
  )
))