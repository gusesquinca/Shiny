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