import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:calendar_old/core/presentation/res/app_config.dart';
import 'package:calendar_old/core/presentation/res/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:calendar_old/features/auth/model/user_repository.dart';
import 'package:calendar_old/features/service/push_notification_service.dart';

final analyticsProvider = Provider((ref) => FirebaseAnalytics());
final pnProvider = Provider((ref) => PushNotificationService());

final userRepoProvider = ChangeNotifierProvider<UserRepository>((ref) {
  final notifService = ref.watch(pnProvider);
  return UserRepository.instance(notifService);
});
final configProvider = Provider<AppConfig>((ref) => AppConfig(
  appTitle: AppConstants.appName,
  buildFlavor: AppFlavor.prod,
));