*&---------------------------------------------------------------------*
*& Report zuv_109_gk_rep_02
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuv_109_gk_rep_02.

"1a/b

TYPES:
  BEGIN OF tys_person,
    id            TYPE i,
    firstname(20) TYPE c,
    lastname(20)  TYPE c,
    age           TYPE i,
    gender        TYPE c,
  END OF tys_person.

"1c
DATA ls_person TYPE tys_person.

"1d

ls_person-id = 1.
ls_person-firstname = 'Hermann'.
ls_person-lastname = 'Humpelbach'.
ls_person-age = 24.
ls_person-gender = 'egirl'.

"1e/f
WRITE 'Person 1'.
NEW-LINE.
WRITE ls_person-id.
NEW-LINE.
WRITE ls_person-firstname.
NEW-LINE.
WRITE ls_person-lastname.
NEW-LINE.
WRITE ls_person-age.
NEW-LINE.
WRITE ls_person-gender.
NEW-LINE.

"1g
TYPES:
  BEGIN OF tys_person2,
    id            TYPE i,
    firstname(40) TYPE c,
    lastname(40)  TYPE c,
    age           TYPE i,
    gender        TYPE c,
  END OF tys_person2.

"1h
DATA ls_person2 TYPE tys_person2.

"1i

MOVE-CORRESPONDING ls_person TO ls_person2.

"1j
WRITE 'Person 2'.
NEW-LINE.
WRITE ls_person2-id.
NEW-LINE.
WRITE ls_person2-firstname.
NEW-LINE.
WRITE ls_person2-lastname.
NEW-LINE.
WRITE ls_person2-age.
NEW-LINE.
WRITE ls_person2-gender.
NEW-LINE.
