import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quize/answers/answers.dart';
import 'package:quize/questions/questions.dart';
import 'package:quize/constants/assets.dart';
import 'package:quize/extension/size_adjust.dart';

void main() => runApp(const QuizeApp());

class QuizeApp extends StatelessWidget {
  const QuizeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: const Body(),
      ),
    );
  }
}

class Body extends StatefulWidget {
  const Body({
    super.key,
  });

  @override
  State<Body> createState() => _BodyState();
}

int? length;
late int right;
late int wrong;
Random random = Random();
late List<TextEditingController> controllerList;

List<String> imageList = [
  Assets.apple,
  Assets.banana,
  Assets.mango,
  Assets.lime,
  Assets.kiwi,
  Assets.plum,
  Assets.durian,
  Assets.pear,
  Assets.grapes,
  Assets.melon,
];
late int imageListLen;
int count = 0;
late List<String> answerLists;
late List<String> quizeLists;
void initForUI() {
  switch (imageListLen) {
    case 0:
      length = 5;
      quizeLists = Questions.quizeApple;
      answerLists = Answers.spellingForApple;
    case 1:
      length = 6;
      quizeLists = Questions.quizeBanana;
      answerLists = Answers.spellingForBanana;
    case 2:
      length = 5;
      quizeLists = Questions.quizeMango;
      answerLists = Answers.spellingForMango;
    case 3:
      length = 4;
      quizeLists = Questions.quizeLime;
      answerLists = Answers.spellingForLime;
    case 4:
      length = 4;
      quizeLists = Questions.quizeKiwi;
      answerLists = Answers.spellingForKiwi;
    case 5:
      length = 4;
      quizeLists = Questions.quizePlum;
      answerLists = Answers.spellingForPlum;
    case 6:
      length = 6;
      quizeLists = Questions.quizeDurian;
      answerLists = Answers.spellingForDurian;
    case 7:
      length = 4;
      quizeLists = Questions.quizePear;
      answerLists = Answers.spellingForPear;
    case 8:
      length = 6;
      quizeLists = Questions.quizeGrapes;
      answerLists = Answers.spellingForGrapes;
    case 9:
      length = 5;
      quizeLists = Questions.quizeMelon;
      answerLists = Answers.spellingForMelon;
  }
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    super.initState();
    int ran = random.nextInt(10);
    imageListLen = ran;
    initForUI();
    count = 0;
    right = 0;
    wrong = 0;
    controllerList = List.generate(length!, (index) => TextEditingController());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 85, 127, 200),
      child: ListView(
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Wrong - $wrong',
                    style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.amberAccent),
                  ),
                  Text(
                    'Right - $right',
                    style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.amberAccent),
                  )
                ],
              ),
              30.paddingHeight,
              SizedBox(
                height: 200,
                width: 250,
                child: Image.asset(imageList[imageListLen]),
              ),
              SizedBox(
                  width: 200,
                  height: 50,
                  child: GridView.builder(
                      padding: const EdgeInsets.all(10),
                      itemCount: length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 8, crossAxisCount: length!),
                      itemBuilder: (context, index) {
                        return SizedBox(
                            width: 5,
                            child: TextField(
                              decoration: const InputDecoration(
                                  enabled: true,
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          style: BorderStyle.solid,
                                          width: 2,
                                          color: Colors.white))),
                              style: const TextStyle(
                                  color: Colors.amberAccent,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                              controller: controllerList[index],
                            ));
                      })),
              10.paddingHeight,
              SizedBox(
                  width: 200,
                  height: 120,
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisSpacing: 5,
                              mainAxisSpacing: 5,
                              crossAxisCount: 4),
                      itemCount: 8,
                      itemBuilder: (context, index) {
                        return ElevatedButton(
                          onPressed: () {
                            setState(() {
                              // print(imageListLen);
                              if (count < answerLists.length) {
                                controllerList[count].text = quizeLists[index];
                                // print(controllerList[count].text);
                                if (controllerList[count].text ==
                                    answerLists[count]) {
                                  right++;
                                } else {
                                  wrong++;
                                }
                                ++count;
                                // print('count is $count');
                              }
                              if (count >= answerLists.length) {
                                if (imageListLen < imageList.length - 1) {
                                  imageListLen++;
                                  count = 0;
                                  controllerList = [];
                                  initForUI();
                                  controllerList = List.generate(length!,
                                      (index) => TextEditingController());
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                          content: Text(
                                    'Your total marks is $right',
                                    style: const TextStyle(
                                      fontSize: 22,
                                      //fontWeight: FontWeight.bold,
                                    ),
                                  )));
                                }
                              }
                            });
                          },
                          style: ElevatedButton.styleFrom(
                              elevation: 10,
                              backgroundColor: Colors.amberAccent,
                              padding: const EdgeInsets.all(10),
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)))),
                          child: Text(
                            quizeLists[index],
                            style: const TextStyle(fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                        );
                      })),
            ],
          ),
        ],
      ),
    );
  }
}
