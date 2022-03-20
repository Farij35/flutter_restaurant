import 'package:flutter/material.dart';
import 'package:flutter_restaurant/restaurants.dart';
import 'package:webview_flutter/webview_flutter.dart';

class RestaurantDetail extends StatelessWidget {
  static const routeName = '/restaurants_list';

  final Restaurant restaurant;

  const RestaurantDetail({required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(restaurant.name),
      ),
      body:  SingleChildScrollView(
        child: Column(
          children: [
            Image.network(restaurant.pictureId),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(restaurant.description),
                  Divider(color: Colors.grey),
                  Text(
                    restaurant.name,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  Divider(color: Colors.grey),
                  Text('Rate: ${restaurant.rating}'),
                  SizedBox(height: 10),
                  Text('Location: ${restaurant.city}'),
                  Divider(color: Colors.grey),
                  Text(
                    restaurant.id,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}

