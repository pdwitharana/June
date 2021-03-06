import 'package:firebase_auth/firebase_auth.dart';
import 'package:june/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:june/services/notificationService.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // await FirebaseAuth.instance.signOut();
  await NotificationService.initFcm();

  runApp(App());
}
