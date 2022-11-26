import 'package:apitest/services/data_provider.dart';
import 'package:apitest/view/home_screen.dart';
import 'package:apitest/view/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DataProvider>(
            create: (_) => DataProvider()),
      ],
      child: MaterialApp(
        title: 'Test',
        theme: ThemeData(
        ),
        home: SignUpScreen(),
      ),
    );
  }
}





