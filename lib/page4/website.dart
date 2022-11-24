import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../page3/home_page.dart';


final Uri _url = Uri.parse('https://naomi.kapakalatech.com/');

void main()
{
  runApp(WebPage());
}

class WebPage extends StatefulWidget {
  const WebPage({Key? key}) : super(key: key);

  @override
  State<WebPage> createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp
      (
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: DrawerCode(),
        appBar:AppBar(
          title: Text('Virtual Shopping'),
          backgroundColor: Colors.green,

        ),
        body:Center(
            child: Center(
              child: ElevatedButton(

                onPressed: _launchUrl,
                child: Text('Show Flutter homepage'),
              ),
            ),
        ),

      ),

    );
  }
}

Future<void> _launchUrl() async {
  if (!await launchUrl(_url)) {
    throw 'Could not launch $_url';
  }
}

