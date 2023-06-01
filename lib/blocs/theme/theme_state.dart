part of 'theme_bloc.dart';

enum AppTheme { light, dark }

class ThemeState extends Equatable {
  final AppTheme appTheme;

  ThemeState({this.appTheme = AppTheme.light});

  factory ThemeState.initial() {
    return ThemeState(appTheme: AppTheme.light);
  }

  ThemeState copyWith({AppTheme? theme}) {
    return ThemeState(appTheme: theme ?? this.appTheme);
  }

  @override
  List<Object> get props => [appTheme];
}
