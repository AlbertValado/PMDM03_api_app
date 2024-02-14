import 'package:flutter/material.dart';

import '../models/models.dart';

class CharacterSlider extends StatelessWidget {
  // const MovieSlider({Key? key}) : super(key: key);
  final List<Character> humans;

  const CharacterSlider({super.key, required this.humans});

  @override
  Widget build(BuildContext context) {

    if(this.humans.length == 0){
      return Container(
          width: double.infinity,
          height: 260,
          child: const Center(
            child: CircularProgressIndicator(),
          )
      );
    }
    return Container(
      width: double.infinity,
      height: 260,
      // color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text('Humans!',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          SizedBox(
            height: 5,
          ),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 20,
                //Anam passant el character situat a la posició index de la llista de personatges
                itemBuilder: (_, int index) => _CharacterPoster(character: humans[index])),
          )
        ],
      ),
    );
  }
}

class _CharacterPoster extends StatelessWidget {
  final Character character;

  const _CharacterPoster({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 190,
      // color: Colors.green,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details',
                arguments: character),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'),
                image: NetworkImage(character.image),
                width: 130,
                height: 190,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            character.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
