import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> with HydratedMixin {
  ThemeBloc() : super(ThemeState.initial()) {
    on<ToggleThemeEvent>(_handleToggleThemeEvent);
  }

  void _handleToggleThemeEvent(
      ToggleThemeEvent event, Emitter<ThemeState> emit) {
    AppTheme toggledTheme =
        (state.appTheme == AppTheme.light) ? AppTheme.dark : AppTheme.light;
    emit(state.copyWith(theme: toggledTheme));
  }

  @override
  ThemeState? fromJson(Map<String, dynamic> json) {
    print("Theme from storage: $json");
    final themeState = ThemeState.fromJson(json);
    print("ThemeState: $themeState");
    return themeState;
  }

  @override
  Map<String, dynamic>? toJson(ThemeState state) {
    print("Theme state to storage: $state");
    final themeJson = state.toJson();
    print("ThemeJson: $themeJson");
    return themeJson;
  }
}
