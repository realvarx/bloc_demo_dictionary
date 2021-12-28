import 'package:bloc_demo_dictionary/blocs/tab/tab_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BotNavBar extends StatelessWidget {
  const BotNavBar({
    Key? key,
    required this.tabBloc,
  }) : super(key: key);

  final TabBloc tabBloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabBloc, int>(
      builder: (context, index) {
        return BottomNavigationBar(
          currentIndex: index,
          onTap: (newIndex) => tabBloc.add(TabChangeEvent(newIndex)),
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.black87,
          showSelectedLabels: true,
          selectedFontSize: 12.0,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.menu_book_rounded),
              label: "Buscar",
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.history_rounded), label: "Historial"),
            BottomNavigationBarItem(
                icon: Icon(Icons.star_border_rounded), label: "Mis palabras")
          ],
        );
      },
    );
  }
}