import 'package:june/controllers/authController.dart';
import 'package:june/screens/login.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:june/services/notificationService.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final dBRef = FirebaseDatabase.instance.reference();

  final authController = Get.put(AuthController());

  @override
  void initState() {
    super.initState();
    NotificationService.getPushToken();
  }

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
