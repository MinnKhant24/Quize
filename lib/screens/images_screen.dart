import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quize/constants/assets.dart';
import 'package:quize/extension/size_adjust.dart';

class ImagesScreen extends StatefulWidget {
  const ImagesScreen({super.key});

  @override
  State<ImagesScreen> createState() => _MyWidgetState();
}

bool? handle;
List<String> imageList = [
  Assets.apple,
  Assets.mango,
  Assets.lime,
  Assets.kiwi,
  Assets.banana
];
int count = 0;
String image = imageList[count];

class _MyWidgetState extends State<ImagesScreen> {
  String nextImage() {
    setState(() {
      if (count < imageList.length - 1) {
        count++;
        image = imageList[count];
        handle = false;
        print(count);
      } else {
        handle = true;
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('This is last photo'),
          duration: Duration(milliseconds: 100),
        ));
      }
    });
    return image;
  }

  String preImage() {
    setState(() {
      if (count > 0) {
        count--;
        image = imageList[count];
        handle = false;
        print(count);
      } else {
        handle = true;
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('This is First photo'),
          duration: Duration(milliseconds: 100),
        ));
      }
    });
    return image;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 92, 142, 227),
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(top: 30),
              child: Image.asset(
                image,
                width: 300,
              ),
            ),
          ),
          20.paddingHeight,
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ElevatedButton(
                    onPressed:
                        (count == 0) && (handle == true) ? null : preImage,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amberAccent),
                    child: const Text('Pre')),
                ElevatedButton(
                    onPressed:
                        (count == imageList.length - 1) && (handle == true)
                            ? null
                            : nextImage,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amberAccent),
                    child: const Text('Next')),
              ],
            ),
          )
        ],
      ),
    );
  }
}
