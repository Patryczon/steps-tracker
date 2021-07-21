import 'package:equatable/equatable.dart';

abstract class GoalUpdateEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class OpenGoalUpdate extends GoalUpdateEvent {}

class CloseGoalUpdate extends GoalUpdateEvent {}

class UpdateGoal extends GoalUpdateEvent {
  UpdateGoal(this.goal);

  final int goal;

  @override
  List<Object?> get props => [goal];
}
