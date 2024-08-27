import 'dart:convert';
import 'package:assesmentproject/features/grocery/data/datasource/groceryremotedatasource.dart';
import 'package:http/http.dart' as http;
import 'package:assesmentproject/features/grocery/data/model/Grocerymodel.dart';
import 'package:assesmentproject/features/grocery/data/model/optionsmodel.dart';
import 'package:assesmentproject/features/grocery/data/model/optionsmodel.dart';
import 'package:assesmentproject/features/grocery/domain/entity/groceryentity.dart';
import 'package:assesmentproject/features/grocery/domain/entity/optionsentity.dart';

class GroceryRemoteDataSourceImpl implements GroceryRemoteDataSource {
  final http.Client client;
  final String baseUrl =
      "https://g5-flutter-learning-path-be.onrender.com/api/v1/groceries";

  GroceryRemoteDataSourceImpl({
    required this.client,
  });

  @override
  Future<GroceryModel> getGrocery(String id) async {
    final url = Uri.parse('$baseUrl/$id');
    final response = await client.get(url);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      // Extract the 'data' field from the response
      final data = json['data'] as Map<String, dynamic>;
      return GroceryModel.fromJson(data);
    } else {
      throw Exception('Failed to load grocery');
    }
  }

  @override
  Future<List<GroceryModel>> getgroceries() async {
    final url = Uri.parse('$baseUrl');
    final response = await client.get(url);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      // Extract the 'data' field which is a list of groceries
      final List<dynamic> data = json['data'];
      return data.map((item) => GroceryModel.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load groceries');
    }
  }
}
