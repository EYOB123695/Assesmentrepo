import 'package:assesmentproject/features/grocery/presentation/bloc/homescreen_bloc.dart';
import 'package:assesmentproject/features/grocery/presentation/widgets/gridview.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<HomescreenBloc>().add(LoadGroceriesEvent());

    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'lib/assets/burgerimage.png',
                width: 24,
                height: 24,
              ),
              const SizedBox(width: 8),
              Text(
                'Burger',
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF0D1217),
                ),
              ),
            ],
          ),
        ),
        toolbarHeight: 80,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                suffixIcon: Icon(Icons.filter_alt),
                hintText: 'Search',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: BlocBuilder<HomescreenBloc, HomescreenState>(
                builder: (context, state) {
                  if (state is HomeScreenLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is HomeScreenLoaded) {
                    return ProductGrid(products: state.groceries);
                  } else if (state is HomeScreenLoadingFailed) {
                    return Center(child: Text(state.message));
                  } else {
                    return Center(child: Text('Something went wrong!'));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
