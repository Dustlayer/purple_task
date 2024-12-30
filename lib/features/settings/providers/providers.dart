import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:purple_task/features/app_version/app_version_repository/app_version_repository.dart';
import 'package:purple_task/features/settings/controllers/settings/settings_controller.dart';
import 'package:purple_task/features/settings/settings_repository/base_settings_repository.dart';
import 'package:purple_task/features/settings/settings_repository/shared_pref_settings_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'providers.g.dart';

@riverpod
AppVersionRepository appVersionRepository(Ref ref) =>
    AppVersionRepository(asyncPrefs: SharedPreferencesAsync());

@riverpod
BaseSettingsRepository settingsRepository(Ref ref) =>
    SharedPrefSettingsRepository(asyncPrefs: SharedPreferencesAsync());

@riverpod
bool isUncategorizedViewPreferred(Ref ref) {
  final settings = ref.watch(settingsNotifierProvider);

  return settings.value?.isUncategorizedViewPreferred ?? true;
}
