// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:adminpannel/Dashboard/Bookings/Components/tables.dart';
import 'package:adminpannel/Dashboard/Bookings/postcategories.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BookingPage extends ConsumerStatefulWidget {
  const BookingPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BookingPageState();
}

class _BookingPageState extends ConsumerState<BookingPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('All Bookings'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Column(
            children: [
              SizedBox(height: height * 0.1, child: PageCategories()),
              SizedBox(height: height * 1.0, child: AllBookingsTable()),
            ],
          ),
        ),
      ),
    );
  }
}
