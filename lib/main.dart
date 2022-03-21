import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_restaurant/detail_restaurant.dart';
import 'package:flutter_restaurant/restaurants.dart';
import 'package:flutter_restaurant/styles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurants',
      theme: ThemeData(
        colorScheme: Theme.of(context).colorScheme.copyWith(
          primary: primaryColor,
          onPrimary: Colors.black,
          secondary: secondaryColor,
        ),
        textTheme: restoTextTheme,
      ),
      initialRoute: RestaurantsList.routeName,
      routes: {
        RestaurantsList.routeName: (context) => RestaurantsList(),
        RestaurantDetail.routeName: (context) => RestaurantDetail(
          restaurant: ModalRoute.of(context)?.settings.arguments as Restaurant,
        ),
      },
    );
  }
}

class RestaurantsList extends StatelessWidget {
  static const routeName = '/restaurants_list';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurant'),
      ),
      body: FutureBuilder<String>(
        future: DefaultAssetBundle.of(context).loadString('assets/local_restaurant.json'),
        builder: (context, snapshot) {
          var jsonMap = jsonDecode(snapshot.data!);

          var restaurant = RestaurantData.fromJson(jsonMap);

          return ListView.builder(
            itemCount: restaurant.restaurants.length,
            itemBuilder: (context, index){
              return _buildRestaurantItem(context, restaurant.restaurants[index]);
            },
          );
        },
      ),
    );
  }
  Widget _buildRestaurantItem(BuildContext context, Restaurant restaurant){
    return ListTile(
      onTap: () {
        Navigator.pushNamed(context, RestaurantDetail.routeName,
        arguments: restaurant);
      },
      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      leading: Image.network(
        restaurant.pictureId,
        width: 100,
      ),
      title: Text(restaurant.name),
      subtitle: Text(restaurant.city),
    );
  }
}





