import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import '../types/expsense.dart';
import 'expense_card.dart';

class ExpenseList extends StatefulWidget {
  const ExpenseList({Key? key}) : super(key: key);

  @override
  State<ExpenseList> createState() => _ExpenseListState();
}

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();

  return directory.path;
}

Future<File> get _localFile async {
  final path = await _localPath;

  return File('$path/expense_list.json.txt');
}

Future<File> initFile() async {
  final file = await _localFile;

  // Write the file
  return file.writeAsString("[]");
}

void addExpense(Map<String, dynamic> formData) async {
  final file = await _localFile;
  final jsonData = await file.readAsString();
  List expenses = json.decode(jsonData);
  expenses.add(formData);
  // Write the file
  file.writeAsString(jsonEncode(expenses));
}

Future<List<Expense>> getExpenses() async {
  //final jsonData = await rootBundle.loadString('assets/expense_list.json');
  final file = await _localFile;
  // Read the file
  String jsonData = "[]";
  try {
    jsonData = await file.readAsString();
  } on FileSystemException {
    await initFile();
    jsonData = await file.readAsString();
  }
  List expenses = json.decode(jsonData);
  return expenses.map((data) => Expense.fromJson(data)).toList();
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
                              title: expense![index].title,
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
