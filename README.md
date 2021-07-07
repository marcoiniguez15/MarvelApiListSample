# MarvelApiListSample
Se ha implementado la prueba técnica usando Clean Swift en concreto una arquitectura VIP (View-Interactor-Presenter) usando el siguiente template
https://github.com/Andrei-Popilian/VIP_Design_Xcode_Template

Se han desarrollado tests de un fichero de la parte Commons y de la primera pantalla "CharactersListView" a modo de ejemplo, dicha manera de testeo es aplicable a todo el ejemplo.

La solución aportada esta basada en navegación mediante Xibs, para aprovechar la facilidad que nos aporta en elemento visual del Xcode a la hora de montar las vistas y también poder reutilizar cualquier vista o trozo de vista en otra parte de la apliación.

A modo resumen:
1. La primera pantalla es una lista de elementos básica con una imagen y el nombre de cada personaje.
2. La segunda pantalla esta formada por la imagen del personaje y una lista con secciones con los distintos elementos que tiene cada personaje (Comics, Series, Stories and Events)

Librerías utlizadas:
1. Alamofire, para realizar todas las llamadas al backend correspondiente
2. Kingfisher, para cargar imagenes desde una url
3. R.swift, para cargar todos los recursos de la app (strings, imágenes, xib, json, .. ) usando esta librería evitas obtener nulos y crash del tipo:
UIImage(named: "image") ya que cogiendo los recursos con esa librería solo nos deja escoger recursos que existan en el proyecto.




