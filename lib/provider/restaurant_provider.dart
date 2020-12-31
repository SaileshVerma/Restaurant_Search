import 'package:flutter/widgets.dart';
import 'package:dio/dio.dart';

class RestaurantProvider with ChangeNotifier {
  List restauarantData =
      []; //contains the list of data feteched from zomato server

  final dio = Dio(BaseOptions(
      baseUrl: "https://developers.zomato.com/api/v2.1/search",
      headers: {
        "user-key": "0d182e36ea68c4dc8675bfe9f5d78a4f",
      }));

  Future<void> searchRestaurant(String query) async {
    final response = await dio.get("", queryParameters: {"q": query});
    print(response.toString());
    restauarantData = response.data["restaurants"];

    notifyListeners();
  }
}
