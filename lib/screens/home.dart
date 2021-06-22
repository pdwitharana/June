import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeScreen extends StatelessWidget {
  final postReference = FirebaseDatabase.instance.reference().child('posts');
  TextEditingController postController = TextEditingController();
  final firestoreInstance = FirebaseFirestore.instance;

  List<dynamic> list = List<dynamic>();

  final width = Get.size.width;
  final height = Get.size.height;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SizedBox(
          height: height * 0.20,
        ),
        ElevatedButton(
          child: Text('back'),
          onPressed: () {
            Get.back();
          },
        ),
        SizedBox(
          height: height * 0.05,
        ),
        Text('Welcome to Home Screen'),
         SizedBox(
          height: height * 0.05,
        ),
        TextField(controller: postController,),
         SizedBox(
          height: height * 0.05,
        ),
        ElevatedButton(
          child: Text('Post'),
          onPressed: () {
          //  FirebaseDatabase.instance.reference().child('posts').set({
          // 'post': '1111'
          
          // });

          firestoreInstance.collection('users').add({
            'name': 'pasan'
          }).then((value) => print(value.id));

          },
        ),
      //   Expanded(
      //     child: StreamBuilder(
      //     stream:
      //         postReference.orderByChild("id").onValue,
      //     builder: (BuildContext context, AsyncSnapshot<Event> snapshot) {
      //       if (snapshot.hasError) {
      //         return Center(
      //           child: Text(snapshot.error.toString()),
      //         );
      //       }
      //       if (snapshot.hasData) {
      //         list.clear();

      //         var snapshotData = snapshot.data.snapshot;

      //         Map<dynamic, dynamic> data = snapshotData.value;
      //         data.forEach((key, value) {
      //           list.add(value);
      //         });

      //         print(list.length);

      //         return ListView.builder(
      //             itemCount: list.length,
      //             padding: EdgeInsets.all(25),
      //             itemBuilder: (context, index) {
      //               return ListTile(
      //                 title: Text(list[index]['post']),
      //               );
      //             });
      //       }
      //       return Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     },
      // ),
      //   ),
      ],
    ));
  }
}
