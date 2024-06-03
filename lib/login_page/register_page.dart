import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:demo_prooject1/models/my_button.dart';
import 'package:demo_prooject1/models/my_textfield.dart';


class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  // text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // sign user in method
  void signUp() async {
    if (passwordConfirmed()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
    password: passwordController.text.trim(),
      );

    }
  }
  bool passwordConfirmed(){
    if(passwordController.text.trim()==confirmPasswordController.text.trim()) {
      return true;
    }
    else {
      return false;
    }
  }

    

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Wrap(
          children: [SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                children: [
                  const SizedBox(height: 30),
                  // logo
                  const Image(
                    width: 100,
                    image: AssetImage('assets/images/logo.png'),
                  ),
                  const SizedBox(height: 40),
                  Text(
                    'Lets get you Started!',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 50),

                  MyTextField(
                    controller: emailController,
                    hintText: 'Email',
                    obscureText: false,
                  ),

                  const SizedBox(height: 10),
                  MyTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: true,
                  ),
                  const SizedBox(height: 10),
                  MyTextField(
                    controller: confirmPasswordController,
                    hintText: 'Confirm Password',
                    obscureText: true,
                  ),


                  const SizedBox(height: 25),

                  // sign in button
                  MyButton(
                    onTap: signUp,
                    text: "Sign UP",
                  ),

                  const SizedBox(height: 50),


                  const SizedBox(height: 30),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already a member?',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      const SizedBox(width: 4),
                      TextButton(
                        onPressed: ()=> Navigator.pushNamed(context, '/login_page'),
                        child: const Text(
                          'Sign In now',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          )]
      ),
    );
  }
}
