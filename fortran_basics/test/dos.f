      program test
C *** first fortran program 
C *** testing do loops

      do 7 j=1, 5
      WRITE(*,*) j
    7 continue

C *** we can open files in unix
C *** REMEMBER UNIX IS CASE-SENSITIVE
      OPEN(UNIT=1, FILE='out.txt', STATUS='UNKNOWN')

      do 14 k = 1, 100
      WRITE(1, *) k
   14 continue

C *** 7 is a statement label
C *** it has to be placed right next to last astrix
C *** it lets the do statement know which line to jump to
      stop
      end
