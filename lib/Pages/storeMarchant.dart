import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webapp/Pages/completeBusinessProfile.dart';
import 'package:webapp/Services/storeMarchantRest.dart';
import 'package:webapp/models/storMarchantModel.dart';
import 'package:webapp/widgets/storepagewidget.dart';

class StoreMarchant extends StatefulWidget {
  @override
  _StoreMarchantState createState() => _StoreMarchantState();
}

class _StoreMarchantState extends State<StoreMarchant> {
  late SharedPreferences sharedPrefs;
  TextEditingController phonenumber = TextEditingController();

  String? mobileNumber;

  String? apikey;

  Future<GetStoreModel> store = fetchstoreMarchant('');

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((prefs) {
      setState(() => sharedPrefs = prefs);
      setState(() {
        //townSelectedStore = sharedPrefs.getString('SELECTED_TOWN');
        mobileNumber = sharedPrefs.getString('USER_MOBILE');
        //deviceToken = sharedPrefs.getString('USER_API_Token');
        apikey = sharedPrefs.getString("USER_API_KEY");
        //print("Token $deviceToken");
        phonenumber.text = mobileNumber!.toString();
      });

      //hotSpotsFuture = fetchHotSpot(townSelectedStore);
    });
  }

  @override
  Widget build(BuildContext context) {
    int index;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.grey[600],
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
          title: Text(
            'Your Store',
            style: TextStyle(color: Colors.grey[600]),
          ),
          actions: [
            Container(
                padding: EdgeInsets.only(right: 20),
                child: IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CompleteBusinessProfile(
                                    businessID: 0,
                                  )));
                    }))
          ],
        ),
        body: FutureBuilder<GetStoreModel>(
            future: fetchstoreMarchant(phonenumber.toString()),
            builder:
                (BuildContext context, AsyncSnapshot<GetStoreModel> snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.result.length,
                  itemBuilder: (BuildContext context, int index) {
                    return SingleChildScrollView(
                      child: Container(
                        margin: EdgeInsets.only(left: 6, right: 6),
                        child: new StorePageWidget(
                          logo: snapshot.data!.result[index].businessLogo,
                          businessname:
                              snapshot.data!.result[index].businessName,
                          businessaddress:
                              snapshot.data!.result[index].businessAddress,
                          bussinessID: snapshot.data!.result[index].businessId,
                        ),
                      ),
                    );
                  },
                );
              } else
                return Center(child: CircularProgressIndicator());
            }));
  }
}
