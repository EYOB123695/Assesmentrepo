import 'package:assesmentproject/core/error/failure.dart';
import 'package:assesmentproject/features/grocery/domain/entity/groceryentity.dart';
import 'package:assesmentproject/features/grocery/domain/repository/groceryrepo.dart';
import 'package:dartz/dartz.dart';

class GetgroceriesUseCase {
  GroceryRepository groceryRepository;
  GetgroceriesUseCase({required this.groceryRepository});
  Future<Either<Failure, List<GroceryEntity>>> execute() {
    return groceryRepository.getgroceries();
  }
}
