import 'package:firestore/user/model/user_model.dart';
import 'package:firestore/user/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final nameController = TextEditingController();
  final idController = TextEditingController();
  final ageController = TextEditingController();
  final cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add User'),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            mainTextFormField(nameController, 'Enter Name'),
            mainTextFormField(idController, ' Enter Id'),
            mainTextFormField(ageController, ' Enter Age'),
            mainTextFormField(cityController, ' Enter City'),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: addUsers,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(0),
                  ),
                  child: const Text(
                    "Add New User",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget mainTextFormField(controller, hintText) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0),
          ),
        ),
      ),
    );
  }

  void addUsers() async {
    String name = nameController.text;
    String id = idController.text;
    int age = int.parse(ageController.text);
    String city = cityController.text;

    User user = User(
      name: name,
      id: id,
      age: age,
      city: city,
    );
    UserProvider provider = Provider.of<UserProvider>(context, listen: false);
    await provider.addUser(user);
  }
}
