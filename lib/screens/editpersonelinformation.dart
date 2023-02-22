import 'package:flutter/material.dart';

import 'editgrade.dart';
import 'editinformation.dart';

class Personal extends StatelessWidget {
  const Personal({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Student Profile'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Personal Information'),
              Tab(text: 'Academic History'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Edit(),
            MyApp(),
          ],
        ),
      ),
    );
  }
}
