import 'package:flutter/material.dart';

class CompleteReg extends StatelessWidget {
  const CompleteReg({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('User Created Successfully'),
        ),
      ),
    );
  }
}

