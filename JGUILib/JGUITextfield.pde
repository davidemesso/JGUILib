class JGUITextfield extends JGUIComponent<JGUITextfield> {
  private String textValue;
  private String label;
  private color labelColor;

  public JGUITextfield(int x, int y) {
    setPos(x, y);
    setSize(0,0);
    textValue = "";
    label = "";
    labelColor = color(0, 0, 0);
  }
  
  public JGUITextfield setLabel(String lbl) {
    label = lbl;
    return this;
  }
  
  public JGUITextfield setLabelColor(color col) {
    this.labelColor = col;
    return this;
  }
  
  public color getLabelColor() {
    return labelColor;
  }

  public void draw() {
    rectMode(CORNER);
    stroke(205);
    fill(getFillColor());
    rect(getPos().x, getPos().y, getSize().x, getSize().y); 
    
    textAlign(LEFT, CENTER);
    textSize(16);
    fill(getTextColor());
    text(textValue, getPos().x + 5, getPos().y + getSize().y/2);
    
    fill(labelColor);
    text(label, getPos().x + 5, getPos().y + getSize().y+5);
    
  }

  public void keyPressed() {
    if (key == BACKSPACE && textValue.length() > 0) 
      textValue = textValue.substring(0, textValue.length()-1);
    else if (key >= ' ') 
      textValue += key;
  }

  public void handle() {}
  
  public String getText() {
    return textValue;
  }
}
