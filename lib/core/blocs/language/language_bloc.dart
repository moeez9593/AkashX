import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../app/constants/pref_constants.dart';

part 'language_event.dart';
part 'language_state.dart';

@Injectable()
class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(LanguageInitial()) {
    on<LanguageEvent>((event, emit) async {
      if (event is GetLanguage) {
        final sf = await SharedPreferences.getInstance();
        emit(
          LanguageUpdate(
            Locale(sf.getString(PrefConstants.selectedLanguageCode) ?? "en"),
          ),
        );
      } else if (event is SetLanguage) {
        final sf = await SharedPreferences.getInstance();
        await sf.setString(PrefConstants.selectedLanguageCode, event.languageCode);
        emit(
          LanguageUpdate(
            Locale(event.languageCode),
          ),
        );
      }
    });
  }
}
