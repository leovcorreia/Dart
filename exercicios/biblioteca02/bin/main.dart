import 'package:http/http.dart';
import 'dart:convert';
import 'dart:io';

void main() {

  print("Qual autor(a) vc quer buscar os livros?");
  String? author = stdin.readLineSync();

  while (author == null) {
    print("Autor(a) inválido(a). Tente novamente!");
    author = stdin.readLineSync();
  }

  workingWithData(author);
}

Future<void> workingWithData(String author) async {
  String url = "https://raw.githubusercontent.com/alura-cursos/dart_assincronismo_api/aula05/.json/books.json";

  // Fazendo a requisição HTTP
  Response res = await get(Uri.parse(url));

  // Decodificando o JSON da resposta em uma lista de objetos/mapas
  List<dynamic> listBooks = json.decode(res.body);
  print(listBooks);

  print("\n");
  if (author != null) {
    List<dynamic> booksByAuthor = listBooks.where((book) => book["author"] == author).toList();
    for (dynamic book in booksByAuthor) {
      print("Título: ${book["title"]}");
    }
  } 

}