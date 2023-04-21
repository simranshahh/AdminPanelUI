// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

import '../Advertisement/AdvertisementPage.dart';
import '../Categories/AllCategories.dart';
import '../Dashboard/Bookings/Bookings.dart';
import '../Dashboard/Components/DashPage.dart';
import '../Providers/ProviderPage.dart';

class CustomNavigation<T> extends StatefulWidget {
  CustomNavigation({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomNavigation<T>> createState() => _CustomNavigationState<T>();
}

class _CustomNavigationState<T> extends State<CustomNavigation<T>> {
  final List<Widget> _pages = [
    const DashPage(),
    const AllCategories(),
    const BookingPage(),
    const AdvertisementPage(),
    const ProviderPage()
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('SAAJHA Dashboard'),
          backgroundColor: Colors.deepPurpleAccent),
      body: Row(
        children: [
          CustomNavigationRail(
            spacerIndex: 5,
            destinations: const [
              DestinationItem(
                icon: Icons.house,
                label: 'Dashpage',
              ),
              DestinationItem(
                icon: Icons.star_border,
                label: 'Categories',
              ),
              DestinationItem(
                icon: Icons.account_circle_outlined,
                label: 'Bookings',
              ),
              DestinationItem(
                icon: Icons.star_border,
                label: 'Advertisement',
              ),
              DestinationItem(
                icon: Icons.man,
                label: 'Providers',
              ),
            ],
            selectedIndex: _selectedIndex,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
          Expanded(
            child: _pages[_selectedIndex],
          ),
        ],
      ),
    );
  }
}

class DestinationItem {
  final IconData icon;
  final String label;

  const DestinationItem({
    Key? key,
    required this.icon,
    required this.label,
  });
}

class CustomNavigationRail extends StatefulWidget {
  final double? elevation;
  final List<DestinationItem> destinations;
  final int selectedIndex;
  final int? spacerIndex;
  final ValueChanged<int> onDestinationSelected;

  const CustomNavigationRail({
    Key? key,
    this.elevation,
    this.spacerIndex,
    required this.destinations,
    required this.selectedIndex,
    required this.onDestinationSelected,
  }) : super(key: key);

  @override
  _CustomNavigationRailState createState() => _CustomNavigationRailState();
}

class _CustomNavigationRailState extends State<CustomNavigationRail> {
  @override
  Widget build(BuildContext context) {
    return (widget.spacerIndex ?? 0) > widget.destinations.length
        ? const Center(
            child: Text(
                "Exception: SpacerIndex Can't be less than length of destination"))
        : Card(
            elevation: widget.elevation ?? 0,
            child: Row(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: widget.destinations
                          .sublist(0, widget.spacerIndex ?? 0)
                          .map((destination) {
                        final index = widget.destinations.indexOf(destination);
                        return GestureDetector(
                          onTap: () => widget.onDestinationSelected(index),
                          child: _CustomNavigationRailDestination(
                            child: destination,
                            selected: index == widget.selectedIndex,
                          ),
                        );
                      }).toList(),
                    ),
                    if (widget.spacerIndex != null) const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ...widget.destinations
                            .sublist(widget.spacerIndex ?? 0)
                            .map((destination) {
                          final index =
                              widget.destinations.indexOf(destination);
                          return GestureDetector(
                            onTap: () => widget.onDestinationSelected(index),
                            child: _CustomNavigationRailDestination(
                              child: destination,
                              selected: index == widget.selectedIndex,
                            ),
                          );
                        }).toList(),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
  }
}

class _CustomNavigationRailDestination extends StatelessWidget {
  final DestinationItem child;
  final bool selected;

  const _CustomNavigationRailDestination({
    Key? key,
    required this.child,
    required this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color =
        selected ? Theme.of(context).primaryColor : Colors.grey.shade600;
    final textTheme = Theme.of(context).textTheme.bodyLarge;
    final textStyle =
        textTheme?.copyWith(color: color) ?? TextStyle(color: color);

    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(child.icon, color: color),
            const SizedBox(width: 16),
            Text(child.label, style: textStyle),
          ],
        ),
      ),
    );
  }
}



