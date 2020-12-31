import 'package:flutter/material.dart';

class RestaurantCard extends StatelessWidget {
  final String name;
  final String city;
  final String picurl;
  final String address;
  final String id;
  RestaurantCard({this.name, this.address, this.city, this.picurl, this.id});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 8, 0, 8),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              name,
              style: TextStyle(
                  fontSize: 16, color: Colors.red, fontWeight: FontWeight.bold),
            ),

            SizedBox(
              height: 10,
            ),
            Row(
              children: <Widget>[
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.grey,
                  child: Image.network(picurl),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.location_city,
                            color: Colors.red,
                            size: 18,
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Text(
                            city,
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.location_on,
                            color: Colors.red,
                            size: 18,
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Container(
                            height: 20,
                            width: 200,
                            child: FittedBox(
                              fit: BoxFit.contain,
                              child: Text(
                                address,
                                textAlign: TextAlign.center,
                                style:
                                    TextStyle(fontSize: 15, color: Colors.grey),
                                softWrap: true,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                IconButton(
                  iconSize: 30,
                  color: Colors.red,
                  icon: Icon(Icons.keyboard_arrow_right),
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed("/detailscreen", arguments: id);
                  },
                )
              ],
            ),
            // Container(child: Image.network(picurl)),
            SizedBox(
              height: 20,
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
