#include <stdio.h>

//##############################################
//# Setup the tic marks for every 1 point with #
//#  different lengths depending on magnitude  #
//##############################################
                                                                                                                                              
int main() {
   int n,h;
   FILE *fp;

   fp=fopen("points.tex","w");
   for(n=1;n<=867;n++) {
      h=7;
      if(n%5 == 0 && n%10 !=0)
         h=14;
      if(n%10 == 0 && n%20 != 0) {
         h=21;
         fprintf(fp,"\\put {\\tiny %i} [b] at %i 23\n",n,n);
      }
      if(n%20 == 0) {
         h=28;
         fprintf(fp,"\\put {\\scriptsize %i} [b] at %i 30\n",n,n);
      }
      fprintf(fp,"\\plot %i 0 %i %i /\n",n,n,h);
   }
   fclose(fp);
}
