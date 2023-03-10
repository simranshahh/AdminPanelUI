// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PostsHead extends ConsumerStatefulWidget {
  const PostsHead({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PostsHeadState();
}

class _PostsHeadState extends ConsumerState<PostsHead> {
  List<HeadPostsModel> items = [
    HeadPostsModel(image: "assets/profilee.png", text: 'Images'),
    HeadPostsModel(image: "assets/profilee.png", text: 'Documents'),
    HeadPostsModel(image: "assets/profilee.png", text: 'Video'),
    HeadPostsModel(image: "assets/profilee.png", text: 'PDF Files'),
    HeadPostsModel(image: "assets/profilee.png", text: 'Audios'),
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
              gradient: LinearGradient(
                begin: Alignment.centerRight,
                end: Alignment.center,
                colors: [
                  Color.fromARGB(255, 157, 102, 253),
                  Color.fromARGB(255, 195, 161, 255)
                ],
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {}, icon: Icon(Icons.more_vert_outlined)),
                  CircleAvatar(
                    backgroundImage: AssetImage(
                      items[index].image,
                    ),
                    radius: 30,
                  ),
                  Text(
                    items[index].text,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
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
