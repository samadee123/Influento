import 'package:assignment/features/authentication/controllers/login_controller.dart';
import 'package:assignment/features/authentication/screens/Home_Screen.dart';
import 'package:flutter/material.dart';
import 'package:assignment/features/authentication/controllers/Signup_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hexcolor/hexcolor.dart';
import 'SignUp_Page.dart';

class LoginPage extends StatelessWidget {

  const LoginPage({Key? key}) : super(key: key);
  

  
  @override
  Widget build(BuildContext context) {
    Color textColor = Theme.of(context).brightness == Brightness.dark ? Colors.white : HexColor("#565555");
    Color subTextColor = Theme.of(context).brightness == Brightness.dark ? Colors.white : HexColor("#848484");
    Color navbar = Theme.of(context).brightness == Brightness.dark ? HexColor("#333333") : Colors.white;
    final loginController = Get.put(LoginController());
    return Form(
      child:  Scaffold(
        body: OrientationBuilder(
          builder: (context, orientation){
            if (orientation == Orientation.portrait){
              return SingleChildScrollView(
                child: Column(
                  children: [
                    // Logo Image
                    Padding(
                    padding: const EdgeInsets.only(
                      left: 10.0,
                      right: 20.0,
                      top: 100.0,
                      bottom: 50.0,
                    ),
                    child: Image.asset(
                      'lib/images/logo.png',
                      width: 350.0,
                      height: 250.0,
                    ),
                    ),
                    // Login Text
                    Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                    ),
                  ),
                  Center(
                    child: Column(
                      children: [
                        // Email Input
                        Container(
                          width: 280.0,
                          height: 48.0,
                          decoration: BoxDecoration(
                            color: navbar,
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(color: HexColor("#848484")),
                          ),
                          child: TextFormField(
                            controller: loginController.email,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding:
                                  const EdgeInsets.only(left: 10.0, top: -6.0),
                              hintText: 'Email',
                              hintStyle: TextStyle(
                                fontSize: 15.0,
                                color: subTextColor,
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter an email address';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: 20.0),
                        // Password Input
                        Container(
                          width: 280.0,
                          height: 48.0,
                          decoration: BoxDecoration(
                            color: navbar,
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(color: HexColor("#848484")),
                          ),
                          child: TextFormField(
                            controller: loginController.password,
                            decoration: InputDecoration(
                              contentPadding: 
                                  const EdgeInsets.only(left: 10.0, top: -6.0),
                              border: InputBorder.none,
                              hintText: 'Password',
                              hintStyle: TextStyle(
                                fontSize: 15.0,
                                color: subTextColor,
                              ),
                            ),
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a password';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: 20.0),
                        // Login Button
                        GestureDetector(
                          onTap: () {
                            // FirebaseAuth.instance.signInWithEmailAndPassword(
                            //   email: controller.email.text.trim(),
                            //   password: controller.password.text.trim()
                            // );
                            LoginController.instance.loginUser(
                                loginController.email.text.trim(),
                                loginController.password.text.trim(),
                            );
                            
                          },
                          child: Container(
                            width: 280.0,
                            height: 48.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: HexColor("#9E54CA"),
                            ),
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              "Login",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w500,
                                color: HexColor("#FFFFFF"),
                              ),
                            )
                          ),
                        ),
                        SizedBox(height: 20.0),
                        // Sign Up Text
                        Text(
                          "Don't have an account?",
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 20.0),
                        // Sign Up Button
                        GestureDetector(
                          onTap: () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return const SignUpPage();
                            }
                            ),
                          ),
                          child: Container(
                            width: 280.0,
                            height: 48.0,
                            decoration: BoxDecoration(
                              color: navbar,
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(color: HexColor("#9E54CA")),
                            ),
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              "Sign Up",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w500,
                                color: HexColor("#9E54CA"),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                  ],)
              );
            } else{
             // Handle the case when orientation is not portrait
            return Center(
              child: Text('Landscape orientation is not supported yet.'),
            ); 
            }
          })));
  }

  
}