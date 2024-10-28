import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/routes/app_router.dart';
import 'core/themes/app_theme.dart';
import 'l10n/l10n.dart';
import 'presentation/logic/locale/locale_cubit.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = AppThemeData();
    return BlocBuilder<LocaleCubit, LocaleState>(
      builder: (context, state) => MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRouter.onGenerateRoute,
        theme: themeData.lightTheme,
        darkTheme: themeData.darkTheme,
        locale: state.locale,
        supportedLocales: L10n.locales,
        localeResolutionCallback: L10n.localeResolutionCallback,
        localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
      ),
    );
  }
}
