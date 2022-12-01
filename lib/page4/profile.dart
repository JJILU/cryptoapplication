// import 'dart:html';
// import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:cryptoapptwo/page4/settingspage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../page2/function_2.dart';
import '../page3/home_page.dart';

class SettingsUI extends StatelessWidget {
  const SettingsUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Settings",
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _userEmail = TextEditingController(); //captures user input
  final _userPassword = TextEditingController(); //captures user input

  //captures user input

  //image picker
  File? _image;

  Future getImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;

    final imageTemporary = File(image.path);

    setState(() {
      this._image = imageTemporary;
    });
  }

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
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
            color: Colors.green,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => SettingsPage()));
            },
            icon: Icon(
              Icons.settings,
              color: Colors.green,
            ),
          ),
        ],
      ),
      body: Container(
        //Text Widget
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Text(
                "Edit Profile",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),

              //CREATE SPACE
              SizedBox(
                height: 15,
              ),

              //IMAGE WIDGET
              Center(
                child: Column(
                  children: [
                    _image != null
                        ? Image.file(
                            _image!,
                            width: 130,
                            height: 130,
                            fit: BoxFit.cover,
                          )
                        : CircleAvatar(
                            backgroundImage: NetworkImage(
                              "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1374&q=80",
                            ),
                            radius: 105,
                          ),

                    // Container(
                    //   width: 130,
                    //   height: 130,
                    //   decoration: BoxDecoration(
                    //     border: Border.all(
                    //       width: 4,
                    //       color: Theme.of(context).scaffoldBackgroundColor,
                    //     ),
                    //     boxShadow: [
                    //       BoxShadow(
                    //         spreadRadius: 2,
                    //         blurRadius: 10,
                    //         color: Colors.black.withOpacity(0.1),
                    //         offset: Offset(0, 10),
                    //       ),
                    //     ],
                    //     shape: BoxShape.circle,
                    //     image: DecorationImage(
                    //       fit: BoxFit.cover,
                    //       image: _image != null
                    //
                    //               _image!,
                    //               width: 130,
                    //               height: 130,
                    //               fit: BoxFit.cover,
                    //             )
                    //           : Image.network(
                    //               "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1374&q=80"),
                    //     ),
                    //   ),
                    // )
                    // Positioned(
                    //   right: 0,
                    //   bottom: 0,
                    //   child: Container(
                    //     height: 40,
                    //     width: 40,
                    //     decoration: BoxDecoration(
                    //       shape: BoxShape.circle,
                    //       border: Border.all(
                    //         width: 4,
                    //         color: Theme.of(context).scaffoldBackgroundColor,
                    //       ),
                    //       color: Colors.green,
                    //     ),
                    //     child: Icon(
                    //       Icons.edit,
                    //       color: Colors.white,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),

              //CREATE SPACE
              SizedBox(
                height: 10,
              ),

              //CODE FOR IMAGE PICKER

              Center(
                child: Column(
                  children: [
                    CustomButton(
                      title: 'Pick from image',
                      icon: Icons.image_outlined,
                      onClick: () => getImage(ImageSource.gallery),
                    ),
                    CustomButton(
                      title: 'Pick from camera',
                      icon: Icons.camera,
                      onClick: () => getImage(ImageSource.camera),
                    ),
                  ],
                ),
              ),

              //CREATE SPACE
              SizedBox(
                height: 10,
              ),

              // //EDIT USER INPUT CODE HERE
              // buildTextField("E-mail", "example@gmail.com", false),
              // buildTextField("Password", "**********", true),

              TextFormField(
                controller: _userEmail,

                //decoration parameter for TextFormField
                decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.mail_outline),
                  hintText: "example@gmail.com",
                  hintStyle: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                  labelText: "User Email",
                  labelStyle: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),

              // //TextFormField for the Password
              // TextFormField(
              //   //obscureText parameter when set to true hides the user password
              //   obscureText: true,

              //   decoration: InputDecoration(
              //     suffixIcon: Icon(Icons.remove_red_eye_outlined),
              //     helperText: "Password must not be more than 8 characters",
              //     helperStyle: TextStyle(color: Colors.black),
              //     hintText: "*********",
              //     hintStyle: TextStyle(
              //       fontSize: 18,
              //       color: Colors.black,
              //     ),
              //     labelText: "User Password",
              //     labelStyle: TextStyle(
              //       fontSize: 18,
              //       color: Colors.black,
              //     ),
              //   ),

              //   controller: _userPassword,
              // ),

              //CREATE SPACE
              SizedBox(
                height: 10,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // //cancel button
                  // ElevatedButton(
                  //   child: Text('RESET EMAIL'),
                  //   style: ElevatedButton.styleFrom(
                  //     elevation: 5.5,
                  //     padding:
                  //         EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(20),
                  //     ),
                  //     primary: Colors.green,
                  //     textStyle: const TextStyle(
                  //       fontSize: 14,
                  //       letterSpacing: 2.2,
                  //       color: Colors.black,
                  //     ),
                  //   ),
                  //   onPressed: () async {},
                  // ),

                  // Reset Password

                  ElevatedButton(
                    child: Text('Reset Password'),
                    style: ElevatedButton.styleFrom(
                      elevation: 5.5,
                      padding:
                          EdgeInsets.symmetric(horizontal: 2, vertical: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      primary: Colors.green,
                      textStyle: const TextStyle(
                        fontSize: 14,
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

                  SizedBox(
                    height: 5,
                  ),
                  /**
                      ElevatedButton(
                      // padding: EdgeInsets.symmetric(horizontal: 50),
                      //   shape: RoundedRectangleBorder(
                      //     borderRadius:BorderRadius.circular(20),
                      //   ),
                      onPressed:(){},
                      child: const Text("CANCEL",
                      style: TextStyle(
                      fontSize: 14,
                      letterSpacing: 2.2,
                      color: Colors.black,
                      ),),),
                      ElevatedButton(
                      onPressed:(){},
                      // color: ,
                      // padding: EdgeInsets.symmetric(horizontal: 50),
                      // shape:RoundedRectangleBorder(
                      //   borderRadius:BorderRadius.circular(20),
                      // ),
                      child:const Text(
                      "SAVE",
                      style: TextStyle(
                      fontSize: 14,
                      letterSpacing: 2.2,
                      color: Colors.white,
                      ),) ,)
                   */
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding buildTextField(
      String labelText, String placeholder, bool passwordObscure) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 60.0),
      child: TextField(
        obscureText: passwordObscure ? showPassword : false,
        decoration: InputDecoration(
          suffixIcon: passwordObscure
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                  icon: const Icon(
                    Icons.remove_red_eye_outlined,
                    color: Colors.green,
                  ),
                )
              : null,
          contentPadding: EdgeInsets.only(bottom: 3),
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: placeholder,
          hintStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

//Code for image picker
  Widget CustomButton({
    required String title,
    required IconData icon,
    required VoidCallback onClick,
  }) {
    return Container(
      width: 280,
      child: ElevatedButton(
        onPressed: onClick,
        child: Row(
          children: [
            Icon(icon),
            SizedBox(width: 18),
            Text(title),
          ],
        ),
      ),
    );
  }
}
