/* . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
File : brclc.c
       Copyright (c) Bernd Radgen 09/1999
       Distributed under the GNU-GENERAL-PUPLIC-LICENSE (version 2)
Version: 0.1.3
Date : 10.09.1999
Autor: Bernd Radgen
Purpose: TEX calculation - compiler
REM: use c++ for math-functions!
     calculations: addition '+', substraction '-', division '/',
                   multiplication '*', raising to a higher power '^',
                   exp, ln, log, sin, cos, tan, asin, acos, atan.
     rounded/unrounded output
     searches for: brclc.sty, \clc{}, \verb, \begin/\end{verbatim(*)},
                   \includeonly{}, \include{}, \input{},
                   \begin/\end{tabularx} (multiscan)
     writes output  in '*.clc'
     writes logfile in '*clg'.
. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . */

/****************************************************************************/
/* Preprozessor:. . . . . . . . . . . . . . . . . . . . . . . . . . . . */
/****************************************************************************/
#define __USE_GNU 1

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>

#define TEXUSEPACKAGE "\\usepackage"
#define STYNAME "brclc"
#define CLC "\\clc"
#define TEXBEGIN "\\begin"
#define TEXEND "\\end"
#define TEXVERB "\\verb"
#define TEXVERBATIM "verbatim"
#define TEXTABULARX "tabularx"
#define TEXINCLUDEONLY "\\includeonly"
#define TEXINCLUDE "\\include"
#define TEXINPUT "\\input"

#define MAXOP 400   /*number of memory-places could be changed by
                      using another number*/

/****************************************************************************/
/* global:. . . . . . . . . . . . . . . . . . . . . . . . . . . . */
/****************************************************************************/
FILE *logfile,*clcfile; /*output files*/

double clcout[MAXOP+2];
char operation[8];
char countalpha[20],umname[20],ionlyarg[100];
int argcount,pointposition;

/*multiscan:*/
int muscanint,muscanpointer,muscancount;
double muscansave[MAXOP+2];


/****************************************************************************/
/* functions: . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . */
/****************************************************************************/

/*errorroutine*/
/****************************************************************************/
int errexit(int errorlevel)
{
char hc;
hc=getchar();
exit(errorlevel);
}

