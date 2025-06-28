import 'package:flutter/material.dart';
import 'login_page.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          height: 600,
          color: Colors.white, // ✅ Fixed incorrect style
          padding: const EdgeInsets.only(top: 80, left: 16, right: 16, bottom: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/logo-with-duo.png",
                width: 270,
              ),
              const SizedBox(height: 22),
              SizedBox(
                width: 280,
                child: Text(
                  "Aprenda idiomas de graça. Agora e sempre.",
                  style: TextStyle(
                    fontSize: 26,
                    color: Colors.grey.shade400, // ✅ Fixed incorrect style
                  ),
                ),
              ),
              const Flexible(
                child: FractionallySizedBox(
                  heightFactor: 0.75,
                ),
              ),
              _button(
                "COMEÇAR AGORA",
                color: Colors.lightGreen, // ✅ Fixed incorrect style
                colorText: Colors.white,
                onPressed: () {},
              ),
              const SizedBox(height: 12),
              _button(
                "JÁ TENHO UMA CONTA",
                color: Colors.white, // ✅ Fixed incorrect style
                colorText: Colors.green,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _button(String text, {required Color color, required Color colorText, required VoidCallback onPressed}) =>
      Container(
        width: 350,
        height: 60,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha(128),
            spreadRadius: 2,
            blurRadius: 12,
            offset: const Offset(0, 2),
          ),
        ]),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape: RoundedRectangleBorder( // ✅ Moved inside style
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(
              color: colorText, // ✅ Fixed incorrect TextStyle
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
}
