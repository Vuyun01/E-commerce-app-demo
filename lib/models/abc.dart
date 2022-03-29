


void main() {
  tamGiac(-1, 0, 4);
}
void tamGiac(int a, int b, int c){
  if(a < 0 || b < 0 || c < 0){
    print("Khong phai tam giac");
  }else{
    if(a != b && a != c && b != c){
      print("Tam Giac Thuong");
    }else if(a*a==b*b+c*c || b*b==a*a+c*c || c*c== a*a+b*b){
      print("Tam Giac Vuong");
    }else if(a==b || a==c || b==c){
      if(a==b && a==c && b==c){
        print("Tam giac deu");
      }
      else if(a==b || b==c){
        print("Tam giac can");
      }
      else if(a*a > b*b+c*c || b*b > a*a+c*c || c*c > a*a+b*b){
        print("Tam Giac Tu");
      } 
      else{
        print("Tam Giac Nhon");
      }
    }
  }
}



