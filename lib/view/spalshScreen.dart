import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tecapplication/component/my_component.dart';
import 'package:tecapplication/view/main_Screen/mainScreen.dart';
import 'package:tecapplication/component/myColors.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 0)).then((value) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => MainScreenState()));
      // Navigator.of(context)
      //     .pushReplacement(MaterialPageRoute(builder: (context) => category()));
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
