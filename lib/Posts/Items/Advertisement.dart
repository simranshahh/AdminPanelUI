// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Advertisement extends ConsumerStatefulWidget {
  const Advertisement({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AdvertisementState();
}

class _AdvertisementState extends ConsumerState<Advertisement> {
  bool light = true;

  final MaterialStateProperty<Icon?> thumbIcon =
      MaterialStateProperty.resolveWith<Icon?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return const Icon(Icons.check);
      }
      return const Icon(Icons.close);
    },
  );

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: height * 0.15,
        width: width,
        color: Color.fromARGB(255, 230, 230, 230),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(18.0, 18, 0, 0),
              child: Container(
                height: height * 0.1,
                width: width * 0.1,
                color: Colors.amber,
                child: Image.asset(
                  'assets/advertisement.jpg',
                  fit: BoxFit.fill,
                  height: 50,
                  width: 50,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(18.0, 25, 0, 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Bonus Offer',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                        fontSize: 25),
                  ),
                  Text('This is the dummy data to be found over the network')
                ],
              ),
            ),
            SizedBox(
              width: 100,
            ),
            Text('Private'),
            Switch(
              value: light,
              onChanged: (bool value) {
                setState(() {
                  light = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
