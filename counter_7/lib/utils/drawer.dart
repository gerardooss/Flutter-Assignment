import 'package:flutter/material.dart';

import 'package:counter_7/main.dart';
import 'package:counter_7/pages/add_budget_page.dart';
import 'package:counter_7/pages/show_budget_page.dart';
import 'package:counter_7/pages/watchlist_page.dart';

class AsgDrawer extends StatefulWidget {
  const AsgDrawer({super.key});

  @override
  State<AsgDrawer> createState() => _AsgDrawerState();
}

class _AsgDrawerState extends State<AsgDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          ListTile(
            title: const Text('Counter'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MyHomePage()),
              );
            },
          ),
          ListTile(
            title: const Text('Add Budget'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MyFormPage()),
              );
            },
          ),
          ListTile(
            title: const Text('View Budget'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MyViewPage()),
              );
            },
          ),
          ListTile(
            title: const Text('My Watch List'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const MyWatchlistPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
