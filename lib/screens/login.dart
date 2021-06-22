import 'package:june/controllers/authController.dart';
import 'package:june/screens/home.dart';
import 'package:june/screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class LoginScreen extends StatelessWidget {


  final authController = Get.find<AuthController>();


  @override
  Widget build(BuildContext context) {
    final width = Get.size.width;
    final height = Get.size.height;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: height*0.20),
          Text('Enter your username and password'),
          SizedBox(height: height*0.05),
          Container(
            width: width*0.80,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Enter email',
                contentPadding: EdgeInsets.all(10),
              ),
              controller: authController.emailControllerL
            ),
          ),
          SizedBox(height:height*0.05),
           Container(
            width: width*0.80,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Enter Password',
                contentPadding: EdgeInsets.all(10),
              ),
              controller: authController.passwordControllerL
            ),
          ),
          SizedBox(height:height*0.05),
          Row(
            children: [
              SizedBox(width: width*0.25),
              ElevatedButton(child: Text('Login'), onPressed: () async {
                authController.login();
                if (authController.currentUser == null) {
                  print(authController.currentUser);
                  return null;
                }

                else {
                  await Get.to(HomeScreen());
                }
              }),
              SizedBox(width: width*0.10),
              ElevatedButton(child: Text('Sign Up'), onPressed: (){
                Get.to(SignUpScreen());
              },)
            ],
          )
        ],
      ),
    );
  }
}
