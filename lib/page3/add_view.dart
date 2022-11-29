import 'package:flutter/material.dart';

import '../page2/function_2.dart';

class AddViews extends StatefulWidget {
  const AddViews({Key? key}) : super(key: key);

  @override
  _AddViewsState createState() => _AddViewsState();
}

class _AddViewsState extends State<AddViews> {
  List<String> currency = [
    //list of currency
    "bitcoin",
    "ethererum",
    "litecoin",
    "cardano",
    "polkadot",
    "stellar"
  ];

  //String? value;

  String dropdownValue = "bitcoin";
  final TextEditingController _amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Add View"),
      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton(
              value:
                  dropdownValue, //set value to new selected value and displays new value
              onChanged: (String? value) {
                setState(() {
                  dropdownValue = value!;
                });
              },
              items: currency.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(), //Error encounterred when  i fail to convert return to list:  The argument type 'Iterable<DropdownMenuItem<String>>' can't be assigned to the parameter type 'List<DropdownMenuItem<String>>?'.V
            ),
            SizedBox(
              height: 28.0,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.3,
              child: TextFormField(
                controller: _amountController,
                decoration: const InputDecoration(
                  labelText: "Coin Amount",
                ),
                // keyboardType: TextInputType.text,
              ),
            ),
            //Add Button

            SizedBox(
              height: 28.0,
            ),

            //Deposit Coins Function
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(200.0),
                color: Colors.white,
              ),
              width: MediaQuery.of(context).size.width / 1.4,
              height: 45,
              child: MaterialButton(
                color: Colors.green,
                onPressed: () async {
                  await addMoney(
                      dropdownValue,
                      _amountController
                          .text); //addMoney(String id,String amount)
                  Navigator.of(context)
                      .pop(); // Removes the user from the material widget screen and bring them back home_page.dart
                },
                child: const Text('Add Coins'),
              ),
            ),

            SizedBox(
              height: 20.0,
            ),
            //WITHDRAW COIN FUNCTION

            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(200.0),
                color: Colors.green,
              ),
              width: MediaQuery.of(context).size.width / 1.4,
              height: 45,
              child: MaterialButton(
                color: Colors.green,
                onPressed: () async {
                  await removeMoney(
                      dropdownValue,
                      _amountController
                          .text); //addMoney(String id,String amount)
                  Navigator.of(context)
                      .pop(); // Removes the user from the material widget screen and bring them back home_page.dart
                },
                child: const Text('Remove Coins'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
