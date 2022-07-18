
import 'dart:async';
import 'package:sub1experttonton/common/styles.dart';

import 'package:flutter/material.dart';

import 'package:sub1experttonton/presentation/ui/pages/movie/home_movie_page.dart';


class SplashScreen extends StatefulWidget {
  static const
  routeName =
      '/unitvy_screen';

  const SplashScreen({Key? key})
      : super(key: key);

  @override
  _SplashScreenState createState(
      ) =>
      _SplashScreenState(

  );
}

class _SplashScreenState extends
State<SplashScreen>
{
  startTime(
      )
  {
    var duration = const Duration(
        seconds: 5
    );

    return Timer(
        duration,
        navigationRoute
    );
  }


  @override
  void initState() {
    super.initState();
    startTime();
  }

  void navigationRoute() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder:
            (BuildContext context) =>
                const HomeMoviePage()
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kRichBlack,
        body: Center(child:
        Center(
            child: Image.asset(
                'assets/movi.png'
            )
        )
        )
    );
  }
}