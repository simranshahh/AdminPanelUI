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
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: height * 0.06,
            width: width * 0.12,
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
            height: height * 0.06,
            width: width * 0.12,
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
            height: height * 0.06,
            width: width * 0.12,
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
            height: height * 0.06,
            width: width * 0.12,
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