/*evaluate+calculation*/
/****************************************************************************/
int clcfkt(char inarg[100])
{
char hs[100];
int z1,z2,z3;
int len,argnum,oplen,istflag;
int num1,num2,outnum;
double arg1,arg2,outarg;

outarg=0;
oplen=1;
istflag=0;
argnum=0;
num1=-1;
num2=-1;
outnum=-1;
operation[0]='n';
arg1=0;
arg2=0;
z2=0;
len=strlen(inarg);
pointposition=0;

for(z1=0;z1<=len;z1++)
   {
   hs[z1-z2]=inarg[z1];
   if(hs[z1]=='{') /*startpoint*/
     {
     z2=z1+1;
     hs[z1-z2]='\0';
     }

   if(hs[z1-z2]==':') /*getting arguments*/
     {
     if(argnum>2)
       {
       fprintf(logfile,"\n> Error: to many arguments found in expression %i\n",argcount);
       printf("\n> Error: to many arguments found in expression %i\n",argcount);
       errexit(3);
       }

     if(argnum==2)
       {
        hs[z1-z2]='\0';
        outnum=atoi(hs);
        if(outnum>MAXOP)
          {
          fprintf(logfile,"\n> Error: overload argument 3 in expression %i\n",argcount);
          printf("\n> Error: overload argument 3 in expression %i\n",argcount);
          errexit(3);
          }
       clcout[outnum]=outarg;
       argnum=3;
       }

     if(argnum==1)
       {
        hs[z1-z2]='\0';
        num2=atoi(hs);
        if(num2>MAXOP)
          {
          fprintf(logfile,"\n> Error: overload argument2 in expression %i\n",argcount);
          printf("\n> Error: overload argument2 in expression %i\n",argcount);
          errexit(3);
          }
        z2=z1+1;
        arg2=clcout[num2];
        argnum=2;
        }

     if(argnum==0)
       {
        hs[z1-z2]='\0';
        num1=atoi(hs);
        if(num1>MAXOP)
          {
          fprintf(logfile,"\n> Error: overload argument1 in expression %i\n",argcount);
          printf("\n> Error: overload argument1 in expression %i\n",argcount);
          errexit(3);
          }
        z2=z1+1;
        arg1=clcout[num1];
        argnum=1;
        }
     }/*:*/
   if(hs[z1-z2]=='+')
     {
     /*test input or calculation?*/
     z3=z2;
     while(z3<len)
       {
       if(inarg[z3]==':'){z3=-1;break;}
       z3++;
       }
     if(z3==-1) /*calculation*/
       {
       z2=z1+1;
       operation[0]='+';
       operation[1]='\0';
       }
     }
   if(hs[z1-z2]=='-')
     {
     /*test input or calculation?*/
     z3=z2;
     while(z3<len)
       {
       if(inarg[z3]==':'){z3=-1;break;}
       z3++;
       }
     if(z3==-1) /*calculation*/
       {
       z2=z1+1;
       operation[0]='-';
       operation[1]='\0';
       }
     }
   if(hs[z1-z2]=='*')
     {
     z2=z1+1;
     operation[0]='*';
     operation[1]='\0';
     }
   if(hs[z1-z2]=='/')
     {
     z2=z1+1;
     operation[0]='/';
     operation[1]='\0';
     }
   if(hs[z1-z2]=='^')
     {
     z2=z1+1;
     operation[0]='^';
     operation[1]='\0';
     }
   if(hs[z1-z2]=='e')/*exponent*/
     {
     z1=z1+2;
     z2=z1+1;
     operation[0]='e';
     operation[1]='x';
     operation[2]='p';
     operation[3]='\0';
     argnum=2;
     }
   if(hs[z1-z2]=='l')
     {
     operation[0]='l';
     if(inarg[z1+1]=='n')/*ln*/
      {
      z1=z1+1;
     operation[1]='n';
     operation[2]='\0';
     }
     if(inarg[z1+1]=='o')/*log*/
      {
     z1=z1+2;
     operation[1]='o';
     operation[2]='g';
     operation[3]='\0';
     }
     z2=z1+1;
     argnum=2;
     }
   if(hs[z1-z2]=='s')/*sinus*/
     {
     z1=z1+2;
     z2=z1+1;
     operation[0]='s';
     operation[1]='i';
     operation[2]='n';
     operation[3]='\0';
     argnum=2;
     }
   if(hs[z1-z2]=='c')/*cosinus*/
     {
     z1=z1+2;
     z2=z1+1;
     operation[0]='c';
     operation[1]='o';
     operation[2]='s';
     operation[3]='\0';
     argnum=2;
     }
   if(hs[z1-z2]=='t')/*tangens*/
     {
     z1=z1+2;
     z2=z1+1;
     operation[0]='t';
     operation[1]='a';
     operation[2]='n';
     operation[3]='\0';
     argnum=2;
     }
   if(hs[z1-z2]=='a')/*arc*/
     {
     operation[0]='a';
     if(inarg[z1+1]=='s')/*arcsin*/
      {
      z1=z1+3;
     operation[1]='s';
     operation[2]='i';
     operation[3]='n';
     operation[4]='\0';
     }
     if(inarg[z1+1]=='c')/*arccos*/
      {
      z1=z1+3;
     operation[1]='c';
     operation[2]='o';
     operation[3]='s';
     operation[4]='\0';
     }
     if(inarg[z1+1]=='t')/*arctan*/
      {
      z1=z1+3;
     operation[1]='t';
     operation[2]='a';
     operation[3]='n';
     operation[4]='\0';
     }
     z2=z1+1;
     argnum=2;
     }
   if(hs[z1-z2]=='=')
     {
     z2=z1+1;
     istflag=1;
     if(operation[0]=='+')outarg=arg1+arg2;
     if(operation[0]=='-')outarg=arg1-arg2;
     if(operation[0]=='*')outarg=arg1*arg2;
     if(operation[0]=='/')outarg=arg1/arg2;
     if(operation[0]=='^')outarg=pow(arg1,arg2);
     if(operation[0]=='e')outarg=exp(arg1);
     if(operation[0]=='l')
       {
       if(operation[1]=='n')outarg=log(arg1);
       if(operation[1]=='o')outarg=log10(arg1);
       }
     if(operation[0]=='s')outarg=sin(arg1);
     if(operation[0]=='c')outarg=cos(arg1);
     if(operation[0]=='t')outarg=tan(arg1);
     if(operation[0]=='a')
       {
       if(operation[1]=='s')outarg=asin(arg1);
       if(operation[1]=='c')outarg=acos(arg1);
       if(operation[1]=='t')outarg=atan(arg1);
       }

     if(operation[0]=='n')/*quiet input*/
       {
       hs[z1-z2]='\0';
       outarg=atof(hs);
       outnum=num1;
       clcout[outnum]=outarg;
       }
     }
   if(hs[z1-z2]=='>')
     {
     if(operation[0]=='n'&& argnum!=1)
       {
       fprintf(logfile,"\n> Error: > Error in expression %i\n",argcount);
       printf("\n> Error: > Error in expression %i\n",argcount);
       errexit(3);
       }
     if(operation[0]=='n'&& argnum==1) /*input argument or just printout*/
       {
       outnum=num1;
       hs[z1-z2]='\0';
       if(hs[0]=='\0');/*just printout*/
       else
         {
         outarg=atof(hs);
         clcout[outnum]=outarg;
         }
       operation[0]='>';
       operation[1]='\0';
       }
     if(argnum==2 && operation[0]!='n')
       {
       outnum=399;
       clcout[399]=outarg;
       operation[oplen]='>';
       operation[oplen+1]='\0';
       }
     if(argnum==3 && operation[0]!='n')
       {
       operation[oplen]='>';
       operation[oplen+1]='\0';
       }
    if(inarg[z1+1]=='.') /*pointposition rounded*/
      {
      hs[0]=inarg[z1+2];
      hs[1]='\0';
      pointposition=atoi(hs)+1;
      return(outnum);
      }
    if(inarg[z1+1]==',') /*pointposition unrounded*/
      {
      hs[0]=inarg[z1+2];
      hs[1]='\0';
      pointposition=-atoi(hs)-1;
      return(outnum);
      }
    return(outnum);
    }/*>*/
   }/*for*/
if(istflag==1) /*quiet calculation*/
  {
  operation[oplen]='=';
  operation[oplen+1]='\0';
  outnum=-2;
  return(outnum);

  }
 fprintf(logfile,"\n> Error: > Error in expression %i %s}\n",argcount,inarg);
 printf("\n> Error: > Error in expression %i %s}\n",argcount,inarg);
 errexit(3);
 return(0);
}/*clcfkt*/
/*printf("\n%s-> f%i:%f; f%i:%f; out: f%i:%f ",inarg,num1,arg1,num2,arg2,outnum,outarg);*/

