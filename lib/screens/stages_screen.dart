import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utak_riscian/fact.dart';
import 'package:utak_riscian/providers/game_screen_provider.dart';
import 'package:utak_riscian/question.dart';
import 'package:utak_riscian/screens/game_screen.dart';

class StagesScreen extends StatelessWidget {
  const StagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // back button
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            Expanded(
              child: Builder(
                builder: ((context) {
                  final questions =
                      context.watch<GameScreenProvider>().questions;
                  final stage = context.watch<GameScreenProvider>().stage;

                  List<List<Question>> levels = [[]];

                  // store questions by level
                  for (int i = 0; i < questions.length; i++) {
                    if (i != questions.length - 1) {
                      if (questions[i].level != questions[i + 1].level) {
                        // levels[];
                        levels[questions[i].level - 1].add(questions[i]);
                      } else {
                        if (levels.length < questions[i].level) {
                          levels.add([questions[i]]);
                        } else {
                          levels[questions[i].level - 1].add(questions[i]);
                        }
                      }
                    } else {
                      levels[questions[i].level - 1].add(questions[i]);
                    }
                  }
                  // display questions by level grid
                  return ListView.builder(
                      itemCount: levels.length,
                      itemBuilder: (context, listIndex) {
                        return Column(
                          children: [
                            SizedBox(
                              height: 20.0,
                            ),
                            Text(
                              'Level ${levels[listIndex][0].level}',
                              style: Theme.of(context).textTheme.headline1,
                            ),
                            Text(
                              facts[listIndex].description,
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: GridView.builder(
                                itemCount: levels[listIndex].length,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4,
                                  crossAxisSpacing: 10.0,
                                  mainAxisSpacing: 10.0,
                                ),
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                    onTap: () {
                                      if (levels[listIndex][index].id - 1 <=
                                          stage) {
                                        context
                                            .read<GameScreenProvider>()
                                            .setQuestion(
                                                levels[listIndex][index].id -
                                                    1);
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => GameScreen(),
                                          ),
                                        );
                                      }
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color:
                                            levels[listIndex][index].id - 1 <=
                                                    stage
                                                ? Theme.of(context)
                                                    .colorScheme
                                                    .secondary
                                                : Colors.grey[600],
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              ' ${levels[listIndex][index].level} - ${levels[listIndex][index].stage}',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1!
                                                  .copyWith(fontSize: 20.0),
                                            ),
                                            Icon(
                                              Icons.play_arrow_outlined,
                                              color: Theme.of(context)
                                                  .backgroundColor,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                          ],
                        );
                      });
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
