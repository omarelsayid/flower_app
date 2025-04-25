import 'package:animate_do/animate_do.dart';
import 'package:flower_app/core/common/get_resposive_height_and_width.dart';
import 'package:flower_app/core/di/injectable_initializer.dart';
import 'package:flower_app/core/utils/text_styles.dart';
import 'package:flower_app/core/widgets/custom_diaolg.dart';
import 'package:flower_app/features/profile/main_profile_screen/presentation/cubit/notification_cubit/notification_view_model.dart';
import 'package:flower_app/features/profile/main_profile_screen/presentation/views/widget/notification_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../../../core/utils/app_colors.dart';
import '../cubit/notification_cubit/notifiaction_state.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var viewModel = getIt.get<NotificationViewModel>();
    return BlocProvider(
      create: (context) => viewModel..doIntent(GetAllNotificationIntent()),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back_ios),
              ),
              Text(
                "Notification",
                style: AppTextStyles.roboto500_16.copyWith(fontSize: 20),
              ),
            ],
          ),
        ),
        body: BlocConsumer<NotificationViewModel, NotificationState>(
          listener: (context, state) {
            if (state is GetAllNotificationErrorState) {
              DialogUtils.showMessage(
                context: context,
                message: state.message,
                title: "Error",
                postActionName: "Cancel",
                postAction: () {},
                negativeActionName: "Retry",
                negativeAction: () {
                  viewModel.doIntent(GetAllNotificationIntent());
                },
              );
            }
            if (state is GetNotificationDetailsLoadingState) {
              EasyLoading.show(status: "Loading...");
            }
            if (state is GetNotificationDetailsErrorState) {
              EasyLoading.dismiss();
              DialogUtils.showMessage(
                context: context,
                message: state.message,
                title: "Error",
                postActionName: "Cancel",
                postAction: () {
                  Navigator.pop(context);
                },
              );
            }

            if (state is GetNotificationDetailsSuccessState) {
              EasyLoading.dismiss();
            }
          },
          builder: (context, state) {
            return state is GetAllNotificationLoadingState ||
                    state is DeleteNotificationLoadingState
                ? Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                )
                : state is GetAllNotificationSuccessState &&
                        state.notificationsResponseEntity.isNotEmpty ||
                    state is DeleteNotificationSuccessState
                ? ListView.builder(
                  padding: EdgeInsets.only(top: resposiveHeight(24)),
                  itemCount: viewModel.notificationList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () async {
                        showDialog(
                          context: context,
                          builder:
                              (_) => FadeInUp(
                                duration: Duration(milliseconds: 1500),
                                child: AlertDialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  title: Text(
                                    viewModel.notificationList[index].title ??
                                        "No Title",
                                  ),
                                  content: Text(
                                    viewModel.notificationList[index].body ??
                                        "No Details Found.",
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed:
                                          () =>
                                              Navigator.of(
                                                context,
                                                rootNavigator: true,
                                              ).pop(),
                                      child: Text("Close"),
                                    ),
                                  ],
                                ),
                              ),
                        );
                      },
                      child: Slidable(
                        closeOnScroll: true,
                        startActionPane: ActionPane(
                          motion: BehindMotion(),
                          extentRatio: .18,
                          dragDismissible: true,
                          children: [
                            SlidableAction(
                              backgroundColor: AppColors.primaryColor,
                              foregroundColor: AppColors.whiteColor,
                              autoClose: true,
                              label: "Delete",
                              padding: EdgeInsets.zero,
                              onPressed: (context) {
                                viewModel.doIntent(
                                  DeleteNotificationIntent(
                                    viewModel.notificationList[index].id
                                        .toString(),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        child: NotificationCardWidget(
                          notification: viewModel.notificationList[index],
                        ),
                      ),
                    );
                  },
                )
                : Center(child: Text("No Notification Found"));
          },
        ),
      ),
    );
  }
}
