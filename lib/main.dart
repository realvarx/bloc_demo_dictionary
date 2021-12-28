import 'package:bloc/bloc.dart';
import 'package:bloc_demo_dictionary/blocs/simple_bloc_observer.dart';
import 'package:bloc_demo_dictionary/ui/home/home_page.dart';
import 'package:flutter/material.dart';


void main() {
  BlocOverrides.runZoned(
    () => runApp(MyApp()),
    blocObserver: SimpleBlocObserver()
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      builder: (context, child) {
        return ScrollConfiguration(
          behavior: NoGlowBehavior(), 
          child: child!
        );
      },

      debugShowCheckedModeBanner: false,
      title: 'Demo BLoC Dictionary',
      theme: Theme.of(context).copyWith(
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Colors.black87,
          selectionHandleColor: Colors.black87,
          selectionColor: Colors.black87
        )),
      home: HomePage()
    );
  }
}

class NoGlowBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}