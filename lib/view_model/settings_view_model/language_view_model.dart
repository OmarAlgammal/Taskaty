import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:taskaty/repositories/local_service_repos/settings_repo.dart';

class LanguageViewModel extends ChangeNotifier{

  final LanguageSettingRepo _languageSettingRepo;

  LanguageViewModel(this._languageSettingRepo);

  static LanguageViewModel instance(BuildContext context) => Provider.of<LanguageViewModel>(context, listen: false);


  Future<void> setLanguageValue(bool value) async{
    return await _languageSettingRepo.setSettingValue(value);
  }

  bool languageIsEnglish () => _languageSettingRepo.gerSettingValue();

  String getInitialLanguageCode(){
    return _languageSettingRepo.gerSettingValue() ? 'en' : 'ar';
  }
}