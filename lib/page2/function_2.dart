import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<bool> signIn(String email, String password) async {
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return true;
  } catch (e) {
    print(e);
    return false;
  }
}

Future<bool> signUp(String email, String password) async {
  try {
    //method contains user authentication method e.g using email and password in this case
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    //if successfull return true
    return true;
  } on FirebaseAuthException catch (e) {
    //Exception handling for firebase
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
    return false;
  } catch (e) {
    print(e.toString());
    return false;
  }
}

//Future method for depositing into existing account

Future<bool> addMoney(String id, String amount) async {
  try {
    //return true if successfull in adding to the database
    String? uid = FirebaseAuth.instance.currentUser?.uid;
    var value = double.parse(amount); //convert string to double
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection('Users')
        .doc(uid)
        .collection('Coins')
        .doc(id);

    //TRANSCATION POINT
    FirebaseFirestore.instance.runTransaction((transaction) async {
      DocumentSnapshot snapshot = await transaction
          .get(documentReference); //capture of data within the document
      if (!snapshot.exists) {
        //user has yet ot not created a document for a transcation
        documentReference.set({'Amount': value});
        return true;
      }

      double newAmount = snapshot.get('Amount') +
          value; //snapshot.data()['Amount'] + value; //if document of transcation already exists
      transaction.update(documentReference,
          {'Amount': newAmount}); // mention the document u want to update
      return true;
    });
  } catch (e) {
    //return false if fails to add to the database
    print(e.toString());
  }
  return false;
}


//Future method for withdrawing into existing account

Future<bool> removeMoney(String id, String amount) async {
  try {
    //return true if successfull in adding to the database
    String? uid = FirebaseAuth.instance.currentUser?.uid;
    var value = double.parse(amount); //convert string to double
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection('Users')
        .doc(uid)
        .collection('Coins')
        .doc(id);

    //TRANSCATION POINT
    FirebaseFirestore.instance.runTransaction((transaction) async {
      DocumentSnapshot snapshot = await transaction
          .get(documentReference); //capture of data within the document
      if (!snapshot.exists) {
        //user has yet ot not created a document for a transcation
        documentReference.set({'Amount': value});
        return true;
      }

      double newAmount = snapshot.get('Amount') -
          value; //snapshot.data()['Amount'] + value; //if document of transcation already exists
      transaction.update(documentReference,
          {'Amount': newAmount}); // mention the document u want to update
      return true;
    });
  } catch (e) {
    //return false if fails to add to the database
    print(e.toString());
  }
  return false;
}




//Future method for deleting transaction from existing account

Future<bool> withdrawMoney(String id) async {
  String? uid = FirebaseAuth.instance.currentUser?.uid;
  FirebaseFirestore.instance
      .collection('Users')
      .doc(uid)
      .collection('Coins')
      .doc(id)
      .delete();
  return true;
}
