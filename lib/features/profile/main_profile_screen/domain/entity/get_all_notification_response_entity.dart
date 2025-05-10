class GetAllNotificationResponseEntity {
  GetAllNotificationResponseEntity({
      this.message,
      this.notifications,});
  String? message;
  List<NotificationsResponseEntity>? notifications;

}

class NotificationsResponseEntity {
  NotificationsResponseEntity({
      this.id, 
      this.title, 
      this.body,
      this.v,
  this.createdAt});
  String? id;
  String? title;
  String? body;
  DateTime ? createdAt;
  num? v;

}

