// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

// class TodoDialogWidget extends StatefulWidget {
//   const TodoDialogWidget({super.key});

//   @override
//   State<TodoDialogWidget> createState() => _TodoDialogWidgetState();
// }

// class _TodoDialogWidgetState extends State<TodoDialogWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//                     content: Column(
//                       mainAxisSize: MainAxisSize.max,
//                       children: <Widget>[
//                         TextFormField(
//                           initialValue: widget.title==null?"":"",
//                           controller: _todoController,
                        
//                           decoration: const InputDecoration(
//                               hintText: 'Title', border: InputBorder.none),
//                         ),
//                         TextField(
//                           controller: _discontroller,
//                           decoration: const InputDecoration(
//                               hintText: 'Description',
//                               border: InputBorder.none),
//                         ),
//                         InkWell(
//                           onTap: () => _selectFromDateTime(context),
//                           child: IgnorePointer(
//                             child: TextField(
//                               decoration: const InputDecoration(
//                                 labelText: 'Select Start Date',
//                                 suffixIcon: Icon(Icons.calendar_today),
//                               ),
//                               controller: TextEditingController(
//                                   text: _selectedFromDateTime),
//                             ),
//                           ),
//                         ),
//                         InkWell(
//                           onTap: () => _selectToDateTime(context),
//                           child: IgnorePointer(
//                             child: TextField(
//                               decoration: const InputDecoration(
//                                 labelText: 'Select End Date',
//                                 suffixIcon: Icon(Icons.calendar_today),
//                               ),
//                               controller: TextEditingController(
//                                   text: _selectedToDateTime.toString()),
//                             ),
//                           ),
//                         ),
//                         Container(
//                           padding: const EdgeInsets.all(0.0),
//                           child: DropdownButton<String>(
//                             value: _chosenValue,
//                             style: const TextStyle(color: Colors.black),
//                             items: <String>['High', 'Low', 'Medium']
//                                 .map<DropdownMenuItem<String>>((String value) {
//                               return DropdownMenuItem<String>(
//                                 value: value,
//                                 child: Text(value),
//                               );
//                             }).toList(),
//                             hint: const Text(
//                               "Proirity",
//                               style: TextStyle(
//                                 color: Colors.black,
//                                 fontSize: 16,
//                               ),
//                             ),
//                             onChanged: (String? value) {
//                               setState(() {
//                                 _chosenValue = value!;
//                               });
//                             },
//                           ),
//                         ),
//                         TextButton(
//                           onPressed: () {
//                             showNotification();
//                             setState(() {
//                               _addToDoItem(
//                                   _todoController.text,
//                                   _discontroller.text,
//                                   _selectedFromDateTime,
//                                   _chosenValue!);
//                             });
//                             Navigator.of(context).pop();
//                           },
//                           child: const Text('Submit'),
//                         ),
//                       ],
//                     ),
//                   );
//   }
// }