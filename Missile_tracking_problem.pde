float T = 0;    //Total time
float t = 0.01; //time interval of update(not real time, But virtual time)
float h = 240;  //Initial Vertical distance between object and Missile


//Object(point A)
float Va = 200; //velocity of object
//initial point A's coordinates
float Xa = 0;
float Ya = 50;
//present X value of point A
float Xatemp = Xa;


//Missile(point B)
float Vb = 270; //velocity of Missile
//initial point B's coordinate
float Xb = 0;
float Yb = Ya + h;
//previous point B's coordinate
float Xbtemp = Xb;
float Ybtemp = Yb;
//present point B's coordinates
float Xbntemp = Xb;  
float Ybntemp = Yb;  
void setup(){
  size(500,300);
  background(0);
}

void draw(){
  T += t;
  Xatemp = Va * T;       //Update X value of point A
  stroke(255,255,255);
  strokeWeight(1);
  line(Xa,Ya,Xatemp,Ya);//Draw line from present point A to initial point A
  
  float G = (Ybntemp - Ya)/(Xbntemp - Xatemp);//calculates gradient of line AB
  float theta = atan(G);//calculates angle of tanjent to the x axes
  //println(theta);
  
  Xbtemp = Xbntemp;
  Ybtemp = Ybntemp;
  Xbntemp += Vb * t * cos(theta); //calculate diatsnce moved in x component and add it to origianl Xb
  Ybntemp += Vb * t * sin(theta); //calculate diatsnce moved in y component and add it to origianl Xb
  line(Xbtemp,Ybtemp,Xbntemp,Ybntemp);//draw line from present pointB to previous pointB
  println(T);
  if(Ybntemp <= Ya & Xbntemp >= Xatemp){
    stop();//stops when point B cathes up with A
  }
}
