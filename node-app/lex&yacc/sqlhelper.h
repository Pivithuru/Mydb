#ifndef __SQLHELPER_H_
#define __SQLHELPER_H_

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdarg.h>

#define MAX_NAME_SIZE

enum data_type {
  TYPE_INT,
  TYPE_DOUBLE,
  TYPE_STRING
};

typedef struct Column_t {
  char *name;
  enum data_type type;
  size_t offset;
  struct Column_t *next;
} Column_t;

typedef struct Table_t {
  char *name;
  Column_t *columns;
} Table_t;

void print_name(char *identifier);
void create_table(char *table_name);
void create_column(char *column_name, char *column_type, char *table_name);

#endif