/*unround*/
/****************************************************************************/
double unround(int innum, double faktor)
{
register double hf;

if(clcout[innum]<0)/*negativ*/
    {
    hf=floor(clcout[innum]*-1*faktor);
    hf=hf*-1;
    }
  else  hf=floor(clcout[innum]*faktor);/*positiv*/
hf=hf/faktor;
return(hf);
}


/*pointpositional output*/
/****************************************************************************/
void clcfileout(int innum)
{
/*int pointposition is global!*/
switch(pointposition)
  {
  /*rounded*/
  case 1:
  fprintf(clcfile,"\\def\\@clc@tmp{%.0f}\\or%%\n",clcout[innum]);
  break;
  case 2:
  fprintf(clcfile,"\\def\\@clc@tmp{%.1f}\\or%%\n",clcout[innum]);
  break;
  case 3:
  fprintf(clcfile,"\\def\\@clc@tmp{%.2f}\\or%%\n",clcout[innum]);
  break;
  case 4:
  fprintf(clcfile,"\\def\\@clc@tmp{%.3f}\\or%%\n",clcout[innum]);
  break;
  case 5:
  fprintf(clcfile,"\\def\\@clc@tmp{%.4f}\\or%%\n",clcout[innum]);
  break;
  case 6:
  fprintf(clcfile,"\\def\\@clc@tmp{%.5f}\\or%%\n",clcout[innum]);
  break;
  case 7:
  fprintf(clcfile,"\\def\\@clc@tmp{%.6f}\\or%%\n",clcout[innum]);
  break;
  case 8:
  fprintf(clcfile,"\\def\\@clc@tmp{%.7f}\\or%%\n",clcout[innum]);
  break;
  case 9:
  fprintf(clcfile,"\\def\\@clc@tmp{%.8f}\\or%%\n",clcout[innum]);
  break;
  /*unrounded*/
  case -1:
  fprintf(clcfile,"\\def\\@clc@tmp{%.0f}\\or%%\n",unround(innum,1));
  break;
  case -2:
  fprintf(clcfile,"\\def\\@clc@tmp{%.1f}\\or%%\n",unround(innum,10));
  break;
  case -3 :
  fprintf(clcfile,"\\def\\@clc@tmp{%.2f}\\or%%\n",unround(innum,100));
  break;
  case -4 :
  fprintf(clcfile,"\\def\\@clc@tmp{%.3f}\\or%%\n",unround(innum,1000));
  break;
  case -5 :
  fprintf(clcfile,"\\def\\@clc@tmp{%.4f}\\or%%\n",unround(innum,10000));
  break;
  case -6 :
  fprintf(clcfile,"\\def\\@clc@tmp{%.5f}\\or%%\n",unround(innum,100000));
  break;
  case -7 :
  fprintf(clcfile,"\\def\\@clc@tmp{%.6f}\\or%%\n",unround(innum,1000000));
  break;
  case -8 :
  fprintf(clcfile,"\\def\\@clc@tmp{%.7f}\\or%%\n",unround(innum,10000000));
  break;
  case -9 :
/*  hf=floor(clcout[innum]*10000000);
  hf= hf/10000000;*/
  fprintf(clcfile,"\\def\\@clc@tmp{%.8f}\\or%%\n",unround(innum,100000000));
  break;

  default :  /*rounded*/
  fprintf(clcfile,"\\def\\@clc@tmp{%.2f}\\or%%\n",clcout[innum]);
  break;
  }
}

