import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'tab_event.dart';

class TabBloc extends Bloc<TabEvent, int> {
  TabBloc() : super(0) {
    on<TabChangeEvent>((event, emit) {
      emit(event.newIndex);
    });
  }
}
