import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _Years = "0000";
  String _marks = "800";
  String _grades = "A+";
  String _board = "Gujranwala board";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(50)),
                child: Center(child: Text(_Years)),
              ),
              Container(
                width: 300,
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Intermediate'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Marks'),
                            Text("$_marks/1100"),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Grade'),
                            Text(_grades),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Board'),
                            Text("$_board"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          ElevatedButton(
            child: const Text("Edit"),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text("Edit Academic History"),
                    content: Column(
                      children: [
                        TextField(
                          decoration: const InputDecoration(labelText: "Year"),
                          onChanged: (value) {
                            setState(() {
                              _Years = value;
                            });
                          },
                        ),
                        TextField(
                          decoration: const InputDecoration(labelText: "Marks"),
                          onChanged: (value) {
                            setState(() {
                              _marks = value;
                            });
                          },
                        ),
                        TextField(
                          decoration:
                              const InputDecoration(labelText: "Grades"),
                          onChanged: (value) {
                            setState(() {
                              _grades = value;
                            });
                          },
                        ),
                        TextField(
                          decoration: const InputDecoration(labelText: "Board"),
                          onChanged: (value) {
                            setState(() {
                              _board = value;
                            });
                          },
                        ),
                      ],
                    ),
                    actions: [
                      ElevatedButton(
                        child: const Text("Save"),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ]),
      ),
    ));
  }
}
