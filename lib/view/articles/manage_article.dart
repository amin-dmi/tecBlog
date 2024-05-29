import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tecapplication/component/my_component.dart';
import 'package:tecapplication/controller/register_Controller.dart';
import 'package:tecapplication/component/myStrings.dart';
import 'package:tecapplication/component/myColors.dart';

class ManageArticle extends StatelessWidget {
  ManageArticle({super.key});
  var registerController = Get.find<RegisterController>();

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: appBar("مدیریت مقاله ها"),
        body: articleEmptyState(textTheme),
      ),
    );
  }

  Widget articleEmptyState(TextTheme textTheme) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/images/tecBotEmpty.svg',
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: myString.articleEmpty, style: textTheme.headline4)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: ElevatedButton(
              onPressed: () {},
              child: const Text(
                'بریم برای نوشتن یک مقاله باحال!',
                style: TextStyle(color: solidColors.statusBarIconBrightness),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
