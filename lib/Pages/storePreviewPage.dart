import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:webapp/Pages/completeBusinessProfile.dart';
import 'package:webapp/Services/StorePreviewRest.dart';
import 'package:webapp/models/storePreviewModel.dart';

class StorePreviewPage extends StatefulWidget {
  int bussinessID;
  StorePreviewPage({required this.bussinessID});

  @override
  _StorePreviewPageState createState() => _StorePreviewPageState();
}

class _StorePreviewPageState extends State<StorePreviewPage> {
  @override
  void initState() {
    super.initState();
    fetchstoreMarchant(105068);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.grey[300],
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        centerTitle: true,
        title: Text('Preview Page'),
      ),
      body: FutureBuilder<StorePreviewPageModel>(
          future: fetchstoreMarchant(widget.bussinessID),
          builder: (BuildContext context,
              AsyncSnapshot<StorePreviewPageModel> snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(snapshot.data!.result.bmAddress == ''
                        ? 'thrissur'
                        : snapshot.data!.result.bmAddress)
                  ],
                ),
              );
            } else
              return Center(child: CircularProgressIndicator());
          }),
    );
  }
}
