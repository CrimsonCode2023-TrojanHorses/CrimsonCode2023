generate_recipes <- function(num) {
  lapply(seq_len(num), function(n) {
    # TODO: get random new recipe
    div(
      class = "recipe",
      img(src = "placeholder-recipe.png"),
      div(
        style = "display: flex;",
        h3("Title"),
        div(
          style = "margin-left: auto; padding-top: 15px;",
          icon("star"),
          icon("star"),
          icon("star"),
          icon("star"),
          icon("star-half")
        )
      ),
      p("Author"),
      p("Short-desc")
    )
  })
}

APP_PAGE_homepage <- function(input, output, session) {
  observeEvent(input$list_end_reached, {
    insertUI(
      selector = "#end",
      where = "beforeBegin",
      ui = generate_recipes(5)
    )
  })
  
  div(
    class = auto_mobile("content-responsive"),
    onscroll = 'if (document.observer != undefined) return; document.observer = new IntersectionObserver(function(entries) { if (entries[0].intersectionRatio > 0) {Shiny.setInputValue("list_end_reached", true, { priority: "event" });}});observer.observe(document.querySelector("#end"));',
    div(
      class = "home-content",
      h3(paste("Welcome back,", session$userData$name), style = "text-align: center;"),
      div(style = "display: flex; align-items: center; justify-content: center; height: 60px; background-color: #F1E3D7;",
        h2("Try Something New", style = "padding: 0; margin: 0")
      ),
      br(),
      generate_recipes(5),
      div(id = "end"),
      br(),
      br(),
      p("Sorry, looks like there's nothing else here...", style = "text-align: center;"),
      br(),
      br(),
      br(),
      br()
    )
  )
}

APP_LSIDE_homepage <- function(input, output, session) {
  div(
    class = auto_mobile("left-sidebar-responsive"),
    div(
      h1("Filter"),
      class = auto_mobile("filter-pane"),
      textInput("searchterm", "", placeholder = "Search..."),
      actionButton("apply_filters", "Apply Filters")
    )
  )
}

APP_RSIDE_mainnav <- function(input, output, session) {
  observeEvent(input$profile, {
    session$userData$page <- "profile"
    output$active_left_sidebar <- renderUI(APP_LSIDE_profile(input, output, session))
    output$active_page <- renderUI(APP_PAGE_profile(input, output, session))
  })
  
  observeEvent(input$homepage, {
    session$userData$page <- "home"
    output$active_left_sidebar <- renderUI(APP_LSIDE_homepage(input, output, session))
    output$active_page <- renderUI(APP_PAGE_homepage(input, output, session))
  })
  
  observeEvent(input$debug, {
    browser()
  })
  
  div(
    class = auto_mobile("right-sidebar-responsive"),
    APP_UTIL_userCard(session),
    div(
      class = "sidebar-link",
      a(
        onclick = shinyOnClick("homepage"),
        h3("My Recipe Feed")
      )
    ),
    div(
      class = "sidebar-link",
      a(
        onclick = shinyOnClick("create"),
        h3("Post A Recipe")
      )
    ),
    div(
      class = "sidebar-link",
      a(
        onclick = shinyOnClick("debug"),
        h3("DEBUG")
      )
    ),
    div(
      class = "sidebar-link",
      style = "height: 0; padding: 0;"
    )
  )
}