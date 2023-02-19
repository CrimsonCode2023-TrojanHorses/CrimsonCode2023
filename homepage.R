recipe <- function() {
  # TODO: get random new recipe
  div(
    class = "recipe",
    img(src = "placeholder-recipe.png"),
    h3("Title"),
    div(
      style = "display: flex;",
      p("Author"),
      div(
        style = "margin-left: auto",
        icon("star"),
        icon("star"),
        icon("star"),
        icon("star"),
        icon("star-half")
      )
    ),
    p("Short-desc")
  )
}

render_content_page <- function() {
  home_content <- renderUI(
    for (x in 1:10) {
      recipe()
    }
  )
}

APP_PAGE_homepage <- function(input, output, session) {
  div(
    class = auto_mobile("content-responsive"),
    div(
      class = "home-content",
      recipe()
      #uiOutput("home_content")
    )
  )
  #render_content_page()
}

APP_LSIDE_homepage <- function(input, output, session) {
  div(
    class = auto_mobile("left-sidebar-responsive"),
  )
}

APP_RSIDE_mainnav <- function(input, output, session) {
  observeEvent(input$profile, {
    output$active_left_sidebar <- renderUI(APP_LSIDE_profile(input, output, session))
    output$active_page <- renderUI(APP_PAGE_profile(input, output, session))
  })
  
  observeEvent(input$homepage, {
    output$active_left_sidebar <- renderUI(APP_LSIDE_homepage(input, output, session))
    output$active_page <- renderUI(APP_PAGE_homepage(input, output, session))
  })
  
  div(
    class = auto_mobile("right-sidebar-responsive"),
    APP_UTIL_userCard(session),
    div(
      class = "sidebar-link",
      a(
        href = "#",
        onclick = shinyOnClick("homepage"),
        h3("My Recipe Feed")
      )
    ),
    div(
      class = "sidebar-link",
      a(
        href = "#",
        onclick = shinyOnClick("create"),
        h3("Post A Recipe")
      )
    ),
    div(
      class = "sidebar-link",
      style = "height: 0; padding: 0;"
    )
  )
}