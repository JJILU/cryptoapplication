import 'package:flutter/material.dart';
import 'package:link_text/link_text.dart';

import '../page3/home_page.dart';

void main() {
  runApp(HelpAndSupport());
}

class HelpAndSupport extends StatefulWidget {
  @override
  State<HelpAndSupport> createState() => _HelpAndSupportState();
}

class _HelpAndSupportState extends State<HelpAndSupport> {
  final String _text1 =
      'Omi templates online shopping website visit as at https://naomi.kapakalatech.com/';
// two
  final String _text2 =
      'Join a Community of fellow traders and cryptocurrency enthusiasts on CoinDCX. Our community is a space for you to learn more about crypto and blockchain, and stay up to date on all the latest happenings within CoinDCX!.Vist at us at https://t.me/coindcx ';

  // three
  final String _text3 =
      'Defi is short for decentralized finance. It is a community that likes to analyse, build and discuss the promise that cryptocurrency will be an open financial system.For help and Support FROM Defi communtiy visit as at https://t.me/DeFimillion ';

  // four
  final String _text4 =
      'Join the ICOSpeaks investment comumnity! We connect Investors with promising Blockchain projects! Make your choice to invest with Us, launch your Startup, become our Private Investor! We are your Blockchain-Connector!.Join ICO Speaks for Crypto markerting support https://t.me/icospeaks';

  // five

  final String _text6 =
      'Provide Feedback on your experience with our app by emailing us https://mail.google.com/mail/';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: DrawerCode(),
        appBar: AppBar(
          title: Text(' Help & Support'),
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
        body: Card(
          margin: EdgeInsets.all(10),
          child: ListView(
            children: [
              // one
              Text(
                'Access Our Online Shopping Website',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              LinkText(
                _text1,
                textStyle: TextStyle(
                  letterSpacing: 2,
                  color: Colors.grey[700],
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 10),
              //two
              Text(
                "Cryptocurrency Online Community",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              LinkText(
                _text2,
                textStyle: TextStyle(
                  letterSpacing: 2,
                  color: Colors.grey[700],
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              // three
              Text(
                "DeFi Million",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              LinkText(
                _text3,
                textStyle: TextStyle(
                  letterSpacing: 2,
                  color: Colors.grey[700],
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              // four
              Text(
                "ICO Speaks ",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              LinkText(
                _text4,
                textStyle: TextStyle(
                  letterSpacing: 2,
                  color: Colors.grey[700],
                ),
                textAlign: TextAlign.center,
              ),
              // five
              SizedBox(height: 10),

              Text(
                "FeedBack",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              LinkText(
                _text6,
                textStyle: TextStyle(
                  letterSpacing: 2,
                  color: Colors.grey[800],
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//HelpAndSupport


