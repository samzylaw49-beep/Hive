import 'user_model.dart';

class HiveNotification {

  final UserProfile fromUser;

  final String type;

  final String message;

  final DateTime createdAt;


  HiveNotification({

    required this.fromUser,

    required this.type,

    required this.message,

    required this.createdAt,

  });

}