/*package searches \usepackage */
/****************************************************************************/
int package(FILE *file)
{
int z1,len;
char inc;
char package[20],texcommand[20],arg[30];
z1=1;
strcpy(package,TEXUSEPACKAGE);
len=strlen(package);
while((inc=fgetc(file))!='{')
  {
  texcommand[z1]=inc;
  if(texcommand[z1]!=package[z1+1])break;

  if(z1==len-2)
    {
    z1=0;
    while((inc=fgetc(file))!='{')
      {
      arg[z1]=inc;
      z1++;
      }
    arg[z1]='\0';
    if(inc=='{')
    {
 /*   fprintf(logfile,"\n \\usepackage%s{",arg);*/
    z1=0;
    while((inc=fgetc(file))!='}'){texcommand[z1]=inc;z1++;}
    texcommand[z1]='\0';
    strcpy(umname,texcommand);
/*    fprintf(logfile,"%s}",umname);*/
    return(1);
    }
    else return(0);
    }
  z1++;
  }
return(0);
}

/*multiscan */
/****************************************************************************/
void multiscan(char begin_end,FILE *file)
{
int z1,len;
char hs[50];

/*tabularx?*/
strcpy(hs,TEXTABULARX);
len=strlen(hs);
for(z1=0;z1<len;z1++)
   {
   if(hs[z1]!=umname[z1])return;
   }

if(begin_end=='b')/*\begin{}*/
  {
  /*save clcout,argcount,filepointer*/
  for(z1=0;z1<MAXOP+2;z1++)muscansave[z1]=clcout[z1];
  muscancount=argcount;
  muscanpointer=ftell(file);
  fprintf(logfile,"tabularx: scan %i \n",muscanint+1);
  return;
  }
if(begin_end=='e')/*\end{}*/
  {
  /*tabularx scans tabular three times!*/
  if(muscanint==3)muscanint=0;
  muscanint++;
  if(muscanint<3)
    {
    /*restore clcout,argcount,filepointer*/
    for(z1=0;z1<MAXOP+2;z1++)clcout[z1]=muscansave[z1];
    argcount=muscancount;
    z1=ftell(file)-muscanpointer;
    fseek(file,-z1,SEEK_CUR);
    fseek(logfile,-15,SEEK_CUR);
    fprintf(logfile,"tabularx: scan %i\n",muscanint+1);
    }
  }
}

