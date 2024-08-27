import 'package:assesmentproject/core/constants/network/networkinfo.dart';
import 'package:assesmentproject/core/error/exceptions.dart';
import 'package:assesmentproject/core/error/failure.dart';
import 'package:assesmentproject/features/grocery/data/datasource/groceryremotedatasource.dart';
import 'package:assesmentproject/features/grocery/data/model/grocerymaper.dart';
import 'package:assesmentproject/features/grocery/domain/entity/groceryentity.dart';
import 'package:assesmentproject/features/grocery/domain/repository/groceryrepo.dart';
import 'package:dartz/dartz.dart';

class Geroceryrepoimpl extends GroceryRepository {
  final GroceryRemoteDataSource _groceryRemoteDataSource;
  // final GroceryLocalDataSource _groceryLocalDataSource;
  final NetworkInfo _networkInfo;

  Geroceryrepoimpl(
    this._networkInfo,
    this._groceryRemoteDataSource,
    // this._productLocalDataSource,
  );
  @override
  Future<Either<Failure, GroceryEntity>> getgrocery(String id) async {
    if (await _networkInfo.isConnected) {
      try {
        final grocery = await _groceryRemoteDataSource.getGrocery(id);
        return Right(grocery.toEntity());
      } on ServerException {
        return const Left(ServerFailure("An error has occurred"));
      } on SocketException {
        return const Left(
            ConnectionFailure("Failed to connect to the network"));
      }
    } else {
      return Left(const NetworkFailure("No internet connection"));
    }
  }

  @override
  Future<Either<Failure, List<GroceryEntity>>> getgroceries() async {
    if (await _networkInfo.isConnected) {
      try {
        final groceries = await _groceryRemoteDataSource.getgroceries();
        final entityofgroceries =
            groceries.map((grocerymodel) => grocerymodel.toEntity()).toList();
        return Right(entityofgroceries);
      } on ServerException {
        return const Left(ServerFailure("An error has occurred"));
      } on SocketException {
        return const Left(
            ConnectionFailure("Failed to connect to the network"));
      }
    } else {
      return Left(const NetworkFailure("No internet connection"));
    }
  }
}
