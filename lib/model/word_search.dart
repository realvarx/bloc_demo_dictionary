// To parse this JSON data, do
//
//     final wordSearch = wordSearchFromJson(jsonString);

import 'dart:convert';

WordSearch wordSearchFromJson(String str) => WordSearch.fromJson(json.decode(str));

String wordSearchToJson(WordSearch data) => json.encode(data.toJson());

class WordSearch {
    WordSearch({
        required this.word,
        required this.meanings,
        required this.isVerb,
        required this.conjugation,
    });

    String? word;
    List<String?>? meanings;
    bool? isVerb;
    List<List<String?>>? conjugation;

    WordSearch copyWith({
        String? word,
        List<String?>? meanings,
        bool? isVerb,
        List<List<String?>>? conjugation,
    }) => 
        WordSearch(
            word: word ?? this.word,
            meanings: meanings ?? this.meanings,
            isVerb: isVerb ?? this.isVerb,
            conjugation: conjugation ?? this.conjugation,
        );

    factory WordSearch.fromJson(Map<String, dynamic> json) => WordSearch(
        word: json["word"],
        meanings: List<String>.from(json["meanings"].map((x) => x)),
        isVerb: json["isVerb"],
        conjugation: List<List<String>>.from(json["conjugation"].map((x) => List<String>.from(x.map((x) => x)))),
    );

    Map<String, dynamic> toJson() => {
        "word": word,
        "meanings": List<dynamic>.from(meanings!.map((x) => x)),
        "isVerb": isVerb,
        "conjugation": List<dynamic>.from(conjugation!.map((x) => List<dynamic>.from(x.map((x) => x)))),
    };
}
