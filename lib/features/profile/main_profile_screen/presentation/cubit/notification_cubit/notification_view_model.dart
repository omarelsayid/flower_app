import 'package:flower_app/features/profile/main_profile_screen/domain/entity/get_all_notification_response_entity.dart';
import 'package:flower_app/features/profile/main_profile_screen/domain/use_case/notification_use_case.dart';
import 'package:flower_app/features/profile/main_profile_screen/presentation/cubit/notification_cubit/notifiaction_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/result.dart';
@injectable
class NotificationViewModel extends Cubit<NotificationState>{
  NotificationViewModel(this._useCase):super(GetAllNotificationLoadingState());
 final NotificationUseCase _useCase;
  List<NotificationsResponseEntity> notificationList=[];
  void doIntent(NotificationIntent intent){
    switch(intent){
      case GetAllNotificationIntent():
        _getAllNotification();
        break;
      case GetNotificationDetailsIntent():
        _getNotificationDetails(intent.id);
        break;
      case DeleteNotificationIntent():
        _deleteNotification(intent.id);
        break;
    }
  }
 void _getAllNotification()async{
   emit(GetAllNotificationLoadingState());
   final result = await _useCase.getAllNotification();
   switch(result){
     case Success():
       var data=result.data;
       if(data!.message == "success"){
         notificationList=data.notifications??[];
         emit(GetAllNotificationSuccessState(notificationList));
       }else{
         emit(GetAllNotificationErrorState(data.message.toString()));
       }
     case Error():
       emit(GetAllNotificationErrorState(result.exception!));
   }
 }
 void _getNotificationDetails(String id)async{
   emit(GetNotificationDetailsLoadingState());
   final result = await _useCase.getNotificationDetails(id);
   switch(result){
     case Success():
       var data=result.data;
       if(data!.message == "success"){
         emit(GetNotificationDetailsSuccessState(data.notification!));
       }else{
         emit(GetNotificationDetailsErrorState(data.error.toString()));
       }
     case Error():
       emit(GetNotificationDetailsErrorState(result.exception!));
   }
 }
void _deleteNotification(String id)async{
  emit(DeleteNotificationLoadingState());
  final result = await _useCase.deleteNotification(id);
  switch(result){
    case Success():
      var data=result.data;
      if(data!.message == "success"){
        _getAllNotification();
        emit(DeleteNotificationSuccessState());

      }else{
        emit(DeleteNotificationErrorState(data.error.toString()));
      }
    case Error():
      emit(DeleteNotificationErrorState(result.exception!));
  }}
}
sealed class NotificationIntent{}
class GetAllNotificationIntent extends NotificationIntent{}
class GetNotificationDetailsIntent extends NotificationIntent{
  final String id;
  GetNotificationDetailsIntent(this.id);
}
class DeleteNotificationIntent extends NotificationIntent{
  final String id;
  DeleteNotificationIntent(this.id);
}