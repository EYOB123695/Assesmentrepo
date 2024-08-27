import 'dart:async';

import 'package:assesmentproject/features/grocery/domain/entity/groceryentity.dart';
import 'package:assesmentproject/features/grocery/domain/usecase/getgroceries.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../../core/error/failure.dart';

part 'homescreen_event.dart';
part 'homescreen_state.dart';

class HomescreenBloc extends Bloc<HomescreenEvent, HomescreenState> {
  final GetgroceriesUseCase getGroceriesUseCase;

  HomescreenBloc({required this.getGroceriesUseCase})
      : super(HomescreenInitial()) {
    on<LoadGroceriesEvent>(_onLoadGroceries);
    on<RefreshGroceriesEvent>(_onRefreshGroceries);
    on<StartSearchEvent>(_onStartSearch);
  }

  Future<void> _onLoadGroceries(
    LoadGroceriesEvent event,
    Emitter<HomescreenState> emit,
  ) async {
    emit(HomeScreenLoading());
    try {
      final Either<Failure, List<GroceryEntity>> result =
          await getGroceriesUseCase.execute();
      emit(result.fold(
        (failure) =>
            HomeScreenLoadingFailed(message: _mapFailureToMessage(failure)),
        (groceries) => HomeScreenLoaded(groceries: groceries),
      ));
    } catch (_) {
      emit(HomeScreenLoadingFailed(message: 'Failed to load groceries'));
    }
  }

  Future<void> _onRefreshGroceries(
    RefreshGroceriesEvent event,
    Emitter<HomescreenState> emit,
  ) async {
    emit(HomeScreenLoading());
    try {
      final Either<Failure, List<GroceryEntity>> result =
          await getGroceriesUseCase.execute();
      emit(result.fold(
        (failure) =>
            HomeScreenLoadingFailed(message: _mapFailureToMessage(failure)),
        (groceries) => HomeScreenLoaded(groceries: groceries),
      ));
    } catch (_) {
      emit(HomeScreenLoadingFailed(message: 'Failed to refresh groceries'));
    }
  }

  Future<void> _onStartSearch(
    StartSearchEvent event,
    Emitter<HomescreenState> emit,
  ) async {
    emit(HomeScreenSearching());
    try {
      final Either<Failure, List<GroceryEntity>> result =
          await getGroceriesUseCase.execute();
      final searchResults = result.fold(
        (failure) => <GroceryEntity>[], // Return an empty list on failure
        (groceries) => groceries
            .where((grocery) => grocery.title.contains(event.query))
            .toList(),
      );
      if (searchResults.isNotEmpty) {
        emit(HomeScreenSearchCompleted(
            result: searchResults.first)); // Assuming you want the first match
      } else {
        emit(HomeScreenSearchingFailed(message: 'No matching groceries found'));
      }
    } catch (_) {
      emit(HomeScreenSearchingFailed(message: 'Search failed'));
    }
  }

  String _mapFailureToMessage(Failure failure) {
    // Map different types of failures to messages
    return "Failed to load groceries";
  }
}