/*verb searches \verb in texfile*/
/****************************************************************************/
void verb(FILE *file)
{
int z1,len;
char beg,inc;
char verb[20],texcommand[20];
z1=1;
strcpy(verb,TEXVERB);
len=strlen(verb);
while((inc=fgetc(file))!='b')
  {
  texcommand[z1]=inc;
  if(texcommand[z1]!=verb[z1+1])break;
  if(z1==len-3)
    {
    beg=fgetc(file);
    if(beg=='b')
    {
    beg=fgetc(file);
    fprintf(logfile,"\\verb%c",beg);
    while((inc=fgetc(file))!=beg);
    fprintf(logfile,"...%c\n",beg);
    printf("*");
    }
    else break;
    }
  z1++;
  }
}


/*begin searches \begin{} */
/****************************************************************************/
int begin(FILE *file)
{
int z1,len;
char inc;
char begin[20],texcommand[20];
z1=1;
strcpy(begin,TEXBEGIN);
len=strlen(begin);
while((inc=fgetc(file))!='{')
  {
  texcommand[z1]=inc;
  if(texcommand[z1]!=begin[z1+1])break;
  if(z1==len-2)
    {
    inc=fgetc(file);
    if(inc=='{')
    {
    fprintf(logfile,"\\begin{");
    z1=0;
    while((inc=fgetc(file))!='}'){texcommand[z1]=inc;z1++;}
    texcommand[z1]='\0';
    strcpy(umname,texcommand);
    fprintf(logfile,"%s}\n",umname);
    multiscan('b',file);/*tabularx?*/
    return(1);
    }
    else return(0);
    }
  z1++;
  }
return(0);
}

/*end searches \end{} */
/****************************************************************************/
int end(int quiet,FILE *file)
{
int z1,len;
char inc;
char end[20],texcommand[20];
z1=1;
strcpy(end,TEXEND);
len=strlen(end);
while((inc=fgetc(file))!='{')
  {
  texcommand[z1]=inc;
  if(texcommand[z1]!=end[z1+1])break;
  if(z1==len-2)
    {
    inc=fgetc(file);
    if(inc=='{')
    {
    if(quiet==0)fprintf(logfile,"\\end{");
    z1=0;
    while((inc=fgetc(file))!='}'){texcommand[z1]=inc;z1++;}
    texcommand[z1]='\0';
    strcpy(umname,texcommand);
    if(quiet==0)fprintf(logfile,"%s}\n",umname);
    multiscan('e',file);/*tabularx?*/
    return(1);
    }
    else return(0);
    }
  z1++;
  }
return(0);
}

