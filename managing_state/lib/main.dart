import 'package:flutter/material.dart';

import 'widgets/categories_checkbox.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String info = "";

  void setInfo( String info ){
    setState(() {
      this.info = info;
    });
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print('build MyApp');

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CategoriesCheckbox( setInfo: setInfo ),
                    Text(info)
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
