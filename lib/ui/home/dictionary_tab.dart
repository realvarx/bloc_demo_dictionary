import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloc_demo_dictionary/blocs/dictionary/dictionary_bloc.dart';
import 'widgets/custom_sliver_app_bar.dart';

class DictionaryTab extends StatelessWidget {
  const DictionaryTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: CustomSliverAppBar(expandedHeight: 250),
            pinned: true,
          ),
          BlocBuilder<DictionaryBloc, DictionaryState>(
            builder: (context, state) {
              int len = state.initialSearch != null
                  ? state.initialSearch!.meanings!.isEmpty
                      ? 0
                      : state.initialSearch!.meanings!.length
                  : 0;

              return len != 0
                  ? SliverList(
                      // itemExtent: 10,
                      delegate: SliverChildBuilderDelegate((context, index) {
                      return ListTile(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          title: Text(state.initialSearch!.meanings![index]!));
                    }, childCount: len))
                  : state.status == DictionaryStatus.initial
                      ? SliverToBoxAdapter(
                          child: Center(
                              child:
                                  Text("Aún no has buscado ninguna palabra")))
                      : state.status == DictionaryStatus.loading
                          ? SliverToBoxAdapter(
                              child: Center(
                                child: CircularProgressIndicator(
                                  color: Colors.black87,
                                ),
                              ),
                            )
                          : SliverToBoxAdapter(
                              child: Center(child: Text("Fail")));
            },
          )
        ],
      ),
    );
  }
}