/*verbatim searches verbatim in texfile*/
/****************************************************************************/
int verbatim(FILE *file)
{
int hi,z1,len;
char inc;
char verbatim[20];
hi=0;

strcpy(verbatim,TEXVERBATIM);
len=strlen(verbatim);
for(z1=0;z1<len;z1++)
   {
   if(verbatim[z1]!=umname[z1])return(0);
   }
while((inc=fgetc(file))!=EOF)
  {
  if(inc=='\\')
    {
    inc=fgetc(file);
    if(inc=='e')hi=end(1,file);
    if(hi==1 && umname[0]=='v')
      {
      for(z1=0;z1<len;z1++)
         {
         if(verbatim[z1] != umname[z1])break;
         }
      if(z1==len)
        {
        fprintf(logfile,"\\end{%s}\n",umname);
        printf("*");
        return(0);
        }
      }
    }
  }
fprintf(logfile,"\nError: \\end{verbatim} not found!");
printf("\n>Error: \\end{verbatim} not found!\n");
errexit(4);
return(0);
}
/*texinclude searches \include\input\incudeonly{} in texfile*/
/****************************************************************************/
int texinclude(FILE *file)
{
int z1,z2;
int ionlyarglen,inclonlylen,incllen;
char inc;
char incl[20],inclonly[20],texcommand[20];
z1=1;

inc=fgetc(file);
if(inc!='n')return(0);


inc=fgetc(file);
if(inc=='c') /*include/includeonly*/
  {
  strcpy(incl,TEXINCLUDE);
  incllen=strlen(incl);
  strcpy(inclonly,TEXINCLUDEONLY);
  inclonlylen=strlen(inclonly);
  ionlyarglen=strlen(ionlyarg);

  while((inc=fgetc(file))!='{')
    {
    texcommand[z1]=inc;
    if(texcommand[z1]!=incl[z1+3])break;
    if(z1==incllen-4)
      {
      inc=fgetc(file);
      if(inc=='{')  /*} (include)*/
        {
        fprintf(logfile,"\\include{");
        z1=0;
        while((inc=fgetc(file))!='}'){texcommand[z1]=inc;z1++;}
        texcommand[z1]='\0';
        strcpy(umname,texcommand);
        /*{*/
        fprintf(logfile,"%s}",umname);
        incllen=strlen(umname);
        if(ionlyarg[0]=='N'&&ionlyarg[1]=='U'&&ionlyarg[2]=='L'&&ionlyarg[3]=='L'&&ionlyarg[4]=='\0')
          {
          fprintf(logfile,"\n");
          return(1);
          }
        for(z2=0;z2<ionlyarglen;z2++)
          {
          for(z1=0;z1<incllen;z1++)
            {
            if(umname[z1]!=ionlyarg[z2+z1])break;
            if(z1==incllen-1)
              {
              fprintf(logfile," accepted\n");
              return(1);
              }
            }/*z1*/
          }/*z2*/
        fprintf(logfile," ignored\n");
        printf("#");
        return(0);
        }/*if {} (include)*/

      if(inc=='o') /*includoeonly ?*/
        {
        z1++;
        while((inc=fgetc(file))!='{')
          {
          z1++;
          texcommand[z1]=inc;
          if(texcommand[z1]!=inclonly[z1+3])break;
          if(z1==inclonlylen-4) /*\includeonly...*/
            {
            inc=fgetc(file);
            if(inc=='{')/*}*/
              {
              fprintf(logfile,"\\includeonly{");
              z1=0;
              while((inc=fgetc(file))!='}'){texcommand[z1]=inc;z1++;}
              texcommand[z1]='\0';
              strcpy(ionlyarg,texcommand);
              /*{*/
              fprintf(logfile,"%s}\n",ionlyarg);
              printf("#");
              return(3);
              }
            }
          }
        }/*if includeonly?*/
      return(0);
      }/*if include*/
    z1++;
    }/*while*/
  return(0);
  }/*if incllen-4*/

if(inc=='p') /*input*/
  {
  strcpy(incl,TEXINPUT);
  incllen=strlen(incl);
  while((inc=fgetc(file))!='{')/*}*/
    {
    texcommand[z1]=inc;
    if(texcommand[z1]!=incl[z1+3])break;
    if(z1==incllen-4)
      {
      inc=fgetc(file);
      if(inc=='{')/*}*/
        {
        fprintf(logfile,"\\input{");
        z1=0;
        while((inc=fgetc(file))!='}'){texcommand[z1]=inc;z1++;}
        texcommand[z1]='\0';
        strcpy(umname,texcommand);
        /*{*/
        fprintf(logfile,"%s}\n",umname);
        return(4);
        }
      }
    z1++;
    }
  return(0);
  }/*if input*/


return(0);
}/*texinclude*/

