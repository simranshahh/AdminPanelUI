// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'AddAdvertismentpage.dart';
import 'TableAdvertisementPage.dart';

class AdvertisementPage extends ConsumerStatefulWidget {
  const AdvertisementPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AdvertisementPageState();
}

class _AdvertisementPageState extends ConsumerState<AdvertisementPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('Advertisements Page'),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 18.0, left: 18),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'All Advertisements Details',
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
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  AddAdvertisementPage()));
                    },
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
                SizedBox(height: height * 1.4, child: AdvertisementPageTable()),
              ],
            ),
          ),
        ));
  }
}
