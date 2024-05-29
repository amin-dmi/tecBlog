import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tecapplication/component/my_component.dart';
import 'package:tecapplication/main.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 0)).then((value) {
      Get.offAndToNamed(NamedRoute.routeMainScreen);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(height: 70, child: Image.asset('assets/images/logo.png')),
            SizedBox(
              height: 40,
            ),
            loading()
          ],
        ),
      ),
    );
  }
}
