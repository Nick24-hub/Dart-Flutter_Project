import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proiect_tppm/pages/expense_detail.dart';
import '../types/expsense.dart';

class ExpenseCard extends StatelessWidget {
  final Expense expense;

  const ExpenseCard({Key? key, required this.expense}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.all(18.0),
        child: Text(expense.title),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ExpenseDetail(
                      expense: expense,
                    )));
      },
    );
  }
}
