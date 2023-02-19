APP_PAGE_create <- function(input, output, session) {
  observeEvent(input$recipe_addingredient, {
    if (input$recipe_addingredient != 0) {
      session$userData$recipe = tibble(Ingredient=c(session$userData$recipe$Ingredient, input$recipe_ingredient),
        Quantity=c(session$userData$recipe$Quantity, input$recipe_quantity))
      output$recipe_ingredients <- renderDataTable(datatable(session$userData$recipe, selection = "single"))
    }
  })
  
  observeEvent(input$recipe_remove, {
    if (!is.null(input$recipe_ingredients_rows_selected) && input$recipe_remove != 0) {
      recipe <- session$userData$recipe
      if (length$recipe == 1) {
        session$userData$recipe <- NULL
        output$recipe_ingredients <- renderDataTable(datatable(data.frame()))
      }
      else if (input$recipe_ingredients_rows_selected == length(recipe)) {
        session$userData$recipe = tibble(
          Ingredient=recipe$Ingredient[1:(input$recipe_ingredients_rows_selected - 1)],
          Quantity=recipe$Quantity[1:(input$recipe_ingredients_rows_selected - 1)],
        )
      }
      else if (input$recipe_ingredients_rows_selected == 1) {
        session$userData$recipe = tibble(
          Ingredient=recipe$Ingredient[(input$recipe_ingredients_rows_selected + 1):
                                                            length(session$userData$recipe$Ingredient)],
          Quantity=recipe$Quantity[(input$recipe_ingredients_rows_selected + 1):
                                                        length(session$userData$recipe$Quantity)]
        )
      } else {
        session$userData$recipe = tibble(
          Ingredient=c(
            recipe$Ingredient[1:(input$recipe_ingredients_rows_selected - 1)],
            recipe$Ingredient[(input$recipe_ingredients_rows_selected + 1):
                                         length(session$userData$recipe$Ingredient)]
          ),
          Quantity=c(
            recipe$Quantity[1:(input$recipe_ingredients_rows_selected - 1)],
            recipe$Quantity[(input$recipe_ingredients_rows_selected + 1):
                                length(session$userData$recipe$Quantity)]
          ),
        )
      }
      output$recipe_ingredients <- renderDataTable(datatable(session$userData$recipe, selection = "single"))
    }
  })
  
  div(
    class = auto_mobile("content-responsive"),
    {
      session$userData$recipe <- list()
      NULL
    },
    div(
      class = "create-content",
      h1("Post a Recipe"),
      textInput("recipe_title", "Title"),
      textInput("recipe_shortdesc", "Short Description"),
      numericInput("recipe_calories", "Calories"),
      textAreaInput("recipe_description", "Description"),
      "Ingredients",
      DTOutput("recipe_ingredients"),
      actionButton("recipe_remove", "Remove Selected"),
      br(),
      textInput("recipe_ingredient", "Ingredient"),
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