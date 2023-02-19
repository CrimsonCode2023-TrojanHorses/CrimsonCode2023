auto_mobile <- function(class) {
  if (is_device_mobile()) {
    paste(class, "mobile")
  } else {
    class
  }
}

shinyOnClick <- function(id) {
  paste0("Shiny.setInputValue('", id, "', Math.random())")
}

APP_UTIL_userCard <- function(session) {
  a(
    onclick = shinyOnClick("profile"),
    class = "usercard",
    img(class = "usericon", src = "user-circle.svg"),
    div(
      class = "userinfo",
      p(session$userData$name, class = "user-fullname"),
      p(paste0("@", session$userData$username), class = "username")
    )
  )
}