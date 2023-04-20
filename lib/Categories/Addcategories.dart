// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, avoid_print, file_names

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toggle_switch/toggle_switch.dart';

class AddCategories extends ConsumerStatefulWidget {
  const AddCategories({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddCategoriesState();
}

class _AddCategoriesState extends ConsumerState<AddCategories> {
  ImagePicker picker = ImagePicker();
  XFile? image;

  String imageUrl = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Text('Add Main Categories'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Add Main Categories',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Row(
              children: [
                Text(
                  'Category Type ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(
                  width: 40,
                ),
                Container(
                  height: 40,
                  width: 200,
                  decoration: BoxDecoration(
                      // borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      border: Border.all(color: Colors.grey)),
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)),
                        labelText: 'Category Type'),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'City ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(
                  width: 120,
                ),
                Container(
                  height: 40,
                  width: 200,
                  decoration: BoxDecoration(
                      // borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      border: Border.all(color: Colors.grey)),
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)),
                        labelText: 'City'),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'Image ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(
                  width: 40,
                ),
                Container(
                    alignment: Alignment.topCenter,
                    child: Column(
                      children: [
                        ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                              Colors.black,
                            )),
                            onPressed: () async {
                              // String uniqueFilename = DateTime.now()
                              //     .millisecondsSinceEpoch
                              //     .toString();
                              // Reference referenceRoot =
                              //     FirebaseStorage.instance.ref();
                              // Reference referenceDirImages =
                              //     referenceRoot.child('images');

                              // Reference referenceImageToUpload =
                              //     referenceDirImages.child(uniqueFilename);
                              // try {
                              //   await referenceImageToUpload
                              //       .putFile(File(image!.path));

                              //   imageUrl = await referenceImageToUpload
                              //       .getDownloadURL();
                              // } catch (error) {}

                              // image = await picker.pickImage(
                              //     source: ImageSource.gallery);
                              // setState(() {
                              //   //update UI
                              // });
                            },
                            child: Text("Pick Image")),
                        image == null
                            ? Container()
                            : Image.file(File(image!.path)),
                        Padding(
                          padding: const EdgeInsets.only(left: 18.0, top: 18),
                          child: Container(
                            height: 200,
                            width: 300,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.grey)),
                          ),
                        )
                      ],
                    )),
              ],
            ),
            Row(
              children: [
                Text(
                  'Status',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(
                  width: 60,
                ),
                ToggleSwitch(
                  minWidth: 90.0,
                  cornerRadius: 20.0,
                  activeBgColors: [
                    [Colors.green[800]!],
                    [Colors.red[800]!]
                  ],
                  activeFgColor: Colors.white,
                  inactiveBgColor: Colors.grey,
                  inactiveFgColor: Colors.white,
                  initialLabelIndex: 1,
                  totalSwitches: 2,
                  labels: ['True', 'False'],
                  radiusStyle: true,
                  onToggle: (index) {
                    print('switched to: $index');
                  },
                ),
              ],
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Add Category'),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.deepPurpleAccent)),
                ),
                SizedBox(
                  width: 40,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Cancel'),
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.black)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
