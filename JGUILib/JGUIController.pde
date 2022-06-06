class JGUIController {
  private ArrayList<JGUIComponent> components;
  private boolean clearing;
  
  public JGUIController() {
    components = new ArrayList<JGUIComponent>();
    clearing = false;
  }
  
  public void add(JGUIComponent c) {
    components.add(c);
  }
  
  public void handle() {
    if(clearing)
    {
      components.clear();
      clearing = false;
    }
    for(JGUIComponent c : components) 
    {
      if(c.isVisible()) {
        c.draw();
        c.handle();
      }
    }
  }
  
  public void clear() {
    clearing = true;
  }
}
