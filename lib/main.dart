//
//  device_typeを指定
//
//  Created by 大内直 on 2024/08/24.
//

import 'package:flutter/material.dart';
import 'device_type.dart';
import 'package:url_launcher/url_launcher.dart';

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
                height: 64,
              ),
              Text(
                'Ouchi Nao',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                'I\'m doing a Master\'s degree at Toyohashi University of Technology.',
                'I\'m interested in robotics and web application development.',
              ),
              SizedBox(
                height: 32,
              ),
              Text(
                'Hobby', 
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                'Travel, Harry Potter, Sauna, etc...',
              ),
              SizedBox(
                height: 32,
              ),
              Text(
                'Using',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                'python, C++, Dart, flutter, ROS2, Docker, etc...',
              ),
              SizedBox(
                height: 32,
              ),
              Text(
                'Study',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                'communication robotics',
              ),
              SizedBox(
                height: 32,
              ),
              Text(
                'Contact',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                'ouchi.nao.jg@tut.jp',
              ),
              SizedBox(
                height: 32,
              ),
              GestureDetector(
                onTap: () {
                  launch(
                    'https://github.com/ouchinao',
                  );
                },
                child: Image.asset(
                  'assets/GitHub-Logo.png',
                  width: 100,
                  height: 100,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}