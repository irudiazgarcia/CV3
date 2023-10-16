library(vitae)
library(dplyr)
library(magrittr)
source("Utils/data_download_funs.R")
library(shiny)


ui <- fluidPage(
  titlePanel("CV3: Título v1.0"),
  
  sidebarLayout(
    sidebarPanel(
      textInput("my_data_location", "Enlace al Google Sheet:", value = ""),
      actionButton("generate", "Generar CV")
    ),
    
    mainPanel(
      verbatimTextOutput("result")
    )
  )
)


server <- function(input, output) {
  
  result <- reactive({ 
    if (input$generate > 0) {
      
      CV <- create_CV_object(
        data_location = input$my_data_location,
        pdf_mode = FALSE
      )
      
      parames = list(
        my_name =  as.character(CV$contact_info[CV$contact_info$loc == "name","contact"]),
        my_surname =  as.character(CV$contact_info[CV$contact_info$loc == "surname","contact"]),
        my_address =  as.character(CV$contact_info[CV$contact_info$loc == "address","contact"]),
        my_position =  as.character(CV$contact_info[CV$contact_info$loc == "position","contact"]),
        my_mobile =  as.character(CV$contact_info[CV$contact_info$loc == "mobile","contact"]),
        my_phone =  as.character(CV$contact_info[CV$contact_info$loc == "phone","contact"]),
        my_email = as.character(CV$contact_info[CV$contact_info$loc == "email","contact"]),
        my_profilepic = as.character(CV$contact_info[CV$contact_info$loc == "profilepic","contact"]),
        my_headcolor = as.character(CV$contact_info[CV$contact_info$loc == "headcolor","contact"]),
        my_fontsize = as.character(CV$contact_info[CV$contact_info$loc == "fontsize","contact"]),
        
        my_linkedin = as.character(CV$contact_info[CV$contact_info$loc == "linkedin","contact"]),      #OPCIONAL
        my_github = as.character(CV$contact_info[CV$contact_info$loc == "github","contact"]),          #OPCIONAL
    
        my_data_location = input$my_data_location
      )
      
      
      rm(CV)
      
      rmarkdown::render('CV3.Rmd', params = parames, output_file = paste("CV",parames$my_name, chartr(" ", "_",parames$my_surname), sep="_"))
      
      
      return(0)
    }
  })
  
  output$result <- renderText({
    result()  # Execute the reactive block to trigger the action
    # You can return any text output here if needed
    return("Data downloaded and processed.")
  })
}

shinyApp(ui, server)





