int scene = 1;

float time = 0;
float time2 = 0;
float base_time = 0;
float base_timeA = 0;

int f = 0;
float n = 0;

int rA = int(random(0, 10));
int rB = int(random(0, 5));

int rank = int(random(1, 5));
String wordA[] = {"book", "bike", "coin", "car", "train", "camera", "card", "wine", "desk", "key"};
String wordB[] = {"red", "small", "big", "best", "blue"};

int count_answer = 0;
int count_time[] = {};
float before_time = 0;

void setup() {
  size(700, 500);
  background(255);
  PFont font = createFont("utf-8", 50);
  textFont(font);
}

void draw() {
  background(255);

  // scene = 2;

  switch(scene) {
  case 1:
    fill(0);
    textSize(56);
    textAlign(CENTER);
    text("Push Enterkey to Strat", width/2, height/2);

    break;

  case 2:
    background(255);
    textSize(46);
    textAlign(CENTER);
    fill(0);
    text("Time Limit", width/2-135, height/4-20);
    text("Search Word", width/2-170, height/2);
    text("Rank", width*3/4, height/2);
    text(wordA[rA], width/2-210, height/2+60);
    text(wordB[rB], width/2-40, height/2+60);
    text(rank, width*3/4, height/2+60);
    text("Push Enterkey to Next", width/2, height*3/4+70);
    noFill();
    //progressBar
    rect(width/2-250, height/4, 500, height/16);


    //display information
    timer();
    makeProgressBar();
    nextScene();

    break;

  case 3:
    background(255);
    textSize(46);
    textAlign(CENTER);
    fill(0);
    text("Finish! Thank you!", width/2, height/4);
    println(count_answer);
    println(count_time);
    noLoop();
    //text(count_answer,width/4,height/2);
    //text(count_time,width/4,height*3/4);
  }
}

void timer() {
  if (base_time == 0) {
      base_time = millis();
    }
    time = millis() - base_time;
    time = time/1000;
    //text("true_time:"+int(time), width/2, height/2-20);
    if (time < 240) {
      f = 1;
      time = time * 3/2;
      //text("fast_time:"+int(time), width/2, height/2);
      //text("fast", width/2, height/2-200);
    } else if (time >= 240) {
      f = 2;
      if (base_timeA == 0) {

        base_timeA = millis();
      }
      time2 = millis() - base_timeA;
      time2 = time2/1000;

      time2 = time2 * 2/3;
      time2 = time2 + 360;
      //text("slow_time:"+int(t), width/2, height/2);
      //text("slow", width/2, height/2-200);
    }
}

void makeProgressBar() {
  if (f == 1) {
    n = (600-time)/6;
  } else if (f == 2) {
    n = (600-time2)/6;
  }
  fill(0, 255, 0);
  for (int i = 0; i < n; i++) {
    if (scene == 2) {
      rect((width/2+250)-5*i, height/4, 5, height/16);
    }
  }
}

void nextScene() {
  if (n < 0) {
    scene = 3;
  }
}


void keyReleased() {
  if (scene == 1) {
    if (keyCode == ENTER) {
      scene = 2;
    }
  } else if (scene == 2) {
    if (keyCode == ENTER) {
      count_answer += 1;

      if (int(time-before_time) == 0) {
      }else{
        count_time = append(count_time, int(time-before_time));
        before_time = time;
      }

      rA = int(random(0, 10));
      rB = int(random(0, 5));
      rank = int(random(1, 5));
    }
  }
}
