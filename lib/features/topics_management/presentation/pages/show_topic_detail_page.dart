import 'package:flutter/material.dart';

import '../../../../configs/styles/app_texts.dart';

class ShowTopicDetailPage extends StatelessWidget {
  const ShowTopicDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as ShowTopicDetailPageArgs;

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: const Icon(
            Icons.arrow_back_ios_new,
            size: 35,
          ),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          args.title,
          style: ralewaySemibold(tSize: 22, tColor: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
    );
  }
}

class ShowTopicDetailPageArgs {
  final String title;

  const ShowTopicDetailPageArgs({required this.title});
}
