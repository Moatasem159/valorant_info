abstract class EndPoints{
  static const String baseUrl="https://valorant-api.com/v1/";
  static String agentsUrl(String lang){
    if(lang=="en"){
      return "${baseUrl}agents?isPlayableCharacter=true&language=en-US";
    }
    else if(lang=="ar"){
      return "${baseUrl}agents?isPlayableCharacter=true&language=ar-AE";
    }
    else {
      return "${baseUrl}agents?isPlayableCharacter=true&language=en-US";
    }
  }
  static String mapsUrl(String lang){
    if(lang=="en"){
    return "${baseUrl}maps?language=en-US";
    }
    else if(lang=="ar"){
    return "${baseUrl}maps?language=ar-AE";
    }
    else {
    return "${baseUrl}maps?language=en-US";
    }
  }
  static String weaponsUrl(String lang){
    if(lang=="en"){
    return "${baseUrl}weapons?language=en-US";
    }
    else if(lang=="ar"){
    return "${baseUrl}weapons?language=ar-AE";
    }
    else {
    return "${baseUrl}weapons?language=en-US";
    }
  }



}