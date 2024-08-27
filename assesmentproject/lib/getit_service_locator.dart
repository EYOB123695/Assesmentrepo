import 'package:assesmentproject/features/grocery/data/datasource/groceryremotedatasourceimpl.dart';
import 'package:assesmentproject/features/grocery/data/repository/geroceryrepoimpl.dart';
import 'package:assesmentproject/features/grocery/domain/repository/groceryrepo.dart';
import 'package:assesmentproject/features/grocery/domain/usecase/getgroceries.dart';
import 'package:assesmentproject/features/grocery/domain/usecase/getgrocery.dart';
import 'package:assesmentproject/features/grocery/presentation/bloc/cartbloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:assesmentproject/core/constants/network/networkinfo.dart';
import 'package:assesmentproject/features/grocery/data/datasource/groceryremotedatasource.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  // External dependencies
  getIt.registerLazySingleton<http.Client>(() => http.Client());
  getIt.registerLazySingleton<InternetConnectionChecker>(
    () => InternetConnectionChecker(),
  );
  getIt.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(getIt<InternetConnectionChecker>()),
  );

  // Data sources
  getIt.registerLazySingleton<GroceryRemoteDataSource>(
      () => GroceryRemoteDataSourceImpl(client: getIt()));

  // Repositories
  getIt.registerLazySingleton<GroceryRepository>(
      () => Geroceryrepoimpl(getIt(), getIt()));

  // Use cases
  getIt.registerLazySingleton<GetgroceriesUseCase>(
      () => GetgroceriesUseCase(groceryRepository: getIt()));

  getIt.registerLazySingleton<GetgroceryUseCase>(
      () => GetgroceryUseCase(groceryRepository: getIt()));
  getIt.registerFactory<CartBloc>(() => CartBloc());
}
