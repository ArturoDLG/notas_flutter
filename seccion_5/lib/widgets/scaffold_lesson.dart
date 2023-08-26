//Seccion 5
//Lecciones:
//101 - 104: El widget Scaffold
//Arturo DLG
import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';

/*
El widget Scaffold, es un widget que nos permite estructurar la pantalla como
una app Android. Este widget cuenta con los siguientes parametros principales:

* AppBar: La barra superior de la app, donde contamos con el titulo de la 
pantalla que visualizamos, menu lateral y botones de acciones.

* FloatingAtionButton: El boton flotante que nos permite acceder a acciones de
la app directamente desde el boton.

* BottonNavigationBar: Barra de navegacion inferior de la app para ver las
diferentes vistas de la app

*Body: Vista principal de la app.

Todos estos parametros son opcionales, por lo que podemos usar aquellos que
nos convengan para la experiencia de nuestra app.

*/

class ScaffoldLesson extends StatelessWidget {
  const ScaffoldLesson({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.grey,
      //Menu lateral
      drawer: const Drawer(
        elevation: 0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Acerca de',
            ),
          ],
        ),
      ),
      //ancho para deslizar el Drawer
      //drawerEdgeDragWidth: 100,
      //Gesto de deslizamiento
      drawerEnableOpenDragGesture: false,
      //ver si el drawer esta abierto
      onDrawerChanged: (isOpened) => print(isOpened),
      //Barra de titulo
      appBar: AppBar(
        // systemOverlayStyle: const SystemUiOverlayStyle(
        //   //cambiar color de barra de estado
        //   statusBarColor: Colors.green,
        //   //cambiar color de los iconos de barra de estado
        //   //statusBarBrightness: Brightness.dark, solo IOS
        //   statusBarIconBrightness: Brightness.dark,
        // ),
        backgroundColor: const Color(0xff00796B),
        elevation: 0,
        //shadowColor: Colors.cyan, color de sombra
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
        title: const Text('Flutter App'),
        //botones de acciones de la app
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      //Extender el body de la app por detreas del appBar
      //extendBodyBehindAppBar: true,
      //evitar que la app se redimensione al mostrar teclado
      //resizeToAvoidBottomInset: false,
      //cuerpo de la app
      body: Container(
        //alignment: Alignment.center,
        width: double.infinity,
        height: double.infinity,
        color: Colors.blueGrey,
        child: const Column(
          children: [
            Expanded(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 25,
                  ),
                  child: TextField(),
                ),
              ),
            ),
            Text(
              'Hello! 👋🏻',
            ),
            SizedBox(
              height: 75,
            ),
          ],
        ),
      ),
      //boton flotante
      floatingActionButton: FloatingActionButton(
        //agregar un icono al boton
        child: const Icon(
          Icons.add,
          size: 30,
        ),
        //accion del boton al ser presionado
        onPressed: () {
          print('👆🏻');
        },
      ),
      //cambiar la posicion del floatingButton
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      //barra de navegacion inferior
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Contacs",
          ),
        ],
      ),
    );
  }
}

/*
Nota:
El color del backgroundColor esta dado por defecto por el theme de MaterialApp 
que da a los widgets del paquete Material un color por defecto. Este paramtro 
puede ser sobreescrito si lo requerimos.

Podemos modificar el estilo del texto de AppBar de diferentes maneras:
* Sobreescribiendo el parametro TextStyle del propio Text
* Modificando el parametro titleTextStyle.

Podemos usar un color personalizado utilizando una instancia de Color con un
numero hexadecimal de 8 digitos.

Podemos tener un drawer del lado derecho de la pantalla, definiendolo con el 
parametro endDrawer, este puede estar junto el otro menu. De igual manera 
podemos desactivar el gesto de deslizamiento con endDrawerEnableOpenGesture, ver
el estatus del drawer (abierto/cerrado) con onEndDrawerChanged.

Scaffold define un estilo de texto por defecto, por lo que no es necesario 
wnvolver nuestros textos en un DefaultTextStyle. 

Por defecto, si usamos un Container sin dimensiones dentro del body de SCaffold, 
si este tiene un widget hijo, se redimensionara al tamaño de este, a menos de 
que definamos su parametro Aligment como center para ocupar todo el espacio disponible.
*/
