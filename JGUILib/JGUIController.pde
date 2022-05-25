class JGUIController {
  private ArrayList<JGUIComponent> components;
  
  public JGUIController() {
    components = new ArrayList<JGUIComponent>();
  }
  
  public void add(JGUIComponent c) {
    components.add(c);
  }
  
  public void handle() {
    for(JGUIComponent c : components) 
    {
      if(c.isVisible()) {
        c.draw();
        c.handle();
      }
    }
  }
  
  public void clear() {
    for(JGUIComponent c : components)
      c.setVisible(false);
  }
}
