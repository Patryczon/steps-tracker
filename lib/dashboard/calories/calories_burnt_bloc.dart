import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:steps_repository/calories_repository.dart';
import 'package:superloop/dashboard/calories/calories_burnt_event.dart';
import 'package:superloop/dashboard/calories/calories_burnt_state.dart';

class CaloriesBurntBloc extends Bloc<CaloriesBurntEvent, CaloriesBurntState> {
  CaloriesBurntBloc(this._caloriesRepository)
      : super(CaloriesBurntDataNotLoaded()) {
    _caloriesSubscription =
        _caloriesRepository.getBurnedCaloriesStream().listen((event) {
      add(CaloriesBurntChanged(event));
    });
  }

  StreamSubscription? _caloriesSubscription;
  final CaloriesRepository _caloriesRepository;

  @override
  Future close() async {
    await _caloriesSubscription?.cancel();
    return super.close();
  }

  @override
  Stream<CaloriesBurntState> mapEventToState(CaloriesBurntEvent event) async* {
    if (event is LoadBurntCalories) {
      yield CaloriesBurntDataLoaded(
          await _caloriesRepository.getBurnedCalories());
    }
    if (event is CaloriesBurntChanged) {
      yield CaloriesBurntDataLoaded(event.calories);
    }
  }
}
