      program ifs
C *** testing how if loops work in fortran 
C *** also logical statements like and or 


      OPEN(UNIT=1, FILE='ifs.out.1', STATUS='UNKNOWN') 
      OPEN(UNIT=2, FILE='ifs.out.2', STATUS='UNKNOWN')
     
      WRITE(1,*) "write even nums and an asterisk instead of odd"

      do 7 j=1, 100
      half = real(j)/2.

C *** real is a built in function 
C *** if block 
C *** .ne. != 

      if(int(half) - half .ne. 0.) then
      WRITE(1,*) '*'
      else 
      WRITE(1,*) j
      endif 

C *** don't mix integers with reals! 
      
    7 continue 
C *** end of do loop 


C *** practice with other relational and logical ops
C *** goto statement controls execution place in code 
C *** not useful here 

      do 14 alpha=1., 1000.,10.
      if( (alpha .lt. 500.) .and. (alpha .gt. 400.)) then 
      WRITE(2,*) alpha, alpha/10.
      else if (alpha.ge.700.) then
      WRITE(2,*) alpha, alpha/10.
      else 
      goto 14 
      endif  


   14 continue 

      stop
      end
