import 'package:equatable/equatable.dart';
import 'groceryentity.dart'; // Import the GroceryEntity

class CartEntity extends Equatable {
  final GroceryEntity product;
  final int quantity;

  CartEntity({
    required this.product,
    this.quantity = 1, // Default quantity is 1
  });

  CartEntity copyWith({
    GroceryEntity? product,
    int? quantity,
  }) {
    return CartEntity(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  List<Object?> get props => [product, quantity];
}
