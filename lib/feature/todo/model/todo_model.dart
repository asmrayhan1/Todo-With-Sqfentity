class TodoModel{
  int? id;
  String title;
  String description;
  String pickerColor;
  bool isSelected;
  int? categoryId;
  TodoModel({this.id, required this.title, required this.description, this.pickerColor = "0xffe6e6e6", this.isSelected = false, this.categoryId});

  // Convert TodoModel to a map for database operations
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'isSelected': isSelected,
      'description': description,
      'pickerColor' : pickerColor,
      'categoryId' : categoryId
    };
  }

  // Create TodoModel from a map (database row)
  factory TodoModel.fromMap(Map<String, dynamic> map) {
    //print("Inside factory $map");
    return TodoModel(
      id: map['id'] as int?,
      title: map['title'] ?? "No Title Found",
      isSelected: map['isSelected'] ?? false, // Convert int to bool
      description : map['description'] ?? "No Description Found",
      pickerColor: map['pickerColor'] ?? "0xffe6e6e6",
      categoryId: map['categoryId']
    );
  }
}