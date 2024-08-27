import 'package:assesmentproject/core/error/failure.dart';
import 'package:assesmentproject/features/grocery/domain/entity/groceryentity.dart';
import 'package:assesmentproject/features/grocery/domain/repository/groceryrepo.dart';
import 'package:dartz/dartz.dart';

class GetgroceryUseCase {
  GroceryRepository groceryRepository;
  GetgroceryUseCase({required this.groceryRepository});
  Future<Either<Failure, GroceryEntity>> execute(String id) {
    return groceryRepository.getgrocery(id);
  }
}
