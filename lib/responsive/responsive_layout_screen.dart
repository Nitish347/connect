import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled6/providers/user_provider.dart';
import 'package:untitled6/utils/global_variables.dart';

class ResponsiveLayout extends StatefulWidget {
  final Widget webScreenLayout;
  final Widget mobileScreenLayout;
  ResponsiveLayout(
      {required this.mobileScreenLayout, required this.webScreenLayout});

  @override
  State<ResponsiveLayout> createState() => _ResponsiveLayoutState();
}

class _ResponsiveLayoutState extends State<ResponsiveLayout> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addData();
  }

  addData() async {
    UserProvider _userProvider = Provider.of(context, listen: false);
    await _userProvider.refreshUser();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > webScreenSize) {
        //webscreen
        return widget.webScreenLayout;
      }
      return widget.mobileScreenLayout;
    });
  }
}
