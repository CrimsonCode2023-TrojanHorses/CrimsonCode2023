APP_PAGE_create <- function(input, output, session) {
  div(
    class = auto_mobile("content-responsive"),
    div(
      class = "create-content",
      h1("Post a Recipe"),
      textInput("recipe_title", "Title"),
      textInput("recipe_shortdesc", "Short Description"),
      textAreaInput("recipe_description", "Description"),
      "Ingredients",
      uiOutput("recipe_ingredients"),
      textInput("recipe_ingredient", "Add Ingredient"),
      textInput("recipe_quantity", "Quantity"),
      actionButton("recipe_addingredient", "Add Ingredient", icon = icon("plus")),
      fileInput("recipe_image", "Image", accept = "image/*")
    )
  )
}

APP_LSIDE_create <- function(input, output, session) {
  div(
    class = auto_mobile("left-sidebar-responsive"),
  )
}