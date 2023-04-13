import '../../../../../model/event_model.dart';

abstract class SendRequestViewInterface {
  void onSendRequestForMoneyPressed(EventModel eventModel);
  void onPopupAppBarIconClicked(String value);
}