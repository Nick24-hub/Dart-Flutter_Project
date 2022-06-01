import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../types/expsense.dart';

class ExpenseDetail extends StatelessWidget {
  const ExpenseDetail({Key? key, required this.expense}) : super(key: key);
  final Expense expense;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(expense.title),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text("Title: ${expense.title}"),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text("Price: ${expense.price}"),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text("Category: ${expense.category}"),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text("Description: ${expense.description}"),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text("date: ${expense.date}"),
            ),
            ElevatedButton(
              child: const Text("Delete"),
              onPressed: () {
                FirebaseFirestore.instance.collection('expenses').doc(expense.id).delete();
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.money), label: 'Expenses'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'More')
        ],
        currentIndex: 2,
      ),
    );
  }
}
