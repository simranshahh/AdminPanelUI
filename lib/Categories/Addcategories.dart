// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'categoriestable.dart';

class AllCategories extends ConsumerStatefulWidget {
  const AllCategories({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AllCategoriesState();
}

class _AllCategoriesState extends ConsumerState<AllCategories> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurpleAccent,
          title: Text('AllCategories'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'All Categories Information',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 40,
                width: 130,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.deepOrange)),
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      Text('Add New'),
                    ],
                  ),
                ),
              ),
              SizedBox(height: height * 0.9, child: AllCategoriesTable()),
            ],
          ),
        ));
  }
}
