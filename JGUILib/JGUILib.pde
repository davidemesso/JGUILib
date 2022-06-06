JGUIController controller;
JGUIDropdown dd;
JGUITextfield tf;
JGUISlider sl;
JGUIRadioGroup rg;

void setup()
{
  size(500, 600);
  frameRate(60);
  background(255, 255, 255);
  
  // Controller
  controller = new JGUIController();
  
  // Button
  controller.add(
    new JGUIButton("Play", 200, 200)
      .setSize(35, 16)
      .setFillColor(color(20, 20, 128))
      .setTextColor(color(255, 255, 255))
      .setCallback(onClickCallback)
  );
  
  // Dropdown
  dd =
    new JGUIDropdown("Power", 200, 300)
      .setSize(35, 16)
      .setFillColor(color(20, 20, 128))
      .setTextColor(color(255, 255, 255))
      .addButton(new JGUIButton("Unicorno"))
      .addButton(new JGUIButton("Castoro"))
      .addButton(new JGUIButton("Alieno"));
  controller.add(dd);
  
  // Textfield
  tf = 
    new JGUITextfield(300,400)
      .setSize(120,25)
      .setLabel("Name")
      .setLabelColor(color(0, 0, 0))
      .setFillColor(color(20, 20, 128))
      .setTextColor(color(255, 255, 255));
  controller.add(tf);
  
  // Slider
  sl =
    new JGUISlider(300,250, 1, 10)
      .setSize(150,20)
      .setFillColor(color(20, 20, 128))
      .setCallback(onSlideCallback);
  controller.add(sl);
  
  // Checkbox
  controller.add(
    new JGUICheckbox("One", 300, 160)
      .setSize(15,15)
      .setFillColor(color(20, 20, 128))
      .setTextColor(color(0))
      .setCallback(onStateChangedCallback));
  controller.add(
    new JGUICheckbox("Two", 300, 180)
      .setSize(15,15)
      .setFillColor(color(20, 20, 128))
      .setTextColor(color(0))
      .setCallback(onStateChangedCallback));
  controller.add(
    new JGUICheckbox("Three", 300, 200)
      .setSize(15,15)
      .setFillColor(color(20, 20, 128))
      .setTextColor(color(0))
      .setSelected(true)
      .setCallback(onStateChangedCallback));
      
  // Radiobuttons
  rg =
    new JGUIRadioGroup()
      .add(
        new JGUIRadiobutton("one", 300, 300)
          .setSize(12,12)
          .setFillColor(color(20, 20, 128))
          .setTextColor(color(0)))
      .add(
        new JGUIRadiobutton("two", 300, 320)
          .setSize(12,12)
          .setFillColor(color(20, 20, 128))
          .setTextColor(color(0))
          .setSelected(true))
      .add(
        new JGUIRadiobutton("three", 300, 340)
          .setSize(12,12)
          .setFillColor(color(20, 20, 128))
          .setTextColor(color(0)))
      .setCallback(onSelectionChangedCallback);
  controller.add(rg);
}

void draw() 
{
  background(255, 255, 255);
  controller.handle();
}

Callback onClickCallback = new CallbackFunction() {
  void call() { 
    controller.remove(dd);
    controller.remove(tf);
    controller.remove(rg);
  }
};

Callback onSlideCallback = new CallbackFunction() {
  void call() { 
    print(sl.getValue() + "\n");
  }
};

Callback onStateChangedCallback = new CallbackFunction() {
  void execute(JGUIComponent o) { 
    print(((JGUICheckbox) o).label + " " + ((JGUICheckbox) o).selected + "\n");
  }
};

Callback onSelectionChangedCallback = new CallbackFunction() {
  void execute(JGUIComponent o) { 
    print(((JGUIRadioGroup) o).getSelected().getLabel() + " selected\n");
  }
};

void keyPressed() {
  tf.keyPressed();
}
