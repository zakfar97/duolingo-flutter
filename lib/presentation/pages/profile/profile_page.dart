import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  _titleText(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _titleText("User Name"),
                const SizedBox(width: 100),
                ClipOval(
                  child: Image.asset(
                    "assets/images/logo-with-duo.png",
                    height: 120,
                    width: 120,  // Ensure width and height are equal
                    fit: BoxFit.cover,  // Optional: fits the image
                  ),
                ),
              ],
            ),
            Divider(
              color: Colors.grey.shade500,  // Use color for Divider
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _titleText("Sobre"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Card(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: 80,
                        width: 170,
                        child: Text("hello"),
                      ),
                    ),
                    Card(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: 80,
                        width: 170,
                        child: ListTile(
                          leading: Icon(
                            Icons.cloud_circle,
                            color: Colors.amber,  // Use color for Icon
                          ),
                          title: Text(
                            "4600",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Card(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: 80,
                        width: 170,
                        child: Text("hello"),
                      ),
                    ),
                    Card(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: 80,
                        width: 170,
                        child: Text("hello"),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    _titleText("Amigos"),
                    Text(
                      "ADICIONAR AMIGOS",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.lightBlue,  // Use color for text
                      ),
                    ),
                  ],
                ),
                Card(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 80,
                    width: 170,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
} 