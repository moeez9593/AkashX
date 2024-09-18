import 'dart:io';

import 'package:akashx/core/domain/model/resource.dart';
import 'package:akashx/core/domain/model/ui_error.dart';
import 'package:akashx/core/domain/model/user.dart';
import 'package:akashx/core/utils/app_utils.dart';
import 'package:akashx/features/auth/domain/model/auth_error.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../app/constants/pref_constants.dart';
import '../network/auth_client.dart';

@Injectable()
class AuthDataSource {
  final AuthClient _authClient;

  AuthDataSource(this._authClient);

  Stream<Resource<bool, AuthError>> loginUser(
    String username,
    String password,
    bool remember,
  ) async* {
    try {
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      AndroidDeviceInfo? androidInfo;
      if (Platform.isAndroid) {
        androidInfo = await deviceInfo.androidInfo;
      }
      IosDeviceInfo? iosInfo;
      if (Platform.isIOS) {
        iosInfo = await deviceInfo.iosInfo;
      }
      final loginRes = await _authClient.loginUser(
        {
          "username": username,
          "password": password,
          "device_token" : "",//OneSignal.User.pushSubscription.id,
          "device_uuid": "D05B1832-DD00-4879-811B-E40E12EF616C",
          "device_type": Platform.isAndroid ? "Android" : "iOS",
          "device_name": Platform.isAndroid
              ? (androidInfo?.device ?? "")
              : (iosInfo?.name ?? ""),
          "device_model": Platform.isAndroid
              ? (androidInfo?.model ?? "")
              : (iosInfo?.model ?? ""),
        },
      );
      if (loginRes.loginData?.user != null) {
        final sp = await SharedPreferences.getInstance();
        sp.setString(PrefConstants.authToken, loginRes.loginData!.token);
        sp.setString(
            PrefConstants.userFirstName, loginRes.loginData!.user!.firstname);
        sp.setString(
            PrefConstants.userLastName, loginRes.loginData!.user!.firstname);
        sp.setString(
            PrefConstants.userLastName, loginRes.loginData!.user!.lastname);
        sp.setBool(PrefConstants.isLoggedIn, true);
        yield ResourceSuccess(true);
      } else {
        yield ResourceError(
          error: UIError(type: AuthError.server, message: loginRes.message!),
        );
      }
    } catch (e) {
      print(e);
      yield ResourceError(
          error: UIError(
        type: AuthError.network,
      ));
    }
  }

  Stream<Resource<User, AuthError>> loadUser() async* {
    try {
      final sp = await SharedPreferences.getInstance();
      final res = await _authClient.userDetails(
          AppUtils.getAuthorisation(sp.getString(PrefConstants.authToken)!));
      if (res == null) {
        yield ResourceError(error: UIError(type: AuthError.network));
      } else {
        yield ResourceSuccess(res);
      }
    } catch (e) {
      print(e);
      yield ResourceError(error: UIError(type: AuthError.network));
    }
  }

  Stream<Resource<bool, AuthError>> updateUser(
      String email,
      String password,
      String phone,
      String companyName,
      String firstname,
      String lastname) async* {
    try {
      final sp = await SharedPreferences.getInstance();
      final res = await _authClient.updateUser(
          AppUtils.getAuthorisation(sp.getString(PrefConstants.authToken)!), {
        "email": email,
        "password": password,
        "phone": phone,
        "firstname": firstname,
        "lastname": lastname,
        "company_name": companyName,
      });
      yield ResourceSuccess(true);
    } catch (e) {
      print(e);
      yield ResourceError(error: UIError(type: AuthError.network));
    }
  }
}
