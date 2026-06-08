import 'package:flutter/material.dart';
import 'package:invoice_app/screens/auth/register.dart';
import '../../services/api_service.dart';
import '../../widgets/custom_textfield.dart';
import '../home/home.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();


  login() async {
    var data = await ApiService.login(username.text, password.text);

    if (data['message'] == "Login success") {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => HomeScreen(userId: data['user_id']),
        ),
      );
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(data['error'])));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Login", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: Colors.white)),
            SizedBox(height: 20),
            CustomTextField(controller: username, label: "Username"),
            SizedBox(height: 10),
            CustomTextField(controller: password, label: "Password", isPassword: true),
            SizedBox(height: 40),
            SizedBox(
              width: 200,
              height: 45,
              child: ElevatedButton(onPressed: login, child: Text("Login"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            // TextButton(
            //   onPressed: () {
            //     Navigator.push(context,
            //         MaterialPageRoute(builder: (_) => RegisterScreen()));
            //   },
            //   child: Text("Create Account"),
            // ),
            SizedBox(height: 20,),
            SizedBox(width: 200,
              height: 42,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterScreen()),
                  );
                },
                child: Text("Create Account",
                    style: TextStyle(color: Colors.white
                    )),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(
                    color: Colors.white,
                  ),

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),

                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}