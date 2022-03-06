import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:utak_riscian/providers/game_screen_provider.dart';
import 'package:provider/provider.dart';

class StatusHeaderWidget extends StatelessWidget {
  const StatusHeaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var gameScreenProvider = context.watch<GameScreenProvider>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  'assets/icons/stages.svg',
                  width: 35,
                  height: 35,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  gameScreenProvider.stage.toString(),
                  style: Theme.of(context).textTheme.headline1,
                )
              ],
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                gameScreenProvider.coins.toString(),
                style: Theme.of(context).textTheme.headline1,
              ),
              SizedBox(
                width: 10.0,
              ),
              SvgPicture.asset(
                'assets/icons/coin.svg',
                height: 35,
                width: 35,
              ),
            ],
          )
        ],
      ),
    );
  }
}
