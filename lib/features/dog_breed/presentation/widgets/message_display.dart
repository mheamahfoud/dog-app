import 'package:flutter/material.dart';

class MessageDisplay extends StatelessWidget {
  final String message;
  final bool isError;
  const MessageDisplay({
     Key? key,
    required this.message,
    required this.isError ,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3,
      child: Center(
        child: SingleChildScrollView(
          child: Text(
            message,
            style: TextStyle(fontSize: 25,
              color: isError ? Colors.red : null
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}