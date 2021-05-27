import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:dotted_border/dotted_border.dart';
import 'package:webapp/Services/getBusinessesOfMerchantService.dart';
import 'package:webapp/Services/validateCouponService.dart';
import 'package:webapp/models/businessesOfMerchantModel.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Validation extends StatefulWidget {
  @override
  _ValidationState createState() => _ValidationState();
}

class _ValidationState extends State<Validation> {
  late Future<BusinessesOfMerchantModel> data;
  late BusinessesOfMerchantModel businessData;

  Future getData() async {
    await getBusinessesOfMerchant("9946895323").then((value) => {
          _mySelection = value.result[0].businessId.toString(),
        });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  TextEditingController couponCodeController = new TextEditingController();
  final formKey = GlobalKey<FormState>();
  String iD = "";
  int valid = 0;
  String _mySelection = "", qrData = "";
  static late MediaQueryData _mediaQueryData;
  static double screenheight = _mediaQueryData.size.height;
  static double screenwidth = _mediaQueryData.size.width;
  @override
  Widget build(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: Text(
                "Your Stores",
                style: TextStyle(color: Colors.grey),
              ),
              automaticallyImplyLeading: true,
              centerTitle: true,
              elevation: 5,
              iconTheme: IconThemeData(
                color: Colors.black,
              ),
            ),
            body: Container(
                height: screenheight,
                width: screenwidth,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          FutureBuilder<BusinessesOfMerchantModel>(
                            future: getBusinessesOfMerchant("9946895323"),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                businessData = snapshot.data!;
                                List<Result> businessList =
                                    businessData.result.toList();
                                return Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black,
                                      ),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5))),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                      hint: Text("Select Store Here"),
                                      items: businessList.map((item) {
                                        iD = item.businessId.toString();
                                        return new DropdownMenuItem(
                                            child: new Text(item.businessName),
                                            value: iD);
                                      }).toList(),
                                      onChanged: (value) {
                                        setState(() {
                                          _mySelection = value.toString();
                                        });
                                      },
                                      value: _mySelection,
                                    ),
                                  ),
                                );
                              } else
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                              alignment: Alignment.center,
                              child: qrData.isNotEmpty
                                  ? QrImage(
                                      data: qrData,
                                      version: QrVersions.auto,
                                      size: 180.0,
                                    )
                                  : Icon(
                                      Icons.qr_code,
                                      size: 100,
                                    )),
                          TextButton(
                            child: Text(
                              "Generate QR-Code",
                              style: TextStyle(color: Colors.orange),
                            ),
                            onPressed: () {
                              setState(() {
                                qrData = _mySelection;
                              });
                            },
                          ),
                          Text(
                            "OR",
                            style: TextStyle(color: Colors.grey),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          DottedBorder(
                              dashPattern: [8],
                              strokeWidth: 2,
                              strokeCap: StrokeCap.square,
                              color: Colors.orange,
                              child: Container(
                                width: (screenwidth / 100) * 70,
                                child: Form(
                                  key: formKey,
                                  child: TextFormField(
                                    controller: couponCodeController,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Enter Coupon Number!";
                                      }
                                      return null;
                                    },
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                        filled: true,
                                        border: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none,
                                        fillColor: Colors.deepOrange[50],
                                        hintText: 'Enter Code',
                                        hintStyle: TextStyle()),
                                  ),
                                ),
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Note"),
                                Text(
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque a fermentum nibh. Etiam eu nisi eu erat porttitor dignissim. Integer orci massa, sollicitudin lobortis sagittis vel, laoreet id velit. Phasellus sit amet odio ipsum.",
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: (screenwidth / 100) * 75,
                            height: 40,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.orangeAccent, // background
                                  onPrimary: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  ValidateCoupon(
                                          couponCodeController.text.toString())
                                      .then((value) => valid = value.result)
                                      .whenComplete(() {
                                    if (valid.toString().isNotEmpty) {
                                      print("Valid=$valid");
                                      showAlertDialog(context, valid);
                                    }
                                  });
                                }
                              },
                              child: Text('Validate'),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ))));
  }

  showAlertDialog(BuildContext context, int valid) {
    AlertDialog alert = AlertDialog(
      title: valid == 1
          ? Text("Successfully Validated !")
          : Text(" Validation Failed !"),
      //  content:valid==1?Image.asset(""):Image.asset("") ,Todo Add Images,
      actions: [
        TextButton(
            onPressed: () {},
            child: Text(
              "Back",
              style: TextStyle(color: Colors.orange),
            ))
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
