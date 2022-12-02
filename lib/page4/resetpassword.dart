import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../page3/verify_user.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final _userEmail = TextEditingController(); //captures user input

  //Reset Password
  bool showPassword = false;

  _showLoadingDialog(bool show, BuildContext context) {
    if (show) {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return const AlertDialog(
                title: const Text('Loading'),
                content: const Center(child: const LinearProgressIndicator()));
          });
    } else {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text(
            'Reset Password',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          elevation: 5,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Useridentity(),
                ),
              );
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //Enter Email where email containing reset link will be sent

            TextFormField(
              controller: _userEmail,

              //decoration parameter for TextFormField
              decoration: const InputDecoration(
                suffixIcon: Icon(Icons.mail_outline),
                hintText: "example@gmail.com",
                hintStyle: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  letterSpacing: 2.2,
                ),
                labelText: "User Email",
                labelStyle: TextStyle(
                  fontSize: 28,
                  color: Colors.black,
                ),
              ),
            ),

            //CREATE SPACE
            SizedBox(
              height: 20,
            ),

            // Reset Password

            ElevatedButton(
              child: Text('Reset Password'),
              style: ElevatedButton.styleFrom(
                elevation: 5.5,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                primary: Colors.green,
                textStyle: const TextStyle(
                  fontSize: 20,
                  letterSpacing: 2.2,
                  color: Colors.white,
                ),
              ),
              onPressed: () async {
                _showLoadingDialog(true, context);
                try {
                  await FirebaseAuth.instance
                      .sendPasswordResetEmail(email: _userEmail.text);
                  if (!mounted) return;
                  _showLoadingDialog(true, context);
                  //send user to next page or show a dialog to enter the code

                } catch (e) {
                  Navigator.pop(context);
                  if (e is FirebaseAuthException) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Error'),
                          content: Text(e.message ?? 'An error occurred'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
