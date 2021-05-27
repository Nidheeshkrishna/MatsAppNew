import 'package:shared_preferences/shared_preferences.dart';

class GeneralTools {
  Future<void> prefsetLoginInfo(String userId, String userApikey) async {
    // ignore: invalid_use_of_visible_for_testing_member
    SharedPreferences.setMockInitialValues({});
    var prefs = await SharedPreferences.getInstance();
    //await prefs.setString("SELECTED_TOWN", selectedTown.toString());
    //await prefs.setInt("USER_STATUS", status);

    await prefs.setString("USER_MOBILE", userId.toString());
    await prefs.setString("USER_API_KEY", userApikey.toString());

    // await prefs.setString("SELECTED_STATE", login.accState);
    // await prefs.setString("SELECTED_DISTRICT", login.accDistrict);
    // await prefs.setInt("USER_ID", login.accId);

    // LoginUserInfo().setstatus = status;
    // LoginUserInfo().setuserName = userId;
    // LoginUserInfo().setuserTown = selectedTown;

    //print("session$selected_Town");
  }
}
