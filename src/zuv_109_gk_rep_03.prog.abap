*&---------------------------------------------------------------------*
*& Report zuv_109_gk_rep_03
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuv_109_gk_rep_03.

"2a
DATA lt_standard TYPE TABLE OF i.

"2b
DO 10 TIMES.
  APPEND sy-index TO lt_standard.
ENDDO.

FIELD-SYMBOLS:
     <lv_entry> TYPE i.

"2c
LOOP AT lt_standard ASSIGNING <lv_entry>.
  WRITE <lv_entry>.
  NEW-LINE.
ENDLOOP.

"2d
SORT lt_standard DESCENDING.

LOOP AT lt_standard ASSIGNING <lv_entry>.
  WRITE <lv_entry>.
  NEW-LINE.
ENDLOOP.

"3a

TYPES:
  BEGIN OF tys_person,
    id            TYPE i,
    firstname(20) TYPE c,
    lastname(20)  TYPE c,
    age           TYPE i,
    gender        TYPE c,
  END OF tys_person.

DATA lt_person TYPE TABLE OF tys_person.

FIELD-SYMBOLS:
    <ls_person> TYPE tys_person.

DO 10 TIMES.
  APPEND INITIAL LINE TO lt_person ASSIGNING <ls_person>.
  <ls_person>-id = sy-index.
  <ls_person>-firstname = sy-index.
  <ls_person>-lastname = 30 - sy-index.
  <ls_person>-age = 30 - sy-index.
  <ls_person>-gender = 'e'.
ENDDO.

READ TABLE lt_person ASSIGNING <ls_person> INDEX 2.
WRITE <ls_person>-age.
NEW-LINE.

FIELD-SYMBOLS:
    <ls_person2> TYPE tys_person.

"3c Wirft Fehler
"READ TABLE lt_person ASSIGNING <ls_person2> INDEX 22.
"WRITE <ls_person2>-age.

"3d
SORT lt_person BY firstname ASCENDING lastname DESCENDING.

"4a
DATA lt_sorted TYPE SORTED TABLE OF i WITH NON-UNIQUE KEY table_line.

"4b
"APPEND erfüllt die sortierungs-condition nicht, deshalb mit INSERT arbeiten
INSERT 8 INTO TABLE lt_sorted.
INSERT 2 INTO TABLE lt_sorted.
INSERT 10 INTO TABLE lt_sorted.
INSERT 7 INTO TABLE lt_sorted.
INSERT 2 INTO TABLE lt_sorted.
INSERT 3 INTO TABLE lt_sorted.
INSERT 5 INTO TABLE lt_sorted.
INSERT 1 INTO TABLE lt_sorted.
INSERT 2 INTO TABLE lt_sorted.
INSERT 9 INTO TABLE lt_sorted.
INSERT 4 INTO TABLE lt_sorted.

LOOP AT lt_sorted ASSIGNING <lv_entry>.
  WRITE <lv_entry>.
  NEW-LINE.
ENDLOOP.

"5a
DATA lt_sorted_struct TYPE SORTED TABLE OF tys_person WITH UNIQUE KEY id.

"5b
SORT lt_person BY id ASCENDING.
INSERT LINES OF lt_person INTO TABLE lt_sorted_struct.

LOOP AT lt_sorted_struct ASSIGNING <ls_person>.
  WRITE <ls_person>-age.
  NEW-LINE.
ENDLOOP.


"5c
READ TABLE lt_sorted_struct ASSIGNING <ls_person> INDEX 3.
<ls_person>-firstname = 'verändert'.
"Die ID kann nicht verändert werden, da er/sie/es eindeutiger identifier in der Tabell ist.

"6a
TYPES:
  BEGIN OF tys_hash_entry,
    id(10) TYPE c,
    anzahl TYPE i,
    preis  TYPE Preis,
  END OF tys_hash_entry.

DATA lt_hash TYPE HASHED TABLE OF tys_hash_entry WITH UNIQUE KEY id.

"6b
FIELD-SYMBOLS:
    <ls_hash> TYPE tys_hash_entry.

DATA ls_entry TYPE tys_hash_entry.

ls_entry-id = 1.
ls_entry-anzahl = 1.

COLLECT ls_entry INTO lt_hash.

ls_entry-id = 1.
ls_entry-anzahl = 1.

COLLECT ls_entry INTO lt_hash.

ls_entry-id = 2.
ls_entry-anzahl = 1.

COLLECT ls_entry INTO lt_hash.

ls_entry-id = 4.
ls_entry-anzahl = 1.

COLLECT ls_entry INTO lt_hash.

ls_entry-id = 2.
ls_entry-anzahl = 1.

COLLECT ls_entry INTO lt_hash.

ls_entry-id = 1.
ls_entry-anzahl = 1.

COLLECT ls_entry INTO lt_hash.

ls_entry-id = 6.
ls_entry-anzahl = 1.

COLLECT ls_entry INTO lt_hash.

"6c
"Duplizierte IDs werden nacheinander überschrieben, da es nur einen validen hashwert pro Id gibt
LOOP AT lt_hash ASSIGNING <ls_hash>.
  WRITE <ls_hash>-id.
  WRITE <ls_hash>-anzahl.
  SKIP.
ENDLOOP.

"6d
ls_entry-id = 6.
ls_entry-anzahl = 1.
ls_entry-preis = 1.

COLLECT ls_entry INTO lt_hash.
COLLECT ls_entry INTO lt_hash.

LOOP AT lt_hash ASSIGNING <ls_hash>.
  WRITE 'ID :' && <ls_hash>-id.
  NEW-LINE.
  WRITE 'Anzahl:' && <ls_hash>-anzahl.
  NEW-LINE.
  WRITE 'Preis:' && <ls_hash>-preis.
  NEW-LINE.
  SKIP.
ENDLOOP.
"Er zählt die Anzahl und den Preis hoch. Muss also nicht mehr selbst berechnet werden

"7
FIELD-SYMBOLS:
    <ls_crash> TYPE tys_hash_entry.

"Short Dump
"WRITE <ls_crash>-anzahl.
