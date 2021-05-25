import 'package:template_package/template_package.dart';

class IsEnabledChangeEvent extends BaseBlocEvent {
  final bool isEnabled;

  IsEnabledChangeEvent(this.isEnabled) : super("on_power_change_event");
}
