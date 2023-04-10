// ignore_for_file: prefer_const_constructors, duplicate_ignore, unused_import

import 'package:adminpannel/Dashboard/Components/DashPage.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'Dashboard/Bookings/Components/tables.dart';
import 'Dashboard/Bookings/postcategories.dart';
import 'Login/Loginpage.dart';
import 'Posts/Components/Posts.dart';
import 'Posts/Items/AddTable.dart';
import 'Posts/Items/Advertisement.dart';
import 'Posts/Items/head.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors

    // ignore: prefer_const_constructors
    return MaterialApp(debugShowCheckedModeBanner: false, home: LoginPage());
  }
}
