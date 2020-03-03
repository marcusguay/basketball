import fisica.*;
FBox Lfloor, Rfloor, Net, Lwall, Rwall,Roof,LBackboard,RBackboard;
FCircle player1, player2,ball;
FWorld world;
boolean wkey, akey, skey, dkey,qkey,ekey;
boolean ukey,rkey,lkey,dnkey,uukey,okey;
boolean ljump,rjump;
void setup() {   

  fullScreen(FX2D);  
  Fisica.init(this);
  world= new FWorld();
  world.setGravity(0, 980);

Roof= new FBox(width, 100);
Roof.setPosition(width/2, -50);
 Roof.setStatic(true);
 world.add(Roof);



RBackboard= new FBox(20, 100);
RBackboard.setFill(#FFFFF5);
RBackboard.setPosition(width-10, 400);
RBackboard.setStatic(true);
  world.add(RBackboard);
  
    FLine Net6 = new FLine(width-96, 405 , width-96, 413);
   Net6.setStatic(true);
 world.add(Net6);

  
  FLine Net5 = new FLine(width-23, 415, width-40, 447);
   Net5.setStatic(true);
 world.add(Net5);
 
    FLine Net4 = new FLine(width-95, 416, width-75, 447);
   Net4.setStatic(true);
 world.add(Net4);

LBackboard= new FBox(20, 100);
LBackboard.setFill(#FFFFF5);
LBackboard.setPosition(10, 400);
LBackboard.setStatic(true);
  world.add(LBackboard);
  
  FLine Net1 = new FLine(95, 415, 74, 445);
   Net1.setStatic(true);
 world.add(Net1);
 
  FLine Net2 = new FLine(23, 414, 46, 445);
   Net2.setStatic(true);
 world.add(Net2);

  FLine Net3 = new FLine(96, 405 , 96, 413);
   Net3.setStatic(true);
 world.add(Net3);


  Lfloor= new FBox(800, 100);
  Lfloor.setPosition(319, 850);
  Lfloor.setStatic(true);
  world.add(Lfloor);


  Rfloor= new FBox(800, 100);
  Rfloor.setPosition(1120, 850);
  Rfloor.setStatic(true);
  world.add(Rfloor);

 
  player1=new FCircle(75);
  player1.setPosition(200, 700);
  player1.setDensity(2);
  player1.setVelocity(100,0);
  world.add(player1);
  
  player2=new FCircle(75);
  player2.setPosition(1000, 700);
    player2.setDensity(2);
  world.add(player2);
  
  ball=new FCircle(35);
  ball.setPosition(200, 100);
    ball.setDensity(0.0001);
    
  world.add(ball);
  
  
  Lwall=new FBox(10,height);
  Lwall.setPosition(-1,height/2);
  Lwall.setStatic(true);
  world.add(Lwall);
  
    Rwall=new FBox(10,height);
  Rwall.setPosition(width+1,height/2);
  Rwall.setStatic(true);
  world.add(Rwall);
}


void draw() {
  background(255);
rect(width-96,405,75,10);
rect(21,405,75,10);
line(45,445,75,445);
line(width-39,447,width-77,447);
 
  ljump=false;
  rjump=false;
ArrayList<FContact> contactsB=ball.getContacts();
for(FContact c : contactsB ){
   if(c.contains(player1)){ ball.addImpulse(0,-0.235/3); if(qkey){ ball.addImpulse(0.250,0.55); ball.addImpulse(0,-0.300);} }
   if(c.contains(player2)){ ball.addImpulse(0,-0.235/3); if(uukey){ ball.addImpulse(-0.250,0.55); ball.addImpulse(0,-0.300);}}
   if(c.contains(Lfloor)){ball.addImpulse(0,-0.235/3);   }
    if(c.contains(Rfloor)){ ball.addImpulse(0,-0.235/3); }
     
  //  reset if p2 scores ball.setPosition(1000,100);   player1.setPosition(200, 700);
 // player2.setPosition(1000, 700); ball.setVelocity(0,0); player1.setVelocity(0,0); player2.setVelocity(0,0);}
  
  
   //ball.setPosition(200,100);   player1.setPosition(200, 700);
  //player2.setPosition(1000, 700); ball.setVelocity(0,0); player1.setVelocity(0,0); player2.setVelocity(0,0);}

 
 
 
 }

  ArrayList<FContact> contacts=player1.getContacts();
 for(FContact c : contacts){
   if(c.contains(Lfloor)) ljump=true;
   if(c.contains(Rfloor)) ljump=true;
    if(c.contains(player2)) ljump=true;
    
     
 }
  if (wkey && ljump) player1.addImpulse(0, -10000);
  if (akey) player1.addImpulse(-350, 0); 
  if (dkey) player1.addImpulse(350, 0);
    if (skey) player1.addImpulse(0, 500);
    
    
      rjump=false;
  ArrayList<FContact> contactss=player2.getContacts();
 for(FContact c : contactss){
   if(c.contains(Rfloor)) rjump=true;
    if(c.contains(Lfloor)) rjump=true;
    if(c.contains(player1)) rjump=true;
 }
    
    
      if (ukey && rjump) player2.addImpulse(0, -10000);
  if (lkey) player2.addImpulse(-350, 0); 
  if (rkey) player2.addImpulse(350, 0);
    if (dnkey) player2.addImpulse(0, 500);
    
  world.step();
  make();
  world.draw();
}

void make() {
}


public void keyPressed() {
  if (key=='a'|| key=='A') akey = true;
  if (key=='d'|| key=='D') dkey = true;
  if (key=='s'|| key=='S') skey = true;
  if (key=='w'|| key=='W') wkey = true;
    if (key=='q'|| key=='Q') qkey = true;
    if (key=='e'|| key=='E') ekey = true;
  
    if (key=='j'|| key=='J') lkey = true;
  if (key=='l'|| key=='L') rkey = true;
  if (key=='k'|| key=='k') dnkey = true;
  if (key=='i'|| key=='I') ukey = true;
   if (key=='u'|| key=='U') uukey = true;
  if (key=='o'|| key=='O') okey = true;
  
}


public void keyReleased() {
  if (key=='a'|| key=='A') akey = false;
  if (key=='d'|| key=='D') dkey = false;
  if (key=='s'|| key=='S') skey = false;
  if (key=='w'|| key=='W') wkey = false;  
  if (key=='q'|| key=='Q') qkey = false;
  if (key=='e'|| key=='E') ekey = false;
  
    if (key=='j'|| key=='J') lkey = false;
  if (key=='l'|| key=='L') rkey = false;
  if (key=='k'|| key=='k') dnkey = false;
  if (key=='i'|| key=='I') ukey = false;
     if (key=='u'|| key=='U') uukey = false;
  if (key=='o'|| key=='O') okey = false;
}
void mouseReleased(){
  println(mouseX,mouseY);
}
