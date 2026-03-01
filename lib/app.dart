import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homz/core/routing/routes.dart';
import 'package:homz/core/theme/app_theme.dart';
import 'core/routing/app_router.dart';


class ApplicationRoot extends StatelessWidget {
  final AppRouter appRouter;
  const ApplicationRoot({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Homz',
        theme: AppTheme.dark,
        initialRoute: Routes.onBoardingScreen,
        onGenerateRoute: appRouter.onGenerateRoute,
      ),
    );
  }
}
