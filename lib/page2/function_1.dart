//API METHODS

//https://api.coingecko.com/api/v3/coins/
/** 
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<double> getPrice(String id) async {
  //returns a double which is the price the user is asking for
  try {
    dynamic url = "https://api.coingecko.com/api/v3/coins/" +
        id; //adds id hence url must left leading with a forward slash
    var response = await http.get(
        url); //gets a request from user //simillar to mail system 'delivery'
    var json =
        jsonDecode(response.body); //convert reponse recieved to json format
    var value = json['market_data']['current_price']['usd'].toString();
    return double.parse(value); //return market price of coin
  } catch (e) {
    print(e.toString()); //if we catch an error print error to string
    return 0.0;
  }
}
**/

 /** 
  var kwacha = 0.0;
  var dollar = 0.0;
  var pound = 0.0;

  @override
  void initState() {
    //override initState

    getValues();
  }

  getValues() async {
    //calls API and sets the current price for each currency
    kwacha = await getPrice("kwacha");
    dollar = await getPrice("dollar");
    pound = await getPrice("pound");
    setState(() {});
  }
  **/


/** 
    getValue(String id, double amount) {
      if (id == "kawcha") {
        return kwacha * amount;
      } else if (id == "dollar") {
        return dollar * amount;
      } else {
        return pound * amount;
      }
    }
**/