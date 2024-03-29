import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tecapplication/component/myColors.dart';
import 'package:tecapplication/component/my_component.dart';

class Single extends StatefulWidget {
  const Single({super.key});

  @override
  State<Single> createState() => _SingleState();
}

class _SingleState extends State<Single> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;

    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              CachedNetworkImage(
                imageUrl: "",
                imageBuilder: (context, imageProvider) {
                  return Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.cover),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(16))),
                  );
                },
                placeholder: (context, url) {
                  return const loading();
                },
                errorWidget: (context, url, error) {
                  return Image.asset('assets/images/single_place_holder.jpg');
                },
              ),
              Positioned(
                  top: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Icon(
                          Icons.share,
                          color: Colors.white,
                          size: 24,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.bookmark,
                          color: Colors.white,
                          size: 24,
                        ),
                        Expanded(child: SizedBox()),
                        Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 24,
                        ),
                      ],
                    ),
                    height: 60,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            end: Alignment.bottomCenter,
                            begin: Alignment.topCenter,
                            colors: gradiantColors.singelAppBarGradiant)),
                  )),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Call of Duty: Mobile بیش از ۶۵۰ میلیون بار دانلود شده است',
              maxLines: 2,
              style: textTheme.titleLarge,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Image.asset(
                  'assets/images/avatar.png',
                  height: 50,
                ),
                SizedBox(
                  width: 16,
                ),
                Text(
                  "فاطمه امیری",
                  style: textTheme.headline4,
                ),
                Text(
                  "فاطمه امیری",
                  style: textTheme.caption,
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
