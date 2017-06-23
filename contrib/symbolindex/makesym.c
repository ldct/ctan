#include <string.h>
#include <stdio.h>
#include <stdlib.h>

#include "makesym.h"

int main(int argc, char *argv[])
{
	FILE * pFile = NULL;
	char* mode;
	int modus = 0;
	char * pFilename = NULL;
	char c;
	char * line = NULL;
	char line_temp[MAX_LINE];
	int j = 0;
	int lines=0;
	char * pch;
	char * group_temp;
	char * symbol_temp;
	char * description_temp;
	char * date_temp;
	
	group_symbol = NULL;

	// ///////////////////////////////////////////
	if (argc <= 1)
	{
		printf("Please specify a file\n");
		return -1;
	}
	if (argc > 2)
	{
		mode = argv[2];
		if (strcmp(mode, "verbose") == 0)
		{
			modus = 1;
		}
		else
		{
			printf("Modus not defined\n");
		}
	}
	
	// ///////////////////////////////////////////
	pFilename = malloc((strlen(argv[1]) + 4)*sizeof(char));
	if (pFilename == NULL)
	{
		printf("Problem of memory allocation\n");
		return -1;
	}
	strcpy(pFilename, argv[1]);
	strcat(pFilename, ".los");

	// ///////////////////////////////////////////
	pFile = fopen (pFilename,"r");
	free (pFilename);
	if (pFile!=NULL)
	{
		do
		{
			// extraction of the symbols
			for (lines=0; (c=fgetc(pFile))!= EOF && c!='\n' && c!='\0' && lines<=MAX_LINE;lines++)
			{
				line_temp[lines]=c;
				if (modus == 1) // verbose mode
				{
					printf("%c", c);
				}
			}
			line_temp[lines]='\n';
			if (modus == 1) // verbose mode
			{
				printf("\t%i\n", lines);
			}
			
			line = malloc (lines*sizeof(char));
			for (j=0; j<lines; j++)
			{
				line[j] = line_temp[j];
			}
			
		
			// if line exists
			if ((lines !=-1) && (lines !=-0))
			{
				// analysis of the line
				if (modus == 1) // verbose mode
				{
					printf("%s\n", line);
				}
				pch = strtok (line, "/");
				if (modus == 1) // verbose mode
				{
					printf("%s\n", pch);
				}
				group_temp = malloc(strlen(pch)*sizeof(char));
				strcpy(group_temp, pch);
				pch = strtok (NULL, "/");
				if (modus == 1) // verbose mode
				{
					printf("%s\n", pch);
				}
				symbol_temp = malloc(strlen(pch)*sizeof(char));
				strcpy(symbol_temp, pch);
				pch = strtok (NULL, "/");
				if (modus == 1) // verbose mode
				{
					printf("%s\n", pch);
				}
				description_temp = malloc(strlen(pch)*sizeof(char));
				strcpy(description_temp, pch);
				pch = strtok (NULL, "/");
				if (modus == 1) // verbose mode
				{
					printf("%s\n", pch);
				}
				date_temp = malloc(strlen(pch)*sizeof(char));
				strcpy(date_temp, pch);
				if (modus == 1) // verbose mode
				{
					printf("%s: %s - %s , %s\n", group_temp, symbol_temp, description_temp, date_temp);
				}

				// storing the new symbol
				// sorting directly done during the extraction
				symbol_add(&group_symbol, group_temp, symbol_temp, description_temp, date_temp);

				free(group_temp);
				free(symbol_temp);
				free(description_temp);
				free(date_temp);
			}
			free (line);
			line = NULL;
		}while ((lines !=-1)&(lines !=0));

		fclose (pFile);

		if (modus == 1) // verbose mode
		{
			printf("List of symbols get\n");
		}
				
		
		// storing the symbols
		pFilename = malloc((strlen(argv[1]) + 4)*sizeof(char));
		if (pFilename == NULL)
		{
			printf("Problem of memory allocation\n");
			return -1;
		}
		strcpy(pFilename, argv[1]);
		strcat(pFilename, ".los");

		// ///////////////////////////////////////////
		pFile = fopen (pFilename,"w");
		if (pFile!=NULL)
		{
			symbol_store (pFile, group_symbol);
			fclose (pFile);
		}
		if (modus == 1) // verbose mode
		{
			printf("List of symbols stored into %s\n", pFilename);
		}
		free (pFilename);
	}

	return 0;
}


