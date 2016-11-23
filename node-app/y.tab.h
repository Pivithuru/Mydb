/* A Bison parser, made by GNU Bison 3.0.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2013 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    AND = 258,
    OR = 259,
    NOT = 260,
    GE = 261,
    LE = 262,
    EQ = 263,
    NE = 264,
    GT = 265,
    LT = 266,
    CREATE = 267,
    TABLE = 268,
    COLUMN = 269,
    TYPE = 270,
    INSERT = 271,
    INTO = 272,
    VALUES = 273,
    SELECT = 274,
    FROM = 275,
    WHERE = 276,
    DELETE = 277,
    LIKE = 278,
    STRINGTYPE = 279,
    INTTYPE = 280,
    DOUBLETYPE = 281,
    IN = 282,
    MAX = 283,
    MIN = 284,
    SUM = 285,
    AVG = 286,
    COUNT = 287,
    ALL = 288,
    COMMA = 289,
    SIQT = 290,
    OPBR = 291,
    CLBR = 292,
    SECL = 293,
    IDENTIFIER = 294,
    INTNUM = 295,
    DOUBLE = 296
  };
#endif
/* Tokens.  */
#define AND 258
#define OR 259
#define NOT 260
#define GE 261
#define LE 262
#define EQ 263
#define NE 264
#define GT 265
#define LT 266
#define CREATE 267
#define TABLE 268
#define COLUMN 269
#define TYPE 270
#define INSERT 271
#define INTO 272
#define VALUES 273
#define SELECT 274
#define FROM 275
#define WHERE 276
#define DELETE 277
#define LIKE 278
#define STRINGTYPE 279
#define INTTYPE 280
#define DOUBLETYPE 281
#define IN 282
#define MAX 283
#define MIN 284
#define SUM 285
#define AVG 286
#define COUNT 287
#define ALL 288
#define COMMA 289
#define SIQT 290
#define OPBR 291
#define CLBR 292
#define SECL 293
#define IDENTIFIER 294
#define INTNUM 295
#define DOUBLE 296

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE YYSTYPE;
union YYSTYPE
{
#line 12 "sqlyacc.y" /* yacc.c:1909  */

    int iValue;                 /* integer value */
    char *string;                /* symbol table index */
    double dvalue;				/* double value */

#line 142 "y.tab.h" /* yacc.c:1909  */
};
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
