import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../page3/home_page.dart';

void main() {
  runApp(ContactusPage());
}

class ContactusPage extends StatefulWidget {
  @override
  State<ContactusPage> createState() => _ContactusPageState();
}

class _ContactusPageState extends State<ContactusPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: DrawerCode(),
        appBar: AppBar(
          title: Text('Contact Us'),
          backgroundColor: Colors.green,
        ),
        body: Center(
          child: Stack(children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset(
                'assets/images/800px_COLOURBOX24981559.jpg',
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // call us
                      TextButton.icon(
                        onPressed: () {
                          launch('tel:+260767660569');
                        },
                        icon: Icon(
                          Icons.call,
                          size: 25,
                          color: Colors.green,
                        ),
                        label: Text(
                          "Call Us",
                          style: TextStyle(fontSize: 25, color: Colors.green),
                        ),
                      ),

                      // Divider(
                      //   height: 10,
                      //   indent: 40,
                      //   endIndent: 40,

                      // ),
                      // // message us

                      TextButton.icon(
                        onPressed: () {
                          launch(
                              'sms:+260767660569?body=Hi,wellcome to CrytoWallet ltd,we are happy to hear from you.');
                        },
                        icon: Icon(
                          Icons.message_rounded,
                          size: 25,
                          color: Colors.green,
                        ),
                        label: Text(
                          "Message Us",
                          style: TextStyle(fontSize: 25, color: Colors.green),
                        ),
                      ),

                      //  Email us
                      TextButton.icon(
                        autofocus: true,
                        onPressed: () {
                          launch(
                              'mailto:kapelenaomi@gmail.com?subject=CryptoWallet more transparent and secure crypto exchange&body=Here at CryptoWallet we love to hear from you...');
                        },
                        icon: Icon(
                          Icons.email_outlined,
                          size: 25,
                          color: Colors.green,
                        ),
                        label: Text(
                          "Email Us",
                          style: TextStyle(fontSize: 25, color: Colors.green),
                        ),
                      ),
                    ],
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
