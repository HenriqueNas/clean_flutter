import 'package:clean_dart/app/modules/auth/domain/entities/logged_user_data.dart';
import 'package:clean_dart/app/modules/auth/domain/usecases/logout.dart';
import 'package:mobx/mobx.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {
  final Logout logout;
  _AuthStore(this.logout);

  @observable
  LoggedUserData? user;

  @computed
  bool get isLogged => user != null;

  @action
  void setUser(LoggedUserData? value) => user = value;

  Future signOut() async {
    var result = await logout();
    result.fold((l) {}, (r) {
      setUser(null);
    });
  }
}
