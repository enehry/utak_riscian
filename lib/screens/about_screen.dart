import 'package:flutter/material.dart';
import 'package:utak_riscian/references_picture.dart';
import 'package:utak_riscian/researcher.dart';
import 'package:utak_riscian/widgets/ResearcherWidget.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        'BRAIN: A Biology Refresher as an Application for Information Learning in New Normal of Grade 11 RNSHS Students',
                        style: Theme.of(context).textTheme.headline4,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20.0),
                      ...researchers.map(
                        (researcher) => ResearcherWidget(
                          avatar: researcher.avatar,
                          name: researcher.name,
                          section: researcher.section,
                          position: researcher.position,
                          align: researcher.align,
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        'References',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Column(
                        children: [
                          Text('Pictures',
                              style: Theme.of(context).textTheme.headline4),
                          SizedBox(height: 10.0),
                          ...referencesPictures.map((e) => Text(e)),
                          SizedBox(
                            height: 20.0,
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Text('Definition',
                              style: Theme.of(context).textTheme.headline4),
                          SizedBox(height: 10.0),
                          ...referencesPictures.map((e) => Text(e)),
                          SizedBox(height: 20.0),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
