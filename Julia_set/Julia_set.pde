
void setup(){
  size(1000,500,P2D);
  colorMode(HSB);
}
float maxiterate=100,lx=-2,ly=-2,r=4,rx,ry,itterate=50,ran,xtemp;
float a,b,jca=0,jcb=0,ca,cb,aa,bb,bright,n,hue,sat,val,k=1;
void draw(){
    
  
  if(mouseX>width/2){
    jca=map(mouseX,width/2,width,lx,lx+r);
    jcb=map(mouseY,0,height,ly,ly+r);
  }
  if(mousePressed && mouseX>width/2){
    r*=0.99;
    rx=map(mouseX,width/2,width,-2,2);
    ry=map(mouseY,0,height,-2,2);
    lx+=rx*r*0.01;
    ly+=ry*r*0.01;
    maxiterate=itterate;
    itterate+=0.3;
  }
    
  loadPixels();
  for(int y=0;y<height;y++){
    for(int x=0;x<width;x++){
      int index = (y*width)+x;
       bright=255;
       
       
       n=0;
       if(x<=width/2){
         a=map(x,0,width/2,-2,2);
         b=map(y,0,height,-2,2);
         maxiterate=50;
         ca=jca;
         cb=jcb;
       }
       else{
         a=map(x,width/2,width,lx,lx+r);
         b=map(y,0,height,ly,ly+r);
         maxiterate=itterate;
         ca=a;
         cb=b;
       }
       //ran = sqrt(a*a+b*b);
       while(n<maxiterate){
         //aa=pow((a*a)+(b*b),(k/2))*cos(k*atan2(b,a));
         //bb=pow((a*a)+(b*b),(k/2))*sin(k*atan2(b,a));
         
         aa=(a*a)-(b*b)+ca;
         bb=2*a*b+cb;
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
         hue=map(sqrt(n/maxiterate),0,1,200,255);
         val = map(n,0,maxiterate,0,255);
         bright = color(hue,255,val); 
       }
       pixels[index]=(int)bright;
    }
  }
  updatePixels();
  //saveFrame("output/git-"+nf(frameCount,3)+".png");
  println(frameRate);
}
void doubleClicked(){

}
