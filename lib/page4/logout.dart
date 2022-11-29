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
        ),
        body: Center(
          child: Stack(children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset(
                '',
                fit: BoxFit.cover,
              ),
            ), //
            Center(
              child: Card(
                margin: EdgeInsets.all(20),
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                color: Colors.white,
                child: Container(
                  child: ElevatedButton(
                    child: Row(children: [
                      Icon(
                        Icons.exit_to_app_rounded,
                        size: 25,
                        color: Colors.white,
                      ),
                      SizedBox(width: 20,),
                      Text('Logout'),
                    ]),
                    onPressed: () {
                      signOut();
                    },
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

