import 'package:flutter/material.dart';
import 'package:movies_app/models/models.dart';
import 'package:movies_app/widgets/widgets.dart';


//La pàgina de detalls rep un Character i el va passant
//entre els diferents widgets per extreure'n la informació
class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final Character character =
        ModalRoute.of(context)?.settings.arguments as Character;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(character: character,),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                _ImageAndName(character: character),
                _Overview(character: character),
                //CastingCards(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  final Character character;

  const _CustomAppBar({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    // Exactament igual que la AppBaer però amb bon comportament davant scroll
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          color: Colors.black12,
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            character.name,
            style: TextStyle(fontSize: 16),
          ),
        ),
        background: FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage(character.image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _ImageAndName extends StatelessWidget {
  final Character character;

  const _ImageAndName({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: AssetImage('assets/loading.gif'),
              image: NetworkImage(character.image),
              height: 150,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            children: [
              Text(
                character.name,
                style: textTheme.headlineSmall,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Text(
                character.species,
                style: textTheme.titleMedium,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Row(
                children: [
                  const Icon(Icons.star_outline, size: 15, color: Colors.grey),
                  const SizedBox(width: 5),
                  Text(character.status, style: textTheme.bodySmall),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  final Character character;

  const _Overview({super.key, required this.character});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child:
      Column(children: [
        Text(
          "Type: ${character.type}",
          textAlign: TextAlign.justify,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Text("Gender: ${character.gender}",
          textAlign: TextAlign.justify,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Text("Origin: ${character.origin.name}",
          textAlign: TextAlign.justify,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ],)
    );
  }
}
