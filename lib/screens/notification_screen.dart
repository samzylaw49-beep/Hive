import 'notification_model.dart';
import 'user_model.dart';

class NotificationService {

  static final List<HiveNotification> notifications = [];


  static void addNotification({

    required UserProfile fromUser,

    required String type,

    required String message,

  }) {

    notifications.insert(

      0,

      HiveNotification(

        fromUser: fromUser,

        type: type,

        message: message,

        createdAt: DateTime.now(),

      ),

    );

  }

}