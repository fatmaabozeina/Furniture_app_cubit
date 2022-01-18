import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:lyans_creative_task/favorite_items.dart';

class CardDetails extends StatefulWidget {
  String sheetImage;
  CardDetails({this.sheetImage});
  @override
  _CardDetailsState createState() => _CardDetailsState();
}

class _CardDetailsState extends State<CardDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5EEE1),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFF5EEE1),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black45,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return FavouriteItems();
              }));
            },
            icon: Icon(
              Icons.favorite_outline_sharp,
              color: Colors.black45,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('hgjhg'),
            Container(
              child: Image.network(widget.sheetImage),
            ),
            Text(
              '\$149',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                'designer name',
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              'detailsssssssssssssssssssssssss jhjhjkhdsfkjhskdfhjkjhskdfhjksdjhfdetaiiiiiiiiiiiils detaaaaiiiiiilssssssss',
              style: TextStyle(color: Colors.grey, fontSize: 17),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40.0, bottom: 10),
              child: Text(
                'Dimensions',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              children: [
                Text(
                  'total width',
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(
                  width: 100,
                ),
                Text('59cm', style: TextStyle(color: Colors.grey))
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.all(15)),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.amber),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)))),
                  child: Text('\$price| add to cart')),
            )
          ],
        ),
      ),
    );
  }
}
