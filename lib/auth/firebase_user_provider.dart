import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class InvestAIFirebaseUser {
  InvestAIFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

InvestAIFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<InvestAIFirebaseUser> investAIFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<InvestAIFirebaseUser>(
      (user) {
        currentUser = InvestAIFirebaseUser(user);
        return currentUser!;
      },
    );
