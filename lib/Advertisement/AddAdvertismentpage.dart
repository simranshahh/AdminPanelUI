// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_local_variable

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddAdvertisementPage extends ConsumerStatefulWidget {
  const AddAdvertisementPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddAdvertisementPageState();
}

class _AddAdvertisementPageState extends ConsumerState<AddAdvertisementPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Text('Add Advertisements'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 18.0, top: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Add Advertisemnets',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Hero Image',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('Add Image'),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.deepPurpleAccent)),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: height * 0.2,
                width: width * 0.5,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey)),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Advertisements',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('Add Image'),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.deepPurpleAccent)),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: height * 0.2,
                width: width * 0.5,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey)),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Offers & Discounts',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('Add Image'),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.deepPurpleAccent)),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: height * 0.2,
                width: width * 0.5,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey)),
              ),
              SizedBox(height: 40),
              Center(
                  child: ElevatedButton(
                onPressed: () {},
                child: Text('Update Images'),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.deepPurpleAccent)),
              )),
              SizedBox(height: 40)
            ],
          ),
        ),
      ),
    );
  }
}