// import 'package:adminpannel/Advertisement/AdvertisementPage.dart';
// import 'package:adminpannel/Dashboard/Bookings/Bookings.dart';
// import 'package:adminpannel/Dashboard/Components/DashPage.dart';
// import 'package:flutter/material.dart';

// import '../Categories/AllCategories.dart';
// import '../Posts/Components/Posts.dart';
// import '../Providers/ProviderPage.dart';

// class MyStatefulWidget extends StatefulWidget {
//   const MyStatefulWidget({Key? key}) : super(key: key);

//   @override
//   State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
// }

// class _MyStatefulWidgetState extends State<MyStatefulWidget> {
//   // int _selectedIndex = 0;

//   // void changeDestination(int index) {
//   //   setState(() {
//   //     _selectedIndex = index;
//   //   });
//   // }

//   int _currentIndex = 0;
//   final screens = [
//     const DashPage(),
//     const AllCategories(),
//     const BookingPage(),
//     const AdvertisementPage(),
//     const ProviderPage()
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _currentIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//         builder: (BuildContext context, BoxConstraints constraints) {
//       if (constraints.maxWidth > 730) {
//         return Scaffold(
//           body: Row(
//             children: <Widget>[
//               NavigationRail(
//                 selectedIndex: _currentIndex,
//                 onDestinationSelected: _onItemTapped,
//                 //minWidth: 100,
//                 labelType: NavigationRailLabelType.all,
//                 //selectedIconTheme: const IconThemeData(color: Colors.white),
//                 //selectedLabelTextStyle: TextStyle(color: Colors.lightBlue[500]),
//                 //unselectedLabelTextStyle: TextStyle(color: Colors.grey[500]),
//                 //elevation: 5,
//                 //useIndicator: true,
//                 //backgroundColor: Colors.grey[50],
//                 //indicatorColor: Colors.cyan[50],
//                 //leading: const MyLeadingWidget(),
//                 //trailing: const MyTrailingWidget(),
//                 destinations: const <NavigationRailDestination>[
//                   NavigationRailDestination(
//                     icon: Icon(Icons.house_outlined),
//                     selectedIcon: Icon(Icons.house),
//                     label: Text('Dashpage'),
//                   ),
//                   NavigationRailDestination(
//                     icon: Icon(Icons.star_border),
//                     selectedIcon: Icon(Icons.star),
//                     label: Text(
//                       'Categories',
//                     ),
//                   ),
//                   NavigationRailDestination(
//                     icon: Icon(Icons.account_circle_outlined),
//                     selectedIcon: Icon(Icons.account_circle),
//                     label: Text('Bookings'),
//                   ),
//                   NavigationRailDestination(
//                     icon: Icon(Icons.star_border),
//                     selectedIcon: Icon(Icons.star),
//                     label: Text('Advertisement'),
//                   ),
//                   NavigationRailDestination(
//                     icon: Icon(Icons.account_circle_outlined),
//                     selectedIcon: Icon(Icons.account_circle),
//                     label: Text('Providers'),
//                   ),
//                 ],
//               ),
//               const VerticalDivider(thickness: 1, width: 1),
//               // This is the main content.
//               Expanded(child: screens[_currentIndex]),
//               // Expanded(
//               //   child: screens
//               // )
//             ],
//           ),
//         );
//       }

//       return Scaffold(
//         bottomNavigationBar: BottomNavigationBar(
//           items: const <BottomNavigationBarItem>[
//             BottomNavigationBarItem(
//               icon: Icon(Icons.home),
//               label: 'Dashboard',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.star),
//               label: 'Categories',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.account_circle),
//               label: 'Bookings',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.star),
//               label: 'Advertisement',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.account_circle),
//               label: 'Providers',
//             ),
//           ],
//           currentIndex: _currentIndex,
//           selectedItemColor: Colors.amber[800],
//           onTap: _onItemTapped,
//         ),
//         body: screens[_currentIndex],
//       );
//     });
//   }
// }
