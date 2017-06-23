#include <string.h>
#include <stdio.h>
#include <stdlib.h>

#ifndef SYMBOL_LATEX
	#define SYMBOL_LATEX

#define MAX_LINE 120

struct st_symbol {
	char* symbol;
	char* description;
	char* date;
	};

struct st_symbol_list {
	struct st_symbol symbol;
	struct st_symbol_list *next;
	};

struct st_symbol_group {
	char* group_name;
	struct st_symbol_list* group_list;
	struct st_symbol_group *next;
	};

struct st_symbol_group *group_symbol;

#endif

int main(int argc, char *argv[]);
int get_line (FILE * Fin, char * line);
void symbol_add (struct st_symbol_group **group_symbol_current, char* group, char* symbol, char* description, char* date);
void symbol_add_list (struct st_symbol_list ** list_current, char* symbol, char* description, char* date);
void symbol_store (FILE* pFile, struct st_symbol_group *group_current);
void symbol_store_list(FILE * pFile, struct st_symbol_list *list_current);

