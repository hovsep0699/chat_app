import 'package:auto_route/auto_route.dart';

import 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SignupRoute.page, initial: true),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: ChatRoute.page),
        AutoRoute(page: ChatDetailsRoute.page)
      ];
}
