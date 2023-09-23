//Seccion 12
//Lecciones:
//220.- Formulario de inicio de sesion
//221 - 222.- El widget Form
//223.- AutovalidateMode
//Arturo DLG
import 'package:flutter/material.dart';
import 'package:seccion_12/pages/login/login_mixin.dart';
import 'package:seccion_12/pages/login/widgets/login_checkbox.dart';
import 'package:seccion_12/pages/login/widgets/login_text_field.dart';

/* 
Un formulario, dentro de UI, es una vista que permite al usuario realizar una 
tarea en pocos pasos, donde debe de ingresar datos [incios de sesion, registrar
una cuenta, recuperar contraseñas, realizar pagos, etc].

Flutter posee una sere d e widgets que nos permite realizar formularios de 
manera sencilla. Form es un StateFulWidget que nos permite gestionar cambios y
validaciones de nuestro formulario. TextFormField, es un widget similar a 
TextField, con caracteristicas agregagdas como validacion del texto ingresado.
TextFormField tiene un parametro llamado autovalidateMode, que recibe un enum
AutovalidateMode, el cual nos permite configurar el modo de validacion entre 3
valores:

*onUserInteraction: el TextFormField empezará a validar el campo cada vez que se
renderize, cuando el usuario interactue, el cual mostrara el mensaje de error, 
hasta que el campo sea valido.

*always: el TextFormField esperara solamente el primer renderizado, y despues 
siempre estara validando el campo sin necesidad de que el usuario este 
interactuando.

*disable: el TextFormField siempre mostrará el error aunque el campo este 
validado correctamente.
*/

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with LoginMixin {
  String _email = '', _password = '';
  bool _checked = true;
  //final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    bool allowSubmit = emailValidator(_email) == null;
    if (allowSubmit) {
      allowSubmit = passwordValidator(_password) == null;
    }
    if (allowSubmit) {
      allowSubmit = _checked;
    }
    return Form(
      //key: _formKey,
      child: Scaffold(
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(15),
            children: [
              // TextFormField(
              //   //initialValue: 'micorreo@correo.com',
              //   // Validar campo
              //   autovalidateMode: AutovalidateMode.onUserInteraction,
              //   keyboardType: TextInputType.emailAddress,
              //   decoration: const InputDecoration(
              //     label: Text('email'),
              //   ),
              //   onChanged: (text) {
              //     setState(() {
              //       _email = text.trim();
              //     });
              //   },
              //   validator: emailValidator,
              // ),
              LoginTextField(
                label: 'email',
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                onChanged: (text) {
                  setState(() {
                    _email = text.trim();
                  });
                },
                validator: emailValidator,
              ),
              const SizedBox(height: 30),
              // TextFormField(
              //   obscureText: true,
              //   autovalidateMode: AutovalidateMode.onUserInteraction,
              //   decoration: const InputDecoration(
              //     label: Text('password'),
              //   ),
              //   onChanged: (text) {
              //     setState(() {
              //       _password = text.replaceAll(' ', '');
              //     });
              //   },
              //   validator: passwordValidator,
              // ),
              Builder(builder: (context) {
                return LoginTextField(
                  label: 'password',
                  obscureText: true,
                  textInputAction: TextInputAction.send,
                  onSubmitted: (_) => _submit(context),
                  onChanged: (text) {
                    setState(() {
                      _password = text.replaceAll(' ', '');
                    });
                  },
                  validator: passwordValidator,
                );
              }),
              const SizedBox(height: 30),
              LoginCheckBox(
                initialValue: _checked,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: chechBoxValidator,
                onChanged: (value) {
                  setState(() {
                    _checked = value;
                  });
                },
              ),
              const SizedBox(height: 30),
              Builder(builder: (context) {
                return MaterialButton(
                  color: Colors.blue.withOpacity(
                    allowSubmit ? 1 : 0.2,
                  ),
                  elevation: 0,
                  onPressed: () => _submit(context),
                  child: const Text('Sing In'),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  void _submit(BuildContext context) {
    final formState = Form.of(context);
    if (formState.validate()) {
      print('👀');
    }
  }
}
