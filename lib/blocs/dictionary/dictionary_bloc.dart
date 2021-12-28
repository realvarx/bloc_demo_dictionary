import 'package:bloc/bloc.dart';
import 'package:bloc_demo_dictionary/model/word_search.dart';
import 'package:bloc_demo_dictionary/services/scraper.dart';
import 'package:equatable/equatable.dart';

part 'dictionary_event.dart';
part 'dictionary_state.dart';

class DictionaryBloc extends Bloc<DictionaryEvent, DictionaryState> {

  // final Scraper scraper;
  // final WordSearch wordSearch;

  DictionaryBloc() : super(DictionaryInitial()) {
    on<DictionaryFieldChanged>((event, emit) => emit(state.copyWith(currentSearch: event.currentSearch)));
    on<DictionaryWordSubmitted>(_onSubmitted);
  }

  final Scraper _scraper = Scraper();

  Future<void> _onSubmitted(
    DictionaryWordSubmitted event, 
    Emitter<DictionaryState> emit,
  ) async {
    print("Vamos a buscar: ${state.currentSearch}");
    emit(state.copyWith(status: DictionaryStatus.loading));
    var word = (state.initialSearch ?? WordSearch(
      word: "", 
      meanings: [], 
      isVerb: false, 
      conjugation: [])
    ).copyWith(
      word: state.currentSearch
    );

    try {
      word = await _scraper.searchWord(state.currentSearch!);
      if(word.word != "") {
        emit(state.copyWith(status: DictionaryStatus.success, initialSearch: word));
        print("success");
        for(var m in word.meanings!) {
          print(m);
        }
      } else {
        emit(state.copyWith(status: DictionaryStatus.failure));
        print("fail: empty");
      }
    } catch(e) {
      emit(state.copyWith(status: DictionaryStatus.failure));
      print("fail: exception e");
    }
  }
}
