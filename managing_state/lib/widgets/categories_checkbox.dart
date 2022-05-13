import 'package:flutter/material.dart';
import 'package:managing_state/dummy_data.dart';
import 'package:managing_state/models/category.dart';
import 'package:managing_state/widgets/subcategories_checkbox.dart';

import '../models/subcategory.dart';

class CategoriesCheckbox extends StatefulWidget {
  final Function setInfo;
  const CategoriesCheckbox({Key? key, required this.setInfo}) : super(key: key);

  @override
  State<CategoriesCheckbox> createState() => _CategoriesCheckboxState();
}

class _CategoriesCheckboxState extends State<CategoriesCheckbox> {
  final List<Category> _selectedCategories = [];
  final List<Subcategory> _selectedSubcategories = [];
  final List<Category> _categories = DUMMY_DATA;
  final double _width = 300;

  void _updateSelectedCategories(Category category) {
    setState(() {
      if (category.isChecked) {
        if (_selectedCategories.length == 1) {
          category.isChecked = false;
        } else {
          _selectedCategories.add(category);
        }
      } else {
        _selectedCategories.remove(category);
        List<Subcategory> toRemove = [];
        for (var sub in category.subcategoris) {
          for (var sub2 in _selectedSubcategories) {
            if (sub.name == sub2.name) {
              sub2.isChecked = false;
              toRemove.add(sub2);
            }
          }
        }
        for (var sub in toRemove) {
          _updateSelectedSubcategories(sub);
        }
      }

    });
  }

  void _updateSelectedSubcategories(Subcategory subcategory) {
    setState(() {
      if (subcategory.isChecked) {
        _selectedSubcategories.add(subcategory);
      } else {
        _selectedSubcategories.remove(subcategory);
      }
    });
  }

  String get getInfo {
    return _selectedCategories.map((e) => e.name).toList().join(',') +
        " - " +
        _selectedSubcategories.map((e) => e.name).toList().join(',');
  }

  @override
  void initState() {
    super.initState();
    print('Init state CategoriesCheckbox');
  }

  @override
  void didUpdateWidget(covariant CategoriesCheckbox oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('didUpdateW CategoriesCheckbox');
  }

  @override
  void dispose() {
    super.dispose();
    print('dispose CategoriesCheckbox');
  }

  Widget buildCategoriesWidget() {
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
              width: _width,
              child: ListView.builder(
                padding: const EdgeInsets.only(top: 20),
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                        value: _categories[index].isChecked,
                        onChanged: (value) {
                          // CHANGE CATEGORY FUNCTION
                          setState(() {
                            _categories[index].isChecked = value!;
                            _updateSelectedCategories(_categories[index]);
                          });
                        },
                      ),
                      Text(_categories[index].name),
                      const SizedBox(
                        width: 15,
                      )
                    ],
                  );
                },
                itemCount: _categories.length,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: _width,
                child: Text(
                    'Selected subcategories: ${_selectedSubcategories.map((e) => e.name).toList().fold("", (previousValue, element) {
                  if (previousValue != null) {
                    return (previousValue as String) + " " + element;
                  } else {
                    return element;
                  }
                })}'),
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print('build CategoriesCheckbox');

    return Column(
      children: [
        buildCategoriesWidget(),
        const SizedBox(
          height: 15,
        ),
        SubcategoriesCheckbox(
            selectedCategories: _selectedCategories,
            changeSelected: _updateSelectedSubcategories),
        const SizedBox(
          height: 15,
        ),
        ElevatedButton(
            onPressed: () {
              setState(() {
                widget.setInfo(getInfo);
              });
            },
            child: const Text('Send Info')),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
