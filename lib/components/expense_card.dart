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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text('Title: ${expense.title}'),
              Text('Price: ${expense.price}'),
              Text('Date: ${expense.date}')
            ],
          )),
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
