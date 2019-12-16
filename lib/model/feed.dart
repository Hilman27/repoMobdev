//import 'package:religi_app/Model/LayarUtama/feed.dart';

import 'dart:core';

import '_model.dart';

class Feed {
  User user;
  Event event;
  Feed(this.user, this.event);

  User get fUser => user;
  Event get fEvent => event;
}
