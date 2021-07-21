import 'package:equatable/equatable.dart';

abstract class StepsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadStepsData extends StepsEvent {}

class StepsCountChanged extends StepsEvent {
  StepsCountChanged(this.stepsCount);

  final int stepsCount;

  @override
  List<Object?> get props => [stepsCount];
}

class StepsGoalCountChanged extends StepsEvent {
  StepsGoalCountChanged(this.goalStepsCount);

  final int? goalStepsCount;

  @override
  List<Object?> get props => [goalStepsCount];
}
