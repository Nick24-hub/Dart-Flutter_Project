import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../types/expsense.dart';
import 'expense_card.dart';

class ExpenseList extends StatefulWidget {
  const ExpenseList({Key? key}) : super(key: key);

  @override
  State<ExpenseList> createState() => _ExpenseListState();
}

Future<List<Expense>> getExpenses() async {
  final jsonData = await rootBundle.loadString('assets/expense_list.json');
  if (jsonData.isEmpty) {
    throw Exception("Failed to load expenses");
  } else {
    List expenses = json.decode(jsonData);
    print(expenses);
    return expenses.map((data) => Expense.fromJson(data)).toList();
  }
}

class _ExpenseListState extends State<ExpenseList> {
  late Future<List<Expense>> expenses;

  @override
  void initState() {
    super.initState();
    expenses = getExpenses();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        child: FutureBuilder<List<Expense>>(
          future: getExpenses(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Expense>? expense = snapshot.data;
              return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Divider(),
                      ExpenseCard(
                          expense: Expense(
                              id: expense![index].id,
                              title: expense[index].title,
                              price: expense[index].price,
                              description: expense[index].description,
                              date: expense[index].date))
                    ],
                  );
                },
                itemCount: expense?.length,
              );
            } else if (snapshot.hasError) {
              return const Text('Error in data');
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
        onRefresh: () {
          setState(() {});
          return getExpenses();
        });
  }
}
