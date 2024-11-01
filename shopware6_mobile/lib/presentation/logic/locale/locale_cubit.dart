import 'dart:io';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'locale_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  LocaleCubit({required this.supportedLocales})
      : super(
          LocaleUpdate(
            Locale(kIsWeb ? 'en' : Platform.localeName.split('_')[0]),
          ),
        );

  final List<Locale> supportedLocales;

  void updateLocale(Locale locale) {
    if (!supportedLocales.contains(locale)) {
      emit(LocaleUpdate(locale));
    }
  }
}
