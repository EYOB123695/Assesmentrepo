import 'package:assesmentproject/core/error/failure.dart';
import 'package:assesmentproject/features/grocery/domain/entity/groceryentity.dart';
import 'package:dartz/dartz.dart';

abstract class GroceryRepository {
  Future<Either<Failure, GroceryEntity>> getgrocery(String id);
  Future<Either<Failure, List<GroceryEntity>>> getgroceries();
}
