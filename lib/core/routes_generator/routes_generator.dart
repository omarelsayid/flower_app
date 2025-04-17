import 'package:flower_app/features/address_details/presentation/view/address_detail_view.dart';
import 'package:flower_app/features/home/best_seller_products/presentation/views/best_seller_view.dart';
import 'package:flower_app/features/home/categories/presentation/categories_tab.dart';
import 'package:flower_app/core/routes_generator/pages_routes.dart';
import 'package:flower_app/features/auth/presentation/views/sign_in_screen.dart';
import 'package:flower_app/features/auth/presentation/views/sign_up_screen.dart';
import 'package:flower_app/features/home/products_details/presentation/views/products_details_view.dart';
import 'package:flower_app/features/home/occasions/presentation/views/occasion_screen.dart';
import 'package:flower_app/layout/presentation/layout_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/auth/presentation/views/forget_passwerd/email_verification_screen.dart';
import '../../features/auth/presentation/views/forget_passwerd/forget_paswerd_screen.dart';
import '../../features/auth/presentation/views/forget_passwerd/reset_password/reset_password.dart';
import '../../features/cart/presentation/cubit/add_to_cart_cubit/add_to_cart_cubit.dart';
import '../../features/cart/presentation/cubit/get_user_cart_cubit/get_user_cart_cubit.dart';
import '../../features/profile/main_profile_screen/presentation/cubit/change_password_cubit/change_password_view-model.dart';
import '../../features/profile/main_profile_screen/presentation/views/change_password_screen.dart';
import '../../features/profile/main_profile_screen/presentation/views/edit_profile_view.dart';
import '../di/injectable_initializer.dart';

class RoutesGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PagesRoutes.signUpScreen:
        return MaterialPageRoute(
          builder: (context) => const SignUpScreen(),
          settings: settings,
        );
      case PagesRoutes.signInScreen:
        return MaterialPageRoute(
          builder: (context) => SignInScreen(),
          settings: settings,
        );
      case PagesRoutes.layOutScreen:
        return MaterialPageRoute(
          builder:
              (context) => MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (context) => getIt.get<AddToCartCubit>(),
                  ),
                  BlocProvider(
                    create: (context) => getIt.get<GetUserCartCubit>(),
                  ),
                ],
                child: LayoutScreen(),
              ),
          settings: settings,
        );

      case PagesRoutes.forgetPassword:
        return MaterialPageRoute(
          builder: (context) => const ForgetPasswordScreen(),
          settings: settings,
        );
      case PagesRoutes.emailVerification:
        return MaterialPageRoute(
          builder: (context) => EmailVerificationsScreen(),
          settings: settings,
        );

      case PagesRoutes.productDetails:
        return MaterialPageRoute(
          builder:
              (context) => BlocProvider(
                create: (context) => getIt.get<AddToCartCubit>(),
                child: ProductsDetailsView(),
              ),
          settings: settings,
        );

      case PagesRoutes.categoriesScreen:
        return MaterialPageRoute(
          builder: (context) => CategoriesTab(),
          settings: settings,
        );

      case PagesRoutes.occasionScreen:
        return MaterialPageRoute(
          builder: (context) => OccasionsScreen(),
          settings: settings,
        );

      case PagesRoutes.resetPassword:
        return MaterialPageRoute(
          builder: (_) => ResetPassword(),
          settings: settings,
        );

      case PagesRoutes.bestSellerScreen:
        return MaterialPageRoute(
          builder: (context) => BestSellerView(),
          settings: settings,
        );
        return MaterialPageRoute(
          builder: (_) => ResetPassword(),
          settings: settings,
        );
      case PagesRoutes.changePasswordScreen:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => getIt.get<ChangePasswordViewModel>(),
                child: ChangePasswordScreen(),
              ),
          settings: settings,
        );
      case PagesRoutes.editProfileScreen:
        return MaterialPageRoute(
          builder: (context) => EditProfileView(),
          settings: settings,
        );

      case PagesRoutes.addressScreen:
        return MaterialPageRoute(
          builder: (context) => AddressDetailsView(),
        );

      default:
        return unDefinedRoute();
    }
  }
}

Route<dynamic> unDefinedRoute() {
  return MaterialPageRoute(
    builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Un defined route"),
          centerTitle: true,
        ),
        body: const Center(child: Text("Un defined route")),
      );
    },
  );
}
