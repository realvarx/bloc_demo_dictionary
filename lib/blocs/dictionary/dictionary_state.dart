part of 'dictionary_bloc.dart';

enum DictionaryStatus { initial, loading, success, failure }

extension DictionaryStatusX on DictionaryStatus {
  bool get isLoadingOrSuccess => [
        DictionaryStatus.loading,
        DictionaryStatus.success,
      ].contains(this);
}

// abstract class DictionaryState 

class DictionaryState extends Equatable {
  const DictionaryState({
    this.status = DictionaryStatus.initial,
    this.currentSearch = "",
    this.initialSearch
  });

  final DictionaryStatus status;
  final String? currentSearch;
  final WordSearch? initialSearch;
  
  @override
  List<Object?> get props => [status, currentSearch, initialSearch];

  DictionaryState copyWith({
    DictionaryStatus? status,
    String? currentSearch,
    WordSearch? initialSearch,
  }) {
    return DictionaryState(
      status: status ?? this.status,
      currentSearch: currentSearch ?? this.currentSearch,
      initialSearch: initialSearch ?? this.initialSearch,
    );
  }
}

class DictionaryInitial extends DictionaryState {}

class DictionarySearching extends DictionaryState {}

class DictionarySearchComplete extends DictionaryState {
  const DictionarySearchComplete();

  // final WordSearch wordSearch;

  @override
  List<Object> get props => [];
}


/*
class DictionaryState extends Equatable {
  const DictionaryState({
    this.status = DictionaryStatus.initial,
    this.initialSearch,
  });

  final DictionaryStatus status;
  final WordSearch? initialSearch;
  
  @override
  List<Object> get props => [];

  DictionaryState copyWith({
    DictionaryStatus? status,
    WordSearch? initialSearch,
  }) {
    return DictionaryState(
      status: status ?? this.status,
      initialSearch: initialSearch ?? this.initialSearch,
    );
  }
}
*/