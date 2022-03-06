import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:utak_riscian/constant.dart';

class DialogWidget extends StatelessWidget {
  const DialogWidget({
    Key? key,
    required this.onPressed,
    required this.title,
    required this.image,
    required this.text,
    this.description,
    this.isOkCancel = false,
  }) : super(key: key);

  final Function onPressed;
  final String title;
  final String image;
  final String text;
  final String? description;
  final bool isOkCancel;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kPaddingDialog),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      content: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
                left: kPaddingDialog,
                top: kAvatarRadiusDialog + kPaddingDialog,
                right: kPaddingDialog,
                bottom: kPaddingDialog),
            margin: EdgeInsets.only(top: kAvatarRadiusDialog),
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Theme.of(context).backgroundColor,
                borderRadius: BorderRadius.circular(kPaddingDialog),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black,
                      offset: Offset(0, 10),
                      blurRadius: 10),
                ]),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  title,
                  style: Theme.of(context).textTheme.headline3,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  text,
                  style: Theme.of(context).textTheme.bodyText2,
                  textAlign: TextAlign.center,
                ),
                description != null ?
                Text(
                  description!,
                  style: Theme.of(context).textTheme.bodyText1,
                  textAlign: TextAlign.center,
                ) : SizedBox(),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    isOkCancel
                        ? TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              "CANCEL",
                              style: TextStyle(fontSize: 18),
                            ),
                          )
                        : Container(),
                    TextButton(
                      onPressed: onPressed as void Function()?,
                      child: Text(
                        "OK",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            left: kPaddingDialog,
            right: kPaddingDialog,
            child: CircleAvatar(
              radius: 40.0,
              child: ClipOval(
                child: SvgPicture.asset(
                  image,
                  fit: BoxFit.cover,
                  height: 80.0,
                  width: 80.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
