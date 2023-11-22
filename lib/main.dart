import 'package:expenseapp/pages/main_page.dart';
import 'package:flutter/material.dart';

// Single Responsibility
ColorScheme lightColorScheme = ColorScheme.fromSeed(
  seedColor: Colors.grey,
  primary: Colors.greenAccent,
  secondary: Colors.black,
);
void main() {
  runApp(
    MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: lightColorScheme,
          appBarTheme: const AppBarTheme().copyWith(
              backgroundColor: lightColorScheme.primary,
              foregroundColor: lightColorScheme.secondary),
          cardTheme:
              const CardTheme().copyWith(color: lightColorScheme.primary),
          textTheme: ThemeData().textTheme.copyWith(
                titleLarge:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
        ),
        home: MainPage()),
  );
}

// modelleme => üzerinde çalışılacak yapıların uygulamada nesne haline getirilmesi