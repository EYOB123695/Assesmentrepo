import 'package:assesmentproject/features/grocery/domain/entity/groceryentity.dart';
import 'package:assesmentproject/features/grocery/presentation/bloc/cart_event.dart';
import 'package:assesmentproject/features/grocery/presentation/bloc/cart_state.dart';
import 'package:assesmentproject/features/grocery/presentation/bloc/cartbloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetailsPage extends StatelessWidget {
  final GroceryEntity product;

  ProductDetailsPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          int quantity = 1;
          if (state is ProductQuantityUpdated) {
            quantity = state.quantity;
          }

          return Stack(
            children: [
              SingleChildScrollView(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 300,
                          margin: EdgeInsets.only(bottom: 50, top: 30),
                          child: Image.network(
                            product.imageUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          top: 40,
                          left: 10,
                          child: CircleAvatar(
                            backgroundColor: Colors.grey[700],
                            child: IconButton(
                              icon: Icon(Icons.arrow_back, color: Colors.white),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            radius: 20,
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          right: 10,
                          top: 190,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: IconButton(
                              icon: Icon(Icons.favorite_border,
                                  color: Colors.red),
                              onPressed: () {
                                // Handle heart icon action
                              },
                            ),
                            radius: 20,
                          ),
                        ),
                      ],
                    ),
                    Text(product.title,
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w600, fontSize: 22)),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          '\$${product.price}',
                          style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w600,
                              fontSize: 22,
                              decoration: TextDecoration.lineThrough),
                        ),
                        SizedBox(width: 10),
                        Text(
                          '\$${product.discount}',
                          style: TextStyle(
                            fontSize: 20,
                            color: const Color(0XFF6347),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.yellow),
                        Text('${product.rating}'),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Description:',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Text(
                      product.description.length > 100
                          ? '${product.description.substring(0, 100)}...'
                          : product.description,
                      maxLines: product.description.length > 100 ? 3 : null,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (product.description.length > 100)
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) => Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: SingleChildScrollView(
                                  child: Text(product.description),
                                ),
                              ),
                            );
                          },
                          child: Text(
                            'See more',
                            style: TextStyle(
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                    SizedBox(height: 20),
                    Text(
                      'Additional Options',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: product.options.map((option) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(option.name),
                            Text('\$${option.price.toStringAsFixed(2)}'),
                          ],
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: () {
                            if (quantity > 1) {
                              context.read<CartBloc>().add(
                                  UpdateProductQuantityInDetails(
                                      quantity: quantity - 1));
                            }
                          },
                        ),
                        Expanded(
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: Text(
                                '$quantity',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            context.read<CartBloc>().add(
                                UpdateProductQuantityInDetails(
                                    quantity: quantity + 1));
                          },
                        ),
                        SizedBox(width: 19),
                        ElevatedButton(
                          onPressed: () {
                            context.read<CartBloc>().add(AddProductToCart(
                                product: product, quantity: quantity));
                          },
                          child: Text('Add to Basket'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Color(0xFFFF6347), // Set the background color
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(28),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
