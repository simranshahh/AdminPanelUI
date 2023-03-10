// ignore_for_file: prefer_const_constructors, file_names, prefer_const_literals_to_create_immutables

import 'package:adminpannel/Dashboard/Components/DashPage.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../Items/head.dart';

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
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => DashPage()));
              },
            ),
            backgroundColor: Colors.deepPurpleAccent,
            title: Text('Posts'),
          ),
          backgroundColor: Color.fromARGB(255, 224, 224, 224),
          body: Column(
            children: [
              Text(
                'Posts',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              SizedBox(height: height * 0.2, child: PostsHead()),
            ],
          )),
    );
  }
}
