import 'package:flutter/material.dart';
import 'package:seccion_8/pages/keyboard_types.dart';
import 'package:seccion_8/pages/text_field_page.dart';
import 'package:seccion_8/routes.dart';

Map<String, Widget Function(BuildContext)> get appRoutes {
  return {
    Routes.textField: (_) => const TextFieldPage(),
    Routes.keyboardTypes: (_) => const KeyboardTypesPage(),
  };
}
