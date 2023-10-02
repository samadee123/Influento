import 'package:assignment/features/authentication/screens/Home_Screen.dart';
import 'package:assignment/repository/authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();

  void loginUser(String email, String password) async {
    try {
      await AuthenticationRepository.instance.loginWithEmailAndPassword(email, password);
      Get.offAll(() => const HomePage());
    } catch (error) {
      Get.snackbar('Login Error', error.toString());
    }
  }
}
