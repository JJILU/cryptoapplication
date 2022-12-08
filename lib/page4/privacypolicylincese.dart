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
  Copyright 2022 CryptoWallet ltd. All rights reserved.
  
     *The Crypto Wallet appliction collects personal information such as Email id,Password,and 
     the transaction information about the dates of purchasing,selling of crypto currencies,it also
     keeps a record of the type of crypto coins invested in,this helps the Crypto Wallet to help
     to serve you better by knowing the best crypto curriences according to a survey of the most used
     coins,we do share your information with third-parties. 
  
  
  *How this Information is Used
The information we collect is used for a variety of purposes, such as:
The information is used for to conduct surveys on to know the best performing crypto coins.
The information allows to create better future versions of this application
The information made primarly in feedback calls,sms,email allows to know the limitation of our 
application and how best resolve failures of service

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
