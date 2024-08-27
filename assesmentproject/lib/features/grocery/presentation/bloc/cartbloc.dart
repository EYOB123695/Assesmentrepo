import 'package:assesmentproject/features/grocery/domain/entity/groceryentity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cart_event.dart';
import 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartEmpty());

  final List<GroceryEntity> _cart = [];
  int _currentProductQuantity = 1; // Tracks the quantity in the details page

  @override
  Stream<CartState> mapEventToState(CartEvent event) async* {
    if (event is AddProductToCart) {
      yield* _mapAddProductToCart(event);
    } else if (event is RemoveProductFromCart) {
      yield* _mapRemoveProductFromCart(event);
    } else if (event is UpdateProductQuantityInDetails) {
      yield* _mapUpdateProductQuantityInDetails(event);
    }
  }

  Stream<CartState> _mapAddProductToCart(AddProductToCart event) async* {
    for (int i = 0; i < event.quantity; i++) {
      _cart.add(event.product);
    }
    yield CartLoaded(products: _cart, totalPrice: _calculateTotalPrice());
  }

  Stream<CartState> _mapRemoveProductFromCart(
      RemoveProductFromCart event) async* {
    _cart.remove(event.product);
    if (_cart.isEmpty) {
      yield CartEmpty();
    } else {
      yield CartLoaded(products: _cart, totalPrice: _calculateTotalPrice());
    }
  }

  Stream<CartState> _mapUpdateProductQuantityInDetails(
      UpdateProductQuantityInDetails event) async* {
    _currentProductQuantity = event.quantity;
    yield ProductQuantityUpdated(quantity: _currentProductQuantity);
  }

  double _calculateTotalPrice() {
    return _cart.fold(
        0.0,
        (total, current) =>
            total + (current.price * (1 - current.discount / 100)));
  }
}
