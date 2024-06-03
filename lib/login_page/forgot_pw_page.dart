
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:demo_prooject1/models/my_textfield.dart';


class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  // text editing controllers
  final emailController = TextEditingController();

  // sign user in method
  void passwordReset() async {
    try{
    await FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text.trim());
    showDialog(context: context, builder: (context){
      return const AlertDialog(
        content: Text("Password reset link sent! Check your Email"),
      );
    },
    );
    }
    on FirebaseAuthException catch (e) {
      showDialog(context: context, builder: (context){
        return AlertDialog(
          content: Text(e.message.toString()),
        );
      },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[700],
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(25.0),
            child: Text("Enter Your Email and we will send you a password rest link",
            textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
          ),
          const SizedBox(height: 15,),
          Padding(padding: const EdgeInsets.symmetric(horizontal: 25),
            child: MyTextField(controller: emailController, hintText: "Email", obscureText: false),
          ),
          const SizedBox(height: 15,),
          MaterialButton(onPressed: passwordReset,color: Colors.grey[600],child: const Text("Reset Password"),)


        ],
      ),
    );
  }
}

