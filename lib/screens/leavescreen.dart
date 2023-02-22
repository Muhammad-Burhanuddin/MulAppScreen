import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LeavesCount extends StatefulWidget {
  const LeavesCount({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LeavesCountState createState() => _LeavesCountState();
}

class _LeavesCountState extends State<LeavesCount> {
  String _reason = '';
  String _selectedToDateTime = '';
  DateTime _submittedDate = DateTime.now();
  String _selectedFromDateTime = '';

  Future _selectToDateTime(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2023),
        lastDate: DateTime(2030));
    if (picked != null) {
      setState(() {
        _selectedToDateTime = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  Future _selectFromDateTime(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime(2030));
    if (picked != null) {
      setState(() {
        _selectedFromDateTime = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  // Variables to store leave data
  final int _totalLeaves = 50;
  int _pendingLeaves = 0;
  int _leaves = 0;

  // Function to calculate remaining leaves
  void _calculateLeaves() {
    setState(() {
      _pendingLeaves = _totalLeaves - _leaves;
    });
  }

  void _applyLeaves() {
    if (_pendingLeaves >= 0) {
      setState(() {
        _leaves++;
      });
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Leaves not allowed"),
            content: const Text("You have no pending leaves to apply"),
            actions: <Widget>[
              TextButton(
                child: const Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Application Form"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _applyLeaves();
          _calculateLeaves();
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TextFormField(
                      onChanged: (value) {
                        _reason = value;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter reason';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(labelText: 'Reason'),
                    ),
                    InkWell(
                      onTap: () => _selectFromDateTime(context),
                      child: IgnorePointer(
                        child: TextField(
                          decoration: const InputDecoration(
                            labelText: 'Select From Date',
                            suffixIcon: Icon(Icons.calendar_today),
                          ),
                          enabled: false,
                          controller: TextEditingController(
                              text: _selectedFromDateTime),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => _selectToDateTime(context),
                      child: IgnorePointer(
                        child: TextField(
                          decoration: const InputDecoration(
                            labelText: 'Select From Date',
                            suffixIcon: Icon(Icons.calendar_today),
                          ),
                          enabled: false,
                          controller:
                              TextEditingController(text: _selectedToDateTime),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _submittedDate = DateTime.now();
                        });
                        Navigator.of(context).pop();
                      },
                      child: const Text('Submit'),
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.amberAccent),
                height: 100,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      const Text("Leave Data"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          Text("Total Leaves"),
                          Text("Pending Leaves"),
                          Text("Leaves"),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("$_totalLeaves"),
                          Text("$_pendingLeaves"),
                          Text("$_leaves"),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "List of leaves",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              _submittedDate == null
                  ? const Center(
                      child: Text('No Form Submitted Yet'),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: 1,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Reason: $_reason'),
                                    const Text(
                                      'Status: Allow',
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.green),
                                    ),
                                  ],
                                ),
                                Text(
                                    'From: ${_selectedFromDateTime.toString()} To: ${_selectedToDateTime.toString()}'),
                                Text(
                                    'Submitted On: ${_submittedDate.toString()}'),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
