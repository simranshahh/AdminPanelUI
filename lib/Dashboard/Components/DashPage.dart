// ignore_for_file: file_names, prefer_const_constructors, unused_local_variable

import 'package:adminpannel/Posts/Components/Posts.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../DashPage/Categories.dart';
import '../DashPage/Head.dart';
import '../DashPage/candidates_table.dart';
import '../DashPage/positions_table.dart';
import '../DashPage/userbarchart.dart';

class DashPage extends ConsumerStatefulWidget {
  const DashPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DashPageState();
}

class _DashPageState extends ConsumerState<DashPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 50, 50, 50),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
                // image: DecorationImage(
                //   image: AssetImage(
                //     "assets/logo.png",
                //   ),
                //   fit: BoxFit.fill,
                // ),
              ),
              child: Text('Saajha '),
            ),
            ListTile(
              title: const Text('Dashboard'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Head()));
              },
            ),
            ListTile(
              title: const Text('Posts'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Posts()));
              },
            ),
            ListTile(
              title: const Text('Notification'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Customer'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Advertisements'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Posts'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height * 0.13, child: Head()),
            SizedBox(height: height * 0.28, child: Categories()),
            Row(
              children: [
                SizedBox(
                    height: height * 0.7,
                    width: width * 0.7,
                    child: InfoTable()),
                SizedBox(
                    height: height * 0.75,
                    width: width * 0.3,
                    child: UserBarChart()),
              ],
            ),
            SizedBox(
                height: height * 0.7,
                width: width * 0.7,
                child: RecentOpenPositions()),
          ],
        ),
      ),
    );
  }
}
