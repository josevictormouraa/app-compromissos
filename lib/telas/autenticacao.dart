import 'package:app_compromissos/componetes/cores.dart';
import 'package:app_compromissos/componetes/style_decoracao.dart';
import 'package:app_compromissos/telas/home.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Cores.pretoTopoGradiente,
                  Cores.pretoBaixoGradiente
                ],
              ),
            ),
          ),
          // Componente formulário
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Image.asset('assets/compromisso.png', height: 128, color: Colors.white,),
                      const Text(
                        "CompromissosApp",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                      const SizedBox(height: 30),
                      TextFormField(
                        controller: _emailController,
                        decoration: getAuthenticationInputDecoration("E-mail"),
                        validator: (String? value) {
                          // Validate email format
                          if (value == null) {
                            return "O e-mail não pode ser vazio!";
                          }
                          if (value.length < 5) {
                            return "O e-mail é muito curto!";
                          }
                          if (!value.contains("@")) {
                            return "Parece que voce esqueceu o @";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _senhaController,
                        decoration: getAuthenticationInputDecoration("Senha"),
                        obscureText: true,
                        validator: (String? value) {
                          // Validate password length
                          if (value == null) {
                            return "A senha não pode ser vazia!";
                          }
                          if (value.length < 5) {
                            return "A senha é muito curta!";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Any email and password combination will be accepted:
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomeTelaState(),
                              ),
                            );
                          }
                        },
                        child: const Text('Login', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey.shade800, // Black
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(64), // All borders rounded
                          ),
                          padding: const EdgeInsets.all(20.0), // Padding on all sides
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}