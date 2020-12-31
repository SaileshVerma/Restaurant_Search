import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:restaurant_app/provider/restaurant_provider.dart';

class DetailScreen extends StatelessWidget {
  static const routname = "/detailscreen";
  @override
  Widget build(BuildContext context) {
    final rid = ModalRoute.of(context).settings.arguments as String;
    final data = Provider.of<RestaurantProvider>(context).restauarantData;

    final rdata = data.where((i) => i["restaurant"]["id"] == rid);

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Details",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: ListView(
          children: rdata
              .map((i) => Container(
                      child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 300,
                        width: double.infinity,
                        color: Colors.grey,
                        child: Image.network(
                          i["restaurant"]["thumb"],
                          fit: BoxFit.fill,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: <Widget>[
                            Text(
                              "Restaurant Name:",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              i["restaurant"]["name"],
                            ),
                          ],
                        ),
                      ),
                      // Row(
                      //   children: <Widget>[
                      //     Text("Address:"),
                      //     SizedBox(
                      //       width: 15,
                      //     ),
                      //     Text(
                      //       i["restaurant"]["location"]["address"],
                      //     ),
                      //   ],
                      // ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: <Widget>[
                            Text("City:",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              i["restaurant"]["location"]["city"],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: <Widget>[
                            Text("Phone Number:",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              i["restaurant"]["phone_numbers"],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: <Widget>[
                            Text("Average Cost For 2 Person`s:",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              i["restaurant"]["average_cost_for_two"]
                                  .toString(),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text("Menu:",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold)),
                          Container(
                            height: 150,
                            width: 200,
                            color: Colors.grey,
                            child: Image.network(
                              i["restaurant"]["thumb"],
                              fit: BoxFit.fill,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )))
              .toList(),
        ));
  }
}
