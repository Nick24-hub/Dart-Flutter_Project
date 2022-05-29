import 'package:flutter/material.dart';
import 'expenses.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('My Dashboard')),
        body: GestureDetector(
          child: const Center(
            child: Text("Welcome to Dash"),
          ),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Expenses()));
          },
        ));
  }
}
