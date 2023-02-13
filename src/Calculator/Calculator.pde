// Jack Wakefield | Nov 2022 | Calculator Project
Button[] numButtons = new Button[10];
Button[] opButtons = new Button[13];
String dVal = "0.0";
char op = ' ';
float l, r, result;
boolean left = true;
boolean exponent = false;
boolean B = true;
int buttonPressed = 1;

void setup() {
  size(340, 500);
  numButtons[0] = new Button(20, 440, 60, 40, '0');
  numButtons[1] = new Button(20, 380, 60, 40, '1');
  numButtons[2] = new Button(100, 380, 60, 40, '2');
  numButtons[3] = new Button(180, 380, 60, 40, '3');
  numButtons[4] = new Button(20, 320, 60, 40, '4');
  numButtons[5] = new Button(100, 320, 60, 40, '5');
  numButtons[6] = new Button(180, 320, 60, 40, '6');
  numButtons[7] = new Button(20, 260, 60, 40, '7');
  numButtons[8] = new Button(100, 260, 60, 40, '8');
  numButtons[9] = new Button(180, 260, 60, 40, '9');
  opButtons[0] = new Button(100, 440, 60, 40, '.');
  opButtons[1] = new Button(180, 440, 60, 40, '±');
  opButtons[2] = new Button(260, 380, 60, 100, '=');
  opButtons[3] = new Button(260, 320, 60, 40, '+');
  opButtons[4] = new Button(260, 260, 60, 40, '-');
  opButtons[5] = new Button(260, 200, 60, 40, '×');
  opButtons[6] = new Button(260, 140, 60, 40, '÷');
  opButtons[7] = new Button(20, 140, 60, 40, 'C');
  opButtons[8] = new Button(100, 140, 60, 40, 'π');
  opButtons[9] = new Button(180, 140, 60, 40, '√');
  opButtons[10] = new Button(20, 200, 60, 40, '²');
  opButtons[11] = new Button(100, 200, 60, 40, 'r');
  opButtons[12] = new Button(180, 200, 60, 40, '%');
}

void draw() {
  background(#475366);
  //noStroke();
  for (int i=0; i<numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].hover(mouseX, mouseY);
  }
  for (int i=0; i<opButtons.length; i++) {
    opButtons[i].display();
    opButtons[i].hover(mouseX, mouseY);
  }
  updateDisplay();
}

void keyPressed() {
  println("key" + key); // code for keyboard use (all num buttons and most important op buttons)
  println("keyCode: " + keyCode);
  if (keyCode == 48 || keyCode == 96) {
    handleEvent("0", true);
  } else if (keyCode == 49 || keyCode == 97) {
    handleEvent("1", true);
  } else if (keyCode == 50 || keyCode == 98) {
    handleEvent("2", true);
  } else if (keyCode == 51 || keyCode == 99) {
    handleEvent("3", true);
  } else if (keyCode == 52 || keyCode == 100) {
    handleEvent("4", true);
  } else if (keyCode == 53 || keyCode == 101) {
    handleEvent("5", true);
  } else if (keyCode == 54 || keyCode == 102) {
    handleEvent("6", true);
  } else if (keyCode == 55 || keyCode == 103) {
    handleEvent("7", true);
  } else if (keyCode == 56 || keyCode == 104) {
    handleEvent("8", true);
  } else if (keyCode == 57 || keyCode == 105) {
    handleEvent("9", true);
  } else if (keyCode == 12 || keyCode == 27 || keyCode == 8 || keyCode == 127) {
    handleEvent("C", false);
  } else if (keyCode == 46 || keyCode == 110) {
    handleEvent(".", false);
  } else if (keyCode == 10) {
    handleEvent("=", false);
  } else if (keyCode == 107) {
    handleEvent("+", false);
  } else if (keyCode == 109) {
    handleEvent("-", false);
  } else if (keyCode == 106) {
    handleEvent("×", false);
  } else if (keyCode == 111) {
    handleEvent("÷", false);
  } else if (keyCode == 16 || keyCode == 32) {
    handleEvent("±", false);
  }
}

