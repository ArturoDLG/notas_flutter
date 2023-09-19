import 'package:flutter/material.dart';
import 'package:seccion_11/state_management/notifier.dart';
import 'package:seccion_11/state_management/provider.dart';

/// Widget padre para envolver a los widgets que notifican los cambios en la
/// app.
class Consumer<T extends ProviderNotifier> extends StatefulWidget {
  final Widget Function(BuildContext context, T notifier) builder;
  const Consumer({
    super.key,
    required this.builder,
  });

  @override
  State<Consumer<T>> createState() => _ConsumerState<T>();
}

class _ConsumerState<T extends ProviderNotifier> extends State<Consumer<T>> {
  late final T _notifier;
  bool _initialized = false;
  @override
  void initState() {
    super.initState();
  }

  /// Agregar los oyentes al ProviderNotifier
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initialized) {
      _notifier = Provider.of<T>(context);
      _notifier.addListener(_listener);
      _initialized = true;
    }
  }

  void _listener() {
    setState(() {});
  }

  @override
  void dispose() {
    _notifier.removeListener(_listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, _notifier);
  }
}
