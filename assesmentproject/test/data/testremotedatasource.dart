import 'dart:convert';
import 'package:assesmentproject/features/grocery/data/datasource/groceryremotedatasourceimpl.dart';
import 'package:http/http.dart' as http;

import 'package:assesmentproject/features/grocery/data/model/Grocerymodel.dart';

void main() async {
  final client = http.Client();
  final dataSource = GroceryRemoteDataSourceImpl(client: client);

  // Test getGroceries
  try {
    final groceries = await dataSource.getgroceries();
    print('Groceries:');
    for (var grocery in groceries) {
      print(grocery.toJson());
    }
  } catch (e) {
    print('Error fetching groceries: $e');
  } finally {
    client.close();
  }
}
