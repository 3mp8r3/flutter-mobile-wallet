import 'package:coda_wallet/receive/screen/receive_account_screen.dart';
import 'package:coda_wallet/route/routes.dart';
import 'package:coda_wallet/widget/account/account_list.dart';
import 'package:coda_wallet/widget/app_bar/app_bar.dart';
import 'package:coda_wallet/widget/ui/custom_gradient.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

_gotoReceiveAccountScreen(BuildContext context, int index) {
  Navigator.of(context).pushNamed(ReceiveAccountRoute, arguments: index);
}

class ReceiveAccountsScreen extends StatefulWidget {
  ReceiveAccountsScreen({Key key}) : super(key: key);

  @override
  _ReceiveAccountsScreenState createState() => _ReceiveAccountsScreenState();
}

class _ReceiveAccountsScreenState extends State<ReceiveAccountsScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(375, 812), allowFontScaling: false);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildNoTitleAppBar(context, leading: false),
      body: Container(
        child: _buildReceiveAccountBody(context),
        decoration: BoxDecoration(
          gradient: backgroundGradient
        ),
      )
    );
  }

  _buildReceiveAccountBody(BuildContext context) {
    return Column(
      children: [
        Container(height: 30.h),
        Padding(
          padding: EdgeInsets.only(left: 29.w, right: 29.w),
          child: Text('Which address do you want to use?', textAlign: TextAlign.left, style: TextStyle(fontSize: 28.sp, color: Colors.black)),
        ),
        Container(height: 37.h),
        Expanded(
          flex: 1,
          child: buildAccountList(
            (index) => _gotoReceiveAccountScreen(context, index)
          )
        )
      ],
    );
  }
}

