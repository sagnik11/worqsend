import 'package:flutter/material.dart';
import 'package:WorqSend_app/gen/assets.gen.dart';

class WorqSendLogo extends StatelessWidget {
  const WorqSendLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Assets.img.logo512.image(
          width: 250,
          height: 250,
        ),
        const Text(
          'WorqSend',
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
