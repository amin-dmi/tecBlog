import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tecapplication/models/fake_data.dart';
import 'package:tecapplication/component/myColors.dart';
import 'package:tecapplication/component/myStrings.dart';

import '../component/my_component.dart';

class category extends StatefulWidget {
  const category({super.key});

  @override
  State<category> createState() => _categoryState();
}

class _categoryState extends State<category> {
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    var bodyMargin = size.width / 10.0;
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: bodyMargin, right: bodyMargin),
            child: Column(
              children: [
                SizedBox(
                  height: 32,
                ),
                SvgPicture.asset(
                  'assets/images/tecBot.svg',
                  height: 100,
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  myString.successfulRegister,
                  style: textTheme.headline4,
                ),
                TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintStyle: textTheme.headline4,
                    hintText: 'نام و نام خانوادگی',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  myString.PleaseSelectFavYoutTag,
                  style: textTheme.headline4,
                ),
                //TagList

                Padding(
                  padding: const EdgeInsets.only(top: 32),
                  child: SizedBox(
                    width: double.infinity,
                    height: 85,
                    child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: ClampingScrollPhysics(),
                      itemCount: tagList.length,
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.3,
                          mainAxisSpacing: 5,
                          crossAxisSpacing: 8),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              if (!selectedTags.contains(tagList[index]))
                                selectedTags.add(tagList[index]);
                            });
                          },
                          child: mainTags(index: index, textTheme: textTheme),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Image.asset(
                  'assets/images/arrowDown.png',
                  scale: 5,
                ),
                //SelectedTags
                Padding(
                  padding: const EdgeInsets.only(top: 32),
                  child: SizedBox(
                    width: double.infinity,
                    height: 85,
                    child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: ClampingScrollPhysics(),
                      itemCount: selectedTags.length,
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.3,
                          mainAxisSpacing: 5,
                          crossAxisSpacing: 8),
                      itemBuilder: (context, index) {
                        return Container(
                          height: 60.0,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(24)),
                            color: solidColors.surfaceColor,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  selectedTags[index].title,
                                  style: textTheme.headline4,
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedTags.removeAt(index);
                                    });
                                  },
                                  child: const Icon(
                                    CupertinoIcons.delete,
                                    color: Colors.black,
                                    size: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
