import 'package:flutter/material.dart';
import 'package:counter_7/utils/drawer.dart';
import 'package:counter_7/models/object01.dart';
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
  final _dateController = TextEditingController();

  Future<Function()?> chooseDate({required BuildContext context}) async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );
    if (date != null) {
      _dateController.text = date.toString();
    }
    return null;
  }

  // --------- Build ---------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add Budget'),
        ),
        drawer: AsgDrawer(),
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
                      icon: const Icon(
                        Icons.title,
                      ),
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
                      icon: const Icon(
                        Icons.attach_money,
                      ),
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
                  TextFormField(
                    controller: _dateController,
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.date_range),
                      labelText: 'Date Field',
                      border: OutlineInputBorder(),
                    ),
                    onTap: () {
                      chooseDate(context: context);
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select the date!';
                      } else if (DateTime.tryParse(value) == null) {
                        return 'Invalid date';
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
                      labelText: 'Type Dropdown',
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
                    height: 80,
                  ),
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green),
                    ),
                    onPressed: (() {
                      if (_formKey.currentState!.validate()) {
                        // ignore: unnecessary_new
                        objectList.add(Object01(
                            name: _titleController.text,
                            nominal: _budgetController.text,
                            type: _typeController.text,
                            date: _dateController.text));

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

void addObject01(String name, String nominal, String type, String date) {}
