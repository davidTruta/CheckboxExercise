import 'package:flutter/material.dart';
import 'package:managing_state/models/subcategory.dart';

import 'models/category.dart';
import 'widgets/categories_checkbox.dart';
import 'widgets/subcategories_checkbox.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  final List<Category> selectedCategories = [];
  final List<Subcategory> selectedSubcategories = [];
  String info = "";

  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void updateSelectedCategories(Category category) {
    setState(() {
      if (category.isChecked) {
        widget.selectedCategories.add(category);
      } else {
        widget.selectedCategories.remove(category);
      }
    });
  }

  void updateSelectedSubcategories(Subcategory subcategory) {
    setState(() {
      if (subcategory.isChecked) {
        widget.selectedSubcategories.add(subcategory);
      } else {
        widget.selectedSubcategories.remove(subcategory);
      }
    });
  }

  String get sendInfo {
    return widget.selectedCategories.map((e) => e.name).toList().join(',') +
        " - " +
        widget.selectedSubcategories.map((e) => e.name).toList().join(',');
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print('build MyApp');

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
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
                    CategoriesCheckbox(
                      selectedSubcategories: widget.selectedSubcategories,
                      changeSelected: updateSelectedCategories,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SubcategoriesCheckbox(
                      selectedCategories: widget.selectedCategories,
                      changeSelected: updateSelectedSubcategories,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            widget.info = sendInfo;
                          });
                        }, child: const Text('Send Info')),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(widget.info)
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
