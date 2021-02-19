import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String image;
  final String title;
  final String subTitle;

  CardWidget({
    Key key,
    @required this.title,
    @required this.image,
    @required this.subTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170.0,
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 8.0),
              child: Image.network(
                image,
                fit: BoxFit.fill,
                height: 245.0,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8.0),
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                  ),
                  Text(
                    subTitle,
                    style: TextStyle(
                        fontWeight: FontWeight.normal, fontSize: 14.0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
