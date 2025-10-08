import 'package:chat_flutter_supabase/app/app.dart';
import 'package:chat_flutter_supabase/bootstrap.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  bootstrap(() => const App());
}
