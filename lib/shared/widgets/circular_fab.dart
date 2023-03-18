import 'dart:math';

import 'package:flutter/material.dart';

import '../../configs/styles/app_colors.dart';
import '../../features/topics_management/presentation/widgets/dialogs/add_topic_dialog.dart';

const double buttonSize = 80;

class CircularFab extends StatefulWidget {
  const CircularFab({Key? key}) : super(key: key);

  @override
  _CircularFabState createState() => _CircularFabState();
}

class _CircularFabState extends State<CircularFab>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  bool addButtonClicked = false;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  Widget buildItem(IconData icon, BuildContext context) {
    return SizedBox(
      height: buttonSize,
      width: buttonSize,
      child: FloatingActionButton(
        heroTag: icon.codePoint,
        elevation: 0,
        splashColor: Colors.black38,
        backgroundColor: (addButtonClicked && icon == Icons.add)
            ? AppColors.hotPink
            : AppColors.mediumPurple,
        child: Icon(
          (addButtonClicked && icon == Icons.add) ? Icons.close : icon,
          color: Colors.white,
          size: 52,
        ),
        onPressed: () {
          if (animationController.status == AnimationStatus.completed) {
            animationController.reverse();
          } else {
            animationController.forward();
          }
          if (icon == Icons.add) {
            setState(() {
              addButtonClicked = !addButtonClicked;
            });
          } else if (icon == Icons.create_new_folder_outlined) {
            showDialog(
                barrierDismissible: false,
                context: context,
                builder: (BuildContext context) => AddTopicDialog());

            setState(() {
              addButtonClicked = false;
            });
          } else if (icon == Icons.post_add_outlined) {
            setState(() {
              addButtonClicked = false;
            });
          } else if (icon == Icons.shuffle_outlined) {
            setState(() {
              addButtonClicked = false;
            });
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Flow(
      delegate: FlowMenuDelegate(controller: animationController),
      children: <IconData>[
        Icons.shuffle_outlined,
        Icons.post_add_outlined,
        Icons.create_new_folder_outlined,
        Icons.add,
      ].map<Widget>((e) => buildItem(e, context)).toList(),
    );
  }
}

class FlowMenuDelegate extends FlowDelegate {
  final Animation<double> controller;

  const FlowMenuDelegate({required this.controller})
      : super(repaint: controller);

  @override
  void paintChildren(FlowPaintingContext context) {
    final n = context.childCount;
    final size = context.size;
    final xStart = size.width - buttonSize;
    final yStart = size.height - buttonSize;

    for (int i = 0; i < n; i++) {
      final isLastItem = i == context.childCount - 1;

      setValue(value) => isLastItem ? 0.0 : value;

      final double r = 110 * controller.value;
      final alpha = i * pi * 0.5 / (n - 2);
      final x = xStart - setValue((r * cos(alpha)));
      final y = yStart - setValue(r * sin(alpha));

      context.paintChild(i,
          transform: Matrix4.identity()
            ..translate(x, y, 0)
            ..translate(buttonSize / 2, buttonSize / 2)
            ..rotateZ(180 * (1 - controller.value) * pi / 180)
            ..scale(isLastItem
                ? max(1.0 - controller.value, 0.75)
                : max(controller.value, 0.5))
            ..translate(-buttonSize / 2, -buttonSize / 2));
    }
  }

  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegate) {
    return false;
  }
}
