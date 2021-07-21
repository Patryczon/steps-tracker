import 'package:equatable/equatable.dart';

abstract class NotificationsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class NotificationsEnabled extends NotificationsState {}

class NotificationsDisabled extends NotificationsState {}
