part of 'homescreen_bloc.dart';

@immutable
abstract class HomescreenState {}

class HomescreenInitial extends HomescreenState {}

class HomeScreenLoading extends HomescreenState {}

class HomeScreenLoaded extends HomescreenState {
  final List<GroceryEntity> groceries;
  HomeScreenLoaded({required this.groceries});
  @override
  List<Object?> get props => [groceries];
}

class HomeScreenLoadingFailed extends HomescreenState {
  final String message;
  HomeScreenLoadingFailed({required this.message});
  @override
  List<Object?> get props => [message];
}

class HomeScreenSearching extends HomescreenState {}

class HomeScreenSearchCompleted extends HomescreenState {
  final GroceryEntity result;
  HomeScreenSearchCompleted({required this.result});
}

class HomeScreenSearchingFailed extends HomescreenState {
  final String message;
  HomeScreenSearchingFailed({required this.message});
  @override
  List<Object?> get props => [message];
}
