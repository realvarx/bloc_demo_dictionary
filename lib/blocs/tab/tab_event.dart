part of 'tab_bloc.dart';

@immutable
abstract class TabEvent extends Equatable{
  TabEvent();
  List<Object> get props => [];
}

class TabChangeEvent extends TabEvent {
  final int newIndex;
  TabChangeEvent(this.newIndex);

  // Propiedades con las que Equatable va a comparar unos eventos con otros 
  List<Object> get props => [newIndex];

  String toString() {
    return "EVENTO: TabEvent: $newIndex";
  }
}
