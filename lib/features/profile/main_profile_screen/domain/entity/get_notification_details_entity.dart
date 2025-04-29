class GetNotificationDetailsEntity {
  GetNotificationDetailsEntity({this.message, this.notification, this.error});

  String? message;
  String? error;
  NotificationsDetailsEntity? notification;
}

class NotificationsDetailsEntity {
  NotificationsDetailsEntity({this.id, this.title, this.body, this.v});

  String? id;
  String? title;
  String? body;
  num? v;
}
