class JGUICheckbox extends JGUIButtonGeneric<JGUICheckbox> {
  private boolean selected;
  private int debounce;
  
  public JGUICheckbox(String label, float x, float y) {
    super(label, new PVector(x, y));
    selected = false;
    debounce = 0;
  }
  
  public void draw() {
    pushStyle();
    rectMode(CENTER);
    fill(20);
    stroke(2);
    color c = (selected)? color(getFillColor()) : color(255);
    fill(c);
    rect(getPos().x, getPos().y, getSize().x, getSize().y);
    fill(getTextColor());
    textSize(12);
    text(getLabel(), getPos().x + getSize().x, getPos().y);
    popStyle();
  }
  
  public void handle() {
    if(mousePressed && abs(mouseX - getPos().x) <= getSize().x/2
                    && abs(mouseY - getPos().y) <= getSize().y/2
                    && debounce == 0)
    {
      debounce = 15;
      selected = !selected;
      getCallback().execute(this);
      getCallback().call();
    }
    
    if(debounce > 0)
      debounce--;
  }
  
  boolean isSelected() {
    return selected;
  }
}
