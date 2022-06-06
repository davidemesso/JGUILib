class JGUIDropdown extends JGUIButtonGeneric<JGUIDropdown> {
  private boolean isOpen;
  private ArrayList<JGUIButton> buttons;
  
  public JGUIDropdown(String label, float x, float y) {
    super(label + " V", new PVector(x, y));
    setCallback(onClickCallback);
    isOpen = true;
    buttons = new ArrayList<JGUIButton>();
  }
  
  private Callback onClickCallback = new CallbackFunction() {
    void execute(JGUIComponent o) { 
      isOpen = !isOpen;
      final char c = isOpen ? 'V' : '^';
      label = label.substring(0, label.length()-1) + c;
    }
  };
  
  public JGUIDropdown addButton(JGUIButton b) {
    b.value = buttons.size();
    buttons.add(b);
    
    b
      .setPos(getPos().x, getPos().y + (getSize().y * 2) * buttons.size())
      .setSize(getSize().x, getSize().y)
      .setFillColor(getFillColor())
      .setTextColor(getTextColor())
      .setCallback(selectedButton);
    return this;
  }
  
  public int getValue() {
    return value;
  }
  
  public void draw() {
    super.draw();
    if(isOpen)
      for(JGUIButton b : buttons)
      {
        b.draw();
        b.handle();
      }
  }
  
  Callback selectedButton = new CallbackFunction() {
    void execute(JGUIButtonGeneric o) { 
      label = o.label + " ^";
      isOpen = !isOpen;
      value = o.value;
    }
  };
}
