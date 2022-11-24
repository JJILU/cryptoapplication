import 'package:flutter/material.dart';

import '../page2/function_2.dart';
import 'home_page.dart';

class Useridentity extends StatefulWidget {
  const Useridentity({Key? key}) : super(key: key);

  @override
  _UseridentityState createState() => _UseridentityState();
}

class _UseridentityState extends State<Useridentity> {
  final _userEmail = TextEditingController(); //captures user input
  final _userPassword = TextEditingController(); //captures user input

  //captures user input

  @override
  void dispose() {
    _userEmail.dispose();
    _userPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: MediaQuery.of(context)
            .size
            .width, //expands container to fill maximum with of the device
        height: MediaQuery.of(context)
            .size
            .height, //expands container to fill maximum with of the device
        decoration: BoxDecoration(
          color: Colors.green[600],
        ),
        child: SafeArea(
          child: Column(
            children: [

              SizedBox(
                height: 60,
              ),
              //TextFormField for Email Id
              TextFormField(
                controller: _userEmail,

                //decoration parameter for TextFormField
                decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.mail_outline),
                  hintText: "example@gmail.com",
                  hintStyle: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                  labelText: "User Email",
                  labelStyle: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),


              //Sized Box For Space
              SizedBox(
                height: 60,
              ),

              //TextFormField for the Password
              TextFormField(
                //obscureText parameter when set to true hides the user password
                obscureText: true,

                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.remove_red_eye_outlined),

                  helperText: "Password must not be more than 8 characters",
                  helperStyle: TextStyle(color: Colors.white),
                  hintText: "*********",
                  hintStyle: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                  labelText: "User Password",
                  labelStyle: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),

                controller: _userPassword,
              ),

              SizedBox(
                height: 50,
              ),
              //Container for Sign Up button
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.white,
                ),
                width: MediaQuery.of(context).size.width / 1.4,
                height: 45,
                child: ElevatedButton(
                  onPressed: () async {
                    bool shouldNavigate =
                        await signUp(_userEmail.text, _userPassword.text);
                    if (shouldNavigate) {
                      //Navigator.push() IS USED TO NAVIGATE THE USER TO THE NEXT PAGE WHEN USER SUCCESSFULLY SIGNS UP
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(), //pushes the the ho
                        ),
                      );
                    }
                  },
                  child: Text('Sign Up'),
                ),
              ),

              SizedBox(
                height: 40,
              ),

              //Container for Login
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.white,
                ),
                width: MediaQuery.of(context).size.width / 1.4,
                height: 45,
                child: ElevatedButton(
                  onPressed: () async {
                    bool shouldNavigate =
                        await signIn(_userEmail.text, _userPassword.text);
                    if (shouldNavigate) {
                      ////Navigator.push() IS USED TO NAVIGATE THE USER TO THE NEXT PAGE WHEN USER SUCCESSFULLY SIGNS IN
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                      );
                    }
                  },
                  child: Text('Login'),
                ),
                ),

            ],
          ),
        ),
      ),
    );
  }
}
