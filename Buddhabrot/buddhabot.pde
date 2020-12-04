
void setup(){
  size(800,800,P2D);
  colorMode(HSB);
  bhuArr=new float[height][width];
  init();
}
float maxiterate=5000,lx=-2,ly=-2,r=4,rx,ry;
float a,b,ca,cb,aa,bb,bright,n,hue,sat,val;
float[][] bhuArr;
void draw(){
  
  
  init();
  for(int y=0;y<height;y++){
    for(int x=0;x<width;x++){
      
       a=map(random(0,width),0,width,lx,lx+r);
       b=map(random(0,height),0,height,ly,ly+r);
       ca=a;
       cb=b;
       n=0;
       while(n<maxiterate){
         aa=(a*a)-(b*b);
         bb=(2*a*b);
         a=aa+ca;
         b=bb+cb;
         if((a*a)+(b*b)>4){
           setOrbit(ca,cb);
           break;
         }
         n++;
         }
       }
     }
  //applyGaussainFIlter();
  setPixels();
 //saveFrame("output/gif-"+nf((int)frameCount,3)+".png");
 //maxiterate+=500;
 if(frameCount>=110){
   exit();
 }
}

void setOrbit(float a,float b){
   ca=a;
   cb=b;
   n=0;
   int x,y;
   while(n<maxiterate){
     x=(int)map(a,lx,lx+r,0,width-1);
     y=(int)map(b,ly,ly+r,0,height-1);
     bhuArr[y][x]++;
     aa=(a*a)-(b*b);
     bb=(2*a*b);
     a=aa+ca;
     b=bb+cb;
     if((a*a)+(b*b)>4){
       break;
     }
     n++;
   }
   
}

void setPixels(){
  float hue,sat,v,dx,dy;
  loadPixels();
   for(int y=0;y<height;y++){
    for(int x=0;x<width;x++){
      int index=y*width+x;
      v=bhuArr[x][y];
      v = map(sqrt(v)*2,0,50,0,255);
      //sat = map(v,0,75,120,255); 
      dx=x-width/2;
      dy=y-height/2;
      hue=map(sqrt(dx*dx+dy*dy),0,height/2,255,180);
      pixels[index]=color(hue,255,v);
    }
   }
  updatePixels();
  println(frameCount);
}

void init(){
  for(int y=0;y<height;y++){
    for(int x=0;x<width;x++){
        bhuArr[y][x]=0;
      }
  }
}
