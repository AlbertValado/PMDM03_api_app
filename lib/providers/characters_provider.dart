import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../models/models.dart';

class CharactersProvider extends ChangeNotifier{

  String _baseUrl = "rickandmortyapi.com";
  String _species = "human";

  List<Character> characters =[];
  List<Character> humans = [];

  CharactersProvider(){
    print("Characters Provider inicialitzat");
    this.getCharacters();
    this.getHumanCharacters();
  }

  //aquest mètode ens proporciona un llistat de personatges
  getCharacters() async{
    print('getCharacters');
    var url =
    Uri.https(_baseUrl, "api/character");

    // esperam la resposta de l' http get, i decodificam la resposta que ve en format json
    final result = await http.get(url);

    final charactersResponse = CharactersResponse.fromJson(result.body);

    characters = charactersResponse.characters;

    notifyListeners();
  }

  //aquest mètode ens proporciona un llistat de personatge humans
  getHumanCharacters() async{
    print('getHumans');
    var url = Uri.https(
      _baseUrl,
      "api/character",
      {'species': _species},
      //en aquest cas, especificam una key amb un valor per obtenir un resultat específic
    );

    final result = await http.get(url);
    final humansResponse = CharactersResponse.fromJson(result.body);

    humans = humansResponse.characters;

    notifyListeners();
  }
}