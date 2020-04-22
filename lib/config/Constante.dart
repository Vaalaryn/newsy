class Constante {
//  static String baseApiUrl = 'http://gendalim.fr:8080';
  static String baseApiUrl = 'http://192.168.1.63';
  static String regexMail = r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$";
  static String regexUsername = r"^[A-Za-z0-9]+(?:[ _-][A-Za-z0-9]+)*$";
  static String regexPassword = r"^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!#$%&?@])[0-9a-zA-Z!#$%&?@]{8,}$";
  static String defaultLang = 'fr';
  static bool defaultThemeBrightness = true;
  static int defaultThemeColor= 12;
}