
void setup(){
  size(500,500,P2D);
  colorMode(HSB);
}
float maxiterate=100,lx=-2,ly=-2,r=4,rx,ry,itterate=15,ran,xtemp;
float a,b,jca=0,jcb=0,ca,cb,aa,bb,bright,n,hue,sat,val,k=1;
void draw(){
    
  k+=0.025;
    
  loadPixels();
  for(int y=0;y<height;y++){
    for(int x=0;x<width;x++){
      int index = (y*width)+x;
       bright=255;
   
       n=0;
         a=map(x,0,width,lx,lx+r);
         b=map(y,0,height,ly,ly+r);
         maxiterate=itterate;
         ca=a;
         cb=b;
       while(n<maxiterate){
         aa=pow((a*a)+(b*b),(k/2))*cos(k*atan2(b,a)) +ca;
         bb=pow((a*a)+(b*b),(k/2))*sin(k*atan2(b,a))+ cb;
         
         a=aa;
         b=bb;
         if((a*a)+(b*b)>4){
           break;
         }
         n++;
       }
       if(n>=maxiterate){
         bright=color(0);
       }else{
         hue=map(n/maxiterate,0,1,150,255);
         val = map(n,0,maxiterate,200,255);
         bright = color(hue,255,val); 
       }
       pixels[index]=(int)bright;
    }
  }
  updatePixels();
  println(frameRate);
}
