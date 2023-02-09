library(vitae)
library(dplyr)
library(magrittr)
source("Utils/data_download_funs.R")

my_data_location = "https://docs.google.com/spreadsheets/d/1KRBDSb8F8fOS9nQpcMOPTNqzA6FCjNxvLfWZsv0eunk/edit?usp=sharing"



CV <- create_CV_object(
  data_location = my_data_location,  
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
  my_github = as.character(CV$contact_info[CV$contact_info$loc == "github","contact"]),
  my_linkedin = as.character(CV$contact_info[CV$contact_info$loc == "linkedin","contact"]),
  my_data_location = my_data_location,
  my_profilepic = as.character(CV$contact_info[CV$contact_info$loc == "profilepic","contact"]),
  my_headcolor = as.character(CV$contact_info[CV$contact_info$loc == "headcolor","contact"])
)


rm(CV)

rmarkdown::render('CV3.Rmd', params = parames, output_file = paste("CV",parames$my_name, chartr(" ", "_",parames$my_surname), sep="_"))


#Para añadir nuevos espacios: añadir este texto modificado al gusto en el archivo CV3.Rmd
#
## Voluntariado

#```{r}
#CV$entries_data %>% 
#  filter(section == 'voluntary') %>% 
#  detailed_entries(
#    what = institution,
#    when = glue::glue("{`start`} - {`end`}"),
#    with = title,
#    where = loc,
#    why = description_bullets
#  )
#```
