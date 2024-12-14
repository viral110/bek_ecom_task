import 'package:bek_task/src/common/constant/color_helper.dart';
import 'package:bek_task/src/common/widgets/custom_text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  final String? title;
  final bool? automaticallyImplyLeading;

  const CustomAppBarWidget({Key? key, this.title, this.automaticallyImplyLeading}) : super(key: key);

  @override
  State<CustomAppBarWidget> createState() => _CustomAppBarWidgetState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarWidgetState extends State<CustomAppBarWidget> {
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorHelper.buttonColor,
      elevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(25),
        ),
      ),
      iconTheme: const IconThemeData(
        color: ColorHelper.whiteColor
      ),
      automaticallyImplyLeading: widget.automaticallyImplyLeading ?? true,
      title: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomTextWidget(
          text: widget.title.toString(),
          color: ColorHelper.whiteColor,
          fontSize: 22,
          fontWeight: FontWeight.w600,
        ),
      ),
      centerTitle: false,
    );
  }
}
