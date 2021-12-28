import 'package:bloc_demo_dictionary/model/word_search.dart';
import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;

class Scraper {
  Future<WordSearch> searchWord(String word) async {

    WordSearch wordSearched = WordSearch(
      word: "",
      meanings: [],
      isVerb: false,
      conjugation: []
    );

    // Getting the response from the targeted url
    final response = await http.Client()
        .get(Uri.parse("https://dle.rae.es/" + word.toLowerCase() + "?m=form"));

    if (response.statusCode == 200) {
      var document = parser.parse(response.body);
      try {
        var word = document
            .getElementsByClassName('col-sm-8')[0] // el primer "col-sm-8"
            .children[0] // el primer child de "col-sm-8", "diccionario"
            .children[1] // el segundo child de "diccionario", "resultados"
            .children[0] // el primer child de "resultados", "Rp1CuT2"
            .children[0]; // el nombre de la palabra, el primer child

        var meanings = document
            .getElementsByClassName('col-sm-8')[0]
            .children[0]
            .children[1]
            .children[0]
            .querySelectorAll("p");

        List<List<String?>> conjugation = isVerb(document);

        wordSearched.word = word.text.trim();
        List<String>? meaningList = [];
        for(var meaning in meanings) {
          meaningList.add(meaning.text.trim());
        }
        wordSearched.meanings = meaningList;
        wordSearched.isVerb = conjugation.isEmpty ? false : true;
        wordSearched.conjugation = conjugation;
        return wordSearched;

      } catch (e) {
        // wordSearched.word = e.toString();
        wordSearched.word = "";
        return wordSearched;
      }
    } else {
      // wordSearched.word = "${response.statusCode}";
      wordSearched.word = "";
      return wordSearched;
    }
  }

  /// Checks if the word is a verb and returns its conjugation table, or
  /// null if it is not a verb
  ///
  List<List<String?>> isVerb(var document) {

    List<List<String?>> verbTable = [];

    try {
      var tableRows = document
          .getElementsByClassName('col-sm-8')[0]
          .children[0]
          .children[1]
          .children[1]
          .children[2]
          .children[1]
          .children[0]
          .getElementsByTagName("tr");
      if (tableRows == null) {
        return verbTable;
      } else {
        var tableColumns = tableRows[0].getElementsByTagName("th");
        verbTable = List.generate(tableRows.length,
            (index) => List<String?>.generate(5, (index) => ""));
        var thList = [0, 1, 3, 5, 6, 15, 24, 33, 34, 43, 52, 53];
        var r = 0;
        tableRows.forEach((row) {
          bool check = thList.contains(r);
          tableColumns = row.getElementsByTagName(check ? "th" : "td");
          var c = 0;
          tableColumns.forEach((col) {
            verbTable[r][c] = col.text.trim();
            if (col.attributes.keys.contains('data-g')) {
              verbTable[r][c] = col.attributes['data-g'];
            }
            c++;
          });
          r++;
        });
        return verbTable;
      }
    } catch (e) {
      return verbTable;
    }
  }


  Future<List<String>> autoSuggestions(String word) async {



    return [];
  }
}


/*
{
  "word" : "",
  "meanings": [
      "",
      ""
    ],
  "isVerb" : true,
  "conjugation": [
      [
          ""
          ]
    ]
}
*/