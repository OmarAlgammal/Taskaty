
import 'package:taskaty/repositories/local_service_repos/settings_repo.dart';

class LanguageViewModel{

  final LanguageSettingRepo _languageSettingRepo;

  LanguageViewModel(this._languageSettingRepo);


  Future<void> setLanguageValue(bool value) async{
    return await _languageSettingRepo.setSettingValue(value);
  }

  bool languageIsEnglish () => _languageSettingRepo.gerSettingValue();

  String getInitialLanguageCode(){
    return _languageSettingRepo.gerSettingValue() ? 'en' : 'ar';
  }
}