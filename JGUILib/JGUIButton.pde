class JGUIButton extends JGUIButtonGeneric<JGUIButton> {
  public JGUIButton() {
    super("");
  };
  
  public JGUIButton(String label, float x, float y) {
    this(label, new PVector(x, y));
  }
  
  public JGUIButton(String label, PVector pos) {
    super("");
    setPos(pos);
    this.label = label;
    value = -1;
  }
  
  public JGUIButton(String label) {
    this(label, 0, 0);
  }
}
