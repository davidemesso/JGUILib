interface Callback {
  void execute(JGUIComponent o);
  void call();
}

abstract class CallbackFunction implements Callback {
  void execute(JGUIComponent o) {}
  void call() {}
}
