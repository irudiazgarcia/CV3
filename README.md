
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



