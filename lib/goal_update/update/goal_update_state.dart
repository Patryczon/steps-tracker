import 'package:equatable/equatable.dart';

abstract class GoalUpdateState extends Equatable {
  @override
  List<Object?> get props => [];
}

class GoalUpdateVisible extends GoalUpdateState {}

class GoalUpdateInVisible extends GoalUpdateState {}
