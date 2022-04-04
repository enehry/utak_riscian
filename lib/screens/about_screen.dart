import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  final version;
  final buildNumber;

  AboutScreen({required this.buildNumber, required this.version}) {
    assert(buildNumber != null);
    assert(version != null);
  }

  @override
  Widget build(BuildContext context) {
    // void _launchURL(String url) async => await canLaunch(url)
    //     ? await launch(url)
    //     : throw 'Could not launch $url';

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
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
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 100.0,
                      ),
                      Hero(
                        tag: 'logo',
                        child: SvgPicture.asset(
                          'assets/icons/logo.svg',
                          height: 100,
                          width: 100,
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Text(
                        'About',
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'Utak Riscian',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      Text(
                        'v$version($buildNumber)',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: 400.0,
                          ),
                          child: Card(
                            elevation: 20.0,
                            color: Theme.of(context).colorScheme.secondary,
                            child: Container(
                              width: double.infinity,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 60.0,
                                  ),
                                  Text(
                                    'Project of',
                                    style:
                                        Theme.of(context).textTheme.headline2,
                                  ),
                                  Text(
                                    'Christian Josef Bolivar',
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                  Text(
                                    'Shania Buenaventura',
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                  Text(
                                    'Yrhen Dedoro',
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                  Text(
                                    'Micka Porto',
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                  Text(
                                    'Ralph Ellis Vasquez',
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                  SizedBox(
                                    height: 50.0,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 70.0,
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.only(top: 30.0),
                      //   child: ConstrainedBox(
                      //     constraints: BoxConstraints(
                      //       maxWidth: 400.0,
                      //     ),
                      //     child: new Stack(
                      //       children: <Widget>[
                      //         Card(
                      //           elevation: 20.0,
                      //           color: Theme.of(context).colorScheme.secondary,
                      //           child: Container(
                      //             width: double.infinity,
                      //             child: Column(
                      //               children: [
                      //                 SizedBox(
                      //                   height: 60.0,
                      //                 ),
                      //                 Text(
                      //                   'Developed and Designed by',
                      //                   style: TextStyle(
                      //                       fontWeight: FontWeight.w300),
                      //                 ),
                      //                 Text(
                      //                   'Yrhen Dedoro',
                      //                   style: TextStyle(
                      //                       fontWeight: FontWeight.w500,
                      //                       fontSize: 20.0),
                      //                 ),
                      //                 SizedBox(
                      //                   height: 20.0,
                      //                 ),
                      //                 Row(
                      //                   mainAxisAlignment:
                      //                       MainAxisAlignment.center,
                      //                   children: [
                      //                     SignInButton(
                      //                       Buttons.Facebook,
                      //                       shape: RoundedRectangleBorder(
                      //                         borderRadius:
                      //                             BorderRadius.circular(50.0),
                      //                       ),
                      //                       mini: true,
                      //                       elevation: 4.0,
                      //                       onPressed: () {
                      //                         _launchURL(
                      //                             'https://www.facebook.com/yrhnddr');
                      //                       },
                      //                     ),
                      //                     SizedBox(
                      //                       width: 5.0,
                      //                     ),
                      //                     SignInButton(
                      //                       Buttons.GitHub,
                      //                       shape: RoundedRectangleBorder(
                      //                         borderRadius:
                      //                             BorderRadius.circular(50.0),
                      //                       ),
                      //                       mini: true,
                      //                       elevation: 4.0,
                      //                       onPressed: () {
                      //                         _launchURL('https://github.com');
                      //                       },
                      //                     ),
                      //                     SizedBox(
                      //                       width: 5.0,
                      //                     ),
                      //                     SignInButton(
                      //                       Buttons.Email,
                      //                       shape: RoundedRectangleBorder(
                      //                         borderRadius:
                      //                             BorderRadius.circular(10.0),
                      //                       ),
                      //                       mini: true,
                      //                       elevation: 4.0,
                      //                       onPressed: () {
                      //                         _launchURL(
                      //                             'yrhendedoro02@gmail.com');
                      //                       },
                      //                     )
                      //                   ],
                      //                 ),
                      //                 SizedBox(
                      //                   height: 30.0,
                      //                 ),
                      //               ],
                      //             ),
                      //           ),
                      //         ),
                      //         FractionalTranslation(
                      //           translation: Offset(0.0, -0.4),
                      //           child: Align(
                      //             child: Container(
                      //               decoration: BoxDecoration(
                      //                 color: Colors.white,
                      //                 shape: BoxShape.circle,
                      //                 boxShadow: [
                      //                   BoxShadow(
                      //                       blurRadius: 3,
                      //                       color: Colors.black54,
                      //                       spreadRadius: 2),
                      //                 ],
                      //               ),
                      //               child: CircleAvatar(
                      //                 radius: 42.0,
                      //                 backgroundColor: Colors.white,
                      //                 child: CircleAvatar(
                      //                   foregroundImage:
                      //                       AssetImage('assets/icons/-.png'),
                      //                   radius: 40.0,
                      //                 ),
                      //               ),
                      //             ),
                      //             alignment: FractionalOffset(0.5, 0.0),
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      SizedBox(
                        height: 50.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
