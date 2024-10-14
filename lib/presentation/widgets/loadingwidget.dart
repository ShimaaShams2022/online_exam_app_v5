import 'package:flutter/material.dart';

class LoadingStateWidget extends StatelessWidget {
  LoadingStateWidget({this.loadingMessage,super.key});

  String? loadingMessage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.height,
      height: MediaQuery.of(context).size.height*0.3,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(),
            Text(loadingMessage??"")
          ],
        ),
      ),
    );
  }
}
