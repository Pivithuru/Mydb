#include <stdio.h>
#include "sqlhelper.h"

static struct Table_t tables[20];

void print_name(char *identifier) {
	printf("identifier is %s\n", identifier);
}

void create_table(char *table_name) {
	// int i;
	// for (i=0; i<20; i++) {
	// 	if(tables[i].name == NULL) {
	// 		tables[0].name = table_name;
	// 	}
	// }
	// printf("Table name: %s\n", tables[0].name);
	// printf("Table name: %s\n", tables[1].name);
	printf("Table '%s' is created successfully.\n", table_name);
}

void create_column(char *column_name, char *column_type, char *table_name) {
	printf("Add column '%s' type '%s' to table '%s'\n", column_name, column_type, table_name);
}
