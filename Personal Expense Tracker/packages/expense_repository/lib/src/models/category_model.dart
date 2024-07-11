import 'package:expense_repository/src/entities/category_entity.dart';

class CategoryModel {
  String categoryId;
  String name;
  String icon;
  int color;

  CategoryModel({
    required this.categoryId,
    required this.name,
    required this.icon,
    required this.color,
  });

  static final empty = CategoryModel(
    categoryId: '',
    name: '',
    icon: 'icon',
    color: 0,
  );

  CategoryEntity toEntity() {
    return CategoryEntity(
      categoryId: categoryId,
      name: name,
      icon: icon,
      color: color,
    );
  }

  static CategoryModel fromEntity(CategoryEntity entity) {
    return CategoryModel(
      categoryId: entity.categoryId,
      name: entity.name,
      icon: entity.icon,
      color: entity.color,
    );
  }
}
