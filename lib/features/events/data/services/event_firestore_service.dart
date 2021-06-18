import 'package:firebase_helpers/firebase_helpers.dart';
import 'package:calendar_old/core/data/data_constants.dart';
import 'package:calendar_old/features/events/data/model/app_event.dart';

final eventDBS = DatabaseService<AppEvent>(
  AppDBConstants.eventsCollection,
  fromDS: (id, data) => AppEvent.fromDS(id, data),
  toMap: (event) => event.toMap(),
);