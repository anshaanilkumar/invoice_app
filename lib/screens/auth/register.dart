import 'package:flutter/material.dart';
import '../../services/api_service.dart';
import '../../widgets/custom_textfield.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();

  register() async {
    var data = await ApiService.register({
      "name": name.text.trim(),
      "username": username.text.trim(),
      "email": email.text.trim(),
      "phone": phone.text.trim(),
      "password": password.text.trim(),
    });

    if (data['message'] != null) {
      // ✅ Success Dialog
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text("Success"),
          content: Text(data['message']),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // close dialog
                Navigator.pop(context); // go to login
              },
              child: Text("OK"),
            )
          ],
        ),
      );
    } else {
      // ❌ Error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(data['error'] ?? "Error")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(title: Text("Register",
        style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),),
      centerTitle: true,
      backgroundColor: Colors.white,),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: ListView(
            children: [
              SizedBox(height: 20,),
              CustomTextField(controller: name, label: "Name"),
              SizedBox(height: 10),
              CustomTextField(controller: username, label: "Username"),
              SizedBox(height: 10),
              CustomTextField(controller: email, label: "Email"),
              SizedBox(height: 10),
              CustomTextField(controller: phone, label: "Phone"),
              SizedBox(height: 10),
              CustomTextField(controller: password, label: "Password", isPassword: true),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: register,
                child: Text("Register",
                  style: TextStyle(color: Colors.blue),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}