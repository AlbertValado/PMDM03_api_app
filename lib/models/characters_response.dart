import 'models.dart';

//Fent servir Quicktype hem mapejat la resposta de l'API en dues classes
//Una és la resposta en sí que conté una llista d'elements de tipus Character
class CharactersResponse {
  Info info;
  List<Character> characters;

  CharactersResponse({
    required this.info,
    required this.characters,
  });

  factory CharactersResponse.fromJson(String str) => CharactersResponse.fromMap(json.decode(str));

  factory CharactersResponse.fromMap(Map<String, dynamic> json) => CharactersResponse(
    info: Info.fromMap(json["info"]),
    characters: List<Character>.from(json["results"].map((x) => Character.fromMap(x))),
  );

}

class Info {
  int count;
  int pages;
  String next;
  dynamic prev;

  Info({
    required this.count,
    required this.pages,
    required this.next,
    required this.prev,
  });

  factory Info.fromJson(String str) => Info.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Info.fromMap(Map<String, dynamic> json) => Info(
    count: json["count"],
    pages: json["pages"],
    next: json["next"],
    prev: json["prev"],
  );

  Map<String, dynamic> toMap() => {
    "count": count,
    "pages": pages,
    "next": next,
    "prev": prev,
  };
}


