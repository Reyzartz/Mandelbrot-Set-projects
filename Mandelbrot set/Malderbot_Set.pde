
void setup(){
  size(500,500,P2D);
  colorMode(HSB);
}
float maxiterate=100,lx=-2,ly=-2,r=4,rx,ry,itterate=10;
float a,b,ca,cb,aa,bb,bright,n,hue,sat,val;
void draw(){
    
  
  if(mousePressed){
    r*=0.99;
    rx=map(mouseX,0,width,-2,2);
    ry=map(mouseY,0,height,-2,2);
    lx+=rx*r*0.01;
    ly+=ry*r*0.01;
    maxiterate=itterate;
    itterate+=0.3;
  }
  else
    maxiterate=itterate*2.5;
    
   if(keyPressed){
    if(keyCode==UP){
      maxiterate=itterate*5;
    }
  }
    
  loadPixels();
  for(int y=0;y<height;y++){
    for(int x=0;x<width;x++){
      int index = (y*width)+x;
       bright=255;
       a=map(x,0,width,lx,lx+r);
       b=map(y,0,height,ly,ly+r);
       ca=a;
       cb=b;
       n=0;
       while(n<maxiterate){
         aa=(a*a)-(b*b);
         bb=(2*a*b);
         a=aa+ca;
         b=bb+cb;
         if(a*a+b*b>4){
           break;
         }
         n++;
       }
       if(n>=maxiterate){
         bright=color(0);
       }else{
         val =map(sqrt(n)*n,5,maxiterate,0,255);
         sat =200;
         hue=map(maxiterate - n,0,maxiterate,0,1);
                hue=map(sqrt(hue),0,1,180,210);
         bright = color(hue,sat,val); 
       }
       pixels[index]=(int)bright;
    }
  }
  updatePixels();
}
