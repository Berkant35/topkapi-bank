
import 'package:state_notifier/state_notifier.dart';

enum BaseAuthPageType {register,login,forgotPassword}


class BaseAuthProvideNotifier extends StateNotifier<BaseAuthPageType> {
  BaseAuthProvideNotifier(BaseAuthPageType state) : super(BaseAuthPageType.login);

    void changeState(BaseAuthPageType type) => state = type;

}