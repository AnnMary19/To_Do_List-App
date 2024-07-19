import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // ignore: use_key_in_widget_constructors, always_specify_types, inference_failure_on_untyped_parameter
  const MyApp({key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo List App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Todo List App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // ignore: use_key_in_widget_constructors, sort_constructors_first, always_specify_types, inference_failure_on_untyped_parameter
  const MyHomePage({key,  this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}



class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _todoController = TextEditingController();
  // final TextEditingController _descriptionController = TextEditingController();

  final List<String> _todoList = [
    'Wake up',
    'Eat Breakfast',
    'Go for a ride with friends',
    'Return back'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                  controller: _todoController,
                  decoration: const InputDecoration(
                      labelText: 'Todo', border: OutlineInputBorder())),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _todoList.add(_todoController.text);
                  });
                },
                child: const Text('Add Todo')),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _todoList.length,
              itemBuilder: (BuildContext context, int index) => Card(
                child: ListTile(
                    title: Text(_todoList[index]),
                    subtitle: Text('Item #$index'),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        setState(() {
                          _todoList.removeAt(index);
                        });
                      },
                    )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
