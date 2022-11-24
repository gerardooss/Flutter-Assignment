import 'package:flutter/material.dart';
import 'package:counter_7/utils/drawer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  final String title = 'Counter 7';

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  // --------- Build ---------
  @override
  Widget build(BuildContext context) {
    var indicator = _counter % 2;
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        drawer: AsgDrawer(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                (indicator == 1) ? 'GANJIL' : 'GENAP',
                style: TextStyle(
                    color: (indicator == 1) ? Colors.blue : Colors.red),
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        ),
        floatingActionButton: Padding(
          padding: EdgeInsets.only(left: 30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Visibility(
                  visible: (_counter != 0),
                  child: FloatingActionButton(
                    onPressed: _decrementCounter,
                    tooltip: 'Increment',
                    child: const Icon(Icons.remove),
                  )),
              Expanded(child: Container()),
              FloatingActionButton(
                onPressed: _incrementCounter,
                tooltip: 'Decrement',
                child: const Icon(Icons.add),
              )
            ],
          ),
        ));
  }
}
