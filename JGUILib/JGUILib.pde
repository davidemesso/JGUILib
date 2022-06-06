JGUIController controller;
JGUIDropdown dd;
JGUITextfield tf;
JGUISlider sl;

void setup()
{
  //fullScreen();
  size(500, 600);
  frameRate(60);
  background(255, 255, 255);
  
  controller = new JGUIController();
  
  controller.add(
    new JGUIButton("Play", 200, 200)
      .setSize(35, 16)
      .setFillColor(color(20, 20, 128))
      .setTextColor(color(255, 255, 255))
      .setCallback(onClickCallback)
  );
  
  dd =
    new JGUIDropdown("Power", 200, 300)
      .setSize(35, 16)
      .setFillColor(color(20, 20, 128))
      .setTextColor(color(255, 255, 255))
      .addButton(new JGUIButton("Unicorno"))
      .addButton(new JGUIButton("Castoro"))
      .addButton(new JGUIButton("Alieno"));
  controller.add(dd);
  
  tf = 
    new JGUITextfield(300,400)
      .setSize(120,25)
      .setLabel("Name")
      .setLabelColor(color(0, 0, 0))
      .setFillColor(color(20, 20, 128))
      .setTextColor(color(255, 255, 255));
  controller.add(tf);
  
  sl =
    new JGUISlider(300,250, 1, 10)
      .setSize(150,20)
      .setFillColor(color(20, 20, 128))
      .setCallback(onSlideCallback);
  controller.add(sl);
}

void draw() 
{
  background(255, 255, 255);
  controller.handle();
}

Callback onClickCallback = new CallbackFunction() {
  void execute(JGUIButtonGeneric o) { 
    print(dd.getValue()); 
    print(tf.getText()); 
    controller.clear();
  }
};

Callback onSlideCallback = new CallbackFunction() {
  void execute(JGUIButtonGeneric o) { 
    print(sl.getValue() + "\n");
  }
};

void keyPressed() {
  tf.keyPressed();
}
