import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_compromissos/telas/autenticacao_tela.dart';
import 'package:app_compromissos/providers/compromissos_provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CompromissosProvider(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const AuthScreen(),
      ),
    );
  }
}