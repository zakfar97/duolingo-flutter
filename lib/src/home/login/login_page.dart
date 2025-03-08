import 'package:duolingo/src/components/button.dart';
import 'package:duolingo/src/components/login_text_field.dart';
import 'package:duolingo/src/firebase/api_response.dart';
import 'package:duolingo/src/firebase/firebase_service.dart';
import 'package:duolingo/src/home/main_screen/home.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _controllerLogin = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  Future<void> _onClickGoogle() async {
    final FirebaseService service = FirebaseService();
    ApiResponse<void> response = await service.loginGoogle();

    if (response.ok && mounted) {
      await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );
    } else {
      _showErrorDialog(response.message);
    }
  }

  void _showErrorDialog(String? message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Error"),
          content: Text(message ?? "An unexpected error occurred."),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, BoxConstraints constraints) => Form(
          key: _formKey,
          child: Container(
            color: Colors.white, // ✅ Fixed incorrect style property
            height: constraints.maxHeight,
            width: constraints.maxWidth,
            padding: const EdgeInsets.only(top: 60, left: 16, right: 16, bottom: 16),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Text(
                    "Insira seus dados",
                    style: TextStyle(
                      color: Colors.grey.shade400, // ✅ Fixed incorrect style
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 40),
                  LoginTextField(
                    "Usuário ou email",
                    controller: _controllerLogin,
                  ),
                  LoginTextField(
                    "Senha",
                    controller: _controllerPassword,
                    obscure: true,
                  ),
                  const SizedBox(height: 20),
                  Button(
                    "ENTRAR",
                    color: const Color(0xFF1AB1F6), // ✅ Fixed incorrect style
                    colorText: Colors.white,
                    width: 350,
                    onPressed: () {},
                  ),
                  const SizedBox(height: 30),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      "ESQUECI A SENHA",
                      style: TextStyle(
                        color: Colors.lightBlueAccent, // ✅ Fixed incorrect style
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
