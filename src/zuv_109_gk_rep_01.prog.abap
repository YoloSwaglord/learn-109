*&---------------------------------------------------------------------*
*& Report zuv_109_gk_rep_01
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuv_109_gk_rep_01.
"1a

WRITE 'Überschrift'.
WRITE 'Unterschrift'.

"1b

DATA:
  lv_caption TYPE string VALUE 'Überschrift',
  lv_sign    TYPE string VALUE 'Unterschrift'.

WRITE lv_caption.
WRITE lv_sign.

"2a

DATA:
      lv_date_yesterday TYPE d VALUE '20220602'.

WRITE lv_date_yesterday.
"Ausgabe Amerikanisches Format mm/dd/yyyy

"2b
WRITE lv_date_yesterday YYMMDD.

"2c

DATA lv_sy_datum TYPE d.
lv_sy_datum = sy-datum.
WRITE lv_sy_datum.

"2d

DATA lv_date_substraction TYPE d VALUE '20110101'.
lv_date_substraction = lv_date_substraction - 1.
WRITE lv_date_substraction.


"3a und b

DO 10 TIMES.
  WRITE Sy-index.
  NEW-LINE.
  WRITE 'Hello World'.
  NEW-LINE.
ENDDO.

"4a

DATA lv_breakpoint TYPE d VALUE '20110101'.
lv_breakpoint = 'Hello World'.
WRITE lv_breakpoint.
