import 'package:june/models/user.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';


class AuthController extends GetxController {


final _firebaseAuth = FirebaseAuth.instance;

final nameControllerS = TextEditingController();
final emailControllerS = TextEditingController();
final passwordControllerS = TextEditingController();

final emailControllerL = TextEditingController();
final passwordControllerL = TextEditingController();


User get currentUser => _firebaseAuth.currentUser;





Future<void> signUp() async {

try {final signedUpUser = (await _firebaseAuth.createUserWithEmailAndPassword(email: emailControllerS.text, password: passwordControllerS.text)).user;

FirebaseDatabase.instance.reference().child('Users/' + signedUpUser.uid).set({
 'email': signedUpUser.email,
 'password': nameControllerS.text


});

print('signUp function');

} catch (e){
  Get.snackbar('Error loggin in', '$e');
  
}

}





Future<UserModel> login() async {

try {

await _firebaseAuth.signInWithEmailAndPassword(email: emailControllerL.text, password: passwordControllerL.text);

final user = await FirebaseDatabase.instance.reference().child('Users/' + currentUser.uid).once();

final appUser = UserModel.fromDocument(user.value);

return appUser;


} catch (e) {

  Get.snackbar('Error loggin in', '$e');

}

}

}








