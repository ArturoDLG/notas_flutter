//Seccion 7
//lecciones:
//144: Navigator y el contexto
//146: Pasar datos a una pagina
//ArturoDLG
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import '../routes.dart';

/*
Navigator es un widget especial que nos permite navegar entre pages utilizando
el contexto de nuestro MaterialApp/CupertinoApp, ya sea insertando elementos
a este o eliminandolos.

Para pasar datos de una page a otra existen varias maneras:

* Si utilizamos MaterialPageRoute, debemos de pasar los datos a traves del 
constructor de la clase
*/

class PageData {
  final String name;
  final String label;
  final Object? arguments;
  // funcion para recuperar los datos retornados por una pagina
  final void Function(Object?)? onResult;

  const PageData({
    required this.name,
    required this.label,
    this.arguments,
    this.onResult,
  });
}

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  Color _color = Colors.blue;

  late final List<PageData> _pages;

  @override
  void initState() {
    _pages = [
      const PageData(
        name: Routes.login,
        label: 'Go to login',
        arguments: 'test@test.com',
      ),
      const PageData(
        name: Routes.counter,
        label: 'Go to counter',
      ),
      PageData(
        name: Routes.colorPicker,
        label: 'Pick Color',
        onResult: (result) {
          if (result is Color) {
            _color = result;
            setState(() {});
          }
        },
      ),
      const PageData(
        name: Routes.dialogs,
        label: 'Go to dialogs',
      ),
    ];
    super.initState();
  }

  void _onTap(BuildContext context) {
    final faker = Faker();
    //calculamos el dato antes de pasarlo como parametro para que persista
    //cuando hagamos hot reload
    final email = faker.internet.email();
    //Creamos una ruta a LoginPage
    // final route = MaterialPageRoute(
    //   builder: (_) => LoginPage(
    //     email: email, //podemos pasarle datos a otro
    //     //widget a traves de su constructor.
    //   ),
    //   settings: const RouteSettings(name: '/login'),
    // );
    //insertamos la ruta a arbol de widgets de la app
    // Navigator.push(context, route);
    //reemplazamos la pagina actual por una nueva
    //Navigator.pushReplacement(context, route);
    //Para pasar datos entre pages usando rutas, usamos pushNamed
    Navigator.pushNamed(
      context,
      Routes.login,
      arguments: email,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _color,
      ),
      // body: ListView(
      //   children: [
      //     ListTile(
      //       title: const Text(
      //         'Go to Login',
      //       ),
      //       trailing: const Icon(
      //         Icons.arrow_right_outlined,
      //       ),
      //       onTap: () => _onTap(
      //         context,
      //       ),
      //     ),
      //     ListTile(
      //       title: const Text(
      //         'Go to Counter',
      //       ),
      //       trailing: const Icon(
      //         Icons.arrow_right_outlined,
      //       ),
      //       onTap: () {
      //         //Navegamos usando el nombre de la ruta
      //         Navigator.pushNamed(context, Routes.counter);
      //       },
      //     ),
      //     ListTile(
      //       title: const Text(
      //         'Pick Color',
      //       ),
      //       trailing: const Icon(
      //         Icons.arrow_right_outlined,
      //       ),
      //       onTap: () async {
      //         //Navegamos usando el nombre de la ruta
      //         // final route = MaterialPageRoute<Color>(
      //         //   builder: (_) => const ColorPicker(),
      //         //   settings: const RouteSettings(name: '/picker'),
      //         // );
      //         // final result = await Navigator.push(context, route);
      //         final result = await Navigator.pushNamed(
      //           context,
      //           Routes.colorPicker,
      //         ) as Color?;
      //         print('🎨 $result');
      //         if (result != null) {
      //           _color = result;
      //           setState(() {});
      //         }
      //       },
      //     ),
      //   ],
      // ),
      body: ListView.builder(
        itemCount: _pages.length,
        itemBuilder: (_, index) {
          final data = _pages[index];
          return ListTile(
            title: Text(data.label),
            onTap: () async {
              final result = await Navigator.pushNamed(
                context,
                data.name,
                arguments: data.arguments,
              );
              if (data.onResult != null) {
                data.onResult!(result);
              }
            },
          );
        },
      ),
    );
  }
}

/*
Para obtener un contexto valido para poder usar Navigator, podemos usar un 
widget Builder, esto cuando el Widget padre no es un MaterialApp/CupertinoApp.

Tenemos una alternativa para pasar datos de una page a otra, esta usando el 
parametro setings, el cual es una instancia de RouteSettings.
En elwidget receptor, debemos de usar una instancia de ModalRoute y pasarle el 
contexto, y de ahi podremos acceder a dichos datos. No es una forma muy 
recomendable, ya que trabaja con datos de tipo dinamico que son propensos a 
errores.

Si queremos reemplazar la pagina actual por una diferente, usamos el metodo 
Navigator.pushReplacement(), el cual sacara del arbol al widget actual y metera
al nuevo en su lugar.
*/