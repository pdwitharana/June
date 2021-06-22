import 'package:june/controllers/authController.dart';
import 'package:june/screens/login.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  final dBRef = FirebaseDatabase.instance.reference();
  final authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            SizedBox(height: 150),
            Container( 
              child: ElevatedButton(
                  child: Text('Enter App'),
                  onPressed: () {
                    Get.to(LoginScreen());
                   
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
