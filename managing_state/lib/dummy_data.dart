import 'package:managing_state/models/subcategory.dart';

import './models/category.dart';

List<Category> DUMMY_DATA = [
  Category(name: 'Fruits', subcategoris: [
    Subcategory(name: 'Apples'),
    Subcategory(name: 'Oranges'),
    Subcategory(name: 'Bananas')
  ]),
  Category(name: 'Vegetables', subcategoris: [
    Subcategory(name: 'Cucumbers'),
    Subcategory(name: 'Potatoes'),
  ]),
  Category(name: 'Grains', subcategoris: [
    Subcategory(name: 'Rice'),
    Subcategory(name: 'Oats'),
    Subcategory(name: 'Wheat')
  ]),
];
