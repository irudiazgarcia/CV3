
# CV3: Currículum Vitae desde Google Sheets automático

<!-- badges: start -->

<!-- badges: end -->

Basado en https://github.com/DarwinCV/automated-CV, éste código pretende aplicar pequeños cambios para mejorar la editabilidad de los CV mediante Google Sheet, permitiendo separar el contenido del output considerando las entradas como datos.

# Cómo empezar

``` bash
git clone https://github.com/irudiazgarcia/CV3.git
```

Crea un documento de Google Sheet que siga la siguiente estructura: 
https://docs.google.com/spreadsheets/d/1KRBDSb8F8fOS9nQpcMOPTNqzA6FCjNxvLfWZsv0eunk/edit?usp=sharing

En el archivo main.R debes modificar el siguiente apartado, estableciendo el enlace de tu archivo de CV:

``` r
my_data_location = "https://docs.google.com/spreadsheets/d/1KRBDSb8F8fOS9nQpcMOPTNqzA6FCjNxvLfWZsv0eunk/edit?usp=sharing"
```

Adjunta en la carpeta la fotografía que deseas en tu CV, y recuerda establecer correctamente el nombre en tu archivo de Google Sheet.

Finalmente, ¡ejecuta main.R y estará listo!

# Cómo editar y/o añadir las entradas

La edición del formato, tanto del orden del texto como del propio contenido, es muy intuitiva. Únicamente debe modificarse el contenido el archivo "CV3.Rmd", teniendo en cuenta que, en RMarkdown, el texto detrás de un #hashtag se considera "Título", de manera que:

``` r
#Formación Académica    -> #Estudios
```

Transformaría el título del apartado, igual que añadir el siguiente código

``` r
# Voluntariado

```{r}
CV$entries_data %>% 
  filter(section == 'voluntary') %>% 
  detailed_entries(
    what = institution,
    when = glue::glue("{`start`} - {`end`}"),
    with = title,
    where = loc,
    why = description_bullets
  )
```
al "CV3.Rmd" significaría añadir el apartado "Voluntariado" haciendo uso de las variables que utilicen el nombre "voluntary" en las entries de tu Google Sheet.




