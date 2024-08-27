import 'package:assesmentproject/features/grocery/data/model/Grocerymodel.dart';
import 'package:assesmentproject/features/grocery/data/model/optionsmodel.dart';
import 'package:assesmentproject/features/grocery/domain/entity/groceryentity.dart';
import 'package:assesmentproject/features/grocery/domain/entity/optionsentity.dart';

extension GroceryModelMapper on GroceryModel {
  GroceryEntity toEntity() {
    return GroceryEntity(
      id: id,
      title: title,
      imageUrl: imageUrl,
      rating: rating,
      price: price,
      discount: discount,
      description: description,
      options: options
          .map((option) => GroceryOption(
                id: option.id,
                name: option.name,
                price: option.price,
              ))
          .toList(),
    );
  }
}

extension GroceryEntityMapper on GroceryEntity {
  GroceryModel toModel() {
    return GroceryModel(
      id: id,
      title: title,
      imageUrl: imageUrl,
      rating: rating,
      price: price,
      discount: discount,
      description: description,
      options: options
          .map((option) => GroceryOptionModel(
                id: option.id,
                name: option.name,
                price: option.price,
              ))
          .toList(),
    );
  }
}
