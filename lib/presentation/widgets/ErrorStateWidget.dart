

import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';




class ErrorStateWidget extends StatelessWidget {
  String? exception;
  String? retryButtonText;
  VoidCallback? retryButtonAction;

  ErrorStateWidget(this.exception,
      {this.retryButtonText, this.retryButtonAction});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text("$exception"),
          retryButtonText != null ? ElevatedButton(onPressed: retryButtonAction,
              child: Text(retryButtonText ?? ""))
              : const Text('')
        ],
      ),
    );
  }



}
