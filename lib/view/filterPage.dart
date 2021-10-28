import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:provider/provider.dart';
import 'package:smash_test/constant.dart';
import 'package:smash_test/providers/sort_provider.dart';
import 'package:smash_test/widgets/radiolist.dart';

class FilterPage extends StatefulWidget {
  FilterPage({Key? key}) : super(key: key);

  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  double ratingValue = 0.0;
  BeveledRectangleBorder buttonShape =
      BeveledRectangleBorder(borderRadius: BorderRadius.circular(2));

  @override
  Widget build(BuildContext context) {
    final filterinfo = Provider.of<SortProvider>(context);
    var deviceWidth = MediaQuery.of(context).size.width;
    var deviceHeight = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: bgFilter,
      appBar: AppBar(
        title: Text("Filters"),
        leading: GestureDetector(
          child: Icon(Icons.arrow_back),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              color: Platform.isAndroid ? Colors.white : bgFilter,
              height: 40,
              padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
              alignment: Alignment.centerLeft,
              child: Text(
                'Sort by',
                textAlign: TextAlign.left,
              ),
            ),
            Container(child: TextRadioList()),
            Container(
              height: 20,
            ),
            //Contenedor Filter by - Ratingbar
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Container(
                    color: Platform.isAndroid ? Colors.white : bgFilter,
                    height: 40,
                    padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'filter by',
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Platform.isIOS
                      ? Divider(
                          height: 1,
                        )
                      : Container(
                          height: 0,
                        ),
                  Container(
                      height: MediaQuery.of(context).size.width * 0.3,
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white,
                      child: RatingStars(
                        value: filterinfo.rate,
                        onValueChanged: (v) {
                          //
                          filterinfo.setRate(v);
                        },
                        starBuilder: (index, color) => Icon(
                          Icons.star_outlined,
                          color: color,
                        ),
                        starCount: 5,
                        starSize: 50,
                        maxValue: 5,
                        starSpacing: 0,
                        maxValueVisibility: true,
                        valueLabelVisibility: false,
                        animationDuration: Duration(milliseconds: 10),
                        starOffColor: const Color(0xffe7e8ea),
                        starColor: Colors.yellow,
                      )
                      //     RatingBar.builder(
                      //   itemBuilder: (context, _) => Icon(
                      //     Icons.star,
                      //     color: Colors.amber,
                      //   ),
                      //   initialRating: 0.0,
                      //   onRatingUpdate: (rating) {
                      //     print(rating);
                      //   },
                      // ),
                      ),
                ],
              ),
            ),
            //Contenedor botones Apply-Reset
            Expanded(
              //alignment: Alignment.bottomCenter,
              child: ButtonBar(
                alignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: deviceWidth * 0.45,
                    child: FloatingActionButton.extended(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.white,
                        shape: Platform.isIOS ? null : buttonShape,
                        heroTag: 'Reset',
                        onPressed: () {
                          filterinfo.setSelectedButton(0);
                          filterinfo.setRate(0.0);
                        },
                        label: Text('Reset')),
                  ),
                  Container(
                    width: deviceWidth * 0.45,
                    child: FloatingActionButton.extended(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.white,
                        shape: Platform.isIOS ? null : buttonShape,
                        heroTag: 'Apply',
                        onPressed: () {},
                        label: Text('Apply')),
                  )
                ],
              ),
            )
          ]),
    );
  }
}
