import 'package:app_fishing/app/app.dart';
import 'package:app_fishing/bootstrap.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  bootstrap(() => const App());
}
