
class Language{
  int id;
  String name="";
  String languageCode="";
  Language({required this.id,required this.name,required this.languageCode});

  static List<Language> languageList(){
    return <Language>[
      Language(id: 0,name: 'English',languageCode: 'en'),
      Language(id: 1,name: 'हिंदी',languageCode: 'hi'),
    ];
  }

}