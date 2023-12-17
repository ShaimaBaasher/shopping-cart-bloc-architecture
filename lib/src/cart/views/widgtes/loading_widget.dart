import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
    required this.message,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        shrinkWrap: true,
        children: [
          const CircularProgressIndicator(),
          const SizedBox(
            height: 10,
          ),
          Text('$message...')
        ],
      ),
    );
  }
}
