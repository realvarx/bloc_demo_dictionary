import 'package:bloc_demo_dictionary/blocs/dictionary/dictionary_bloc.dart';
import 'package:bloc_demo_dictionary/blocs/tab/tab_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TabBloc>(
          create: (context) => TabBloc(),
        ),
        BlocProvider<DictionaryBloc>(
          create: (context) => DictionaryBloc(),
        )
      ],
      child: HomeView(),
    );
  }
}


// https://pixabay.com/api/docs/