abstract class EndPoints{
  static const String baseUrl="https://valorant-api.com/v1/";
  static String agentsUrl(String lang)=>urlLocal("${baseUrl}agents?isPlayableCharacter=true&",lang);
  static String mapsUrl(String lang)=>urlLocal("${baseUrl}maps?",lang);
  static String weaponsUrl(String lang)=>urlLocal("${baseUrl}weapons?", lang);
  static String urlLocal(String url,String lang){
    if(lang=="en"){
      return "${url}language=en-US";
    }
    else if(lang=="ar"){
      return "${url}language=ar-AE";
    }
    else {
      return "${url}language=en-US";
    }
  }
}