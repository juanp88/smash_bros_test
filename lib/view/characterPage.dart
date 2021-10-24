import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:smash_test/models/character_model.dart';

class CharacterPage extends StatefulWidget {
  const CharacterPage({Key? key}) : super(key: key);

  @override
  _CharacterPageState createState() => _CharacterPageState();
}

class _CharacterPageState extends State<CharacterPage> {
  @override
  Widget build(BuildContext context) {
    final routeData =
        ModalRoute.of(context)!.settings.arguments as CharacterModel;

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)),
        title: Text("data"),
      ),
      body: Column(
        children: [
          Container(
            //color: Colors.amber,
            //width: 200,
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    // color: Colors.amberAccent,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(routeData.name),
                        Text(routeData.universe),
                        Container(
                          height: 20,
                        ),
                        RatingBarIndicator(
                          rating: routeData.rate.toDouble(),
                          itemBuilder: (context, index) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          itemCount: 5,
                          itemSize: 25.0,
                          direction: Axis.horizontal,
                        ),
                        Text('Downloads: ' + routeData.downloads),
                        Container(
                          height: 20,
                        ),
                        Container(
                          height: 40,
                          width: 50,
                          child: FloatingActionButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0))),
                              onPressed: null,
                              child: Text('\$' + routeData.price)),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Image.network(
                    routeData.imageUrl,
                    height: 150,
                    width: 150,
                  ),
                )
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                    padding: EdgeInsets.all(10),
                    child: Text(routeData.description)),
              )
            ],
          )
        ],
      ),
    );
  }
}
