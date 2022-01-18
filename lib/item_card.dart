import 'package:flutter/material.dart';
import 'package:lyans_creative_task/bottom_sheet_card.dart';
import 'package:lyans_creative_task/card_details_page.dart';
import 'data_model.dart';

class ItemCard extends StatelessWidget {
  final image;
  ItemCard({this.image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            context: context,
            builder: (context) {
              return BottomSheetCard();
            });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.white,
        ),
        child: Image(
          image: NetworkImage(
            image,
          ),
          fit: BoxFit.fill,
          errorBuilder: (BuildContext context, Object fatma, StackTrace trace) {
            return Container(
              color: Colors.blue,
            );
          },
        ),
      ),
    );
  }
}
