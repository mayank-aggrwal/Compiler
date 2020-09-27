/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

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
    op = 258,
    dec_num = 259,
    oct_num = 260,
    hex_num = 261,
    pre_pro_dir = 262,
    header_file = 263,
    endStmt = 264,
    struct_KW = 265,
    main_KW = 266,
    for_KW = 267,
    while_KW = 268,
    if_KW = 269,
    else_KW = 270,
    assign_op = 271,
    string = 272,
    id = 273,
    dataT = 274,
    return_KW = 275,
    hash = 276,
    leftAng = 277,
    rightAng = 278,
    rightCB = 279,
    leftCB = 280,
    leftP = 281,
    rightP = 282,
    equal = 283,
    comma = 284
  };
#endif
/* Tokens.  */
#define op 258
#define dec_num 259
#define oct_num 260
#define hex_num 261
#define pre_pro_dir 262
#define header_file 263
#define endStmt 264
#define struct_KW 265
#define main_KW 266
#define for_KW 267
#define while_KW 268
#define if_KW 269
#define else_KW 270
#define assign_op 271
#define string 272
#define id 273
#define dataT 274
#define return_KW 275
#define hash 276
#define leftAng 277
#define rightAng 278
#define rightCB 279
#define leftCB 280
#define leftP 281
#define rightP 282
#define equal 283
#define comma 284

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
