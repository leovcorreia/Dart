import 'package:http/http.dart';
import 'dart:convert';

void main() {
  workingWithJson(["1 lata de leite condensado",
            "2 colheres de sopa de cacau em pó",
            "1 colher de sopa de manteiga",
            "Chocolate granulado a gosto"]);
}

Future<void> workingWithJson(List<String> availableIngredients) async {
  String url = "https://raw.githubusercontent.com/alura-cursos/dart_assincronismo_api/aula05/.json/recipes.json";

  Response res = await get(Uri.parse(url));

  List<dynamic> recipes = json.decode(res.body);
  print(recipes);

  List<String> availableRecipes = [];

  for (dynamic recipe in recipes) {
    List<String> ingredients = List<String>.from(recipe["ingredients"]);

    if (ingredients.every((ingredient) => availableIngredients.contains(ingredient))) {
      availableRecipes.add(recipe["name"]);
    }
  }

  print("Receitas que podem ser feitas: ");
  for (dynamic recipe in availableRecipes) {
    print(recipe);
  }

}