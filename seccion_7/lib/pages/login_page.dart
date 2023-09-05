//Seccion 7
//lecciones:
//145: pop y maybePop
//ArturoDLG
import 'package:flutter/material.dart';
import '/pages/profile_page.dart';

class LoginPage extends StatelessWidget {
  final String email;
  const LoginPage({
    super.key,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            //Quitamos el widget actual para regresar al widget anterior
            //Navigator.pop(context);

            //Quitamos el widget actual verificando si existen rutas en el
            //historial
            Navigator.maybePop(context);
          },
        ),
      ),
      body: Center(
        child: MaterialButton(
          child: Text('LOGIN PAGE $email'),
          onPressed: () {
            final route = MaterialPageRoute(
              builder: (_) => const ProfilePage(),
              settings: const RouteSettings(name: '/profile'),
            );
            Navigator.push(context, route);
          },
        ),
      ),
    );
  }
}

/*
Nota:
Cuando utilizamos un AppBar en un scaffold, si Flutter detecta que podemos 
regresar a una pagina anterior, renderiza un icono de flecha para navegar a la 
pagina anterior. En caso de no poder navegar a una pagina anterior, Flutter no 
agregará dicho icono.

Si nosotros colocamos un icono personalizado para navegar hacia atras en nuestro
appBar, deberemos de definir su funcionamiento.

Si usamos Navigator.pop() en un Widget que no tiene mas rutas en el historial, 
Flutter mostrará la pantalla en negro al no tener que renderizar, por lo que 
tenemos que ser cuidadosos al momento de usar dicho metodo. En su lugar debemos 
de usar Navigator.maybePop() para que verifique si existen mas rutas en el 
historial.
*/
