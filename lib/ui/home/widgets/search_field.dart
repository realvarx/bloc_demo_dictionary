import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloc_demo_dictionary/blocs/dictionary/dictionary_bloc.dart';

class SearchField extends StatelessWidget {
  const SearchField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dictionaryBloc = context.read<DictionaryBloc>();
    Color themeColor = Colors.black87;

    return Theme(
        data: Theme.of(context).copyWith(
            // backgroundColor: Colors.white,
            splashColor: Colors.white,
            // textSelectionColor: themeColor,
            // textSelectionHandleColor: themeColor,
            // indicatorColor: themeColor,
            focusColor: themeColor,
            cursorColor: themeColor,
            canvasColor: Color.fromRGBO(55, 57, 84, 1.0),
            primaryColor: themeColor,
            textTheme: Theme.of(context).textTheme.copyWith(
                caption: TextStyle(color: Color.fromRGBO(116, 117, 152, 1.0)))),
        child: TextField(
          onSubmitted: (value) {
            FocusScope.of(context).unfocus();
            dictionaryBloc.add(DictionaryWordSubmitted());
          },
          onChanged: (value) {
            dictionaryBloc.add(DictionaryFieldChanged(value));
          },
          style: TextStyle(color: themeColor),
          textCapitalization: TextCapitalization.sentences,
          decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide(width: 1, color: themeColor),
              ),
              // focusColor: themeColor,
              filled: true,
              fillColor: Colors.white,
              hintText: "Introduzca una palabra",
              hintStyle: TextStyle(
                  color: themeColor,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w100,
                  fontStyle: FontStyle.italic),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(color: themeColor)),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(color: themeColor)),
              //labelText: 'Nombre',
              suffixIcon: IconButton(
                  icon: Icon(Icons.search_outlined),
                  color: themeColor,
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    dictionaryBloc.add(DictionaryWordSubmitted());
                  })),
        ));
  }
}
