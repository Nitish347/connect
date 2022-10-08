// import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:untitled6/account.dart';
// import 'package:untitled6/notification.dart';
//
// class booking extends StatefulWidget {
//   @override
//   State<booking> createState() => _bookingState();
// }
//
// class _bookingState extends State<booking> {
//   final List tabs = [notification(), account()];
//   int index = 0;
//   Widget? _child;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _child = account();
//   }
//
//   void _change(int index) {
//     print(index);
//     setState(() {
//       switch (index) {
//         case 0:
//           _child = account();
//           break;
//         case 1:
//           _child = notification();
//           break;
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(),
//         bottomNavigationBar: FluidNavBar(
//           defaultIndex: index,
//           onChange: _change,
//           icons: [
//             FluidNavBarIcon(icon: Icons.account_circle_outlined),
//             FluidNavBarIcon(icon: Icons.ac_unit_rounded),
//           ],
//           style: FluidNavBarStyle(
//               barBackgroundColor: Colors.blueAccent,
//               iconUnselectedForegroundColor: Colors.red,
//               iconSelectedForegroundColor: Colors.yellow,
//               iconBackgroundColor: Colors.greenAccent),
//           animationFactor: 0.3,
//         ),
//         body: _child,
//       ),
//     );
//   }
// }
//
// void main() {
//   runApp(booking());
// }
