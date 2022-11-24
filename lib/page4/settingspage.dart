import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../page3/home_page.dart';



void main()
{
  runApp(SettingsPage());
}


class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 1,
            leading: IconButton(
              onPressed: ()
              {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back,
              color: Colors.green,
              ),
            ),
          ),
      body: Container(
        padding: EdgeInsets.only(left: 16,top: 25,right: 16 ),
        child: ListView(
          children: [
            Text(
              "Settings",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
            //SizedBox TO ADD SPACE B/W SETTINGS TEXT & ROW
            SizedBox(height: 40,),
            //ADDED THE PERSON ICON AND ACCOUNT TEXT
            Row(
              children: [
                Icon(Icons.person,color: Colors.green,),
                SizedBox(width: 8,),
                Text("Account",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              ],
            ),

            //ADDING DIVIDER
            Divider(height: 15 ,thickness: 2,),

            //ADDING SPACE
            SizedBox(height: 10,),

            //ADDING A ROW()
            buildAccountOptionRow(context,"Change Password"),
            buildAccountOptionRow(context,"Content Setting"),
            buildAccountOptionRow(context,"Social"),
            buildAccountOptionRow(context,"Language"),
            buildAccountOptionRow(context,"Privacy and Security"),

            //ADDING THE NOTIFICATION SECTION
            SizedBox(height: 40,),
            //ADDED THE PERSON ICON AND ACCOUNT TEXT
            Row(
              children: [
                Icon(Icons.volume_up_outlined,color: Colors.green,),
                SizedBox(width: 8,),
                Text("Notifications",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              ],
            ),

            //ADDING DIVIDER
            Divider(height: 15 ,thickness: 2,),

            //ADDING SPACE
            SizedBox(height: 10,),

            //ADDING SWITCHES,=> LATER EXTRACTED INTO A METHOD
            buidNotificationsOptionRow("New For You", true),
            buidNotificationsOptionRow("Account Activity",true),
            buidNotificationsOptionRow("Opportunity",false),

            //ADDING SOME SPACING
            SizedBox(
              height: 50,
            ),

            //ADDING BUTTON TO SIGN OUT

            Center(
              child: OutlinedButton(
                  onPressed: (){},
                  child: Text(
                      "SIGN OUT",
                    style: TextStyle(
                      fontSize: 16,
                      letterSpacing: 2.2,
                      color: Colors.black,
                    ),
                  ),),
            ),



          ],
        ),
      ),
    );
  }

  Row buidNotificationsOptionRow(String title, bool isActive) {
    return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.grey[600],
                ),
              ),

              Transform.scale(
                scale: 0.7,
                  child: CupertinoSwitch(value: isActive, onChanged: (bool val) {}))
            ],
          );
  }

  GestureDetector buildAccountOptionRow(BuildContext context, String title) {
    return GestureDetector(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context)
              {
                return AlertDialog(
                  title: Text(title),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text("Option 1"),
                      Text("Option 2"),
                      Text("Option 3"),
                    ],
                  ),
                  actions: [
                    ElevatedButton(
                        onPressed: (){
                            Navigator.of(context).pop();
                        },
                        child: Text("Close")),
                  ],
                );
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                  title,
                  style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[600],
                  ),
                  ),

                  Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                  ),

                ],
              ),
            ),
          );
  }
}


/*
class SettingsPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp
      (
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: DrawerCode(),
        appBar:AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 1,
          leading: IconButton(
            onPressed: ()
            {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>  const HomePage(),
                ),
              );
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.green,
            ),
          ),
        ),
        body:Center(child: Text("Settings Page")),

      ),

    );
  }
}

 */