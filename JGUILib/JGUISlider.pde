class JGUISlider extends JGUIComponent<JGUISlider>{
  private boolean over;
  private int min;
  private int max;
  private float sliderPos;
  private int value;
  private Callback onValueChanged;
  
  public JGUISlider(int x, int y, int min, int max) {
    setPos(new PVector(x, y));
    this.min = min;
    this.max = max;
    over = false;
    sliderPos = getPos().x;
    value = (min + max)/2;
  }
  
  void draw() {
    pushStyle();
    stroke(2);
    line (getPos().x-getSize().x/2, getPos().y, getPos().x+getSize().x/2, getPos().y);
    over = (abs(mouseY-getPos().y) < getSize().y/2 &&
           abs(mouseX-getPos().x) < getSize().x/2);
    color c = (over)? color(getFillColor()) : color(255);
    fill(c);
  
    rectMode(CENTER);
    rect(sliderPos, getPos().y, getSize().x/5, getSize().y/2);
    textSize(8);
    text(value, sliderPos, getPos().y+getSize().y/2);
    popStyle();
  }
  
  public JGUISlider setCallback(Callback cb) {
    onValueChanged = cb;
    return this;
  }
  
  int getValue() {
    return value;
  }
  
  void handle() {
    if(mousePressed && over)
    {
      sliderPos = mouseX;
      final int lastValue = value;
      value = round(
        map(sliderPos, getPos().x-getSize().x/2, getPos().x+getSize().x/2, min, max));
      if(onValueChanged != null && lastValue != value)
        onValueChanged.call();
    }
  }
}
