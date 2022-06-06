class JGUIRadioGroup extends JGUIComponent{
  private ArrayList<JGUIRadiobutton> buttons;
  private ArrayList<JGUIRadiobutton> toBeRemoved;
  private boolean clearing;
  private JGUIRadiobutton selected;
  private Callback onSelectionChanged;
  
  public JGUIRadioGroup() {
    buttons  = new ArrayList<JGUIRadiobutton>();
    toBeRemoved = new ArrayList<JGUIRadiobutton>();
    clearing = false;
    selected = null;
    onSelectionChanged = null;
  }
  
  public JGUIRadioGroup add(JGUIRadiobutton c) {
    buttons.add(c);
    return this;
  }
  
  public JGUIRadioGroup setCallback(Callback cb) {
    onSelectionChanged = cb;
    return this;
  }
  
  public Callback getCallback() {
    return onSelectionChanged;
  }
  
  public JGUIRadiobutton getSelected() {
    return selected;
  }
  
  public void draw(){};
  
  public void handle() {
    if(!toBeRemoved.isEmpty())
    { 
      for(JGUIRadiobutton c : toBeRemoved)
        buttons.remove(c);
      toBeRemoved.clear();
    }
    
    if(clearing)
    {
      buttons.clear();
      clearing = false;
    }
    
    for(JGUIRadiobutton c : buttons) 
    {
      if(c.isVisible()) {
        c.draw();
        c.handle();
      }
      if(c.isSelected() && c != selected)
      {
        if(selected != null)
          selected.setSelected(false);
        selected = c;
        if(onSelectionChanged != null)
        {
          onSelectionChanged.execute(this);
          onSelectionChanged.call();
        }
      }
    }
  }
  
  public void clear() {
    clearing = true;
  }
  
  public void remove(JGUIRadiobutton c) {
    toBeRemoved.add(c);
  }
}
