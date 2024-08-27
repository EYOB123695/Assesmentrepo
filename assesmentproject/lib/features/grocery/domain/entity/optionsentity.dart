import 'package:equatable/equatable.dart';

class GroceryOption extends Equatable {
  final String id;
  final String name;
  final double price;

  GroceryOption({
    required this.id,
    required this.name,
    required this.price,
  });
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
    };
  }

  @override
  List<Object?> get props => [id, name, price];
}
