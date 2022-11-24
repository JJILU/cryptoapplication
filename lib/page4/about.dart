import 'package:flutter/material.dart';

import '../page3/home_page.dart';

void main() {
  runApp(AboutPage());
}

class AboutPage extends StatefulWidget {
  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: DrawerCode(),
        appBar: AppBar(
          title: Text('About'),
          backgroundColor: Colors.green,
        ),
        body: Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.green,
              elevation: 5,
            ),
            child: Text("About Page"),
            onPressed: aboutPage,
          ),
        ),
      ),
    );
  }

  //aboutPage

  aboutPage() {
    showAboutDialog(
        context: context,
        applicationIcon: FlutterLogo(
          size: 70,
        ),
        applicationName: 'About Cryptocurrency Wallet App',
        applicationVersion: '0.0.1',
      applicationLegalese: 'Developed By Omi Templates ltd, ©2022 CryptoWallet.com',
        children: [

              SizedBox(
                height: 40,
              ),
              Text('The Crypto Wallet Application  is the type Application Software that is used as a platform to facillitate the buying and selling of cryptocurrency such as bitcoin, litecoin, ethereum,cardano polkadot,stellar e.t.c'),
              Text('The Crypto Wallet application was created using Flutter,which means the application can run for both Android iOS devices.'),


      ],

    );
  }
}
