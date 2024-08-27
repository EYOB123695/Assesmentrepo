import 'package:assesmentproject/features/grocery/domain/entity/groceryentity.dart';
import 'package:equatable/equatable.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class AddProductToCart extends CartEvent {
  final GroceryEntity product;
  final int quantity;

  const AddProductToCart({required this.product, this.quantity = 1});

  @override
  List<Object> get props => [product, quantity];
}

class RemoveProductFromCart extends CartEvent {
  final GroceryEntity product;

  const RemoveProductFromCart({required this.product});

  @override
  List<Object> get props => [product];
}

class UpdateProductQuantityInDetails extends CartEvent {
  final int quantity;

  const UpdateProductQuantityInDetails({required this.quantity});

  @override
  List<Object> get props => [quantity];
}
