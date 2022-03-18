import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:utak_riscian/constant.dart';
import 'package:utak_riscian/question.dart';

class DialogWidget extends StatelessWidget {
  const DialogWidget({
    Key? key,
    required this.onPressed,
    required this.title,
    required this.image,
    required this.text,
    this.question,
    this.isOkCancel = false,
  }) : super(key: key);

  final Function onPressed;
  final String title;
  final String image;
  final String text;
  final Question? question;
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
                question != null
                    ? Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Text(
                                question!.answer.join('').replaceAll('_', ' '),
                                style: Theme.of(context).textTheme.headline3,
                              ),
                              Text(
                                question!.definition,
                                style: Theme.of(context).textTheme.bodyText2,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      )
                    : SizedBox(),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: isOkCancel
                      ? MainAxisAlignment.spaceBetween
                      : MainAxisAlignment.center,
                  children: [
                    isOkCancel
                        ? TextButton(
                            style: ElevatedButton.styleFrom(
                              primary: Theme.of(context).colorScheme.secondary,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              "CANCEL",
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          )
                        : Container(),
                    TextButton(
                      onPressed: onPressed as void Function()?,
                      style: ElevatedButton.styleFrom(
                          primary: Theme.of(context).colorScheme.secondary,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          )),
                      child: Text(
                        isOkCancel ? 'OK' : 'CONTINUE',
                        style: Theme.of(context).textTheme.bodyText1,
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
