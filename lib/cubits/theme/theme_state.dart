part of 'theme_cubit.dart';

enum AppTheme { light, dark }

class ThemeState extends Equatable {
  final AppTheme appTheme;

  ThemeState({this.appTheme = AppTheme.light});

  factory ThemeState.initial() {
    return ThemeState();
  }

  ThemeState copyWith({AppTheme? theme}) {
    return ThemeState(appTheme: theme ?? this.appTheme);
  }

  @override
  List<Object> get props => [appTheme];
}
