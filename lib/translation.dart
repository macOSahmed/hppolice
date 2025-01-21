import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'welcome': 'Welcome To',
          'police': 'Himachal Pradesh Police',
          'login': 'Login',
          'citizen': 'CITIZEN',
          'police_officer': 'POLICE',
          'privacy_policy': 'I have read the Privacy Policy.',
          'login_sso': 'Login with SSO',
          'login_id': 'Login Id/Username',
          'password': 'Password',
          'forgot_password': 'Forgot Password?',
          'change_language': 'Change Language',
        },
        'hi_IN': {
          'welcome': 'स्वागत है',
          'police': 'हिमाचल प्रदेश पुलिस',
          'login': 'लॉगिन',
          'citizen': 'नागरिक',
          'police_officer': 'पुलिस',
          'privacy_policy': 'मैंने गोपनीयता नीति पढ़ी है।',
          'login_sso': 'एसएसओ के साथ लॉगिन करें',
          'login_id': 'लॉगिन आईडी/यूजरनेम',
          'password': 'पासवर्ड',
          'forgot_password': 'पासवर्ड भूल गए?',
          'change_language': 'भाषा बदलें',
        },
      };
}
