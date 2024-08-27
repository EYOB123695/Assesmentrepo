import 'package:assesmentproject/features/grocery/domain/entity/groceryentity.dart';
import 'package:assesmentproject/features/grocery/presentation/widgets/productcard.dart';
import 'package:flutter/material.dart';

class ProductGrid extends StatelessWidget {
  final List<GroceryEntity> products;

  const ProductGrid({
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(8.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Number of columns
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        childAspectRatio: 0.8, // Adjust based on your design needs
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return ProductCard(
          product: product, // Pass the entire GroceryEntity
        );
      },
    );
  }
}
