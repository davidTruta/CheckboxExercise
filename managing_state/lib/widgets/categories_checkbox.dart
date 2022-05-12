import 'package:flutter/material.dart';
import 'package:managing_state/dummy_data.dart';
import 'package:managing_state/models/category.dart';

import '../models/subcategory.dart';

class CategoriesCheckbox extends StatefulWidget {
  final List<Category> categories = DUMMY_DATA;
  final List<Subcategory> selectedSubcategories;
  final Function changeSelected;

  CategoriesCheckbox(
      {Key? key,
      required this.changeSelected,
      required this.selectedSubcategories})
      : super(key: key);

  @override
  State<CategoriesCheckbox> createState() => _CategoriesCheckboxState();
}

class _CategoriesCheckboxState extends State<CategoriesCheckbox> {

  @override
  Widget build(BuildContext context) {
    const double width = 300;

    print('build CatCheck');
    return Container(
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.1),
          borderRadius: BorderRadius.circular(15)),
      child: FittedBox(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Categories :',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(
              height: 180,
              width: width,
              child: ListView.builder(
                padding: const EdgeInsets.only(top: 20),
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                        value: widget.categories[index].isChecked,
                        onChanged: (value) {
                          setState(() {
                            widget.categories[index].isChecked = value!;
                            widget.changeSelected(widget.categories[index]);
                          });
                        },
                      ),
                      Text(widget.categories[index].name),
                      const SizedBox(
                        width: 15,
                      )
                    ],
                  );
                },
                itemCount: widget.categories.length,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: width,
                child: Text(
                    'Selected subcategories: ${widget.selectedSubcategories.map((e) => e.name).toList().fold("", (previousValue, element) {
                  if (previousValue != null) {
                    return (previousValue as String) + " " + element;
                  } else {
                    return element;
                  }
                })}'),
              ),
            ),
            const SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}
