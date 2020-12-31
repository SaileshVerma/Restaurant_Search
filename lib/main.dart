import 'package:flutter/material.dart';
// import 'package:dio/dio.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/provider/restaurant_provider.dart';
import 'package:restaurant_app/screen/RestraListScreen.dart';
import 'package:restaurant_app/screen/restuarantdetailscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RestaurantProvider>(
      create: (ctx) => RestaurantProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.red, accentColor: Colors.white),
        home: HomePage(),
        routes: {
          RestaurantList.routename: (ctx) => RestaurantList(),
          DetailScreen.routname: (ctx) => DetailScreen(),
        },
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String search;

  Widget build(BuildContext context) {
    final data = Provider.of<RestaurantProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Restaurant Search",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/p2.jpg"), fit: BoxFit.cover),
        ),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    //filled: true,
                    focusColor: Colors.white,
                    labelText: "Enter Restaurant Name",
                    labelStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    )),
                onChanged: (text) {
                  search = text;
                },
              ),
            ),
            FlatButton(
                color: Colors.red,
                onPressed: () async {
                  await data.searchRestaurant(search);
                  Navigator.of(context).pushNamed("/RestaurantList");
                },
                child: Text(
                  "Search",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                )),
          ],
        ),
      ),
    );
  }
}
