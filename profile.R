APP_PAGE_profile <- function(input, output, session) {
  div(
    class = auto_mobile("content-responsive"),
    div(
      class = "profile-content",
      div(class = "profile-top-container",
      img(class = "profile-banner", src = "placeholder-banner.jpg"),
      div(
        class = "profile-info-container",
        div(
          class = "profile-info",
          # TODO: Get profile info
          img(src = "user-circle.svg"),
          p("John Doe", class = "user-fullname"),
          p("@chezbigjohn", class = "username")
        )
      ),
      div(
        class = "profile-follow",
        p("121 following", class = "profile-following"),
        p("58 followers", class = "profile-followers")
      )),
      div(
        class = "profile-options",
        div(
          class = "profile-option-tabs",
          span(class = "profile-option", "Settings"),
          span(class = "profile-option", "Saved Recipes"),
          span(class = "profile-option", "My Recipes")
        ),
        div(
          id = "profile-settings",
          class = "profile-option-pane",
          style = "height: 50vh;",
          div(
            class = "profile-settings-left",
            div(
              class = "profile-settings-menu",
              icon("user"),
              "Profile"
            ),
            div(
              class = "profile-settings-menu",
              icon("skull"),
              "Allergies"
            ),
            div(
              class = "profile-settings-menu",
              icon("bell"),
              "Notifications"
            ),
            div(
              class = "profile-settings-menu",
              icon("shield"),
              "Security"
            )
          )
        ),
        hide(div(
          id = "profile-saved",
          class = "profile-option-pane"
        )),
        hide(div(
          id = "profile-my",
          class = "profile-option-pane"
        ))
      )
    )
  )
}

APP_LSIDE_profile <- function(input, output, session) {
  div(
    class = auto_mobile("left-sidebar-responsive"),
  )
}