import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:steps_repository/steps_repository.dart';
import 'package:superloop/dashboard/steps/steps_event.dart';
import 'package:superloop/dashboard/steps/steps_state.dart';

class StepsBloc extends Bloc<StepsEvent, StepsState> {
  StepsBloc(this._stepsRepository, this._stepsGoalRepository)
      : super(StepsDataNotLoaded()) {
    _stepsRepository.getStepsCountStream().listen((event) {
      add(StepsCountChanged(event));
    });
    _stepsGoalRepository.getStepsGoalStream().listen((event) {
      add(StepsGoalCountChanged(event));
    });
  }

  StreamSubscription? _stepsStreamSubscription;
  StreamSubscription? _stepsGoalStreamSubscription;

  final StepsRepository _stepsRepository;
  final StepsGoalRepository _stepsGoalRepository;

  @override
  Future close() async {
    await _stepsStreamSubscription?.cancel();
    await _stepsGoalStreamSubscription?.cancel();
    return super.close();
  }

  @override
  Stream<StepsState> mapEventToState(StepsEvent event) async* {
    if (event is LoadStepsData) {
      var _stepsGoal = await _stepsGoalRepository.getStepsGoal();
      yield StepsDataLoaded(await _stepsRepository.getStepsCount(),
          _stepsGoal ?? StepsGoalRepository.defaultStepsCount);
    }
    if (event is StepsCountChanged && state is StepsDataLoaded) {
      yield StepsDataLoaded(
          event.stepsCount, (state as StepsDataLoaded).stepsGoal);
    }
    if (event is StepsGoalCountChanged && state is StepsDataLoaded) {
      yield StepsDataLoaded((state as StepsDataLoaded).stepsGoal,
          event.goalStepsCount ?? StepsGoalRepository.defaultStepsCount);
    }
  }
}
