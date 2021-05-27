import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:webapp/Pages/homepage.dart';
import 'package:webapp/Services/CompletebussinessdetailsRest.dart';
import 'package:webapp/Services/getCategoryRest.dart';
import 'package:webapp/Services/getStateRest.dart';
import 'package:webapp/Services/getSubCategoryRest.dart';
import 'package:webapp/Services/getdistrictRest.dart';
import 'package:webapp/models/getCategoryModel.dart';
import 'package:webapp/models/getDistrictModel.dart';
import 'package:webapp/models/getStateModel.dart';
import 'package:webapp/models/getSubCategoryModel.dart';
import 'package:webapp/widgets/TextFormfield.dart';

class CompleteBussinessDetails extends StatefulWidget {
  final String mobile1;
  CompleteBussinessDetails({required this.mobile1});

  @override
  _CompleteBussinessDetailsState createState() =>
      _CompleteBussinessDetailsState();
}

class _CompleteBussinessDetailsState extends State<CompleteBussinessDetails> {
  late Future<GetdistrictModel> data;
  late List<Resultdist> districtdata;
  Future getData() async {
    await fetchdistrict("Thrissur").then((value) => {
          districtdatavalue = value.resultdist[0].fkDistrict.toString(),
        });
  }

  late Future<Resultstate> data1;
  late List<Resultstate> statedata;
  Future getDatastate() async {
    await fetchState("Kerala").then((value) => {
          statedatavalue = value.result[0].disFkState.toString(),
        });
  }

  late Future<ResultCategory> datacategory;
  late List<ResultCategory> catagorydata;
  Future getDataCategory() async {
    await fetchcategory().then((value) => {
          statedatavalue = value.result[0].categoryName.toString(),
        });
  }

  late Future<ResultsubCategory> datasubcategory;
  late List<ResultsubCategory> subcatagorydata;
  Future getDatasubCategory() async {
    await fetchSubcategory(categoryID).then((value) => {
          subcategoryvalue = value.result[0].bscSubCatgName,
        });
  }

  TextEditingController businessname = TextEditingController();
  TextEditingController ownername = TextEditingController();
  TextEditingController district = TextEditingController();
  TextEditingController bussinesstype = TextEditingController();
  TextEditingController businesscategory = TextEditingController();
  String statedatavalue = '';
  String districtdatavalue = '';
  String categorydatavalue = '';
  String subcategoryvalue = '';
  dynamic categoryID = 4;

