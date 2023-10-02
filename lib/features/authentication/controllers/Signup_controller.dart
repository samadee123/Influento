import 'package:assignment/features/authentication/models/user_model.dart';
import 'package:assignment/repository/user_repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:assignment/repository/authentication_repository/authentication_repository.dart';
import 'package:get/get.dart';


class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();
  final confirmpassword = TextEditingController();
  final name = TextEditingController();
  final contactNo = TextEditingController();
  final address = TextEditingController();
  final dob = TextEditingController();

  final userRepo = Get.put(UserRepository());

  void registerUser(String email, String password) {
    String? error = AuthenticationRepository.instance.createUserWithEmailAndPassword(email, password) as String?;
    if (error != null) {
      Get.showSnackbar(GetSnackBar(message: error.toString()));
    }
  }

  Future<void> creatUser(UserModel user) async {
    await userRepo.creatUser(user);
    }
} 