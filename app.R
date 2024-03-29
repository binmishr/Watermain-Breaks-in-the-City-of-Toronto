library(shiny)
ui <- shinyUI(pageWithSidebar(
   
   # Application title
   headerPanel("Old Faithful Geyser Data"),
   
   # Sidebar with a slider input for number of bins
   sidebarPanel(
      sliderInput("bins",
                  "Number of bins:",
                  min = 1,
                  max = 50,
                  value = 30)
   ),
   
   # Show a plot of the generated distribution
   mainPanel(
      plotOutput("distPlot")
   )
))
server <- function(input, output) {
   output$distPlot <- renderPlot({
      
      # generate bins based on input$bins from ui.R
      x    <- faithful[, 2] 
      bins <- seq(min(x), max(x), length.out = input$bins + 1)
      
      # draw the histogram with the specified number of bins
      hist(x, breaks = bins, col = 'darkgray', border = 'white')
      
   })
   
}
shinyApp(ui = ui, server = server)