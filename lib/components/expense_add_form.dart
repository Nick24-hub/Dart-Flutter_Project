import 'package:flutter/material.dart';
import 'package:proiect_tppm/components/expense_list.dart';
import 'package:proiect_tppm/pages/expenses.dart';

class ExpenseAddForm extends StatefulWidget {
  const ExpenseAddForm({Key? key}) : super(key: key);

  @override
  State<ExpenseAddForm> createState() => _ExpenseAddFormState();
}

class _ExpenseAddFormState extends State<ExpenseAddForm> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> formData = {
    'title': '',
    'price': 0,
    'description': '',
    'date': ''
  };

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: TextFormField(
            decoration: const InputDecoration(labelText: "Enter the title"),
            validator: (value) {
              return (value == null || value.isEmpty)
                  ? "Please fill the title"
                  : null;
            },
            onSaved: (value) {
              formData['title'] = value;
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: TextFormField(
            decoration: const InputDecoration(labelText: "Enter the price"),
            keyboardType: TextInputType.number,
            validator: (value) {
              return (value == null || value.isEmpty)
                  ? "Please fill the price"
                  : null;
            },
            onSaved: (value) {
              formData['price'] = value;
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: TextFormField(
            decoration:
                const InputDecoration(labelText: "Enter the description"),
            validator: (value) {
              return (value == null || value.isEmpty)
                  ? "Please fill the description"
                  : null;
            },
            onSaved: (value) {
              formData['description'] = value;
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: TextFormField(
            decoration: const InputDecoration(labelText: "Enter the date"),
            keyboardType: TextInputType.number,
            validator: (value) {
              return (value == null || value.isEmpty)
                  ? "Please fill the date"
                  : null;
            },
            onSaved: (value) {
              formData['date'] = value;
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: ElevatedButton(
            child: const Text("Submit"),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                addExpense(formData);
                Navigator.push(context, MaterialPageRoute(builder: ((context) => const Expenses())));
              }
            },
          ),
        ),
      ]),
    );
  }
}
