import 'package:assignment/features/authentication/models/user_model.dart';
import 'package:assignment/features/authentication/screens/Home_Screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:assignment/features/authentication/controllers/Signup_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hexcolor/hexcolor.dart';
import 'login_page.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
      Color navbar = Theme.of(context).brightness == Brightness.dark ? HexColor("#333333") : Colors.white;
      Color TextColor = Theme.of(context).brightness == Brightness.dark ? Colors.white : HexColor("#565555");
      Color SubTextColor = Theme.of(context).brightness == Brightness.dark ? Colors.white : HexColor("#848484");
      final controller = Get.put(SignUpController());
      final _formKey = GlobalKey<FormState>();
      return Form(
        key: _formKey,
        child: Scaffold(
          body: SingleChildScrollView (
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top:70.0),
                  child: Text('Sign Up',style: TextStyle(fontSize: 40.0,fontWeight: FontWeight.bold,color:TextColor)),
                ),
                SizedBox(height: 30.0,),
                Center(
                  child: Column(
                    children: [
                      Container(
                        width: 280.0,
                        height: 48.0,
                        decoration: BoxDecoration(
                          color: navbar,
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(color:HexColor("#848484")),
                        ),
                        child: TextFormField(
                          controller: controller.name,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(left:10.0,top:-5.0),
                            hintText:'Name',
                            hintStyle: TextStyle(
                            fontSize: 15.0,
                            color:SubTextColor,
                          ),
                          ),
                          validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                          },
                        ),
                      ),
                      SizedBox(height: 20.0,),
                      Container(
                        width: 280.0,
                        height: 48.0,
                        decoration: BoxDecoration(
                          color: navbar,
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(color:HexColor("#848484")),
                        ),
                        child:TextFormField(
                          controller: controller.email,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(left:10.0,top:-6.0),
                            hintText:'Email',
                            hintStyle: TextStyle(
                              fontSize: 15.0,
                              color: SubTextColor,
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
                      SizedBox(height: 20.0,),
                      Container(
                        width: 280.0,
                        height: 48.0,
                        decoration: BoxDecoration(
                          color:navbar ,
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(color:HexColor("#848484")),
                        ),
                        child: TextFormField(
                          controller: controller.password,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(left:10.0,top:-6.0),
                            hintText:'Password',
                            hintStyle: TextStyle(
                              fontSize: 15.0,
                              color:SubTextColor,
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
                      SizedBox(height: 20.0,),
                      Container(
                        width: 280.0,
                        height: 48.0,
                        decoration: BoxDecoration(
                          color:navbar ,
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(color: HexColor("#848484")),
                      ),
                      child: TextFormField(
                        controller: controller.confirmpassword,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(left: 10.0, top: -6.0),
                          hintText: 'Confirm Password',
                          hintStyle: TextStyle(
                            fontSize: 15.0,
                            color: SubTextColor,
                          ),
                        ),
                        obscureText: true,  
                      ),
                      ),
                      SizedBox(height: 20.0,),
                      Container(
                      width: 280.0,
                      height: 48.0,
                      decoration: BoxDecoration(
                        color:navbar ,
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(color:HexColor("#848484")),
                      ),
                      child:TextFormField(
                        controller: controller.contactNo,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(left:10.0,top:-6.0),
                          hintText:'Contact Number',
                          hintStyle: TextStyle(
                            fontSize: 15.0,
                            color:SubTextColor,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the contact number address';
                          }
                          if (value.length != 10) {
                            return 'Phone number should have exactly 10 digits';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 20.0,),
                    Container(
                      width: 280.0,
                      height: 48.0,
                      decoration: BoxDecoration(
                        color:navbar ,
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(color:HexColor("#848484")),
                      ),
                      child:TextFormField(
                        controller: controller.address,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(left:10.0,top:-6.0),
                          hintText:'Address',
                          hintStyle: TextStyle(
                            fontSize: 15.0,
                            color:SubTextColor,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter an address';
                          }
                          return null;
                        },        
                      ),
                    ),
                    SizedBox(height: 20.0),
                        Container(
                      width: 280.0,
                      height: 48.0,
                      decoration: BoxDecoration(
                        color:navbar ,
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(color:HexColor("#848484")),
                      ),
                      child:TextFormField(
                        controller: controller.dob,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(left:10.0,top:-6.0),
                          hintText:'Date of Birth',
                          hintStyle: TextStyle(
                            fontSize: 15.0,
                            color:SubTextColor,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter you birthday ';
                          }
                          return null;
                        },            
                      ),
                    ),
                    SizedBox(height: 20.0,),
                    GestureDetector(
                      onTap: () {
                        if(_formKey.currentState!.validate()){
                          // SignUpController.instance.registerUser(controller.email.text.trim(), controller.password.text.trim());

                          final User = UserModel(
                            email: controller.email.text.trim(),
                            password: controller.password.text.trim(),
                            name: controller.name.text.trim(),
                            contactNo: controller.contactNo.text.trim(),
                            address: controller.address.text.trim(),
                            dob: controller.dob.text.trim(),
                          );
                          SignUpController.instance.creatUser(User);

                          Get.to(() => const HomePage());
                        }
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
                          "Sign Up",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.w500,color:HexColor("#FFFFFF"))        
                        ),  
                      ),
                    ),
                    SizedBox(height: 20.0,),
                    Text("Have an account?",style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.w500,)),
                    SizedBox(height: 20.0,),
                    GestureDetector(
                      onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context){
                          return const  LoginPage();
                        },
                      ),
                    ),
                    child: Container(
                      width: 280.0,
                      height: 48.0,
                      decoration: BoxDecoration(
                        color:navbar ,
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(color:HexColor("#9E54CA")),
                      ),
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                          "Login",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.w500,color:HexColor("#9E54CA"))        
                        ),
                      ),
                    ),
                    ]),
                )
              ]),
          )
        ),
      );
  }
}