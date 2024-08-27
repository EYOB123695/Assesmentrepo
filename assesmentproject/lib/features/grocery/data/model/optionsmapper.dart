import 'package:assesmentproject/features/grocery/domain/entity/optionsentity.dart';
import 'package:assesmentproject/features/grocery/data/model/optionsmodel.dart';

extension GroceryOptionModelMapper on GroceryOptionModel {
  GroceryOption toEntity() {
    return GroceryOption(
      id: id,
      name: name,
      price: price,
    );
  }
}

extension GroceryOptionMapper on GroceryOption {
  GroceryOptionModel toModel() {
    return GroceryOptionModel(
      id: id,
      name: name,
      price: price,
    );
  }
}
