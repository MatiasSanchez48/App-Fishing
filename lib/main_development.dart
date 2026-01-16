import 'package:app_fishing/app/app.dart';
import 'package:app_fishing/bootstrap.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await bootstrap(() => const App());
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://kglrddokqiewtvpdgfpk.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImtnbHJkZG9rcWlld3R2cGRnZnBrIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDk4MzY5NjksImV4cCI6MjA2NTQxMjk2OX0.014g8AF6c7P3J8HavCMDeW_ykjsfnPsIJTXQa-MrjYc',
  );
}
