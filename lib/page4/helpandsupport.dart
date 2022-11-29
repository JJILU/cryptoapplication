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
  final String _text2 = 'CoinDCX Pro Community Vist https://t.me/coindcx ';

  // three
  final String _text3 = 'visit https://t.me/DeFimillion ';

  // four
  final String _text4 = 'https://t.me/icospeaks';

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
        ),
        body: Card(
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              // one
              Text(
                'Access Our Online Shopping Website',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 10),
              LinkText(
                _text1,
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 10),
              //two
              Text(
                "Cryptocurrency Online Community",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 10),
              LinkText(
                _text2,
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
              ),
              SizedBox(height: 10),
              LinkText(
                _text3,
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
              ),
              SizedBox(height: 10),
              LinkText(
                _text4,
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
              ),
              SizedBox(height: 10),
              LinkText(
                _text6,
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


