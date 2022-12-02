import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../page3/home_page.dart';

void main() => runApp(const PrivacyPolicy());

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: _MyAppContent(),
    );
  }
}

class _MyAppContent extends StatefulWidget {
  @override
  _MyAppContentState createState() => _MyAppContentState();
}

class _MyAppContentState extends State<_MyAppContent> {
  @override
  void initState() {
    super.initState();
    this.initMyLibrary();
  }

  void initMyLibrary() {
    LicenseRegistry.reset();
    LicenseRegistry.addLicense(() async* {
      yield LicenseEntryWithLineBreaks(<String>['ACustomLibrary'], '''
  Copyright 2022 CryptoWallet.com. All rights reserved.
  
     *Personally Identifiable Information that You Provide to Us
We do not collect personally identifiable information e.g., name, e-mail address,
 contact or similar information unless you choose to provide it to us. 
 If you voluntarily provide us with personal information, 
 for example by sending an e-mail or by filling out a form and submitting it through our Website, 
 we may use that information only to respond to your message and to help us provide you with the information or services that you request. 
To the extent that we process your personal information based on your consent, you may withdraw your consent at any time as stated below.
  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS
  
  
  *How this Information is Used
The information we collect is used for a variety of purposes, such as:

to enable your use of our services and fulfill your requests for certain features, such as enabling you to participate in and renew paid services, polls, and message boards;
by performing statistical, demographic and marketing analyses of users of our services to improve our relationship with our customers
for product development purposes and to generally inform advertisers about the nature of our subscriber base to improve our relationship with our customers;
to customize your experience by allowing advertising to be targeted to the users for whom such advertising is most pertinent
''');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        drawer: DrawerCode(),
        appBar: AppBar(
          title: Text('Privacy and Licenses'),
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
        body: Center(
          child: ElevatedButton(
            
            style: ElevatedButton.styleFrom(
              primary: Colors.green,
            ),
            child: Text('Privacy Policy & Lincese '),
            onPressed: () {
              showAboutDialog(
                context: context,
                applicationIcon: FlutterLogo(),
                applicationName: 'Cryptocurrency Wallet',
                applicationVersion: '0.0.1',
                applicationLegalese: '©2022 CryptoWallet.com',
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: Text('The Crycurrency Privacy Policy & Licenses'))
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
