PImage catImage;
PImage mouseImage;
int[] randp;

// random point with not same point of cat :)
int[] randomPoint(int px, int py) {
  int x, y;
  while (true) {
    x = int(random(0, 4));
    y = int(random(0, 4));
    if (x == px && y == py) {
      continue;
    } else {
      break;
    }
  }

  return new int[] { x, y };
}


void setup()
{
  size(400,400);
  background(255);
  stroke(0);
  frameRate(1);
  noFill();
  catImage = loadImage("cat.png");
  mouseImage = loadImage("mouse.png");
  randp = randomPoint(0, 0); // not same point 0, 0
}

void walk() {
	switch(direction) {
		case 1:
			p.py--;
		break;
		case 2:
			p.px++;
		break;
		case 3:
			p.py++;
		break;
		case 4:
			p.px--;
		break;
	}

	if (p.py < 0) p.py = 0;
	if (p.py >= 5) p.py = 4;
	if (p.px < 0) p.px = 0;
	if (p.px >= 5) p.px = 4;
}

void turnLeft() {
	switch(direction) {
		case 1:
			direction = 4;
		break;
		case 2:
			direction = 1;
		break;
		case 3:
			direction = 2;
		break;
		case 4:
			direction = 3;
		break;
	}
}

void turnRight() {
	switch(direction) {
		case 1:
			direction = 2;
		break;
		case 2:
			direction = 3;
		break;
		case 3:
			direction = 4;
		break;
		case 4:
			direction = 1;
		break;
	}
}

void draw(){
  var x = 40, y = 40;
  if (commandList != undefined) {
  	if(commandIndex < commandList.length) {
  		switch(commandList[commandIndex]) {
  			case "เดิน" :
  				walk();
  			break;
  			case "ซ้ายหัน" :
  				turnLeft();
  			break;
  			case "ขวาหัน" :
  				turnRight();
  			break;
  		}
		commandIndex++;
  	} else {
  		commandIndex = 0;
  		commandList = undefined;
  	}
  }

  background(255);
  stroke(0);
  noFill();
  rect(0,0,399,399);
  fill(0);
  image(mouseImage, randp[0] * 80 + 20, randp[1] * 80 + 20);
  for (var i = 0; i < 5; i++) {
  	for (var j = 0; j < 5; j++) {
  		if (p.px == j && p.py == i) {
        if (p.px == randp[0] && p.py == randp[1]) {
          randp = randomPoint(i, j);
          image(mouseImage, randp[0] * 80 + 20, randp[1] * 80 + 20);
        }
  			stroke(255,0,0);
  			fill(255,0,0);
  			ellipse(x,y,5,5);
  			image(catImage,x-20,y-20);
  		} else {
  			stroke(0);
  			fill(0);
  			ellipse(x,y,5,5);
  		}
  		x+=80;
  	}
  	x = 40;
  	y+=80;
  }

}