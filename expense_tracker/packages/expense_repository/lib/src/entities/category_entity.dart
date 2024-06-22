class CategoryEntity {
  String categoryId;
  String name;
  String icon;
  int color;

  CategoryEntity({
    required this.categoryId,
    required this.name,
    required this.icon,
    required this.color,
  });

  Map<String, Object?> toDocument() {
    return {
      'categoryId': categoryId,
      'name': name,
      'icon': icon,
      'color': color,
    };
  }

  static CategoryEntity fromDocument(Map<String, Object?> document) {
    return CategoryEntity(
      categoryId: document['categoryId'] as String,
      name: document['name'] as String,
      icon: document['icon'] as String,
      color: document['color'] as int,
    );
  }
}
