// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PAN extends ConsumerStatefulWidget {
  const PAN({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PANState();
}

class _PANState extends ConsumerState<PAN> {
  List<HeadPostsModel> items = [
    HeadPostsModel(image: "assets/pan.png", text: 'Carpenter'),
    HeadPostsModel(image: "assets/pan.png", text: 'Laundary'),
    HeadPostsModel(image: "assets/pan.png", text: 'Plumber'),
    HeadPostsModel(image: "assets/pan.png", text: 'Electrician'),
    HeadPostsModel(image: "assets/pan.png", text: 'Painter'),
  ];
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: ListView.builder(
        itemCount: items.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Card(
          child: Container(
            height: height * 0.25,
            width: width * 0.2,
            decoration: BoxDecoration(
              color: Colors.white,
              // gradient: LinearGradient(
              //   begin: Alignment.centerRight,
              //   end: Alignment.center,
              //   colors: [
              //     Color.fromARGB(255, 208, 207, 212),
              //     Color.fromARGB(255, 142, 141, 145)
              //   ],
              // ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 208.0),
                    child: IconButton(
                        onPressed: () {}, icon: Icon(Icons.more_vert_outlined)),
                  ),
                  CircleAvatar(
                    backgroundImage: AssetImage(
                      items[index].image,
                    ),
                    radius: 30,
                  ),
                  Text(
                    items[index].text,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HeadPostsModel {
  String text;
  String image;

  HeadPostsModel({required this.image, required this.text});
}