  late String subcategory;
  late String bussinessstatus;

  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    getData();
    getDatastate();
  }

  @override
  Widget build(BuildContext context) {
    String label;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: SafeArea(
              child: Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            margin: EdgeInsets.all(15),
            child: Column(
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * .5,
                        height: MediaQuery.of(context).size.height * .3,
                        child: Image.asset("images/icn.png"),
                      ),
                      Text(
                        'Complete Bussiness Details',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextFormWidget(
                        validationtext: 'Please enter Bussiness Name',
                        labeltext: 'Business Name',
                        hindtext: 'Business Name',
                        controllerobject: businessname,
                        icon: Icon(Icons.business),
                        formvalidator: 'Please enter Bussiness Name',
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormWidget(
                        validationtext: 'Please enter Owner Name',
                        labeltext: 'Owner Name',
                        hindtext: 'Owner Name',
                        controllerobject: ownername,
                        icon: Icon(Icons.person),
                        formvalidator: 'Please enter Owner Name',
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.orange)),
                        child: FutureBuilder<GetStateModel>(
                            future: fetchState("Kerala"),
                            builder: (BuildContext context,
                                AsyncSnapshot<GetStateModel> snapshot) {
                              if (snapshot.hasData) {
                                statedata = snapshot.data!.result;

                                return DropdownButtonFormField(
                                    hint: Container(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Text('district')),
                                    items: statedata.map((item) {
                                      return new DropdownMenuItem(
                                        child: new Text(item.disPkDistrict),
                                        value: item.disPkDistrict,
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        statedatavalue = value.toString();
                                      });
                                    });
                              } else
                                return Center(
                                    child: CircularProgressIndicator());
                            }),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.orange)),
                        child: FutureBuilder<GetdistrictModel>(
                            future: fetchdistrict("Thrissur"),
                            builder: (BuildContext context,
                                AsyncSnapshot<GetdistrictModel> snapshot) {
                              if (snapshot.hasData) {
                                districtdata = snapshot.data!.resultdist;

                                return DropdownButtonFormField(
                                  hint: Container(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Text('town')),
                                  items: districtdata.map((item) {
                                    return new DropdownMenuItem(
                                      child: new Text(item.pkTown),
                                      value: item.pkTown,
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      districtdatavalue = value.toString();
                                    });
                                  },
                                );
                              } else
                                return Center(
                                    child: CircularProgressIndicator());
                            }),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.orange)),
                        child: FutureBuilder<GetCategoryModel>(
                            future: fetchcategory(),
                            builder: (BuildContext context,
                                AsyncSnapshot<GetCategoryModel> snapshot) {
                              if (snapshot.hasData) {
                                catagorydata = snapshot.data!.result;

                                return DropdownButtonFormField(
                                    hint: Container(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Text('Category')),
                                    items: catagorydata.map((item) {
                                      categoryID = item.id;
                                      return new DropdownMenuItem(
                                        child: new Text(item.categoryName),
                                        value: item.categoryName,
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        categorydatavalue = value.toString();
                                      });
                                    });
                              } else
                                return Center(
                                    child: CircularProgressIndicator());
                            }),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.orange)),
                        child: FutureBuilder<GetsubCategoryModel>(
                            future: fetchSubcategory(4),
                            builder: (BuildContext context,
                                AsyncSnapshot<GetsubCategoryModel> snapshot) {
                              if (snapshot.hasData) {
                                subcatagorydata = snapshot.data!.result;

                                return DropdownButtonFormField(
                                    hint: Container(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Text('subCategory')),
                                    items: subcatagorydata.map((item) {
                                      return new DropdownMenuItem(
                                        child: new Text(item.bscSubCatgName),
                                        value: item.bscSubCatgName,
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        subcategoryvalue = value.toString();
                                      });
                                    });
                              } else
                                return Center(
                                    child: CircularProgressIndicator());
                            }),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
                RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: Color.fromRGBO(255, 181, 23, 1),
                    child: Container(
                        padding: EdgeInsets.only(left: 30, right: 30),
                        child: Container(
                          padding: EdgeInsets.only(
                              left: 40, right: 40, top: 15, bottom: 15),
                          child: Text(
                            'Continue',
                            style: TextStyle(color: Colors.white),
                          ),
                        )),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {}
                      // If the form is valid, display a Snackbar.
                      fetchBussinessRegistration(
                              businessname.text.toString(),
                              ownername.text.toString(),
                              statedatavalue.characters.toString(),
                              districtdatavalue.characters.toString(),
                              categorydatavalue.characters.toString(),
                              subcategoryvalue.characters.toString(),
                              widget.mobile1)
                          .then((value) => {bussinessstatus = value.bmStatus})
                          .whenComplete(() => {
                                if (bussinessstatus == 'New')
                                  {
                                    Fluttertoast.showToast(
                                        msg: "Registration Completed",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor:
                                            Color.fromRGBO(255, 181, 23, 1),
                                        textColor: Colors.white,
                                        fontSize: 16.0),
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => HomePage())),
                                    setState(() {
                                      businessname.clear();
                                      ownername.clear();
                                    })
                                  }
                                else
                                  {
                                    Fluttertoast.showToast(
                                        msg: "Registration not Completed",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor:
                                            Color.fromRGBO(255, 181, 23, 1),
                                        textColor: Colors.white,
                                        fontSize: 16.0)
                                  }
                              });
                    })
              ],
            ),
          )),
        ),
      ),
    );
  }
}
