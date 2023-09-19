import 'package:seccion_11/state_management/notifier.dart';

class ThemeController extends ProviderNotifier {
  bool _isDarkModeEnabled = false;

  bool get isDarkModeEnable => _isDarkModeEnabled;

  void toggleTheme() {
    _isDarkModeEnabled = !_isDarkModeEnabled;
    notify();
  }
}
