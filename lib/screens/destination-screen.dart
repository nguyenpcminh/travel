import 'package:flutter/material.dart';
import 'package:travelUi/model/activity_model.dart';
import 'package:travelUi/model/destination_model.dart';

class DestinationScreen extends StatefulWidget {
  final Destination data;

  DestinationScreen({this.data});

  @override
  _DestinationScreenState createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> {
  @override
  void initState() {
    super.initState();
    print(widget.data);
  }

  Text _buildRating(int rating) {
    String starts = '';
    for (int i = 0; i < rating; i++) {
      starts += '⭐';
    }
    return Text(starts);
  }

  MediaQueryData _mediaQueryData;

  @override
  Widget build(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 300,
                width: _mediaQueryData.size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  child: Hero(
                    tag: widget.data.imageUrl,
                    child: Image(
                      fit: BoxFit.cover,
                      image: AssetImage(widget.data.imageUrl),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        size: 30,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Row(
                      children: <Widget>[
                        IconButton(
                            icon: Icon(
                              Icons.search,
                              size: 30,
                            ),
                            onPressed: () {}),
                        IconButton(
                          icon: Icon(
                            Icons.sort,
                            size: 30,
                          ),
                          onPressed: () {},
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 20,
                bottom: 20,
                child: Icon(
                  Icons.location_on,
                  size: 25,
                  color: Colors.white70,
                ),
              ),
              Positioned(
                left: 20,
                bottom: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.data.city,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.location_on,
                          size: 20,
                          color: Colors.white,
                        ),
                        Text(
                          widget.data.country,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.data.activities.length,
              itemBuilder: (BuildContext context, int index) {
                Activity activity = widget.data.activities[index];
                return Stack(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(40, 5, 20, 5),
                      height: 170,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(100, 20, 20, 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  width: 140,
                                  child: Text(
                                    activity.name,
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                ),
                                Column(
                                  children: <Widget>[
                                    Text(
                                      '\$${activity.price}',
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text('per tax'),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(activity.type),
                            SizedBox(
                              height: 5,
                            ),
                            _buildRating(activity.rating),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 5),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).accentColor,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(activity.startTimes[0]),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 5),
                                  // alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).accentColor,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(activity.startTimes[1]),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 15,
                      left: 20,
                      bottom: 15,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image(
                          width: 110,
                          image: AssetImage(activity.imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
