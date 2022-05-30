import 'package:flutter/material.dart';
import 'package:proiect_tppm/components/expense_add_form.dart';

class AddExpense extends StatelessWidget {
  const AddExpense({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Add Expense')),
        body: const ExpenseAddForm());
  }
}
