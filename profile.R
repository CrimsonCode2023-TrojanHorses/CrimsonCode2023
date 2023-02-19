APP_PAGE_profile <- function(input, output, session) {
  div(
    class = auto_mobile("content-responsive"),
    div(
      class = "profile-content",
      h1("Profile", style = "text-align: center;"),
      p("Profile stuff")
    )
  )
}

APP_LSIDE_profile <- function(input, output, session) {
  div(
    class = auto_mobile("left-sidebar-responsive"),
  )
}