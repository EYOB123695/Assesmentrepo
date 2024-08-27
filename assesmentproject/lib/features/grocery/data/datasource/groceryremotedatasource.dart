import 'package:assesmentproject/features/grocery/data/model/Grocerymodel.dart';

abstract class GroceryRemoteDataSource {
  Future<GroceryModel> getGrocery(String id);
  Future<List<GroceryModel>> getgroceries();
}
