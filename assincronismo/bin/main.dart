import 'package:http/http.dart';

void main() {
  print("Olá, mundo!");
  requestData();
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
    },
  );
}
