import 'package:http/http.dart';
import 'dart:convert';
import 'package:catalogo03/github_api_key.dart';

void main() {

  print("Teste");

  Map<String, dynamic> newProduct = {
    "id" : 4,
    "name" : "Computador",
    "price" : 4000.00
  };

  sendNewData(newProduct);
}

sendNewData(Map<String, dynamic> newProduct) async {

  String url = "https://gist.githubusercontent.com/leovcorreia/7d995951139f3e35d02022ddaf623615/raw/6f7841d0674ada99b8ff9e0eec7fc4ab9ed3cea8/products.json";
  
  Response res = await get(Uri.parse(url));

  List<dynamic> listProducts = json.decode(res.body);
  listProducts.add(newProduct);
  String updatedProducts = json.encode(listProducts);

  url = "https://api.github.com/gists/7d995951139f3e35d02022ddaf623615";

  res = await post(
    Uri.parse(url),
      headers: {"Authorization" : "Bearer $apiKey"},
      body: json.encode({
        "description" : "adicionando produto no products.json",
        "public" : true,
        "files" : {
          "products.json" : {
            "content" : updatedProducts,
          }
        }
      }),
  );

  print(res.statusCode);

}
