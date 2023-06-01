import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState.initial()) {
    on<ChangeThemeEvent>((event, emit) {
      print('hello - ${event.randInt}');
      if (event.randInt % 2 == 0) {
        emit(state.copyWith(theme: AppTheme.light));
      } else {
        emit(state.copyWith(theme: AppTheme.dark));
      }
    });
  }
}
