import 'package:happy_family/app/model/event_model.dart';

abstract class UserDashBoardInterface {
  void onPackageClicked(EventModel event);
  void onPopupAppBarIconClicked(String result);
}