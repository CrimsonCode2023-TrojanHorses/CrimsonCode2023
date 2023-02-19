auto_mobile <- function(id) {
  if (is_device_mobile()) {
    paste(id, "mobile")
  } else {
    id
  }
}

shinyOnClick <- function(id) {
  paste0("Shiny.setInputValue('", id, "', Math.random())")
}

APP_UTIL_userCard <- function(session) {
  a(
    onclick = shinyOnClick("profile"),
    href = "#",
    class = "usercard",
    img(class = "usericon", src = "user-circle.svg"),
    div(
      class = "userinfo",
      p("User Name"),
      p("Points? Email?")
    )
  )
}