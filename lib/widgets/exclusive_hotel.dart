import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelUi/data/data.dart';
import 'package:travelUi/model/hotel_model.dart';

class ExclisiveHotel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Top Destination',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  letterSpacing: 1.2,
                ),
              ),
              GestureDetector(
                onTap: () {
                  print('see all');
                },
                child: Text(
                  'See All',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
//
            ],
          ),
        ),
        Container(
          height: 300.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: Provider.of<Data>(context).hotels.length,
            itemBuilder: (BuildContext context, int index) {
              Hotel hotel = Provider.of<Data>(context).hotels[index];
              return Container(
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
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                hotel.name,
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                hotel.address,
                                style: TextStyle(fontSize: 13),
//                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(
                                height: 2.0,
                              ),
                              Text(
                                '${hotel.price} / night',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600),
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
                            child: Image(
                              height: 180,
                              width: 180,
                              fit: BoxFit.cover,
                              image: AssetImage(hotel.imageUrl),
                            ),
                          ),
                          // Positioned(
                          //   bottom: 10,
                          //   left: 10,
                          //   child: Column(
                          //     crossAxisAlignment: CrossAxisAlignment.start,
                          //     children: <Widget>[
                          //       Text(
                          //         titleImage,
                          //         style: TextStyle(
                          //           color: Colors.white,
                          //           fontSize: 20,
                          //           fontWeight: FontWeight.w600,
                          //         ),
                          //       ),
                          //       Row(
                          //         children: <Widget>[
                          //           Icon(
                          //             Icons.add_location,
                          //             color: Colors.white,
                          //             size: 18,
                          //           ),
                          //           Text(
                          //             subTitle,
                          //             style: TextStyle(
                          //               color: Colors.white,
                          //               fontSize: 16,
                          //               fontWeight: FontWeight.w500,
                          //             ),
                          //           ),
                          //         ],
                          //       ),
                          //     ],
                          //   ),
                          // )
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
