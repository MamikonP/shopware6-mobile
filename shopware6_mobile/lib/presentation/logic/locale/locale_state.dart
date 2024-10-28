part of 'locale_cubit.dart';

abstract class LocaleState extends Equatable {
  const LocaleState(this.locale);

  final Locale locale;

  @override
  List<Object> get props => <Object>[locale];
}

class LocaleUpdate extends LocaleState {
  const LocaleUpdate(super.locale);
}
