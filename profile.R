APP_PAGE_profile <- function(input, output, session) {
  observeEvent(input$profile_settings, {
    show("profile-settings")
    hide("profile-saved")
    hide("profile-mine")
  })
  
  observeEvent(input$profile_saved, {
    hide("profile-settings")
    show("profile-saved")
    hide("profile-mine")
  })
  
  observeEvent(input$profile_mine, {
    hide("profile-settings")
    hide("profile-saved")
    show("profile-mine")
  })
  
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
          a(class = "profile-option", onclick = shinyOnClick("profile_settings"), "Settings"),
          a(class = "profile-option", onclick = shinyOnClick("profile_saved"), "Saved Recipes"),
          a(class = "profile-option", onclick = shinyOnClick("profile_mine"), "My Recipes")
        ),
        div(
          id = "profile-settings",
          class = "profile-option-pane",
          style = "height: 70vh;",
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
          ),
          div(
            id = "profile-settings-profile",
            class = "profile-settings-right",
            textInput("name", "Name", value = session$userData$name),
            textInput("email", "Email", value = session$userData$email),
            passwordInput("password", "Password", placeholder = "********"),
            passwordInput("password", "Confirm Password", placeholder = "********"),
            actionButton("submit", "Update Profile")
          )
        ),
        hide(div(
          id = "profile-saved",
          class = "profile-option-pane"
        )),
        hide(div(
          id = "profile-mine",
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