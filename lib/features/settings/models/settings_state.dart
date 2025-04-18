import 'package:equatable/equatable.dart';
import 'package:purple_task/core/styles/themes.dart';

class SettingsState extends Equatable {
  const SettingsState({
    required this.timeFormat,
    required this.dateFormat,
    required this.showDoneTime,
    required this.isUncategorizedViewPreferred,
    required this.theme,
    required this.locale,
  });

  final String timeFormat;
  final String dateFormat;
  final bool showDoneTime;
  final bool isUncategorizedViewPreferred;
  final AppThemeMode theme;
  final String? locale;

  SettingsState copyWith({
    String? timeFormat,
    String? dateFormat,
    bool? showDoneTime,
    bool? isUncategorizedViewPreferred,
    AppThemeMode? theme,
    String? locale,
  }) {
    return SettingsState(
      timeFormat: timeFormat ?? this.timeFormat,
      dateFormat: dateFormat ?? this.dateFormat,
      showDoneTime: showDoneTime ?? this.showDoneTime,
      isUncategorizedViewPreferred:
          isUncategorizedViewPreferred ?? this.isUncategorizedViewPreferred,
      theme: theme ?? this.theme,
      locale: locale ?? this.locale,
    );
  }

  @override
  List<Object?> get props => [
        timeFormat,
        dateFormat,
        showDoneTime,
        isUncategorizedViewPreferred,
        theme,
        locale,
      ];
}