/*reading+calculating*/
/****************************************************************************/
void clcmain(FILE *file)
{
FILE *incfile;
int hb,hi,innum,clclen;
int z1,z2; /*counter*/
char inc,texcommand[256],arg[100],clc[20];

strcpy(clc,CLC);
clclen=strlen(clc);

while((inc=fgetc(file))!=EOF)
  {
  if(inc=='%'){while((inc=fgetc(file))!='\n'){}}/*Comment*/
  if(inc=='\\')
    {
    texcommand[0]=inc;
    z1=1;
    hb=0;
    while((inc=fgetc(file))!='{') /*}*/
      {
      if(inc=='v'&&z1==1)verb(file); /*\verb found?*/
      if(inc=='b'&&z1==1)        /*\begin found?*/
        {
        hi=begin(file);
        if(hi==1)verbatim(file);
        }
      if(inc=='e'&&z1==1)end(0,file); /*\end found ?*/
      if(inc=='i'&&z1==1) /*\include(only)\input found ?*/
        {
        hi=texinclude(file);
        if(hi==1)/*include*/
          {
          sprintf(umname,"%s.tex",umname);
          printf("\n> opening includefile '%s' for reading ... ",umname);
          incfile=fopen(umname,"r");
          if(incfile==NULL)
            {
            printf("\n> Error:   could not open includefile '%s' \n",umname);
            errexit(2);
            }
            else printf("done.\n");
          printf("> calculating ");
          fprintf(logfile,"%s:\n",umname);
          clcmain(incfile);
          printf("done.\n");
          fprintf(logfile,"finished %s\n",umname);
          printf("> continue calculating ");
          }
        if(hi==4)/*input*/
          {
          printf("\n> opening inputfile '%s' for reading ... ",umname);
          incfile=fopen(umname,"r");
          if(incfile==NULL)
            {
            printf("\n> Error:   could not open inputfile '%s' \n",umname);
            errexit(2);
            }
            else printf("done.\n");
          printf("> calculating ");
          fprintf(logfile,"%s:\n",umname);
          clcmain(incfile);
          printf("done.\n");
          fprintf(logfile,"finished %s\n",umname);
          printf("> continue calculating ");
          }
        }/*if \include(only), \input*/
      texcommand[z1]=inc;
      if(texcommand[z1]!=clc[z1]){break;}
      else
        {
        if(z1+1==clclen)
          {
          inc=fgetc(file);
          if(inc!='{')break;
          printf(".");
          fflush(stdout);
          argcount++;
          z2=0;
     /*{*/while((inc=fgetc(file))!='}')
            {
            arg[z2]=inc;
            z2++;
            }
          arg[z2]='\0';
          innum=clcfkt(arg);
          fprintf(logfile,"%i %s}-> %i:=%f (%s) \n"\
          ,argcount-1,arg,innum,clcout[innum],operation);

          if(innum==-1)
            {
            printf("\n> Error: > Error in expression %i!",argcount);
            break;
            }
          if(innum!=-2)
            {
            clcfileout(innum);
            break;
            }
          else
            {
            fprintf(clcfile,"\\def\\@clc@tmp{}\\or%%\n");
            break;
            }

          }
        z1++;
        } /*while {*/
      }/*while }*/
    }/*if \\*/
  }/*main while*/

/*end*/
/****************************************************************************/

}

/****************************************************************************/
/****************************************************************************/
/* M A I N:_________________________________________________________________*/
/****************************************************************************/
/****************************************************************************/


