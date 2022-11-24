import 'package:flutter/material.dart';
import 'package:counter_7/utils/drawer.dart';
import 'package:counter_7/models/object01.dart';

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
      drawer: AsgDrawer(),
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
                    leading: Icon(Icons.face),
                    title: Text(objectList[index].getName),
                    subtitle: Text("Rp" +
                        objectList[index].getNominal +
                        "     (" +
                        objectList[index].getDate.toString().substring(0, 11) +
                        ")"),
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
