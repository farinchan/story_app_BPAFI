import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_app_bpafi/core/routes/app_router.dart';
import 'package:story_app_bpafi/core/styles/themes/app_theme.dart';
import 'package:story_app_bpafi/injection.dart';
import 'package:story_app_bpafi/presentation/bloc/register_bloc.dart';

void main() {
  init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => getIt<RegisterBloc>())],
      child: MaterialApp.router(
        title: 'Story App',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        routerConfig: AppRoute.router,
      ),
    );
  }
}
