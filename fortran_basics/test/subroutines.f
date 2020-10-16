C *** Here we use a subroutine to write 1000 random numbers to file 
C *** IX is the seed for the random number generator 

      program randNum
      common ix
      ix = 77777

      OPEN(UNIT=1, FILE='rand.in', STATUS='UNKNOWN')

c     do 35 k = 1, 10000
c     call random(rn1)
c  35 continue



C *** this is a do until structure 
C *** while loop in c
C *** NOTE: here rn1 is the return value not a param 
C *** can use < to mean .le.

      j = 1

    7 call random(rn1)
      j=j+1 
      WRITE(1,*) rn1
      if (j<1000) goto 7

      stop 
      end 


C *** subroutine random
C *** what is this doing? 
C ***********************

      subroutine random(rn1)
      common ix
      iy = ix * 6539
      if(iy) 5, 6, 6

C ** if(iy< 0) goto line 5
C ** if iy >= 0 goto line 6 
    
    5 iy = iy + 2147483647+1
    6 rn1 = iy
      rn1 = rn1*.4656613E-9
      ix = iy
      return
      end 

C ***********************
