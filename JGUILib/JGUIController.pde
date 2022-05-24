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
      c.draw();
      c.handle();
    }
  }
}
