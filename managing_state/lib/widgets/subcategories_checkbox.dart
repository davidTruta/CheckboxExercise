import 'package:flutter/material.dart';
import 'package:managing_state/models/category.dart';

class SubcategoriesCheckbox extends StatelessWidget {
  final List<Category> selectedCategories;
  final Function changeSelected;

  const SubcategoriesCheckbox(
      {Key? key,
      required this.selectedCategories,
      required this.changeSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('build SubcategoriesCheckbox');

    return Container(
      height: 300,
      width: 340,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.1),
          borderRadius: BorderRadius.circular(15)),
      child: selectedCategories.isNotEmpty
          ? ListView.builder(
              padding: const EdgeInsets.all(20),
              itemBuilder: (context, i) {
                return Column(children: [
                  Text(
                    '${selectedCategories[i].name} :',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Column(
                    children: selectedCategories[i].subcategoris.map((s) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Checkbox(
                              value: s.isChecked,
                              onChanged: (value) {
                                s.isChecked = value!;
                                changeSelected(s);
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
              itemCount: selectedCategories.length,
            )
          : const Text('No category is selected!'),
    );
  }
}
