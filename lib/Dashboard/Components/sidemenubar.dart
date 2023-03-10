// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_element, duplicate_ignore

import 'package:adminpannel/Dashboard/Components/DashPage.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SidemenuBar extends ConsumerStatefulWidget {
  const SidemenuBar({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SidemenuBarState();
}

class _SidemenuBarState extends ConsumerState<SidemenuBar> {
  int _currentIndex = 0;

  final screens = [
    DashPage(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_currentIndex],
      drawer: Drawer(
          child: ListView(
        // ignore: prefer_const_constructors
        children: [DrawerHeader(child: Text('SAAJHA')), ListTile()],
      )),
    );
  }
}
