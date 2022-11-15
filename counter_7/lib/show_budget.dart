import 'package:flutter/material.dart';
import 'package:counter_7/add_budget.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/object01.dart';

class MyViewPage extends StatefulWidget {
  const MyViewPage({super.key});

  @override
  State<MyViewPage> createState() => _MyViewPageState();
}

class _MyViewPageState extends State<MyViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Budget Data'),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            // Menambahkan clickable menu
            ListTile(
              title: const Text('Counter'),
              onTap: () {
                // Route menu ke halaman utama
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MyHomePage()),
                );
              },
            ),
            ListTile(
              title: const Text('Add Budget'),
              onTap: () {
                // Route menu ke halaman form
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MyFormPage()),
                );
              },
            ),
            ListTile(
              title: const Text('View Budget'),
              onTap: () {
                // Route menu ke halaman form
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MyViewPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Container(
        child: Column(
          children: [
            ListView.builder(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              shrinkWrap: true,
              itemCount: objectList.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(objectList[index].getName),
                    subtitle: Text(objectList[index].getNominal),
                    trailing: Text(objectList[index].getType),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
