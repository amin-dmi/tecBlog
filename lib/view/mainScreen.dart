import 'package:flutter/material.dart';
import 'package:tecapplication/models/fake_data.dart';
import 'package:tecapplication/view/proFileScreen.dart';
import 'package:tecapplication/component/myColors.dart';

import 'homeScreen.dart';

class mainScreen extends StatefulWidget {
  const mainScreen({super.key});

  @override
  State<mainScreen> createState() => _mainScreenState();
}

final GlobalKey<ScaffoldState> _key = GlobalKey();

class _mainScreenState extends State<mainScreen> {
  var selectedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    double bodyMargin = size.width / 20;

    return Scaffold(
      key: _key,
      drawer: Drawer(
        backgroundColor: solidColors.scafoldBg,
        child: Padding(
          padding: EdgeInsets.only(left: bodyMargin, right: bodyMargin),
          child: ListView(
            children: [
              DrawerHeader(
                child: Center(
                  child: Image.asset(
                    'assets/images/logo.png',
                    scale: 3,
                  ),
                ),
              ),
              const Divider(
                color: solidColors.dividerColor,
              ),
              ListTile(
                title: Text(
                  'پروفایل کاربری ',
                  style: textTheme.headline4,
                ),
                onTap: () {},
              ),
              const Divider(
                color: solidColors.dividerColor,
              ),
              ListTile(
                title: Text(
                  'پروفایل کاربری ',
                  style: textTheme.headline4,
                ),
                onTap: () {},
              ),
              const Divider(
                color: solidColors.dividerColor,
              ),
              ListTile(
                title: Text(
                  'پروفایل کاربری ',
                  style: textTheme.headline4,
                ),
                onTap: () {},
              ),
              const Divider(
                color: solidColors.dividerColor,
              ),
              ListTile(
                title: Text(
                  'پروفایل کاربری ',
                  style: textTheme.headline4,
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: solidColors.scafoldBg,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              child: Icon(
                Icons.menu,
                color: Colors.black,
              ),
              onTap: () {
                _key.currentState!.openDrawer();
              },
            ),
            Image.asset(
              'assets/images/logo.png',
              height: size.height / 13.6,
            ),
            const Icon(
              Icons.search,
              color: Colors.black,
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
          child: Stack(
            children: [
              Positioned.fill(
                child: IndexedStack(
                  index: selectedPageIndex,
                  children: [
                    homeScreen(
                        size: size,
                        textTheme: textTheme,
                        bodyMargin: bodyMargin),
                    profileScreen(
                        size: size,
                        textTheme: textTheme,
                        bodyMargin: bodyMargin)
                  ],
                ),
              ),
              bottomNavigation(
                size: size,
                bodyMargin: bodyMargin,
                changeScreen: (int value) {
                  setState(() {
                    selectedPageIndex = value;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class bottomNavigation extends StatelessWidget {
  const bottomNavigation(
      {super.key,
      required this.size,
      required this.bodyMargin,
      required this.changeScreen});

  final Size size;
  final double bodyMargin;
  final Function(int) changeScreen;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: size.width / 25,
      right: 0,
      left: 0,
      child: Container(
        height: size.height / 14,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: gradiantColors.bottomNavBackGroung,
              end: Alignment.topCenter,
              begin: Alignment.bottomCenter),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: bodyMargin, right: bodyMargin),
          child: Container(
            height: size.height / 8.0,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(18)),
                gradient: LinearGradient(
                  colors: gradiantColors.bottomNav,
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () => changeScreen(0),
                  icon: const Icon(Icons.home_filled, color: Colors.white),
                ),
                IconButton(
                  onPressed: () => changeScreen(1),
                  color: Colors.white,
                  icon: const Icon(Icons.edit),
                ),
                IconButton(
                  onPressed: () {},
                  color: Colors.white,
                  icon: const Icon(Icons.person),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
