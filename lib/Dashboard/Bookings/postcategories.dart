// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PageCategories extends ConsumerStatefulWidget {
  const PageCategories({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PageCategoriesState();
}

class _PageCategoriesState extends ConsumerState<PageCategories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 50,
            width: 200,
            color: Colors.black,
            child: Center(
                child: Text(
              'All Bookings',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            )),
          ),
          Container(
            height: 50,
            width: 200,
            color: Colors.black,
            child: Center(
                child: Text(
              'Pendings',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            )),
          ),
          Container(
            height: 50,
            width: 200,
            color: Colors.black,
            child: Center(
                child: Text(
              'Confirmed',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            )),
          ),
          Container(
            height: 50,
            width: 200,
            color: Colors.black,
            child: Center(
                child: Text(
              '   Completed',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            )),
          ),
        ],
      ),
    );
  }
}
