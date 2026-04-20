import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:News/providers/theme_provider.dart';
import 'package:News/ui/home/screen/home_screen.dart';
import 'package:provider/provider.dart';
import 'core/remote/local/prefs_manager.dart';
import 'core/resources/app_theme.dart';
import 'core/resources/routes_manager.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await EasyLocalization.ensureInitialized();
  await PrefsManager.init();
  runApp(EasyLocalization(
      startLocale: Locale("en"),
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: Locale('en'),
      child: ChangeNotifierProvider(create: (context) => ThemeProvider()..init(),
      child: const MyApp())));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          title: 'News',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: themeProvider.mode,

          initialRoute: RoutesManager.homeRouteName,
          routes: {
            RoutesManager.homeRouteName: (_) => HomeScreen(),
          },
        );
      },
    );
  }
}
