import 'package:flutter/material.dart';

import 'package:utak_riscian/researcher.dart';

class ResearcherWidget extends StatelessWidget {
  const ResearcherWidget({
    Key? key,
    required this.name,
    required this.section,
    required this.position,
    required this.align,
    required this.avatar,
  }) : super(key: key);

  final String name;
  final String section;
  final String position;
  final AlignPos align;
  final String avatar;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: align == AlignPos.center
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 35.0,
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  child: CircleAvatar(
                    radius: 30.0,
                    backgroundImage: AssetImage(this.avatar),
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  name,
                  style: Theme.of(context).textTheme.headline4,
                ),
                SizedBox(height: 10.0),
                Text(
                  position,
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            )
          : Row(
              mainAxisAlignment: align == AlignPos.right
                  ? MainAxisAlignment.end
                  : MainAxisAlignment.start,
              children: [
                align == AlignPos.left
                    ? CircleAvatar(
                        radius: 35.0,
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                        child: CircleAvatar(
                          radius: 30.0,
                          backgroundImage: AssetImage(this.avatar),
                        ),
                      )
                    : SizedBox.shrink(),
                SizedBox(width: 16.0),
                Column(
                  crossAxisAlignment: align == AlignPos.left
                      ? CrossAxisAlignment.start
                      : CrossAxisAlignment.end,
                  children: [
                    Text(
                      this.name,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Text(
                      this.section,
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(fontSize: 14.0),
                    ),
                    Text(
                      this.position,
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(fontSize: 14.0),
                    ),
                  ],
                ),
                SizedBox(width: 16.0),
                align == AlignPos.right
                    ? CircleAvatar(
                        radius: 35.0,
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                        child: CircleAvatar(
                          radius: 30.0,
                          backgroundImage: AssetImage('assets/icons/logo.png'),
                        ),
                      )
                    : SizedBox.shrink(),
              ],
            ),
    );
  }
}
