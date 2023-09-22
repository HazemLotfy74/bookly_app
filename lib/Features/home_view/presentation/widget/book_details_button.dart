import 'package:bookly/Features/home_view/Data/Models/Book_Model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../Core/Widgets/custom_button.dart';

class ButtonAction extends StatelessWidget {
  const ButtonAction({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          const Expanded(
            child: CustomButton(
              background: Colors.white,
              textColor: Colors.black,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                bottomLeft: Radius.circular(15),
              ),
              text: 'Free',
            ),
          ),
          Expanded(
            child: CustomButton(
              background: const Color(0xffEF8262),
              textColor: Colors.white,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
              text: 'Preview',
              onPressed: ()async {
                Uri url = Uri.parse(bookModel.volumeInfo?.previewLink??"");
                  if (await canLaunchUrl(url)) {
                   await launchUrl(url);
                  }

              },
            ),
          ),
        ],
      ),
    );
  }
}
