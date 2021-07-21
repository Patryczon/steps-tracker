# Steps-tracker with mocked data
Simple steps tracker task to show my approach to flutter projects.

## Demo
![](app.gif)

## How to run
    Application entry point is file "main.dart" in lib folder. Is not needed to pass any additional arguments or choose any native flavour.

## Architecture
    For state managment I've used BLoC pattern. I was following clean architecture, DI pattern and SOLID approach.

## Functionalities
 - Notification reminder at 8pm every day when goal was not achived,
 - Possibility to setting up user daily goal,
 - Displaying number of steps (mocked data), goal steps and burned calories (mocked data) in clearly designed dashboard.

## Libraries
    - flutter_bloc - state managment library,
    - get_it - dependency injection library,
    - google_fonts - google fonts styling library,
    - percent_indicator - UI library for progress indicators
    - equatable - avoid boilerplate for hashcode and equals,
    - shared_preferences - access to device local storage,
    - modal_bottom_sheet - to show bottom sliding panel,
    - background_fetch - to perform work in the background.

## Project modules
    - background_work_manager - Package to perform background task to make sure that notifications are only delivered when needed.
    - notifications - Package to provide device notifications functionality.
    - steps_repository - Repository to provide data related to steps.

