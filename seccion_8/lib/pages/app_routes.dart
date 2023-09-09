import 'package:flutter/material.dart';
import 'package:seccion_8/pages/calendar_page.dart';
import 'package:seccion_8/pages/check_box_page.dart';
import 'package:seccion_8/pages/keyboard_types.dart';
import 'package:seccion_8/pages/radio_page.dart';
import 'package:seccion_8/pages/slider_page.dart';
import 'package:seccion_8/pages/switch_page.dart';
import 'package:seccion_8/pages/text_field_page.dart';
import 'package:seccion_8/routes.dart';

Map<String, Widget Function(BuildContext)> get appRoutes {
  return {
    Routes.textField: (_) => const TextFieldPage(),
    Routes.keyboardTypes: (_) => const KeyboardTypesPage(),
    Routes.checkBox: (_) => const CheckBoxPage(),
    Routes.radio: (_) => const RadioPage(),
    Routes.switchWidget: (_) => const SwitchPage(),
    Routes.slider: (_) => const SliderPage(),
    Routes.calendar: (_) => const CalendarPage(),
  };
}
