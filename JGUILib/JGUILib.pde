JGUIController controller;
JGUIDropdown dd;

void setup()
{
  size(500, 500);
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

}

void draw() 
{
  background(255, 255, 255);
  controller.handle();
}

Callback onClickCallback = new CallbackFunction() {
  void execute(JGUIButtonGeneric o) { 
    print(dd.getValue()); 
  }
};
