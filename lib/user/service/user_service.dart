import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore/user/model/user_model.dart';

class UserService {
  static Future addUser(User user) async {
    FirebaseFirestore.instance.collection('user').doc(user.id).set(
          user.toJson(),
        );
  }

  static Future autoAddUser(User user) async {
    FirebaseFirestore.instance.collection('user').add(
          user.toJson(),
        );
  }

  static Future deleteUser(String id) async {
    await FirebaseFirestore.instance.collection('user').doc(id).delete();
  }
}
