abstract class JGUIComponent<T> {
  private PVector pos;
  private PVector size;
  private color fillColor;
  private color textColor; 
  private boolean isVisible;
  
  public JGUIComponent() {
    this(0, 0);
  }
  
  public JGUIComponent(float x, float y) {
    this(new PVector(x, y));
  }
  
  public JGUIComponent(PVector pos) {
    this.pos = pos;
    isVisible = true;
    this.size = new PVector(0, 0);
    textColor = color(255, 255, 255);
  }
  
  public T setPos(float x, float y) {
    this.setPos(new PVector(x, y));
    return (T)this;
  }
  
  public T setPos(PVector pos) {
    this.pos = pos;
    return (T)this;
  }
  
  public PVector getPos() {
    return pos;
  }
  
  public T setSize(float w, float h) {
    this.size = new PVector(w, h);
    return (T)this;
  }
  
  public PVector getSize() {
    return size;
  }
  
  public T setFillColor(color col) {
    this.fillColor = col;
    return (T)this;
  }
  
  public color getFillColor() {
    return fillColor;
  }
  
  public T setTextColor(color col) {
    this.textColor = col;
    return (T)this;
  }
  
  public color getTextColor() {
    return textColor;
  }
  
  public T setVisible(boolean v) {
    this.isVisible = v;
    return (T)this;
  }
  
  public boolean isVisible() {
    return isVisible;
  }
  
  
  abstract void handle();
  abstract void draw();
}
