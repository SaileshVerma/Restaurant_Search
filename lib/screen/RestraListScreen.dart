import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/widget/restaurant_card.dart';
import 'package:restaurant_app/provider/restaurant_provider.dart';

class RestaurantList extends StatefulWidget {
  static const routename = "/RestaurantList";

  @override
  _RestaurantListState createState() => _RestaurantListState();
}

class _RestaurantListState extends State<RestaurantList> {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<RestaurantProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text("Restaurant List"),
        ),
        body: data.restauarantData.isEmpty
            ? Center(child: Text("Could not find the Restaurant!!"))
            : ListView(
                children: data.restauarantData
                    .map((i) => RestaurantCard(
                          name: i["restaurant"]["name"],
                          address: i["restaurant"]["location"]["address"],
                          city: i["restaurant"]["location"]["city"],
                          picurl: i["restaurant"]["thumb"],
                          id: i["restaurant"]["id"],
                        ))
                    .toList(),
              ));
  }
}
