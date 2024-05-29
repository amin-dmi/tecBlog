import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tecapplication/component/api_constant.dart';
import 'package:tecapplication/component/storage_const.dart';
import 'package:tecapplication/main.dart';
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
        Get.to(MainScreenState());
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
      routeToWriteBottomSheet();
    }
  }

  routeToWriteBottomSheet() {
    Get.bottomSheet(
      Container(
        height: Get.height / 3,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  SvgPicture.asset('assets/images/tecBot.svg', height: 40),
                  const SizedBox(width: 8),
                  const Text("دانسته هات رو با بقیه به اشتراک بذار ...")
                ],
              ),
              const SizedBox(
                height: 8.0,
              ),
              const Text(
                """فکر کن !!  اینجا بودنت به این معناست که یک گیک تکنولوژی هستی دونسته هات رو با  جامعه‌ی گیک های فارسی زبان به اشتراک بذار""",
              ),
              const SizedBox(
                height: 15.0,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(NamedRoute.manageArticle);
                  },
                  child: Container(
                    child: Row(
                      children: [
                        Image.asset('assets/images/writeArticel.png',
                            height: 32),
                        const SizedBox(width: 8),
                        const Text("مدیریت مقاله")
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    log("مدیریت پادکست");
                  },
                  child: Container(
                    child: Row(
                      children: [
                        Image.asset('assets/images/writePodcast.png',
                            height: 32),
                        const SizedBox(width: 8),
                        const Text("مدیریت پادکست")
                      ],
                    ),
                  ),
                )
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
