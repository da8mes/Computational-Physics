C *** primes

      program bruteprimes 

C *** compute all primes upto rmc 

      integer number
      OPEN(UNIT=1, FILE='primes.out', STATUS='UNKNOWN')

C      WRITE(*,*) 'ENTER UPPER LIMIT'
C      READ(*,*)rmc 
      rmc = 1E8
      do 14 number=1, rmc

      do 21 denomi=2, number-1
      if (int(number/real(denomi)) - (number/denomi) .eq. 0.) goto 14
   21 continue

      WRITE(1,*)int(number)

   14 continue

      stop
      end
