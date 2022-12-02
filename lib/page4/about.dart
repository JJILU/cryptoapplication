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
            ),
            Center(
              child: Card(
                margin: EdgeInsets.all(20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(40),
                    primary: Colors.green,
                    elevation: 20,
                  ),
                  child:
                      Text("Click Here To Know About CryptoWallet Application",
                          style: TextStyle(
                            fontSize: 20,
                            letterSpacing: 2,
                          )),
                  onPressed: aboutPage,
                ),
              ),
            ),
          ],
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
      applicationLegalese:
          'Developed By Omi Templates ltd, ©2022 CryptoWallet.com',
      children: [
        SizedBox(
          height: 40,
        ),
        Text(
            'The Crypto Wallet Application  is the type Application Software that is used as a platform to facillitate the buying and selling of cryptocurrency such as bitcoin, litecoin, ethereum,cardano polkadot,stellar e.t.c'),
        Text(
            'The Crypto Wallet application was created using Flutter,which means the application can run for both Android iOS devices.'),
      ],
    );
  }
}
