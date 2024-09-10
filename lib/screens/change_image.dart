import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quize/constants/assets.dart';
import 'package:quize/extension/size_adjust.dart';

class ChangeImage extends StatefulWidget {
  const ChangeImage({super.key});

  @override
  State<ChangeImage> createState() => _MyWidgetState();
}

bool? handle;
List<String> imageList = [
  Assets.lime,
  Assets.kiwi,
  Assets.banana,
  Assets.apple,
  Assets.mango,
];
int count = 0;
String image = imageList[count];

class _MyWidgetState extends State<ChangeImage> {
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
                    onPressed: () {
                      setState(() {
                        if (count > 0) {
                          count--;
                          image = imageList[count];

                          print(count);
                        } else {
                          handle = false;
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('This is First photo')));
                        }
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amberAccent),
                    child: const Text('Pre')),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (count < 4) {
                          count++;
                          image = imageList[count];
                          print(count);
                        } else {
                          handle = true;
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('This is last phot')));
                        }
                      });
                    },
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
