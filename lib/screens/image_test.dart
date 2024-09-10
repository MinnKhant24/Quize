import 'package:flutter/material.dart';
import 'package:quize/constants/assets.dart';

class MyImage extends StatefulWidget {
  const MyImage({super.key});

  @override
  State<MyImage> createState() => _MyImageState();
}

class _MyImageState extends State<MyImage> {
  List<String> fruit = [Assets.banana, Assets.mango, Assets.apple, Assets.kiwi];
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      padding: EdgeInsets.only(top: 30),
      child: Column(
        children: [
          Container(
            height: 250,
            width: 250,
            child: Image.asset(fruit[count]),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  if (count > 0) {
                    count--;
                    setState(() {});
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('This is first photo')));
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow,
                ),
                child: const Text(
                  'pre',
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (count < fruit.length - 1) {
                    count++;
                    print(count);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('This is last photo')));
                  }
                  setState(() {});
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow,
                ),
                child: const Text('Next'),
              )
            ],
          ),
        ],
      ),
    );
  }
}
