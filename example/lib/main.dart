import 'package:flutter/material.dart';
import 'package:rview/rview.dart';

void main() => runApp(
      const MyApp(),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  List<String> items = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: StateListView(
        requestData: (RequestDataType type, int position) async {
          return (page: position >= 20 ? 3 : 1, pages: 3, data: items);
        },
        itemExtent: 100,
        itemBuilder: (BuildContext context, List<String> data, int i) {
          return Card(
            child: Center(
              child: Text(data[i]),
            ),
          );
        },
      ),
    );
  }
}
