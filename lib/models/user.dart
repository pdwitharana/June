

class UserModel {

String uid;
String email;
String name;


UserModel({
  this.uid,
  this.email,
  this.name
});


static UserModel fromDocument(doc){

  return UserModel(
  uid: doc['uid'],
  name: doc['name'],
  email: doc['email']
  );
}


Map<String, dynamic> toJson() => {

  'uid': this.uid,
  'name': this.name,
  'email': this.email
};



}