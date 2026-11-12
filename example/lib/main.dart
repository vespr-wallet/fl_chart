import 'package:fl_chart_app/cubits/app/app_cubit.dart';
import 'package:fl_chart_app/presentation/resources/app_resources.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_ui/material_ui.dart';

import 'presentation/router/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppCubit>(create: (BuildContext context) => AppCubit()),
      ],
      child: MaterialApp.router(
        title: AppTexts.appName,
        theme: ThemeData(
          brightness: Brightness.dark,
          useMaterial3: true,
          // google_fonts still returns package:flutter's TextTheme, which is
          // not material_ui's, so only take the font family from it.
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: AppColors.mainTextColor3,
                fontFamily: GoogleFonts.assistant().fontFamily,
              ),
          scaffoldBackgroundColor: AppColors.pageBackground,
        ),
        routerConfig: appRouterConfig,
      ),
    );
  }
}
