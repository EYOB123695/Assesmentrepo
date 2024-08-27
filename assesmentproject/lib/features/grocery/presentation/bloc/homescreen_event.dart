part of 'homescreen_bloc.dart';

@immutable
abstract class HomescreenEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadGroceriesEvent extends HomescreenEvent {}

class RefreshGroceriesEvent extends HomescreenEvent {}

class StartSearchEvent extends HomescreenEvent {
  final String query;

  StartSearchEvent({required this.query});

  @override
  List<Object?> get props => [query];
}
