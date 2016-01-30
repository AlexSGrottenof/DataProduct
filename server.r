
mean=70; sd=10
x <- seq(-4,4,length=100)*sd + mean
hx <- dnorm(x,mean,sd)
Grade_letter <- "C"


shinyServer(
  function(input, output) {
    fstscr <- reactive({input$stscr})
  rhx <- reactive({dnorm(fstscr(),70, 10)})
    rletter <- reactive({
      if(fstscr()>= 2*sd + mean){
      Grade_letter= "A"
    } else if(fstscr()>=1*sd + mean){
      Grade_letter= "B"
    } else if(fstscr()>= mean){
      Grade_letter= "C"
    } else if(fstscr() <  mean -2*sd ){
      Grade_letter= "F"
    } else if(fstscr() < mean - sd){
      Grade_letter= "D"
    } else if(fstscr() < mean){
      Grade_letter= "C-"
    }
    })
    output$Bcurve <- renderPlot({
    plot(x, hx, type="n", xlab="Scores", ylab="",
         main="Grade on the Normal Curve", axes=FALSE)
    lines(x, hx)
    axis(1, at=seq(0, 100, 10), pos=0) 
    abline(v=fstscr(), col="blue")
    text(fstscr(), 0.022, labels = rletter(), col="coral1", pos= 4)
    text(fstscr(),0.02, labels = fstscr(), col="deeppink3", pos= 4)
    }
    )
    
    
    
  }
  )