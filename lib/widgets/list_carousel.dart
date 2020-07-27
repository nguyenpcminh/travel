import 'package:flutter/material.dart';
import 'package:travelUi/model/destination_model.dart';
import 'package:travelUi/screens/destination-screen.dart';

class ListCarousel extends StatelessWidget {
  final List activities;
  final String description;
  final String titleImage;
  final String subTitle;
  final String imageUrl;
  final IconData nameIcon;
  final Destination data;

  ListCarousel({
    this.activities,
    this.description,
    this.imageUrl,
    this.nameIcon,
    this.titleImage,
    this.subTitle,
    this.data,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DestinationScreen(
              data: data,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.all(10),
        width: 210,
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Positioned(
              bottom: 15.0,
              child: Container(
                width: 200,
                height: 110,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 2),
                        color: Colors.black26,
                        blurRadius: .7,
                        spreadRadius: .5,
                      )
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '${activities.length} activities',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        description,
                        style: TextStyle(fontSize: 13),
//                                overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 2),
                    color: Colors.black26,
                    blurRadius: .6,
                    spreadRadius: .5,
                  ),
                ],
              ),
              child: Stack(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Hero(
                      tag: imageUrl,
                      child: Image(
                        height: 180,
                        width: 180,
                        fit: BoxFit.cover,
                        image: AssetImage(imageUrl),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 10,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          titleImage,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.add_location,
                              color: Colors.white,
                              size: 18,
                            ),
                            Text(
                              subTitle,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
