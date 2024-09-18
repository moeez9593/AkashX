import 'package:url_launcher/url_launcher.dart';

const String _schemePhone = 'tel';

final class UrlLauncherUtils {
  const UrlLauncherUtils._();

  static Future<void> makePhoneCall(String phoneNumber) async {
    final Uri phoneNumberUri = Uri(
      scheme: _schemePhone,
      path: phoneNumber,
    );
    await launch(phoneNumberUri);
  }

  static Future<void> openBrowser(
    String url,
  ) async {
    final Uri websiteUri = Uri.parse(url);

    await launch(websiteUri, mode: LaunchMode.externalApplication);
  }

  static Future<void> launch(
    Uri uri, {
    LaunchMode mode = LaunchMode.platformDefault,
    String? webOnlyWindowName,
  }) async {
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: mode, webOnlyWindowName: webOnlyWindowName);
    }
  }
}
