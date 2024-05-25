import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tecapplication/component/api_constant.dart';
import 'package:tecapplication/component/storage_const.dart';
import 'package:tecapplication/services/dio_services.dart';
import 'package:tecapplication/view/main_Screen/mainScreen.dart';
import 'package:tecapplication/view/register/registerIntro.dart';

class RegisterController extends GetxController {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController activeTextEditingController = TextEditingController();
  var email = '';
  var userId = '';

  register() async {
    Map<String, dynamic> map = {
      'email': emailTextEditingController.text,
      'command': "register"
    };

    var response =
        await DioServices().postMethode(map, ApiConsttant.postRegister);
    email = emailTextEditingController.text;
    userId = response.data['user_id'];
  }

  verify() async {
    Map<String, dynamic> map = {
      'email': email,
      'user_id': userId,
      'code': activeTextEditingController.text,
      'command': "verify"
    };

    var response =
        await DioServices().postMethode(map, ApiConsttant.postRegister);

    log(response.data.toString());
    var status_response = response.data['response'].toString();
    switch (status_response) {
      case "verified":
        var box = GetStorage();
        box.write(token, response.data["token"]);
        box.write(token, response.data["user_id"]);

        Get.offAll(MainScreenState());
        break;
      case "incorrect_code":
        Get.snackbar("خطا", "کدفعالسازی اشتباه است");
        break;
      case "expired":
        Get.snackbar("خطا", "کدفعالسازی منقضی شده است");
        break;
    }
  }

  toggleLogin() {
    if (GetStorage().read(token) == null) {
      Get.to(RegisterIntro());
    } else {
      log("post screen");
    }
  }
}
