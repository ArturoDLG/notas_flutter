//Seccion 5
//Lecciones:
//111 - 112: Fuentes personalizadas
//Arturo DLG
import 'package:flutter/material.dart';

/*
Por defecto, flutter nos de a Roboto como fuente por defecto, pero podemos 
agregar a nuestra app una fuente personalizada, para esto descargamos alguna
fuente de internet y copiamos los archivos .ttf en la carpeta asstes/fonts/
<font> en la raiz del proyecto [nosotros debemos de crear dichas carpetas].

Para que Flutter pueda reconocer estos archivos debemos agregarlos en el archivo
pubspec.yaml con la siguiente estructura:
fonts:  
    - family: <family>
      fonts:
        - asset: assets/fonts/nunito/<font-name>.ttf
          weight: <weight>
          style: <style>

family corresponde al nombre de nuestra fuente, en los assets agregaremos los 
archivos, peso y estilo indicados para cada archivo.

Una vez guardada la configuración, podremos usarla dentro del parametro style de
Text.
*/

class CustomFontLesson extends StatelessWidget {
  const CustomFontLesson({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: const [
            Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
              "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,"
              "when an unknown printer took a galley of type and scrambled it to make a type"
              "specimen book. It has survived not only five centuries.",
              style: TextStyle(
                fontFamily: 'Nunito',
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
