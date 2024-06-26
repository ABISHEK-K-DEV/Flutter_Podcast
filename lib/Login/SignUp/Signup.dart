import 'package:flutter/material.dart';
import 'package:flutter_final_project/Login/Login.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // Schedule a future to close the dialog and navigate to the home page
        Future.delayed(Duration(seconds: 2), () {
          Navigator.of(context).pop(true); // Pop the dialog
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Login()), // Navigate to the home page
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
                  MaterialPageRoute(builder: (context) => Login()), // Navigate to the home page
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
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
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
              TextField(
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
                  labelText: 'Name...',
                  hintText: "Enter Your Name ..",
                  labelStyle: TextStyle(color: Colors.purpleAccent),
                  hintStyle: TextStyle(color: Colors.purpleAccent),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
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
                  labelText: 'Phone No..',
                  hintText: "Enter Your Phone Number...",
                  labelStyle: TextStyle(color: Colors.purpleAccent),
                  hintStyle: TextStyle(color: Colors.purpleAccent),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
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
                  labelText: 'UserName..',
                  hintText: "Display Name...",
                  labelStyle: TextStyle(color: Colors.purpleAccent),
                  hintStyle: TextStyle(color: Colors.purpleAccent),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
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
                  labelText: 'Email..',
                  hintText: "Enter Your Email Address..",
                  labelStyle: TextStyle(color: Colors.purpleAccent),
                  hintStyle: TextStyle(color: Colors.purpleAccent),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
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
                  labelText: 'Password..',
                  hintText: "Enter Your New Password..",
                  labelStyle: TextStyle(color: Colors.purpleAccent),
                  hintStyle: TextStyle(color: Colors.purpleAccent),
                ),
              ),
              const SizedBox(height: 20),
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
                  "Sign Up",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
