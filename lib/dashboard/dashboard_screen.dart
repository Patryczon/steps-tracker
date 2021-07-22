import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:superloop/dashboard/calories/calories_burnt_bloc.dart';
import 'package:superloop/dashboard/calories/calories_burnt_event.dart';
import 'package:superloop/dashboard/calories/calories_burnt_state.dart';
import 'package:superloop/dashboard/notification/notification_bloc.dart';
import 'package:superloop/dashboard/notification/notification_event.dart';
import 'package:superloop/dashboard/notification/notification_state.dart';
import 'package:superloop/dashboard/steps/steps_bloc.dart';
import 'package:superloop/dashboard/steps/steps_state.dart';
import 'package:superloop/goal_update/goal_update_navigation.dart';
import 'package:superloop/goal_update/update/goal_update_bloc.dart';
import 'package:superloop/goal_update/update/goal_update_event.dart';
import 'package:superloop/goal_update/update/goal_update_state.dart';
import 'package:superloop/theme/app_colors.dart';
import 'package:superloop/widgets/calories_indicator.dart';
import 'package:superloop/widgets/circular_progress.dart';
import 'package:superloop/widgets/linear_progress.dart';
import 'package:superloop/widgets/step_indicator.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: BlocBuilder<NotificationBloc, NotificationsState>(
                bloc: GetIt.instance.get<NotificationBloc>(),
                builder: (context, state) => GestureDetector(
                  onTap: () => GetIt.instance
                      .get<NotificationBloc>()
                      .add(ToggleNotifications()),
                  child: Icon(
                    state is NotificationsEnabled
                        ? Icons.notifications_active_outlined
                        : Icons.notifications_off_outlined,
                    color: state is NotificationsEnabled
                        ? Theme.of(context).accentColor
                        : Theme.of(context).primaryColor,
                  ),
                ),
              ),
            )
          ],
          leading: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Icon(
              Icons.arrow_back_ios,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        body: BlocListener<GoalUpdateBloc, GoalUpdateState>(
          bloc: GetIt.instance.get<GoalUpdateBloc>(),
          listener: (context, state) => state is GoalUpdateVisible
              ? GetIt.instance
                  .get<GoalUpdateNavigation>()
                  .showGoalUpdate(context)
              : GetIt.instance
                  .get<GoalUpdateNavigation>()
                  .hideGoalUpdate(context),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Stepcounter',
                  style: Theme.of(context).textTheme.headline2,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 48.0, bottom: 8),
                  child: BlocBuilder<StepsBloc, StepsState>(
                      bloc: GetIt.instance.get<StepsBloc>(),
                      builder: (context, state) => CircularProgress(
                          percentage: state is StepsDataLoaded
                              ? state.stepsCount.toDouble() /
                                  state.stepsGoal.toDouble()
                              : null)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BlocBuilder<StepsBloc, StepsState>(
                          bloc: GetIt.instance.get<StepsBloc>(),
                          builder: (context, state) => StepIndicator(
                              stepsCount: state is StepsDataLoaded
                                  ? state.stepsCount
                                  : 0,
                              stepsGoal: state is StepsDataLoaded
                                  ? state.stepsGoal
                                  : 0)),
                      BlocBuilder<CaloriesBurntBloc, CaloriesBurntState>(
                          bloc: GetIt.instance.get<CaloriesBurntBloc>()
                            ..add(LoadBurntCalories()),
                          builder: (context, state) => CaloriesIndicator(
                              caloriesBurnt: state is CaloriesBurntDataLoaded
                                  ? state.caloriesBurnt
                                  : 0)),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () => GetIt.instance
                        .get<GoalUpdateBloc>()
                        .add(OpenGoalUpdate()),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(30)),
                          color: Theme.of(context)
                              .backgroundColor
                              .withOpacity(0.3)),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.edit_outlined,
                            color: softBlue,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              'Daily Goal',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(color: softBlue),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
                  child: BlocBuilder<StepsBloc, StepsState>(
                      bloc: GetIt.instance.get<StepsBloc>(),
                      builder: (context, state) => LinearProgress(
                          percentage: state is StepsDataLoaded
                              ? state.stepsCount.toDouble() /
                                  state.stepsGoal.toDouble()
                              : 0.0)),
                )
              ],
            ),
          ),
        ),
      );
}