// ////////////////////////////////////////////
int get_line (FILE * Fin, char * line)
{
	int c, i;

	for (i=0; (c=fgetc(Fin))!= EOF && c!='\n' && i<=MAX_LINE;i++)
	{
		line[i]=c;
	}
	
	line[i]='\n';          	// replace NEW LINE or last by '\0'

	if (c==EOF)
	{
		return(-1); 	// EOF encountered
	}
	else
	{
		return (i);
	}
} 


// ////////////////////////////////////////////
void symbol_add(struct st_symbol_group **group_symbol_current, char* group, char* symbol, char* description, char* date)
{
	struct st_symbol_group *group_new = NULL;
	int comparison = 0;
	int is_voidgroup = 0;

	if (*group_symbol_current == NULL)
	{
		// adding a new group
		group_new = (struct st_symbol_group*) malloc (sizeof(struct st_symbol_group));
		if (group_new != NULL)
		{
			group_new->group_name =  malloc(strlen(group)*sizeof(char));
			strcpy(group_new->group_name, group);
			group_new->group_list =  malloc(sizeof(struct st_symbol_list));

			group_new->group_list->symbol.symbol = malloc(strlen(symbol)*sizeof(char));
			strcpy(group_new->group_list->symbol.symbol, symbol);
			group_new->group_list->symbol.description = malloc(strlen(description)*sizeof(char));
			strcpy(group_new->group_list->symbol.description, description);
			group_new->group_list->symbol.date = malloc(strlen(date)*sizeof(char));
			strcpy(group_new->group_list->symbol.date, date);

			group_new->group_list->next = NULL;
			group_new->next = NULL;
			*group_symbol_current = group_new;
		}
	}
	else
	{
		comparison = strcmp((*group_symbol_current)->group_name, group);
		is_voidgroup = strcmp((*group_symbol_current)->group_name, "voidgroup");

		if (is_voidgroup == 0)
		{
			if (comparison == 0)
			{
				// right group -> adding the symbol to the list
				symbol_add_list (&(*group_symbol_current)->group_list, symbol, description, date);
			}
			else
			{
				// adding the voidgroup before
				group_new = (struct st_symbol_group*) malloc (sizeof(struct st_symbol_group));
				if (group_new != NULL)
				{
					group_new->group_name =  malloc(strlen(group)*sizeof(char));
					strcpy(group_new->group_name, group);
					group_new->group_list =  malloc(sizeof(struct st_symbol_list));
	
					group_new->group_list->symbol.symbol = malloc(strlen(symbol)*sizeof(char));
					strcpy(group_new->group_list->symbol.symbol, symbol);
					group_new->group_list->symbol.description = malloc(strlen(description)*sizeof(char));
					strcpy(group_new->group_list->symbol.description, description);
					group_new->group_list->symbol.date = malloc(strlen(date)*sizeof(char));
					strcpy(group_new->group_list->symbol.date, date);
	
					group_new->group_list->next = NULL;
					group_new->next = *group_symbol_current;
					*group_symbol_current = group_new;
				}
			}
		}
		else
		{
			// normal group -> to sort alphabeticaly
			if (comparison == 0)
			{
				// right group -> adding the symbol to the list
				symbol_add_list (&(*group_symbol_current)->group_list, symbol, description, date);
			}
			else
			{
				if (comparison > 0)
				{
					// the group has to be integrated before
					group_new = (struct st_symbol_group*) malloc (sizeof(struct st_symbol_group));
					if (group_new != NULL)
					{
						group_new->group_name =  malloc(strlen(group)*sizeof(char));
						strcpy(group_new->group_name, group);
						group_new->group_list =  malloc(sizeof(struct st_symbol_list));
						
						group_new->group_list->symbol.symbol = malloc(strlen(symbol)*sizeof(char));
						strcpy(group_new->group_list->symbol.symbol, symbol);
						group_new->group_list->symbol.description = malloc(strlen(description)*sizeof(char));
						strcpy(group_new->group_list->symbol.description, description);
						group_new->group_list->symbol.date = malloc(strlen(date)*sizeof(char));
						strcpy(group_new->group_list->symbol.date, date);
						
						group_new->group_list->next = NULL;
						group_new->next = *group_symbol_current;
						*group_symbol_current = group_new;
					}
				}
				else
				{
					if ((*group_symbol_current)->next != NULL)
					{
						symbol_add(&(*group_symbol_current)->next, group, symbol, description, date);
					}
					else
					{
						// creation of the next
						group_new = (struct st_symbol_group*) malloc (sizeof(struct st_symbol_group));
						if (group_new != NULL)
						{
							group_new->group_name =  malloc(strlen(group)*sizeof(char));
							strcpy(group_new->group_name, group);
							group_new->group_list =  malloc(sizeof(struct st_symbol_list));
							
							group_new->group_list->symbol.symbol = malloc(strlen(symbol)*sizeof(char));
							strcpy(group_new->group_list->symbol.symbol, symbol);
							group_new->group_list->symbol.description = malloc(strlen(description)*sizeof(char));
							strcpy(group_new->group_list->symbol.description, description);
							group_new->group_list->symbol.date = malloc(strlen(date)*sizeof(char));
							strcpy(group_new->group_list->symbol.date, date);
							
							group_new->group_list->next = NULL;
							group_new->next = NULL;
							(*group_symbol_current)->next = group_new;
						}
					}
				}
			}
		}
	}
}


