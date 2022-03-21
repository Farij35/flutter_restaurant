import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_restaurant/main.dart';
import 'package:flutter_restaurant/restaurants.dart';

class RestaurantDetail extends StatelessWidget {
  static const routeName = '/restaurants_detail';

  final Restaurant restaurant;

  const RestaurantDetail({required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(restaurant.name),
        leading: IconButton(
          icon : Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RestaurantsList()),
            );
          },
        ),
      ),
      body:  SingleChildScrollView(
        child: Column(
          children: [
            Image.network(restaurant.pictureId),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    restaurant.name,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  Divider(color: Colors.grey),
                  Text('Location: ${restaurant.city}'),
                  SizedBox(height: 10),
                  Text('Rate: ${restaurant.rating}'),
                  Divider(color: Colors.grey),
                  Text(
                    restaurant.description,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Divider(color: Colors.grey),
                  SizedBox(height: 10),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

