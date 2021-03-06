c *** Finite Element Analysis 

      PROGRAM FEA

c *** setting delta x = delta y = 1 cm 
c *** for convergence delta t <= 125 s
      REAL, DIMENSION (90,90,80000) :: u = 0.0
      INTEGER t
      REAL d, gradt

      OPEN (UNIT=1, FILE='output.out', STATUS='UNKNOWN')
c *** in cm^2/s
      d = 0.002 

c *** want to ramp from 0 - 15 degrees celcius
c *** total_t is time in hours to ramp full range
      total_t = 20
      rspeed = 15. / (total_t * 3600)
c      WRITE(*,*) rspeed
      WRITE(1,*) "total time [hrs]: ", total_t 
c *** delta t in s
      step = 1.
      tot_steps = INT((total_t * 3600)/step)

c *** time evolution where t-1 is the present state
c *** t = 1 is initial time
      do t=2,tot_steps

c *** update boundary temp via rspeed 
      u(1,:,t) = rspeed*step*(t-1) 
      u(90,:,t) = rspeed*step*(t-1) 
      u(:,1,t) = rspeed*step*(t-1) 
      u(:,90,t) = rspeed*step*(t-1)

c *** time evolve the interior temp value
      do i= 2,89
      do j= 2,89
 
      delta = u(i-1,j,t-1) + u(i, j-1,t-1)
      delta = delta + u(i+1,j,t-1) + u(i, j+1, t-1)
      delta = delta - 4*u(i,j,t-1)
 
      u(i,j,t) = u(i,j,t-1) + 100*d*step*delta

c      WRITE(*,*)i,j 
      end do
      end do

c *** find max gradient at current time
c *** curr time in seconds is step * (t - 1)      
      gradt = MAXVAL(u(:,:,t)) - MINVAL(u(:,:,t))        
      WRITE(1,*) step*(t-1), gradt        
      end do 

      STOP
      END
