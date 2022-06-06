class JGUIController {
  private ArrayList<JGUIComponent> components;
  private ArrayList<JGUIComponent> toBeRemoved;
  private boolean clearing;
  
  public JGUIController() {
    components  = new ArrayList<JGUIComponent>();
    toBeRemoved = new ArrayList<JGUIComponent>();
    clearing = false;
  }
  
  public void add(JGUIComponent c) {
    components.add(c);
  }
  
  public void handle() {
    if(!toBeRemoved.isEmpty())
    { 
      for(JGUIComponent c : toBeRemoved)
        components.remove(c);
      toBeRemoved.clear();
    }
    
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
  
  public void remove(JGUIComponent c) {
    toBeRemoved.add(c);
  }
}
