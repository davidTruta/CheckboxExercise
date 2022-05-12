import 'subcategory.dart';

class Category {
  final String name;
  final List<Subcategory> subcategoris;
  bool isChecked;

  Category(
      {required this.name, required this.subcategoris, this.isChecked = false});
}
