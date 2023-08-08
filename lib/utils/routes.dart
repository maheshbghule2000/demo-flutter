import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:go_router/go_router.dart';
import 'package:pagination_demo/views/screens/posts/post_pagination.dart';
import 'package:pagination_demo/views/screens/product/product_screen.dart';
import 'package:pagination_demo/views/screens/start/splash_screen.dart';

import '../views/screens/dashboard/dashboard.dart';
import '../views/screens/sign_in/sign_in.dart';
import '../views/screens/sign_up/sign_up.dart';

final unknownRoute = GetPage(
  name: Routes.splashRoute,
  page: () => SplashScreen(),
);

class Routes {
  static const String splashRoute = "/splash";
  static const String postRoute = "/post";
  static const String productRoute = "/product";
  static const String signIn = "/sign-in";
  static const String signUp = "/sign-up";
  static const String dashboard = "/dashboard";

  final GoRouter router = GoRouter(
    initialLocation: splashRoute,
    routes: <GoRoute>[
      GoRoute(
        path: splashRoute,
        builder: (BuildContext context, GoRouterState state) => SplashScreen(),
      ),
      GoRoute(
        path: productRoute,
        builder: (BuildContext context, GoRouterState state) => ProductScreen(),
      ),
      GoRoute(
        path: postRoute,
        builder: (BuildContext context, GoRouterState state) =>
            const PostPaginationScreen(),
      ),
      GoRoute(
        path: signUp,
        builder: (BuildContext context, GoRouterState state) =>
            const SignUpScreen(),
      ),
      GoRoute(
        path: signIn,
        builder: (BuildContext context, GoRouterState state) =>
            const SignInScreen(),
      ),
      GoRoute(
        path: dashboard,
        builder: (BuildContext context, GoRouterState state) =>
            const DashboardScreen(),
      ),
    ],
  );
}
