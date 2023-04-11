import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/rendering.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ödev',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: const ListRandomPage(title: 'Random Sayı Üretme Uygulaması'),
    );
  }
}

class ListRandomPage extends StatefulWidget {
  const ListRandomPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<ListRandomPage> createState() => ListRandomPageState();
}

class ListRandomPageState extends State<ListRandomPage> {
  List<int> randomList = [];

  void createRandomList() {
    setState(() {
      randomList.clear();
      for (int i = 0; i < 10; i++) {
        int randomNumber = Random().nextInt(200);
        randomList.add(randomNumber);
      }
    });
  }

  void removeFromList(int index) {
    setState(() {
      randomList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: randomList.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(
                    '${randomList[index]}',
                    textAlign: TextAlign.center,
                  ),
                  onTap: () => removeFromList(index),
                );
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 15),
            child: ElevatedButton(
              onPressed: createRandomList,
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 94, 27, 31),
                minimumSize: Size(50, 60),
              ),
              child: const Text('Sayı Üret'),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 25),
            child: Text(
              'Sayılara Tıklayarak Silebilirsiniz.',
              style: TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          )
        ],
      ),
    );
  }
}
