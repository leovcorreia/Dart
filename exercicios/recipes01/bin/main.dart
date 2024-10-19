import 'package:http/http.dart';

void main() {
  print("main funcionando!");
  fetchRecipes();
}

Future<void> fetchRecipes() async {
  String url = "https://gist.githubusercontent.com/leovcorreia/967d927882e2efc4db950dbe419accb9/raw/4920a268f1b9bf0b320991d0a8547b8276b846d5/recipes.json";

  Uri uri = Uri.parse(url);

  // Future<Response> futResponse = get(uri);
  
  get(uri).then(
    (Response response) {
      print("Imprimindo response:");
      print(response.body);
    },
  );
}