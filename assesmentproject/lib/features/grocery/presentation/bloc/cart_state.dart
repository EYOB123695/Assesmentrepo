import 'package:assesmentproject/features/grocery/domain/entity/groceryentity.dart';
import 'package:equatable/equatable.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartEmpty extends CartState {}

class CartLoaded extends CartState {
  final List<GroceryEntity> products;
  final double totalPrice;

  const CartLoaded({required this.products, required this.totalPrice});

  @override
  List<Object> get props => [products, totalPrice];
}

class ProductQuantityUpdated extends CartState {
  final int quantity;

  const ProductQuantityUpdated({required this.quantity});

  @override
  List<Object> get props => [quantity];
}
