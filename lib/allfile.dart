import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:localnotificationstest/screens/editpersonelinformation.dart';
import 'package:localnotificationstest/screens/filedownloader.dart';

import 'screens/home_screen.dart';
import 'screens/leavescreen.dart';

class AllScreens extends StatefulWidget {
  const AllScreens({super.key});

  @override
  State<AllScreens> createState() => _AllScreensState();
}

class _AllScreensState extends State<AllScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("All screens")),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
              child: Text('Todolist Notification')),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LeavesCount()));
              },
              child: Text('Leaves Count')),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FileDownloader()));
              },
              child: Text('Pdf File Downlaoder')),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Personal()));
              },
              child: Text('Edit Personal Information')),
        ],
      ),
    );
  }
}
