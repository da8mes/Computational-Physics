C *** here we read a file containing random numbers and sort them
C *** using straing insertion sort (cpu expensive)

C *** some big number for dimension 
C *** see discussion of assumed-size arrays in p 77 C.G.Page

      program sorting
      
      dimension arr(100000)

      OPEN(UNIT=1, FILE='list.in', STATUS='UNKNOWN')
      OPEN(UNIT=2, FILE='list_sorted.out', STATUS='UNKNOWN')
      
      n = 0 

C *** NOTE: array indices start with 1 not 0

    7 n=n+1
      READ(1,*,END=14) arr(n)
      goto 7

   14 continue

C *** what is 14 continue doing here?
C *** the 14 is an argument for the 
C *** READ method, it is the line to excute when reading is finished 

      n = n-1
C *** n-=1 because we increment before exiting

      call piskrt(n, arr)

C *** after sorting print sorted array in a do untill loop

      WRITE(2, *) 'SROTED ARRAY:'
      do 21 j=1,n 
      WRITE(2,*) arr(j)
   21 continue 


      stop
      end  

C **************
      subroutine piskrt(n, arr)

      dimension arr(n)

      do 12 j=2,n
      a = arr(j)

      do 11 i=j-1,1,-1
      if (arr(i) < a) goto 10
      arr(i+1) = arr(i)
   11 continue 

      i = 0
   10 arr(i+1) = a 

      WRITE(*,*) arr(1), arr(2), arr(3), arr(4), arr(5), arr(6), arr(7)
  
   12 continue 
      return         
      end 
C **************



















