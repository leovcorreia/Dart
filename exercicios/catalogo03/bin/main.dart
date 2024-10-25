import 'package:http/http.dart';
import 'dart:convert';

void main() {
  String responseBody = '''
  [
    {"id": 1, "name": "Celular", "price": 1200.75},
    {"id": 2, "name": "Notebook", "price": 3500.10},
    {"id": 3, "name": "Tablet", "price": 1500.00}
  ]
  ''';

  List<dynamic> products = json.decode(responseBody);

  Map<String, dynamic> newProduct = {
    "id" : 4,
    "name" : "Computador",
    "price" : 4000.00
  };

  products.add(newProduct);

  String updatedProducts = json.encode(products);

  print(updatedProducts);

}
