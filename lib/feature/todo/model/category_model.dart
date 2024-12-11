class CategoryModel{
  int? id;
  String title;
  CategoryModel({this.id, required this.title});

  // Convert TodoModel to a map for database operations
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': title,
    };
  }

  // Create TodoModel from a map (database row)
  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    //print("Inside factory $map");
    return CategoryModel(
        id: map['id'] as int?,
        title: map['name'] ?? "No Title Found",
    );
  }
}