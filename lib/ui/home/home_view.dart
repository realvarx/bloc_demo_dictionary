import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'dictionary_tab.dart';
import 'widgets/bot_nav_bar.dart';
import 'package:bloc_demo_dictionary/blocs/tab/tab_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tabBloc = context.read<TabBloc>();

    return BlocBuilder<TabBloc, int>(
      builder: (context, index) {
        return SafeArea(
          child: Scaffold(
            body: index == 0
                ? DictionaryTab()
                : index == 1
                    ? Center(child: Text("Historial"))
                    : Center(child: Text("Mis palabras")),
            bottomNavigationBar: BotNavBar(tabBloc: tabBloc),
            appBar: index == 0
                ? null
                : AppBar(
                    centerTitle: true,
                    backgroundColor: Colors.black87,
                    leading: IconButton(
                      icon: Icon(Icons.menu),
                      onPressed: () {},
                    ),
                    actions: [
                      IconButton(
                        icon: Icon(Icons.info_outline_rounded),
                        onPressed: () {},
                      ),
                    ],
                    elevation: 0.0,
                    title: Text(index == 1 ? "Historial" : "Mis palabras"),
                  ),
          ),
        );
      },
    );
  }
}

