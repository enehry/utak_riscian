import 'package:flutter/material.dart';
import 'package:utak_riscian/fact.dart';
import 'package:utak_riscian/providers/audio_player_provider.dart';
import 'package:utak_riscian/providers/game_screen_provider.dart';
import 'package:utak_riscian/widgets/dialog_widget.dart';
import 'package:utak_riscian/widgets/small_button_widget.dart';
import 'package:provider/provider.dart';

class AnswerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<GameScreenProvider>(builder: (context, provider, widget) {
        List<String> choice = provider.choices;

        List<String> userAnswer = provider.userAnswer;

        int ansLength = (userAnswer.length <= 8) ? userAnswer.length : 8;

        int choiceLength = (choice.length <= 8) ? choice.length : 8;

        return Column(
          children: [
            for (int i = 0; i < (userAnswer.length / 8).ceil(); i++)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (int j = i == 0 ? 0 : 8;
                      j < ((i == 0) ? ansLength : userAnswer.length);
                      j++)
                    SmallButtonWidget(
                      title: userAnswer[j],
                      color: Theme.of(context).colorScheme.secondary,
                      onPressed: () {
                        provider.removeAnswer(j);
                      },
                    )
                ],
              ),
            SizedBox(
              height: 20.0,
            ),
            for (int i = 0; i < (choice.length / 8).ceil(); i++)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (int j = (i == 0) ? 0 : 8;
                      j < ((i == 0) ? choiceLength : choice.length);
                      j++)
                    SmallButtonWidget(
                      title: choice[j],
                      color: Theme.of(context).colorScheme.secondary,
                      onPressed: () {
                        provider.addAnswer(j);
                        if (provider.stage <
                            context
                                .read<GameScreenProvider>()
                                .questions
                                .length) {
                          if (provider.correct) {
                            context
                                .read<AudioPlayerProvider>()
                                .playSound('assets/sounds/coin.wav');

                            // check if next level
                            if (provider.questions[provider.stage - 1].level !=
                                provider.question.level) {
                              showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (builder) => DialogWidget(
                                  title: 'DID YOU KNOW?',
                                  text: facts[provider
                                              .questions[provider.stage - 1]
                                              .level -
                                          1]
                                      .text,
                                  image:
                                      "assets/levels/${provider.question.level}.png",
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              );
                            }

                            showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (builder) => DialogWidget(
                                title: 'CORRECT!',
                                text: 'You guessed it right. \n +20 COINS',
                                image: 'assets/icons/coin.svg',
                                question:
                                    provider.questions[provider.stage - 1],
                                onPressed: () {
                                  Navigator.pop(context);
                                  provider.resetCorrect();
                                },
                              ),
                            );
                          } else if (provider.isWrong) {
                            context
                                .read<AudioPlayerProvider>()
                                .playSound('assets/sounds/error.wav');
                            showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (builder) => DialogWidget(
                                title: 'WRONG',
                                text: 'Your answer is wrong try again!',
                                image: 'assets/icons/warn.svg',
                                onPressed: () {
                                  Navigator.pop(context);
                                  provider.isWrong = false;
                                },
                              ),
                            );
                          }
                        }
                      },
                    ),
                ],
              ),
          ],
        );
      }),
    );
  }
}
