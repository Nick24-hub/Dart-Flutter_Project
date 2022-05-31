import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../types/expsense.dart';
import 'expense_card.dart';

class ExpenseList extends StatefulWidget {
  const ExpenseList({Key? key}) : super(key: key);

  @override
  State<ExpenseList> createState() => _ExpenseListState();
}

Future<List<Expense>> getExpenses(CollectionReference colRef) async {
    // Get docs from collection reference
    QuerySnapshot querySnapshot = await colRef.where('userId', isEqualTo: FirebaseAuth.instance.currentUser!.uid).get();

    // Get data from docs and convert map to List
    List allData = querySnapshot.docs.map((doc) => doc.data()).toList();

    return allData.map((data) => Expense.fromJson(data)).toList();
}

class _ExpenseListState extends State<ExpenseList> {
  late Future<List<Expense>> expenses;
  final CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection('expenses');

  @override
  void initState() {
    super.initState();

    expenses = getExpenses(_collectionRef);
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        child: FutureBuilder<List<Expense>>(
          future: getExpenses(_collectionRef),
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
                              category: expense[index].category,
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
          return getExpenses(_collectionRef);
        });
  }
}
