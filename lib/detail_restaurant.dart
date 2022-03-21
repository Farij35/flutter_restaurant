import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_restaurant/restaurants.dart';

import 'main.dart';

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
                  Text('Foods Menu'),
                  Column(
                    children: restaurant.menus.foods.map((food) => Column(
                      children: [
                        Card(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.food_bank,
                                size: 50,
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Text(food.name),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    )).toList(),
                  ),
                  Divider(color: Colors.grey),
                  Text('Drinks Menu'),
                  Column(
                    children: restaurant.menus.drinks.map((drink) => Column(
                      children: [
                        Card(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.local_drink,
                                size: 50,
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Text(drink.name),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    )).toList(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

