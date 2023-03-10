// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, file_names, unused_local_variable

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../constants/color_constants.dart';
import '../../responsive.dart';

class Head extends ConsumerStatefulWidget {
  const Head({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HeadState();
}

class _HeadState extends ConsumerState<Head> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Hello Simran',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.white),
                ),
                SizedBox(
                  width: width * 0.25,
                ),
                Container(
                  height: 50,
                  width: 350,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey),
                  child: TextField(
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        suffixIcon: IconButton(
                            onPressed: () {
                              // // method to show the search bar
                              showSearch(
                                  context: context,
                                  // delegate to customize the search bar
                                  delegate: CustomSearchDelegate());
                            },
                            icon: const Icon(Icons.search))),
                  ),
                ),
                Column(
                  children: [
                    // Container(
                    //   height: height * 0.05,
                    //   width: width * 0.1,
                    //   decoration: BoxDecoration(
                    //       color: Colors.grey,
                    //       borderRadius: BorderRadius.circular(10)),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //     children: [
                    //       CircleAvatar(
                    //         backgroundImage: AssetImage(
                    //           'assets/profilee.png',
                    //         ),
                    //         radius: 10,
                    //       ),
                    //       Text('Simran Sah')
                    //     ],
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 10,
                    // ),
                    Container(
                      margin: EdgeInsets.only(left: defaultPadding),
                      padding: EdgeInsets.symmetric(
                        horizontal: defaultPadding,
                        vertical: defaultPadding / 2,
                      ),
                      decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: Colors.white10),
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage("assets/profilee.png"),
                          ),
                          if (!Responsive.isMobile(context))
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: defaultPadding / 2),
                              child: Text(
                                "Simran Sah",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          Icon(Icons.keyboard_arrow_down),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  List<String> categories = [
    'Carpenter',
    'Plumber',
    'Laundary',
    'Cleaner',
  ];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.clear))
    ];
  } // for clearing the query use hunxa

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  } //used for leave and close the search bar

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchquery = [];
    for (var works in categories) {
      if (works.toLowerCase().contains(query.toLowerCase())) {
        matchquery.add(works);
      }
    }

    return ListView.builder(
        itemCount: matchquery.length,
        itemBuilder: (context, index) {
          var result = matchquery[index];
          return ListTile(
            title: Text(result),
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchquery = [];
    for (var works in categories) {
      if (works.toLowerCase().contains(query.toLowerCase())) {
        matchquery.add(works);
      }
    }

    return ListView.builder(
        itemCount: matchquery.length,
        itemBuilder: (context, index) {
          var result = matchquery[index];
          return ListTile(
            title: Text(result),
          );
        });
  }
}
