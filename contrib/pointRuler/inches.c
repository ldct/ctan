#include <stdio.h>

//################################################
//# Setup the tic marks for every 1/16 inch with #
//#   different lengths depending on magnitude   #
//################################################

int main() {
   int n,h;
   FILE *fp;
   fp=fopen("inches.tex","w");
   for(n=1;n<=191;n++) {
      h=3.5;
      if(n%2 == 0 && n%4 !=0)
         h=7;
      if(n%4 == 0 && n%8 !=0)
         h=14;
      if(n%8 == 0 && n%16 != 0)
         h=21;
      if(n%16 == 0) {
         h=28;
         fprintf(fp,"\\put {\\scriptsize %i} [t] at %5.2f -29\n",n/16,n*72.27/16.0);
      }
      fprintf(fp,"\\plot %5.2f 0 %5.2f %i /\n",n*72.27/16.0,n*72.27/16.0,-h);
   }
   fclose(fp);
}
