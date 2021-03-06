import 'package:flutter/material.dart';
import 'package:proiect_tppm/pages/dashboard.dart';
import 'package:provider/provider.dart';
import 'components/application_state.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ApplicationState(),
      builder: (context, _) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,) {
    return Builder(builder: (context) {
      return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Budget Tracker',
          theme: ThemeData(primarySwatch: Colors.blue),
          home: const Dashboard());
    });
  }
}
