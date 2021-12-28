part of 'dictionary_bloc.dart';

abstract class DictionaryEvent extends Equatable {
  const DictionaryEvent();

  @override
  List<Object> get props => [];
}

class DictionaryFieldChanged extends DictionaryEvent {
  const DictionaryFieldChanged(this.currentSearch);
  
  final String currentSearch;
  
  @override
  List<Object> get props => [currentSearch];

  String toString() {
    return "EVENTO: DictionaryFieldChanged: $currentSearch";
  }
}

class DictionaryWordSubmitted extends DictionaryEvent {
  const DictionaryWordSubmitted();
}
