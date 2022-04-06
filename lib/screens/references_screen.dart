import 'package:flutter/material.dart';
import 'package:utak_riscian/references_picture.dart';

class ReferencesScreen extends StatelessWidget {
  const ReferencesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'References',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
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
          ],
        ),
      ),
    );
  }
}
