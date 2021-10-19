import 'package:dog_app/core/routings/route_paths.dart';
import 'package:dog_app/features/dog_breed/presentation/pages/dog_breed_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic> ? generateRoute(RouteSettings  settings) {
    switch (settings.name) {
    // case RoutePaths.Start:
    //   return MaterialPageRoute(builder: (_) => SignUpScreen());
      case RoutePaths.HomePage:
      //  final args = settings.arguments as NumberTrivia;
        return MaterialPageRoute<void>(
          builder: (context) {
            return DogBreedPage(
              // post: args,
            );
          },
        );

   /*   case RoutePaths.SecondPage:
      //final args = settings.arguments as NumberTrivia;
        return MaterialPageRoute<void>(
          builder: (context) {
            return SecondPage(
              // post: args,
            );
          },
        );*/
    //return MaterialPageRoute(builder: (_) => PostsDetails());

      default:
        return MaterialPageRoute<void>(builder: (_) => DogBreedPage());
    /* return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));*/
    }
  }
}
