import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../page3/home_page.dart';

final Uri _url = Uri.parse('https://naomi.kapakalatech.com/');

void main() {
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: DrawerCode(),
        appBar: AppBar(
          title: Text('Virtual Shopping'),
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
        body: 
          
             Stack(
               children: 
               [
                
               ElevatedButton(
                onPressed: _launchUrl,
                child: Text('Click Here To Visit Our Virtual Shop Website '),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                         ),
               ],
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
