import 'package:flutter/material.dart';
import 'package:flutter_final_project/Home/Home.dart';
import 'package:flutter_final_project/Login/Login.dart';

import '../MergedPage/MergePage.dart';

class LoginDetail extends StatefulWidget {
  const LoginDetail({Key? key}) : super(key: key);

  @override
  State<LoginDetail> createState() => _LoginDetailState();
}

class _LoginDetailState extends State<LoginDetail> {
  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // Schedule a future to close the dialog and navigate to the home page
        Future.delayed(Duration(seconds: 2), () {
          Navigator.of(context).pop(true); // Pop the dialog
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Home()), // Navigate to the home page
          );
        });

        return AlertDialog(
          title: const Text('Success'),
          content: const Text('Account created successfully!'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(true); // Pop the dialog
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Home()), // Navigate to the home page
                );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width * 0.8; // 80% of the screen width

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10), // Add radius here
                      child: Image.asset(
                        "assets/image/logo.jpg",
                        width: 50,
                        height: 50,
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      "AK CAST",
                      style: TextStyle(
                        fontSize: 36,
                        color: Colors.purpleAccent,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.1), // 10% padding on both sides
                child: TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.purpleAccent,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purpleAccent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purpleAccent),
                    ),
                    labelText: 'Email',
                    hintText: "Enter Your Email Address",
                    labelStyle: TextStyle(color: Colors.purpleAccent),
                    hintStyle: TextStyle(color: Colors.purpleAccent),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.1), // 10% padding on both sides
                child: TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.purpleAccent,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purpleAccent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purpleAccent),
                    ),
                    labelText: 'Password',
                    hintText: "Enter Your Password",
                    labelStyle: TextStyle(color: Colors.purpleAccent),
                    hintStyle: TextStyle(color: Colors.purpleAccent),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _showSuccessDialog,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purpleAccent, // Change button color
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 15),
                      textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    child: const Text(
                      "Sign In",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
