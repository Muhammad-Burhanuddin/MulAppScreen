import 'package:flutter/material.dart';
import '../models/todo.dart';
import '../constants/colors.dart';

class ToDoItem extends StatelessWidget {
  final ToDo todo;

  final onedit;

  const ToDoItem(
      {Key? key,
      required this.todo,
      required this.onedit,
      required onToDoChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  todo.priority!,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: tdGrey,
                  ),
                ),
                IconButton(
                  color: tdOrange,
                  iconSize: 30,
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    onedit(todo.id);
                  },
                ),
              ],
            ),
            Text(
              todo.todoText!,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: titlecolor,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              todo.distext!,
              style: TextStyle(
                fontSize: 18,
                color: tdGrey,
              ),
              maxLines: 2,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'till ${todo.enddate!}',
              style: TextStyle(
                fontSize: 18,
                color: tdGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
