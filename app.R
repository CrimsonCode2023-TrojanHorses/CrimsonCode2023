library(shiny)
library(shinybrowser)
library(shinyjs)

ui <- fluidPage(
  useShinyjs(),
  detect(),
  tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "mainstyle.css"),
    tags$meta(name = "viewport", content = "width=device-width, initial-scale=1.0"),
  ),
  
  {
    source("utils.R")
    source("homepage.R")
    source("profile.R")
    source("create.R")
    NULL
  },
  
  uiOutput("desktop_header"),
  uiOutput("mobile_footer"),
  div(
    id = "content",
    style = "display: flex; overflow: hidden;",
    uiOutput("active_left_sidebar", style = "display: flex;"),
    uiOutput("active_page", style = "display: flex; width: 100%; height: 100vh"),
    uiOutput("active_right_sidebar", style = "display: flex; float: right")
  ),
)

server <- function(input, output, session) {
  reticulate::virtualenv_create("venv")
  reticulate::use_virtualenv("venv")

  session$userData$username <- "chezbigjohn"
  session$userData$name <- "John Doe"
  session$userData$email <- "johndoe@email.com"
  session$userData$page <- "home"
  
  ui_state <- reactiveValues(left_sidebar = "open", right_sidebar = "open")
  
  output$active_page <- renderUI(APP_PAGE_homepage(input, output, session))
  output$active_left_sidebar <- renderUI(
    APP_LSIDE_homepage(input, output, session)
  )
  
  output$active_right_sidebar <- renderUI(
    APP_RSIDE_mainnav(input, output, session)
  )
  
  output$desktop_header <- renderUI(
    if (is_device_desktop()) {
      div(
        class = "desktop-header",
        h3("Food Finder", style = "margin: auto; color: var(--theme-verylight);")
      )
    }
  )
  
  observeEvent(input$search, {
    if (session$userData$page == "home") {
      runjs("$('#active_left_sidebar div').addClass('show')")
    } else {
      session$userData$page <- "home"
      output$active_left_sidebar <- renderUI(APP_LSIDE_homepage(input, output, session))
      output$active_page <- renderUI(APP_PAGE_homepage(input, output, session))
      runjs("Shiny.setInputValue('search', Math.random())")
    }
  })
  
  output$mobile_footer <- renderUI(
    if (is_device_mobile()) {
      runjs("$('#content').css('height', '92vh')")
      runjs("$('.content-responsive').css('padding-left', '0')")
      runjs("$('.content-responsive').css('padding-right', '0')")
      div(
        class = "mobile-footer",
        a(onclick = shinyOnClick("back"), icon("arrow-left")),
        a(onclick = shinyOnClick("homepage"), icon("home")),
        a(onclick = shinyOnClick("search"), icon("search")),
        a(onclick = shinyOnClick("create"), icon("plus")),
        a(onclick = shinyOnClick("profile"), icon("user-circle"))
      )
    }
  )
}

# Run the application 
shinyApp(ui = ui, server = server)
