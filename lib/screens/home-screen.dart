import 'package:flutter/material.dart';
import 'package:travelUi/widgets/destination_carousel.dart';
import 'package:travelUi/widgets/exclusive_hotel.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectIcon = 0;
  int _currentTab = 0;

  List<IconData> _icons = [
    Icons.airplanemode_active,
    Icons.directions_car,
    Icons.directions_walk,
    Icons.motorcycle,
  ];

  void _onTapped(int index) {
    setState(() {
      _currentTab = index;
    });
    print('currenttab : $_currentTab');
  }

  GestureDetector _buildIcon(int idx) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectIcon = idx;
        });
        print(_selectIcon);
      },
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: _selectIcon == idx
              ? Theme.of(context).accentColor
              : Color(0xFFE7BEE),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Icon(
          _icons[idx],
          size: 30.0,
          color: _selectIcon == idx
              ? Theme.of(context).primaryColor
              : Color(0xFFB4C1C4),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 20, right: 120),
              child: Text(
                'What you would like to find?',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:
                  _icons.asMap().entries.map((e) => _buildIcon(e.key)).toList(),
            ),
            SizedBox(
              height: 20,
            ),
            DestinationCarousel(),
            ExclisiveHotel()
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTab,
        onTap: _onTapped,
        selectedItemColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              size: 30,
            ),
            title: SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.local_pizza,
              size: 30,
            ),
            title: SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 15,
              backgroundImage: NetworkImage(
                  'https://i.pinimg.com/originals/27/16/dc/2716dcdb7a191d5485c32dd3abdbe858.jpg'),
            ),
            title: SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
