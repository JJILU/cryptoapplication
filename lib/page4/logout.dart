import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../page3/home_page.dart';

void main() {
  runApp(LogoutPage());
}

class LogoutPage extends StatefulWidget {
  @override
  State<LogoutPage> createState() => _LogoutPageState();
}

class _LogoutPageState extends State<LogoutPage> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  //signout function
  signOut() async {
    await auth.signOut();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: DrawerCode(),
        appBar: AppBar(
          title: Text('Log out'),
          backgroundColor: Colors.green,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
          ],
        ),
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                'assets/images/800px_COLOURBOX24981559.jpg',
                fit: BoxFit.cover,
              ),
            ), //
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontStyle: FontStyle.normal),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.exit_to_app_rounded,
                      size: 50,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Sign Out',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
                onPressed: () {
                  signOut();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
