import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class MyLoadingIndicator extends StatelessWidget {
  const MyLoadingIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SpinKitWave(
      color: Colors.white,
    );
  }
}
