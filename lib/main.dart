import 'package:flutter/material.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Magic Notes'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  var _noteContents = [
    "Well the internet documenting a lot about western cultures helps sustain interest in that also living a new country helps ",
    "The contrast of one having reduced interest in somethiing while someone has fresh or new interest in that oy same thing",
    "Looking at something from a constructed very complicated angle suggesting that perhaps conventionally complicated things have a simplified angle",
    "I do something with a lot of my theories about perception, focusing mostly on the 'software' and not the 'hardware' and how it evolved"
  ];

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: GridView.count(
          crossAxisCount: 2,
          children: List.generate(_noteContents.length, (index) {
            return Center(
              child: Container(
                  width: 125,
                  height: 125,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1.0, color: const Color(0xFF000000)),
                    borderRadius: const BorderRadius.all(Radius.circular(10))
                  ),
                  child: Text(
                    _noteContents[index],
                    style: Theme.of(context).textTheme.headlineSmall,
                  )
              )

            );
          }
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog<String>(
          context: context,
          builder: (BuildContext context) => Dialog(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(hintText: 'Start a new note...'),
              ),
            ),
          )
        ),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
