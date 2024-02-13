import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tecapplication/view/mycategory.dart';
import 'package:tecapplication/component/myStrings.dart';
import 'package:tecapplication/component/myColors.dart';

class RigesterCustomer extends StatelessWidget {
  const RigesterCustomer({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/tecBot.svg',
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: myString.welcome, style: textTheme.headline4)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: ElevatedButton(
                onPressed: () {
                  _showEmailBottomSheet(context, size, textTheme);
                },
                child: const Text(
                  '! بزن بریم',
                  style: TextStyle(color: solidColors.statusBarIconBrightness),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }

  Future<dynamic> _showEmailBottomSheet(
      BuildContext context, Size size, TextTheme textTheme) {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            height: size.height / 2.5,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0)),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    myString.insertYourEmail,
                    style: textTheme.headline4,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
                    child: TextField(
                      style: textTheme.headline5,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          hintText: "amin.dmi1375@gmail.com",
                          hintStyle: textTheme.headline5),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      _activateCodeBottomSheet(context, size, textTheme);
                    },
                    child: Text('ادامه'),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<dynamic> _activateCodeBottomSheet(
      BuildContext context, Size size, TextTheme textTheme) {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            height: size.height / 2.5,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0)),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    myString.activateCode,
                    style: textTheme.headline4,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
                    child: TextField(
                      style: textTheme.headline5,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          hintText: "amin.dmi1375@gmail.com",
                          hintStyle: textTheme.headline5),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => category()));
                    },
                    child: Text('ادامه'),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
