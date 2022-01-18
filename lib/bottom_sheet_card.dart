import 'package:flutter/material.dart';
import 'card_details_page.dart';
import 'package:carousel_slider/carousel_slider.dart';

class BottomSheetCard extends StatefulWidget {
  @override
  _BottomSheetCardState createState() => _BottomSheetCardState();
}

class _BottomSheetCardState extends State<BottomSheetCard> {
  int _current = 0;
  List<String> imgList = [
    'https://images.unsplash.com/photo-1550226891-ef816aed4a98?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGZ1cm5pdHVyZXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1554295405-abb8fd54f153?ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8ZnVybml0dXJlfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1616464916356-3a777b2b60b1?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mjl8fGZ1cm5pdHVyZXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60'
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 30,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ListTile(
            leading: Text('\$5433'),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imgList.map((url) {
                int index = imgList.indexOf(url);
                return Container(
                  width: 12,
                  height: 12,
                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _current == index ? Colors.amber : Colors.yellow),
                );
              }).toList(),
            ),
            trailing: Icon(
              Icons.favorite_border_sharp,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return CardDetails(
                  sheetImage: imgList[_current],
                );
              }));
            },
            child: CarouselSlider(
              items: imgList
                  .map((item) => Container(
                        child: Image.network(
                          item,
                          fit: BoxFit.fill,
                          width: 400,
                        ),
                      ))
                  .toList(),
              options: CarouselOptions(
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 2.0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  }),
            ),
          )
        ],
      ),
    );
  }
}
