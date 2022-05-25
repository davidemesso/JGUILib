class JGUIButtonGeneric<T> extends JGUIComponent<T> {
  public String label; 
  public int value;
  private int debounce; 
  private Callback callback;
  
  public JGUIButtonGeneric(String label, float x, float y) {
    this(label, new PVector(x, y));
  }
  
  public JGUIButtonGeneric(String label, PVector pos) {
    super();
    setPos(pos);
    this.label = label;
    value = -1;
  }
  
  public JGUIButtonGeneric(String label) {
    this(label, 0, 0);
  }
  
  public T setCallback(Callback cb) {
    callback = cb;
    return (T)this;
  }

  public void handle() {
    if(mousePressed && abs(mouseX - getPos().x) <= getSize().x
                    && abs(mouseY - getPos().y) <= getSize().y
                    && debounce == 0)
    {
      debounce = 15;
      callback.execute(this);
    }
    
    if(debounce > 0)
      debounce--;
  }
  
  public void draw() {
    fill(getFillColor());
    rectMode(RADIUS);
    rect(getPos().x, getPos().y, getSize().x, getSize().y);
    
    textAlign(CENTER, CENTER);
    fill(getTextColor());
    textSize(12);
    text(label, getPos().x, getPos().y);
    
  }
}
