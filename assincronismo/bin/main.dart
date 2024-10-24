import 'package:http/http.dart';
import 'dart:convert';
import 'package:assincronismo/api_key.dart';

void main() {
  print("Olá, mundo!");
  // requestData();
  // requestDataAsync();
  sendDataAsync(
    {
      "id" : "NEW001",
      "name" : "Leo",
      "lastName" : "Correia",
      "balance" : 5000,
    }
  );
}

requestData(){
  String url = "https://gist.githubusercontent.com/leovcorreia/9c1bf15f600dd6dea713d6b4db8162b9/raw/e5b86cc327efd806f243c46e9f41549b5a53bd22/accounsts.json";
  Uri uri = Uri.parse(url);

  Future<Response> futureResponse = get(uri);
  print(futureResponse);

  futureResponse.then(
    (Response response) {
      print(response);
      print(response.body);

      List<dynamic> listAccounts = json.decode(response.body);
      
      Map<String, dynamic> mapCarla = listAccounts.firstWhere(
        (element) => element["name"] == "Carla",
      );
      print("Saldo da Carla: ");
      print(mapCarla["balance"]);
    },
  );

  print("Ultima coisa");
}

Future<List<dynamic>> requestDataAsync() async {
   String url = "https://gist.githubusercontent.com/leovcorreia/9c1bf15f600dd6dea713d6b4db8162b9/raw/e5b86cc327efd806f243c46e9f41549b5a53bd22/accounsts.json";

   Response response = await get(Uri.parse(url));

   return json.decode(response.body);
}

sendDataAsync(Map<String, dynamic> mapAccount) async {
  List<dynamic> listAccounts = await requestDataAsync();

  listAccounts.add(mapAccount);
  String content = json.encode(listAccounts);
  
  String url = "https://api.github.com/gists/9c1bf15f600dd6dea713d6b4db8162b9";

  Response response = await post(
    Uri.parse(url),
     headers: {"Authorization" : "Bearer $apiKey"},
     body: json.encode({
      "description" : "account.json",
      "public" : true,
      "files" : {
        "accounts.json" : {
          "content" : content,
        }
      }
     }),
     );

  print(response.statusCode);
}
