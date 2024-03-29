import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tecapplication/component/myColors.dart';
import 'package:tecapplication/view/single.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: solidColors.statusBarColor,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: solidColors.statusBarIconBrightness,
      systemNavigationBarIconBrightness: Brightness.dark));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.+
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateColor.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) {
                return solidColors.primeryColor;
              }
              return solidColors.seeMore;
            }),
            textStyle: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) {
                return TextStyle(fontSize: 25);
              }
              return TextStyle(fontSize: 20);
            }),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(width: 2.0),
          ),
        ),
        useMaterial3: false,
        fontFamily: 'dana',
        textTheme: const TextTheme(
          // ignore: deprecated_member_use
          headline1: TextStyle(
            fontFamily: 'dana',
            fontSize: 16,
            color: solidColors.posterTitle,
            fontWeight: FontWeight.w700,
          ),
          // ignore: deprecated_member_use
          subtitle1: TextStyle(
            fontFamily: 'dana',
            fontSize: 14,
            color: solidColors.posterSubTitle,
            fontWeight: FontWeight.w300,
          ),
          // ignore: deprecated_member_use
          headline2: TextStyle(
            fontFamily: 'dana',
            fontSize: 12,
            color: Color.fromARGB(255, 255, 255, 255),
            fontWeight: FontWeight.w600,
          ),
          // ignore: deprecated_member_use
          headline3: TextStyle(
            fontFamily: 'dana',
            fontSize: 14,
            color: solidColors.seeMore,
            fontWeight: FontWeight.w700,
          ),
          // ignore: deprecated_member_use
          headline4: TextStyle(
            fontFamily: 'dana',
            fontSize: 16,
            color: Color.fromARGB(255, 70, 70, 70),
            fontWeight: FontWeight.w400,
          ),
          headline5: TextStyle(
            fontFamily: 'dana',
            fontSize: 16,
            color: Color.fromARGB(219, 80, 79, 79),
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      //home: splashScreen(),
      home: Single(),
    );
  }
}
