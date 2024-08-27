import 'package:assesmentproject/features/grocery/domain/entity/groceryentity.dart';
import 'package:assesmentproject/features/grocery/domain/usecase/getgroceries.dart';
import 'package:assesmentproject/features/grocery/presentation/bloc/cartbloc.dart';
import 'package:assesmentproject/features/grocery/presentation/bloc/homescreen_bloc.dart';
import 'package:assesmentproject/features/grocery/presentation/pages/custompageroute.dart';
import 'package:assesmentproject/features/grocery/presentation/pages/detailscreen.dart';
import 'package:assesmentproject/features/grocery/presentation/pages/homescreen.dart';
import 'package:assesmentproject/features/grocery/presentation/pages/splashscreen.dart'; // Import the splash screen
import 'package:assesmentproject/getit_service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await init();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => HomescreenBloc(
                  getGroceriesUseCase: GetIt.instance<GetgroceriesUseCase>(),
                )),
        BlocProvider(create: (context) => CartBloc()),
        // Other BlocProviders can be uncommented and configured as needed
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter task',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SplashScreen(), // Set SplashScreen as the initial screen
      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return CustomPageRoute(page: Homescreen(), settings: settings);
          case '/details':
            final product = settings.arguments as GroceryEntity;
            return CustomPageRoute(
              page: ProductDetailsPage(product: product),
              settings: settings,
            );

          default:
            return null;
        }
      },
    );
  }
}
