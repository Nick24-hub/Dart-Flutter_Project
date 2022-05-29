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
          child: Text("${expense.description}\n Price: ${expense.price}\n Date: ${expense.date}")),
    );
  }
}
