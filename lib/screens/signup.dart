import 'package:june/controllers/authController.dart';
import 'package:june/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {

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
          Text('Create New Account'),
          SizedBox(height: height*0.05),
       
           Container(
            width: width*0.80,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Enter Name',
                contentPadding: EdgeInsets.all(10),
              ),
              controller: authController.nameControllerS
            ),
          ),
           SizedBox(height: height*0.05),
          Container(
            width: width*0.80,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Enter email',
                contentPadding: EdgeInsets.all(10),
              ),
              controller: authController.emailControllerS
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
              controller: authController.passwordControllerS
            ),
          ),
          SizedBox(height:height*0.05),
          Row(
            children: [
              SizedBox(width: width*0.25),
              ElevatedButton(child: Text('Back to Login'), onPressed: () {
                Get.to(LoginScreen());
              }),
              SizedBox(width: width*0.10),
              ElevatedButton(child: Text('Sign Up'), onPressed: (){
                authController.signUp();
              },)
            ],
          )
        ],
      ),
    );
  }
}
