// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use

import 'package:adminpannel/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class Categories extends ConsumerStatefulWidget {
  const Categories({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CategoriesState();
}

class _CategoriesState extends ConsumerState<Categories> {
  List<CategoriesModel> items = [
    CategoriesModel(
        duration: 'Daily',
        icon1: Icons.emoji_people,
        icon2: Icons.more_vert,
        maintext: 'Employees',
        number: '255',
        value: LinearPercentIndicator(
          width: 200.0,
          lineHeight: 10.0,
          percent: 0.5,
          linearStrokeCap: LinearStrokeCap.roundAll,
          backgroundColor: Colors.grey,
          progressColor: Colors.green,
        )),
    CategoriesModel(
        duration: 'Weekly',
        icon1: Icons.emoji_people,
        icon2: Icons.more_vert,
        maintext: 'Customer',
        number: '255',
        value: LinearPercentIndicator(
          width: 200.0,
          lineHeight: 10.0,
          percent: 0.5,
          linearStrokeCap: LinearStrokeCap.roundAll,
          backgroundColor: Colors.grey,
          progressColor: Colors.amber,
        )),
    CategoriesModel(
        duration: 'Monthly',
        icon1: Icons.emoji_people,
        icon2: Icons.more_vert,
        maintext: 'Customer',
        number: '255',
        value: LinearPercentIndicator(
          width: 200.0,
          lineHeight: 10.0,
          percent: 0.5,
          linearStrokeCap: LinearStrokeCap.roundAll,
          backgroundColor: Colors.grey,
          progressColor: Colors.red,
        )),
  ];
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: secondaryColor,
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        height: height * 0.3,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: height * 0.25,
              width: width * 0.27,
              decoration: BoxDecoration(
                  color: secondaryColor,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Icon(
                          items[index].icon1,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: width * 0.15,
                        ),
                        Text(
                          items[index].duration,
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        IconButton(
                          icon: Icon(items[index].icon2),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  // alignment: Alignment.topCenter,
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      // DropdownButton(items: , onChanged: onChanged)
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          color: Colors.white,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      items[index].maintext,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    LinearPercentIndicator(
                      width: 200.0,
                      lineHeight: 10.0,
                      percent: 0.5,
                      // center: Text(
                      //   "50.0%",
                      //   style: TextStyle(fontSize: 12.0),
                      // ),
                      // trailing: Icon(Icons.mood),
                      linearStrokeCap: LinearStrokeCap.roundAll,
                      backgroundColor: Colors.grey,
                      progressColor: Colors.green,
                    ),
                    Text(
                      items[index].number,
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CategoriesModel {
  String maintext;
  String number;
  String duration;
  IconData icon1;
  IconData icon2;
  LinearPercentIndicator value;

  CategoriesModel(
      {required this.duration,
      required this.icon1,
      required this.icon2,
      required this.maintext,
      required this.number,
      required this.value});
}
