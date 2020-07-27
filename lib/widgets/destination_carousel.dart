import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelUi/data/data.dart';
import 'package:travelUi/model/destination_model.dart';

import 'list_carousel.dart';

class DestinationCarousel extends StatelessWidget {
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
            itemCount: Provider.of<Data>(context).destinations.length,
            itemBuilder: (BuildContext context, int index) {
              Destination destination =
                  Provider.of<Data>(context).destinations[index];
              return ListCarousel(
                activities: destination.activities,
                description: destination.description,
                nameIcon: Icons.add_location,
                imageUrl: destination.imageUrl,
                titleImage: destination.city,
                subTitle: destination.country,
                data: destination,
              );
            },
          ),
        ),
      ],
    );
  }
}
