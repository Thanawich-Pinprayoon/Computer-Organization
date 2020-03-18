#include <stdio.h>

int gcd(int a, int b)
{
  if (a == 0 || b == 0){
      return 0;
  }
  while(a != b)
  {
    if(a>b)
      a = a - b;
    else
      b = b - a;
  }
  return a;
}

int
main ()
{
    int a,b;
    printf("Input num1 : ");
    scanf("%d",&a);
    printf("Input num2 : ");
    scanf("%d",&b);
    printf("GCD of %d and %d is %d",a,b,gcd(a,b));
    return 0;
}
