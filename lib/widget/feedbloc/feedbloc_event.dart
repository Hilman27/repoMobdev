import 'package:meta/meta.dart';

@immutable
abstract class FeedblocEvent {}

class GetFeedListEvent extends FeedblocEvent {}

class GiveFeedListEvent extends FeedblocEvent {}