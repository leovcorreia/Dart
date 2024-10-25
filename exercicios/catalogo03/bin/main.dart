import 'package:http/http.dart';
import 'dart:convert';
import 'package:catalogo03/github_api_key.dart';

void main() {

  print("Teste");

  List<Map<String, dynamic>> newProducts = [
    {
      "id": 5,
      "name": "Teclado",
      "price": 200.00
    },
    {
      "id": 6,
      "name": "Mouse",
      "price": 100.00
    }
  ];

  sendNewData(newProducts, "Periféricos");
}

sendNewData(List<Map<String, dynamic>> newProducts, String nameList) async {

  Uri url = Uri.parse("https://api.github.com/gists/7d995951139f3e35d02022ddaf623615");

  String content = json.encode(newProducts);

  Response res = await post(
    url,
      headers: {"Authorization" : "Bearer $apiKey"},
      body: json.encode({
        "description" : nameList,
        "public" : true,
        "files" : {
          "${nameList.toLowerCase().replaceAll(" ", "")}.json" : {
            "content" : content,
          }
        }
      }),
  );

  print(res.statusCode);

}
