import 'package:equatable/equatable.dart';

abstract class StepsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class StepsDataNotLoaded extends StepsState {}

class StepsDataLoaded extends StepsState {
  StepsDataLoaded(this.stepsCount, this.stepsGoal);

  final int stepsCount;
  final int stepsGoal;

  @override
  List<Object?> get props => [stepsCount, stepsGoal];
}
