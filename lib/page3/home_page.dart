//import 'package:banking/page2/function_1.dart';
import 'package:cryptoapptwo/page2/function_2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../page4/about.dart';
import '../page4/main2.dart';
import '../page4/privacypolicylincese.dart';
import '../page4/profile.dart';
import '../page4/settingspage.dart';
import '../page4/update1.dart';
import '../page4/website.dart';
import 'add_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:DrawerCode(),
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 50.0,
        //EX1!!
/**
        actions: [
          IconButton(
            icon:Icon(Icons.arrow_forward),
            onPressed:(){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CoinListing(),
                ),
              );
            },
          ),
        ],

**/
        title: const Text('Home page'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Center(
          child: StreamBuilder(
            //part 1 of StreamBuilder data from user
            stream: FirebaseFirestore.instance
                .collection('Users')
                .doc(FirebaseAuth.instance.currentUser?.uid)
                .collection('Coins')
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView(
                children: snapshot.data!.docs.map(
                  (document) {
                    return Padding(
                      padding:
                          EdgeInsets.only(top: 5.0, left: 15.0, right: 15.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 1.3,
                        height: MediaQuery.of(context).size.width / 12,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.green,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              "Curreny Name : ${document.id} ",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ), //stores the name of the coin in the document.id
                            Text(
                              " ${document.get("Amount")}",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ), //stores the current amount multipled by the current exchange value
                            IconButton(
                              onPressed: () async {
                                await withdrawMoney(document.id);
                              },
                              icon: Icon(
                                Icons.delete,
                                color: Colors.black,
                              ),
                            ),


                          ],
                        ),
                      ),
                    );
                  },
                ).toList(),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddViews(),
            ),
          );
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.green,
      ),
    );
  }
}


//Drawer Code
class DrawerCode extends StatelessWidget {
  const DrawerCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer( //drawer property that contains Drawer()
      child:ListView //a ListView Widget that contain children widget in a verticall order
        (
        children:
        [
          DrawerHeader
            (
            child: Image.asset('assets/images/kanchanara-ow-rGjlqJkM-unsplash.jpg',fit: BoxFit.cover,),
          ),

          //Profile PAGE
          ListTile(
            title: Text(
              "Profile",
              style: TextStyle(
                fontWeight:FontWeight.normal,
                fontSize: 20.0,),
            ),
            onTap: ()
            {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>  ProfilePage(),
                ),
              );
            },


          ),


          //CryptoCurrency Rate
          ListTile(
            title: Text(
              "Cryptocurrrency Rate",
              style: TextStyle(
                  fontWeight:FontWeight.normal,
               fontSize: 20.0,),
            ),
            onTap: ()
            {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CoinListing(),
                ),
              );
            },
          ),



          //Virtaul Website

          ListTile(
            title: Text(
              "Virtual Website",
              style: TextStyle(
                fontWeight:FontWeight.normal,
                fontSize: 20.0,),
            ),
            onTap: ()
            {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>  WebPage(),
                ),
              );
            },


          ),



          //Cryptocurrency Survey

          ListTile(
            title: Text(
              "Cryptocurrency Survey",
              style: TextStyle(
                fontWeight:FontWeight.normal,
                fontSize: 20.0,),
            ),
            onTap: ()
            {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>  Survey(),
                ),
              );
            },


          ),



          //SETTINGS PAGE
          ListTile(
            title: Text(
              "Settings",
              style: TextStyle(
                  fontWeight:FontWeight.normal,
                fontSize: 18.5,),
            ),
            onTap: ()
            {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>  SettingsPage(),
                ),
              );
            },


          ),


          //ABOUT PAGE
          ListTile(
            title: Text(
              "About",
              style: TextStyle(
                fontWeight:FontWeight.normal,
                fontSize: 20.0,),
            ),
            onTap: ()
            {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>  AboutPage(),
                ),
              );
            },
          ),


        //Privacy Policy And Terms
          //ABOUT PAGE
          ListTile(
            title: Text(
              "Privacy & Licenses",
              style: TextStyle(
                fontWeight:FontWeight.normal,
                fontSize: 20.0,),
            ),
            onTap: ()
            {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>  PrivacyPolicy(),
                ),
              );
            },
          ),


        ],
      ),
    );
  }
}
