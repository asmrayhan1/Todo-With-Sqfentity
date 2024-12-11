import '../../model/category_model.dart';

class CategoryGenerics{
  List<CategoryModel> myCategory;
  CategoryGenerics({this.myCategory = const []});

  CategoryGenerics update({List<CategoryModel>? currentCategory}){
    return CategoryGenerics(
      myCategory: currentCategory?? this.myCategory
    );
  }
}