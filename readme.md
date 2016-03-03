## Readme

### The shiny app for the course assigment, makes a simple calculation of the Pitagoras Theorem.  
The user is able to apply this theorem moving the lenght of the sides of a triangle rectangle with two slider inputs.

The ui.R file prepares the inputs and segmentation of the web page.
One slider input for side a of the rectangle, and one slider input for side b of the rectangle.
The maximumn value permited is 100, with steps of 0.1.

On the server.R file the calculation and plotting is made for showing the user the results.
There is the function Pitagoras created for the calculations, and hte plot using a simple plot function with de polygon
function.


### Code of the ui.R file

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
  
### Code of the server.R file

    pitagoras <- function(a,b) { sqrt(a^2 + b^2)
  
    }
  
    triangle <- function(a,b) {
  
    c <- pitagoras(a,b)
    
    a1 <- c(0, a)
  
    b1 <- c(b, 0)
  
    orig <- rbind(a1, c(0,0), b1)
  
    x <- c(0,100)
    
    y <- c(0,100)
    
    plot(x,y, xlab = "a", ylab = "b")
    
    polygon(orig, col = "dark red", lwd = 2)
    
    axis(side = 1, at = 100)
    
    axis(side= 2, at = 100)
    
    text(10+(a/2), 5+(b/2), labels = c)
    
    }
    
    shinyServer( 
    
      function(input,output) {
    
      output$c <- renderPrint({pitagoras(input$a,input$b)})
    
      output$polygon <- renderPlot({triangle(input$a, input$b)})
    
    }
   
    )
