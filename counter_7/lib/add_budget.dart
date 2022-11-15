import 'package:flutter/material.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/show_budget.dart';
import 'package:counter_7/object01.dart';
import 'package:flutter/services.dart';

class MyFormPage extends StatefulWidget {
  const MyFormPage({super.key});

  @override
  State<MyFormPage> createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _budgetController = TextEditingController();
  final _typeController = TextEditingController();
  String _budgetTitle = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text('Add Budget'),
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
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: _titleController,
                    decoration: InputDecoration(
                      hintText: "Yoshinoya",
                      labelText: "Title Field",
                      // Menambahkan icon agar lebih intuitif
                      icon: const Icon(
                        Icons.title,
                      ),
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please fill out this field!';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _budgetController,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: InputDecoration(
                      hintText: "65000",
                      labelText: "Nominal Field",
                      // Menambahkan icon agar lebih intuitif
                      icon: const Icon(
                        Icons.attach_money,
                      ),
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    validator: (String? value) {
                      if (value == null ||
                          value.isEmpty ||
                          value.startsWith("0")) {
                        return 'Please fill out this field!';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  DropdownButtonFormField<String>(
                    icon: const Icon(Icons.keyboard_arrow_down),
                    decoration: const InputDecoration(
                      labelText: 'Type Drowdown',
                      border: OutlineInputBorder(),
                      icon: Icon(
                        Icons.arrow_drop_down_circle,
                      ),
                    ),
                    // ignore: prefer_const_literals_to_create_immutables
                    items: [
                      const DropdownMenuItem(
                        value: 'Income',
                        child: Text("Income"),
                      ),
                      // ignore: prefer_const_constructors
                      const DropdownMenuItem(
                        value: 'Outcome',
                        child: Text("Outcome"),
                      ),
                    ],
                    onChanged: (String? value) {
                      setState(() {
                        _typeController.text = value!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select one option!';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                    ),
                    onPressed: (() {
                      if (_formKey.currentState!.validate()) {
                        // ignore: unnecessary_new
                        objectList.add(Object01(
                            name: _titleController.text,
                            nominal: _budgetController.text,
                            type: _typeController.text));

                        _titleController.clear();
                        _budgetController.clear();
                        _typeController.clearComposing();
                      }
                    }),
                    child: const Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

void addObject01(String name, String nominal, String type) {}
