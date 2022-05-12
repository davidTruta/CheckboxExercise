import 'package:flutter/material.dart';
import 'package:managing_state/models/category.dart';
import 'package:managing_state/models/subcategory.dart';

class SubcategoriesCheckbox extends StatefulWidget {
  final List<Category> selectedCategories;
  final Function changeSelected;

  const SubcategoriesCheckbox({Key? key, required this.selectedCategories, required this.changeSelected})
      : super(key: key);

  @override
  State<SubcategoriesCheckbox> createState() => _SubcategoriesCheckboxState();
}

class _SubcategoriesCheckboxState extends State<SubcategoriesCheckbox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 340,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.1),
          borderRadius: BorderRadius.circular(15)),
      child: widget.selectedCategories.isNotEmpty
          ? ListView.builder(
              padding: const EdgeInsets.all(20),
              itemBuilder: (context, i) {
                return Column(children: [
                  Text(
                    '${widget.selectedCategories[i].name} :',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Column(
                    children:
                        widget.selectedCategories[i].subcategoris.map((s) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Checkbox(
                              value: s.isChecked,
                              onChanged: (value) {
                                setState(() {
                                  s.isChecked = value!;
                                  widget.changeSelected(s);
                                });
                              }),
                          Text(s.name),
                          const SizedBox(
                            width: 15,
                          )
                        ],
                      );
                    }).toList(),
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ]);
              },
              itemCount: widget.selectedCategories.length,
            )
          : const Text('No category is selected!'),
    );
  }
}
