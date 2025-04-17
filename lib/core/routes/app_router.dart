import 'package:go_router/go_router.dart';
import 'package:story_app_bpafi/presentation/pages/register_page.dart';

class AppRoute {
  static final GoRouter router = GoRouter(
    initialLocation: RegisterPage.route,
    routes: [
      GoRoute(
        path: RegisterPage.route,
        builder: (context, state) => const RegisterPage(),
      ),
    ],
  );
}