// ////////////////////////////////////////////
void symbol_add_list (struct st_symbol_list ** list_current, char* symbol, char* description, char* date)
{
	struct st_symbol_list * symbol_new = NULL;
	
	if ((*list_current)->next != NULL)
	{
		// sorting the element
		if (strcmp((*list_current)->next->symbol.symbol, symbol) < 0)
		{
			symbol_add_list (&(*list_current)->next, symbol, description, date);
		}
		else
		{
			// adding the element before
			symbol_new = malloc (sizeof(struct st_symbol_list));
			if (symbol_new != NULL)
			{
				symbol_new->symbol.symbol = malloc(strlen(symbol)*sizeof(char));
				strcpy(symbol_new->symbol.symbol, symbol);
				symbol_new->symbol.description = malloc(strlen(description)*sizeof(char));
				strcpy(symbol_new->symbol.description, description);
				symbol_new->symbol.date = malloc(strlen(date)*sizeof(char));
				strcpy(symbol_new->symbol.date, date);
				
				symbol_new->next = (*list_current)->next;
				(*list_current)->next = symbol_new;
			}
		}
	}
	else
	{
		// last element of the list -> creating a new element
		symbol_new = malloc (sizeof(struct st_symbol_list));

		if (symbol_new != NULL)
		{
			(*list_current)->next = symbol_new;

			symbol_new->symbol.symbol = malloc(strlen(symbol)*sizeof(char));
			strcpy(symbol_new->symbol.symbol, symbol);
			symbol_new->symbol.description = malloc(strlen(description)*sizeof(char));
			strcpy(symbol_new->symbol.description, description);
			symbol_new->symbol.date = malloc(strlen(date)*sizeof(char));
			strcpy(symbol_new->symbol.date, date);
		
			symbol_new->next = NULL;
		}
	}
}



// ////////////////////////////////////////////
void symbol_store (FILE* pFile, struct st_symbol_group *group_current)
{
	if (group_current != NULL)
	{
		if (strncmp(group_current->group_name, "voidgroup", 9)!=0)
		{
			// group void must be stored without name !
			fprintf(pFile, "\\noindent \\hspace*{1em} \\large \\bfseries \\MakeTextUppercase{%s} \\normalsize \\newline\n", group_current->group_name);
		}
		symbol_store_list(pFile, group_current->group_list);
		symbol_store (pFile, group_current->next);
	}
	else
	{
		fprintf(pFile, "\\newline\n");
	}
}

void symbol_store_list(FILE * pFile, struct st_symbol_list *list_current)
{
	if (list_current != NULL)
	{
		fprintf(pFile, "\\begin{minipage}[t]{3cm} %s \\end{minipage} \\begin{minipage}[t]{4cm} %s, %s \\end{minipage} \\newline\n", list_current->symbol.symbol, list_current->symbol.description, list_current->symbol.date);
		symbol_store_list(pFile, list_current->next);
	}
	else
	{
		fprintf(pFile, "\\vspace{1em} \\newline");
	}
}
