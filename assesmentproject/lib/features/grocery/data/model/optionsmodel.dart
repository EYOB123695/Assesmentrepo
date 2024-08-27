import 'package:assesmentproject/features/grocery/domain/entity/optionsentity.dart';

class GroceryOptionModel extends GroceryOption {
  GroceryOptionModel({
    required String id,
    required String name,
    required double price,
  }) : super(
          id: id,
          name: name,
          price: price,
        );

  factory GroceryOptionModel.fromJson(Map<String, dynamic> json) {
    return GroceryOptionModel(
      id: json['id'],
      name: json['name'],
      price: (json['price'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
    };
  }
}
