import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:localnotificationstest/main.dart';
import 'package:timezone/timezone.dart' as tz;
import '../constants/colors.dart';
import '../models/todo.dart';
import '../widgets/todo_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ToDo? todo;
  void showNotification() async {
    AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
        "notificaton-youtube", " Notification Youtube",
        priority: Priority.max, importance: Importance.max);

    DarwinNotificationDetails iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    NotificationDetails notiDetails =
        NotificationDetails(android: androidDetails, iOS: iosDetails);

    // DateTime scheduleDate = DateTime.now().add(Duration(seconds: 5));
    DateTime scheduleDate = DateTime.parse(_selectStartDateTime.toString());

    await notificationsPlugin.zonedSchedule(
        0,
        "Hello",
        "Notification",
        //todo!.todoText.toString(),
        // todo!.distext.toString(),

        // todo!.todoText.toString(),
        tz.TZDateTime.from(scheduleDate, tz.local),
        notiDetails,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.wallClockTime,
        androidAllowWhileIdle: true,
        payload: "notification-payload");
  }

  void checkForNotification() async {
    NotificationAppLaunchDetails? details =
        await notificationsPlugin.getNotificationAppLaunchDetails();

    if (details != null) {
      if (details.didNotificationLaunchApp) {
        NotificationResponse? response = details.notificationResponse;

        if (response != null) {
          String? payload = response.payload;
          log("Notification Payload: $payload");
        }
      }
    }
  }

  @override
  void initState() {
    super.initState();
    checkForNotification();
    _foundToDo = todosList;
  }

  _changeToDoItem(String id) {
    setState(() {});
  }

  _addToDoItem(String toDo, String distodo, String endtodo, String priotext) {
    if (toDo.isEmpty) {
    } else {
      setState(() {
        todosList.add(ToDo(
            id: DateTime.now().millisecondsSinceEpoch,
            todoText: toDo,
            distext: distodo,
            enddate: endtodo,
            priority: priotext));
      });
      _todoController.clear();
      _discontroller.clear();
    }
  }

  final todosList = ToDo.todoList();
  List<ToDo> _foundToDo = [];
  final _todoController = TextEditingController();
  final _discontroller = TextEditingController();

  DateTime? _selectStartDateTime;
  DateTime? _selectedEndDateTime;
  String? _chosenValue = 'High';

  Future _selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2023),
        lastDate: DateTime(2030));
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(DateTime.now()),
    );
    if (picked != null) {
      setState(() {
        _selectStartDateTime = DateTime(picked.year, picked.month, picked.day,
            pickedTime!.hour, pickedTime.minute);
      });
      print(_selectStartDateTime);
    }
  }

  Future _selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2023),
        lastDate: DateTime(2030));
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(DateTime.now()),
    );
    if (picked != null) {
      setState(() {
        _selectedEndDateTime = DateTime(picked.year, picked.month, picked.day,
            pickedTime!.hour, pickedTime.minute);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: const Text(
            '+',
            style: TextStyle(
              fontSize: 40,
            ),
          ),
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        TextField(
                          controller: _todoController,
                          decoration: const InputDecoration(
                              hintText: 'Title', border: InputBorder.none),
                        ),
                        TextField(
                          controller: _discontroller,
                          decoration: const InputDecoration(
                              hintText: 'Description',
                              border: InputBorder.none),
                        ),
                        InkWell(
                          onTap: () => _selectStartDate(context),
                          child: IgnorePointer(
                            child: TextField(
                              decoration: const InputDecoration(
                                labelText: 'Select Start Date',
                                suffixIcon: Icon(Icons.calendar_today),
                              ),
                              controller: TextEditingController(
                                  text: _selectStartDateTime.toString()),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () => _selectEndDate(context),
                          child: IgnorePointer(
                            child: TextField(
                              decoration: const InputDecoration(
                                labelText: 'Select End Date',
                                suffixIcon: Icon(Icons.calendar_today),
                              ),
                              controller: TextEditingController(
                                  text: _selectedEndDateTime.toString()),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(0.0),
                          child: DropdownButton<String>(
                            value: _chosenValue,
                            style: const TextStyle(color: Colors.black),
                            items: <String>['High', 'Low', 'Medium']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            hint: const Text(
                              "Proirity",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                            onChanged: (String? value) {
                              setState(() {
                                _chosenValue = value!;
                              });
                            },
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            showNotification();
                            setState(() {
                              _addToDoItem(
                                  _todoController.text,
                                  _discontroller.text,
                                  _selectedEndDateTime.toString(),
                                  _chosenValue!);
                            });
                            Navigator.of(context).pop();
                          },
                          child: const Text('Submit'),
                        ),
                      ],
                    ),
                  );
                });
          }),
      backgroundColor: tdBGColor,
      appBar: AppBar(
        title: const Text('Todolist'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            children: [
              FutureBuilder(
                future: Future.delayed(const Duration(seconds: 1)),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    showNotification();
                  }
                  return const Text("Notification will be scheduled .");
                },
              ),
              ListView(
                shrinkWrap: true,
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      top: 50,
                      bottom: 20,
                    ),
                    child: const Text(
                      'All ToDos',
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  for (ToDo todoo in _foundToDo.reversed)
                    ToDoItem(
                      todo: todoo,
                      onToDoChanged: _changeToDoItem,
                      onedit: _changeToDoItem,
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
