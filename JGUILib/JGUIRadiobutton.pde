class JGUIRadiobutton extends JGUIButtonGeneric<JGUIRadiobutton> {
  private boolean selected;
  private int debounce;
  
  public JGUIRadiobutton(String label, float x, float y) {
    super(label, new PVector(x, y));
    selected = false;
    debounce = 0;
  }
  
  public void draw() {
    pushStyle();
    rectMode(CENTER);
    textAlign(LEFT, CENTER);
    fill(20);
    stroke(2);
    color c = (selected)? color(getFillColor()) : color(255);
    fill(c);
    ellipse(getPos().x, getPos().y, getSize().x, getSize().y);
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
      if(getCallback() != null) {
        getCallback().execute(this);
        getCallback().call();
      }
    }
    
    if(debounce > 0)
      debounce--;
  }
  
  public JGUIRadiobutton setSelected(boolean s) {
    selected = s;
    return this;
  }
  
  boolean isSelected() {
    return selected;
  }
}