int main(int parai,char *para[3])
{
/* deklaration: */
/****************************************************************************/
FILE *texfile;

char texfilename[FILENAME_MAX],logfilename[FILENAME_MAX],clcfilename[FILENAME_MAX];
int texnamelen,packageexist;
char hs[100],clc[20];

int z1; /*counter*/
int hi;
int clclen;
char inc;

time_t ltime;
struct tm *today;

/* initialize:*/
/****************************************************************************/
packageexist=0;
strcpy(ionlyarg,"NULL");
strcpy(clc,CLC);
clclen=strlen(clc);
argcount=0;
muscanint=0;

/*start*/
/****************************************************************************/
printf("brclc Version: 0.1.3 (10/09/1999)\n");
if(para[1] == NULL)
    {
    printf("Usage: brclc [texfile] \n");
    exit(2);
    }

/*opening files*/
/****************************************************************************/
texnamelen=strlen(para[1]);

if(para[1][texnamelen-4]=='.')
  {
  if(texnamelen>FILENAME_MAX)
    {
    printf("\n> Error:   too many characters in texfilename! \n");
    errexit(2);
    }
  if(para[1][texnamelen-1]!='x'&&para[1][texnamelen-2]!='e'\
     &&para[1][texnamelen-3]!='t')
    {
    printf("> texfilename does not end on '.tex' continueing ...\n");
    }
  strcpy(texfilename,para[1]);
  strcpy(logfilename,texfilename);
  logfilename[texnamelen-3]='c';
  logfilename[texnamelen-2]='l';
  logfilename[texnamelen-1]='g';
  strcpy(clcfilename,texfilename);
  clcfilename[texnamelen-3]='c';
  clcfilename[texnamelen-2]='l';
  clcfilename[texnamelen-1]='c';
  printf("> opening '%s' for reading .... ",texfilename);
  texfile=fopen(texfilename,"r");
  if(texfile==NULL)
    {
    printf("\n> Error:   could not open texfile '%s' \n",texfilename);
    errexit(2);
    }
  else printf("done.\n");
  }
else
  {
  if(texnamelen+4>FILENAME_MAX)
   {
   printf("\n> Error:   too many characters in texfilename!\n");
   errexit(2);
   }
  strcpy(texfilename,para[1]);
  texfilename[texnamelen]='.';
  texfilename[texnamelen+1]='t';
  texfilename[texnamelen+2]='e';
  texfilename[texnamelen+3]='x';
  texfilename[texnamelen+4]='\0';
  strcpy(logfilename,texfilename);
  logfilename[texnamelen]='.';
  logfilename[texnamelen+1]='c';
  logfilename[texnamelen+2]='l';
  logfilename[texnamelen+3]='g';
  logfilename[texnamelen+4]='\0';
  strcpy(clcfilename,texfilename);
  clcfilename[texnamelen+1]='c';
  clcfilename[texnamelen+2]='l';
  clcfilename[texnamelen+3]='c';
  clcfilename[texnamelen+4]='\0';

  printf("> opening '%s' for reading ... ",texfilename);
  texfile=fopen(texfilename,"r");
  if(texfile==NULL)
    {
    printf("\n> Error:   could not open texfile '%s' \n",texfilename);
    errexit(2);
    }
  else printf("done.\n");
  }


  printf("> opening '%s' for noting .... ",logfilename);
  logfile=fopen(logfilename,"w");
  if(logfile==NULL)
    {
    printf("\n> Error:   could not open logfile '%s' \n",logfilename);
    errexit(2);
    }
   fprintf(logfile,"log-file '%s'\ngenerated by brclc V0.1.3 -- ",logfilename);
   /*time output*/
   tzset();     /* Set time zone from TZ environment variable*/
   time( &ltime );
   today = localtime( &ltime );
   strftime( hs, 128,"%Y/%m/%d  %H:%M:%S", today);
   fprintf(logfile,"%s\n\n",hs);
   printf("done.\n");

  printf("> opening '%s' for output .... ",clcfilename);
  clcfile=fopen(clcfilename,"w");
  if(clcfile==NULL)
    {
    printf("\n> Error:   could not open clcfile '%s' \n",clcfilename);
    errexit(2);
    }
  fprintf(clcfile,"%%%%include-file '%s' for brclc.sty\n%%%%generated by brclc V0.1.3 -- ",clcfilename);
  /*time output*/
  /*hs defined by logfile*/
  fprintf(clcfile,"%s\n%%%%\n",hs);
  fprintf(clcfile,"\\def\\@clc@include#1{%%\n");
  fprintf(clcfile,"\\ifcase#1%%\n");
  printf("done.\n");

/*exists package brclc.sty?*/
/****************************************************************************/
while((inc=fgetc(texfile))!=EOF)
  {
  if(inc=='%'){while((inc=fgetc(texfile))!='\n'){}}/*Comment*/
  if(inc=='\\')
    {
    hi=0;
    inc=fgetc(texfile);
    if(inc=='u')hi=package(texfile); /*\usepackage found?*/
    if(hi==1)
      {
      strcpy(hs,STYNAME);
      hi=strlen(hs);
      for(z1=0;z1<hi;z1++)
         {
         if(hs[z1]!=umname[z1])break;
         }
      if(z1==hi)
        {
        fprintf(logfile,"brclc.sty found!\n");
        printf("> package brclc.sty found.");
        packageexist=1;
        break;
        }
      }
    }
  }/*while*/
if(packageexist==0)
  {
  fprintf(logfile,"> Error: Package brclc.sty not found!");
  printf("> Error:   no package brclc.sty? \n         expression ");
  printf(TEXUSEPACKAGE);
  printf("{"STYNAME"}");
  printf(" not found!\n");
  errexit(4);
  }

/*reading+calculating*/
/****************************************************************************/
printf("\n> calculating: ");
clcmain(texfile);
printf("\n");

/*end*/
/****************************************************************************/
fprintf(logfile,"Calculated %i expressions",argcount);
printf("> calculated %i expressions",argcount);
fprintf(clcfile,"\\fi}\n");
fprintf(clcfile,"%%%%\n%%%%End of file '%s'",clcfilename);
printf(" output written to '%s'.\n",clcfilename);
fprintf(logfile," output written to '%s', ready.\n",clcfilename);
fclose(logfile);
fclose(texfile);
fclose(clcfile);
exit(0);
} /*main*/


