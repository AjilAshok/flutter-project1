// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sample2/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _loginState();
}

class _loginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool hidePass = true;

  void nav() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
      return Home();
    }));
  }

  Future<void> validate() async {
    if (_formKey.currentState!.validate()) {
      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString('email', 'ajil');
      nav();

      // Get.to(HomePage());

    } else {
      print(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Login',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  // key: _formKey,
                  // ignore: prefer_const_constructors
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.red),
                    labelText: 'User',
                    hintText: 'Enter the username',
                    hintStyle: TextStyle(
                      color: Colors.black,
                    ),
                    // ignore: prefer_const_constructors
                    focusedBorder: OutlineInputBorder(
                      // ignore: prefer_const_constructors
                      borderSide: BorderSide(
                        color: Colors.red,
                      ),
                    ),
                    prefixIcon: Icon(
                      Icons.account_box,
                      color: Colors.red,
                    ),
                  ),
                  validator: (value) {
                    if (value == "") {
                      return "Required";
                    } else if (value != "ajil123") {
                      return "Incorrect user";
                    } else {
                      return null;
                    }
                  },
                ),
                Container(
                  padding: EdgeInsets.only(top: 10),
                  child: TextFormField(
                    obscureText: hidePass,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.red),
                      hintText: 'Enter the Password',
                      labelText: 'Password',
                      hintStyle: TextStyle(
                        color: Colors.black,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                      ),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.red,
                      ),
                      suffixIcon: InkWell(
                        onTap: passwordview,
                        child: Icon(
                          Icons.visibility,
                          color: Colors.red,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == "") {
                        return "*Required";
                      } else if (value != "ajil") {
                        return "Incorrect password";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 70,
                  padding: EdgeInsets.only(top: 20),
                  child: ElevatedButton(
                    onPressed: validate,
                    child: const Text('Login'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void passwordview() {
    setState(() {
      hidePass = !hidePass;
    });
  }
}