void handleEvent (String val, boolean num) {
  if (num && dVal.length() < 24) {
    if (dVal.equals("0.0")) {
      dVal = val;
    } else {
      dVal += val;
    }

    if (left) {
      l = float(dVal);
    } else {
      r = float(dVal);
    }
  } else if (val.equals("C")) { // All opButtons here
    dVal = "";
    op = ' ';
    l = 0.0;
    r = 0.0;
    result = 0.0;
    left = true;
  } else if (val.equals(".")) {
    if (!dVal.contains(".")) {
      dVal += ".";
    }
  } else if (val.equals("±")) {
    if (left) {
      l = l * -1;
      dVal = str(l);
    } else {
      r = r * -1;
      dVal = str(r);
    }
  } else if (val.equals("=")) {
    performCalculation();
  } else if (val.equals("+")) {
    op = '+';
    dVal = "";
    left = false;
  } else if (val.equals("-")) {
    op = '-';
    dVal = "";
    left = false;
  } else if (val.equals("×")) {
    op = '×';
    dVal = "";
    left = false;
  } else if (val.equals("÷")) {
    op = '÷';
    dVal = "";
    left = false;
  } else if (val.equals("π")) {
    if (left) {
      l = PI;
      dVal = str(l);
    } else {
      r = PI;
      dVal = str(r);
    }
  } else if (val.equals("√")) {
    if (left) {
      l = sqrt(l);
      dVal = str(l);
    } else {
      r = sqrt(r);
      dVal = str(r);
    }
  } else if (val.equals("²")) {
    if (left) {
      l = sq(l);
      dVal = str(l);
    } else {
      r = sq(r);
      dVal = str(r);
    }
  } else if (val.equals("r")) {
    if (left) {
      l = round(l);
      dVal = str(l);
    } else {
      r = round(r);
      dVal = str(r);
    }
  } else if (val.equals("%")) {
    if (left) {
      l = l * 0.01;
      dVal = str(l);
    } else {
      r = r * 0.01;
      dVal = str(r);
    }
  }
}

void mouseReleased() {
  for (int i=0; i<numButtons.length; i++) {
    if (numButtons[i].on && dVal.length() < 24) {
      handleEvent(str(numButtons[i].val), true);
    }
  }
  for (int i=0; i<opButtons.length; i++) {
    if (opButtons[i].on && opButtons[i].val == 'C') {
      handleEvent("C", false);
    } else if (opButtons[i].on && opButtons[i].val == '.') {
      handleEvent(".", false);
    } else if (opButtons[i].on && opButtons[i].val == '±') {
      handleEvent("±", false);
    } else if (opButtons[i].on && opButtons[i].val == '=') {
      handleEvent("=", false);
    } else if (opButtons[i].on && opButtons[i].val == '+') {
      handleEvent("+", false);
    } else if (opButtons[i].on && opButtons[i].val == '-') {
      handleEvent("-", false);
    } else if (opButtons[i].on && opButtons[i].val == '×') {
      handleEvent("×", false);
    } else if (opButtons[i].on && opButtons[i].val == '÷') {
      handleEvent("÷", false);
    } else if (opButtons[i].on && opButtons[i].val == 'π') {
      handleEvent("π", false);
    } else if (opButtons[i].on && opButtons[i].val == '√') {
      handleEvent("√", false);
    } else if (opButtons[i].on && opButtons[i].val == '²') {
      handleEvent("²", false);
    } else if (opButtons[i].on && opButtons[i].val == 'r') {
      handleEvent("r", false);
    } else if (opButtons[i].on && opButtons[i].val == '%') {
      handleEvent("%", false);
    }
  }
  println("Input #" + buttonPressed++ + "   l: " + l + "   r: " + r + "   op: " + op + "   Left: " + left);
}

void updateDisplay() {
  fill(#272522);
  rect(20, 20, 300, 100, 10);
  fill(#39332A);
  rect(30, 30, 280, 80);
  textAlign(LEFT, TOP);
  // Clarification of r = round
  textSize(16);
  text("r = round", 260,480);
  fill(#66EAD5);
  textSize(36);
  // Render Scaling Text
  if (dVal.length()>14) {
    textSize(34);
  }
  if (dVal.length()>15) {
    textSize(32);
  }
  if (dVal.length()>16) {
    textSize(30);
  }
  if (dVal.length()>17) {
    textSize(28);
  }
  if (dVal.length()>18) {
    textSize(26);
  }
  if (dVal.length()>20) {
    textSize(24);
  }
  if (dVal.length()>22) {
    textSize(22);
  }
  if (dVal.length()>24) {
    textSize(20);
  }
  text(dVal, 40, 35);
}

void performCalculation() {
  if (op == '+') {
    result = l + r;
  } else if (op == '-') {
    result = l - r;
  } else if (op == '×') {
    result = l * r;
  } else if (op == '÷') {
    result = l / r;
  }
  dVal = str(result);
  l = result;
  left = true;
}
