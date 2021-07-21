import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:steps_repository/goal/steps_goal_repository.dart';
import 'package:superloop/goal_update/update/goal_update_event.dart';
import 'package:superloop/goal_update/update/goal_update_state.dart';

class GoalUpdateBloc extends Bloc<GoalUpdateEvent, GoalUpdateState> {
  GoalUpdateBloc(this._stepsGoalRepository) : super(GoalUpdateInVisible());
  final StepsGoalRepository _stepsGoalRepository;

  @override
  Stream<GoalUpdateState> mapEventToState(GoalUpdateEvent event) async* {
    if (event is UpdateGoal) {
      await _stepsGoalRepository.updateStepsGoal(event.goal);
      yield GoalUpdateInVisible();
    }
    if (event is OpenGoalUpdate) {
      yield GoalUpdateVisible();
    }
    if (event is CloseGoalUpdate) {
      yield GoalUpdateInVisible();
    }
  }
}
