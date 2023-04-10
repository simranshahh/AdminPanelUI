// ignore_for_file: prefer_const_constructors, file_names, prefer_const_literals_to_create_immutables, unused_local_variable

import 'package:adminpannel/Dashboard/Components/DashPage.dart';
import 'package:adminpannel/Posts/Items/head.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../Items/PAN.dart';

class Posts extends ConsumerStatefulWidget {
  const Posts({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PostsState();
}

class _PostsState extends ConsumerState<Posts> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
          Container(
            height: height * 0.2,
            width: width,
            color: Colors.deepPurple,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => DashPage()));
                    },
                  ),
                  Text(
                    'Posts',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 25),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(18.0, 85, 18, 0),
            child: Column(
              children: [
                SizedBox(
                    height: height * 0.2, width: width, child: PostsHead()),
                Text(
                  'PAN Documents',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: height * 0.2, width: width, child: PAN()),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
