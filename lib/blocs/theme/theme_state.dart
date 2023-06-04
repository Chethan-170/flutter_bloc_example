part of 'theme_bloc.dart';

enum AppTheme {
  light,
  dark;

  String toJson() => name;

  static AppTheme fromJson(String json) => values.byName(json);
}

class ThemeState extends Equatable {
  final AppTheme appTheme;

  ThemeState({required this.appTheme});

  factory ThemeState.initial() {
    return ThemeState(appTheme: AppTheme.light);
  }

  ThemeState copyWith({AppTheme? theme}) {
    return ThemeState(appTheme: theme ?? this.appTheme);
  }

  @override
  List<Object?> get props => [appTheme];

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'appTheme': appTheme.toJson(),
    };
  }

  factory ThemeState.fromJson(Map<String, dynamic> map) {
    return ThemeState(
      appTheme: AppTheme.fromJson(map['appTheme']),
    );
  }
}
