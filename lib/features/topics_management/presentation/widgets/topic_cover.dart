import 'package:flutter/material.dart';

import '../../../../configs/styles/app_texts.dart';

class TopicCover extends StatelessWidget {
  final Color topicColor;
  final String topicTitle;

  const TopicCover({
    Key? key,
    required this.topicColor,
    required this.topicTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.fromLTRB(20, 23, 20, 0),
        width: double.infinity,
        height: 185,
        decoration: BoxDecoration(
          color: topicColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Stack(children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              topicTitle,
              style: ralewayBold(
                tSize: 40,
                tColor: Colors.white,
              ),
            ),
          ),
          Positioned(
            left: 234,
            top: 100,
            child: SizedBox(
              height: 179,
              width: 179,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFFFEFEFE).withOpacity(0.2),
                  ),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Center(
                  child: SizedBox(
                    height: 104,
                    width: 104,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: const Color(0xFFFEFEFE).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: -12,
            top: -87,
            child: SizedBox(
              height: 179,
              width: 179,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFFFEFEFE).withOpacity(0.2),
                  ),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Center(
                  child: SizedBox(
                    height: 104,
                    width: 104,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: const Color(0xFFFEFEFE).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 128,
            top: 126,
            child: SizedBox(
              height: 19,
              width: 19,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: const Color(0xFFFEFEFE).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
          ),
          Positioned(
            left: 222,
            top: 23,
            child: SizedBox(
              height: 35,
              width: 35,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: const Color(0xFFFEFEFE).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
          ),
          Positioned(
            left: 355,
            top: 6,
            child: GestureDetector(
              child: const Icon(
                Icons.more_vert,
                size: 24,
                color: Colors.white,
              ),
              onTap: () {},
            ),
          ),
        ]),
      ),
      onTap: () {},
    );
  }
}
