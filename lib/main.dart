//
//  device_typeを指定
//
//  Created by 大内直 on 2024/08/24.
//

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

const SpaceText = 16.0;
const SpaceHeight = 32.0;
const IconSize = 100.0;


void main() {
  runApp(PortfolioApp(),
  );
}

class PortfolioApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ouchiのポートフォリオ',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: SpaceHeight * 2,
              ),
              Text(
                'Ouchi Nao',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: SpaceText),
                child: Text(
                  'I\'m doing a Master\'s degree at Toyohashi University of Technology. And I\'m interested in robotics development and web application development.',
                )
              ),
              SizedBox(
                height: SpaceHeight,
              ),
              Text(
                'Hobby', 
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                'Travel, Harry Potter, Sauna, etc...',
              ),
              SizedBox(
                height: SpaceHeight,
              ),
              Text(
                'Using',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                'python, C++, Dart, flutter, ROS2, Docker, etc...',
              ),
              SizedBox(
                height: SpaceHeight,
              ),
              Text(
                'Study',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                'communication robotics',
              ),
              SizedBox(
                height: SpaceHeight,
              ),
              Text(
                'Contact',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                'ouchi.nao.jg@tut.jp',
              ),
              SizedBox(
                height: SpaceHeight,
              ),
              GestureDetector(
                onTap: () {
                  launch(
                    'https://github.com/ouchinao',
                  );
                },
                child: Image.asset(
                  'assets/GitHub-Logo.png',
                  width: IconSize,
                  height: IconSize,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}