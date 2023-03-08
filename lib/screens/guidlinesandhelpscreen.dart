import 'package:flutter/material.dart';

import '../widgets/itemsWidget.dart';
import '../widgets/list.dart';

class GuidlineAndHelpScreen extends StatefulWidget {
  const GuidlineAndHelpScreen({super.key});

  @override
  State<GuidlineAndHelpScreen> createState() => _GuidlineAndHelpScreenState();
}

class _GuidlineAndHelpScreenState extends State<GuidlineAndHelpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Guidance & Help'),
        backgroundColor: const Color(0xff2A4A9F),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            children: [
              Item(
                listoflink: generaldownload,
                heading: 'General Download',
                uris: generaldownloadUrl,
              ),
              const SizedBox(
                height: 15,
              ),
              Item(
                listoflink: policymanuals,
                heading: 'Policy Manuals',
                uris: policymanulUrl,
              ),
              const SizedBox(
                height: 15,
              ),
              Item(
                listoflink: applicationform,
                heading: 'Application Forms',
                uris: applicationurl,
              ),
              const SizedBox(
                height: 15,
              ),
              Item(
                listoflink: admission,
                heading: 'Admissions',
                uris: admissionurl,
              ),
              Item(
                listoflink: scolarship,
                heading: 'Scholarship/ Financial Aid',
                uris: scolarshipurl,
              ),
              const SizedBox(
                height: 15,
              ),
              Item(
                listoflink: opportunity,
                heading: 'Opportunity',
                uris: opporunityurl,
              )
            ],
          ),
        ),
      ),
    );
  }
}
