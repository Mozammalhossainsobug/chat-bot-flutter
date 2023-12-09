import 'package:chat_bot_flutter/src/core/services/routes/routes.dart';
import 'package:chat_bot_flutter/src/features/inbox/presentation/pages/inbox_page.dart';
import 'package:chat_bot_flutter/src/features/on_boarding/presentation/pages/on_boarding_page.dart';
import 'package:chat_bot_flutter/src/features/splash_screen/presentation/splash_page.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static void get controller {}

  static Route<dynamic>? generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.inbox:
        return MaterialPageRoute(
          builder: (_) => const InboxPage(),
        );

      case Routes.onBoarding:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingPage(),
        );

      case Routes.splashScreen:
        return MaterialPageRoute(
          builder: (_) => const SplashScreenPage(),
        );
      //
      // case Routes.forgotPassword:
      //   return MaterialPageRoute(
      //     builder: (_) => const ForgotPasswordPage(),
      //   );
      //
      // case Routes.welcome:
      //   return MaterialPageRoute(builder: (_) => const SuccessPage());
      //
      // case Routes.webView:
      //   return MaterialPageRoute(
      //     builder: (_) => WebViewPage(
      //       url: routeSettings.arguments! as String,
      //     ),
      //   );
      //
      // case Routes.resetPassword:
      //   return MaterialPageRoute(
      //     builder: (_) => const SetNewPasswordPage(),
      //   );
      //
      // case Routes.changePassword:
      //   return MaterialPageRoute(
      //     builder: (_) => const ChangePasswordPage(),
      //   );
      //
      // case Routes.updateProfile:
      //   return MaterialPageRoute(
      //     builder: (_) => const UpdateProfilePage(),
      //   );
      //
      // case Routes.identityVerification:
      //   final arguments = routeSettings.arguments! as Map<String, dynamic>;
      //   return MaterialPageRoute(
      //     builder: (_) => IdentityVerificationPage(
      //       isFromSignUp: arguments['isFromSignUp'] as bool,
      //     ),
      //   );

      default:
        return null;
    }
  }
}
