import 'package:flutter/material.dart';

import '../../../../../configs/styles/app_colors.dart';
import '../../../../../configs/styles/app_texts.dart';

const double checkBoxEdge = 30;

class AddTopicDialog extends StatefulWidget {
  const AddTopicDialog({
    super.key,
  });

  @override
  State<AddTopicDialog> createState() => _AddTopicDialogState();
}

class _AddTopicDialogState extends State<AddTopicDialog> {
  final TextEditingController _titleController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _titleController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      backgroundColor: Colors.white,
      elevation: 0.0,
      child: Container(
        height: 400,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'New topic',
                    style: urbanistSemiBold(
                      tSize: 24,
                      tColor: AppColors.darkBlue,
                    ),
                  ),
                  InkWell(
                    child: Ink(
                      child: const SizedBox(
                        height: 40,
                        width: 40,
                        child: Icon(
                          Icons.close,
                          size: 28,
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Topic title',
                style: urbanistSemiBold(
                  tSize: 20,
                  tColor: AppColors.darkBlue,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 4),
              child: TextField(
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                  hintText: "Enter the title of your topic...",
                  hintStyle:
                      urbanistRegular(tSize: 18, tColor: Colors.grey.shade400),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 7,
                  ),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                ),
                style: urbanistSemiBold(tSize: 20, tColor: AppColors.dark),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 10, 16, 4),
              child: Text(
                "Choose color",
                style: urbanistSemiBold(
                  tSize: 20,
                  tColor: AppColors.darkBlue,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    child: Ink(
                      child: Container(
                        height: checkBoxEdge,
                        width: checkBoxEdge,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                        ),
                      ),
                    ),
                    onTap: () {},
                  ),
                  Container(
                    height: checkBoxEdge,
                    width: checkBoxEdge,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                    ),
                  ),
                  Container(
                    height: checkBoxEdge,
                    width: checkBoxEdge,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                    ),
                  ),
                  Container(
                    height: checkBoxEdge,
                    width: checkBoxEdge,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                    ),
                  ),
                  Container(
                    height: checkBoxEdge,
                    width: checkBoxEdge,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                    ),
                  ),
                  Container(
                    height: checkBoxEdge,
                    width: checkBoxEdge,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                    ),
                  ),
                  Container(
                    height: checkBoxEdge,
                    width: checkBoxEdge,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
