import 'i_transition_method.dart';

class OnNothing implements ITransitionMethod {
  @override
  void execute([var data]) {
    print ("@OnNothing $data");
  }
}

class OnPlay implements ITransitionMethod {
  @override
  void execute([var data]) {
    print ("@OnPlay $data");
  }
}

class OnStop implements ITransitionMethod {
  @override
  void execute([var data]) {
    print ("@OnStop $data");
  }
}

