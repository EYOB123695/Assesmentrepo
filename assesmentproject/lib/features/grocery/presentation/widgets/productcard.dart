import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:assesmentproject/features/grocery/domain/entity/groceryentity.dart';

class ProductCard extends StatelessWidget {
  final GroceryEntity product; // Use GroceryEntity

  const ProductCard({
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(
            '/details',
            arguments: product,
          );
        },
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image with heart emoji
                Stack(
                  children: [
                    Center(
                      child: Container(
                        width: 142,
                        height: 100,
                        padding: const EdgeInsets.only(left: 20),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(12.0)),
                          image: DecorationImage(
                            image: NetworkImage(product.imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 8,
                      right: 15,
                      child: CircleAvatar(
                        backgroundColor:
                            Colors.white, // White background for the circle
                        radius: 16, // Adjust the radius as needed
                        child: Icon(
                          Icons.favorite_border, // Heart emoji icon
                          color: Colors.red, // Icon color
                          size: 20, // Adjust size as needed
                        ),
                      ),
                    )
                  ],
                ),
                // Title
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    product.title,
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                // Rating
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 16),
                      SizedBox(width: 4),
                      Text(
                        '${product.rating}',
                        style: GoogleFonts.roboto(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                // Price and Discount Price
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      Text(
                        '\$${product.price}',
                        style: GoogleFonts.roboto(
                          fontSize: 14,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        '\$${product.discount}',
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
