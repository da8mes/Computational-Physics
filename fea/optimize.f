c *** FIND OPTIMAL RAMP TIME

      PROGRAM OPTIMIZE

c *** optimal ramp time is in [1, 20] hrs
c *** we scan this by 0.1 hours and find 
c *** optimal ramp time 

c *** setting delta x = delta y = 1 cm 
c *** for convergence delta t <= 125 s
      REAL, DIMENSION (9,9,50000) :: u = 0.0
      INTEGER t, s, valid
      REAL d, gradt

      OPEN (UNIT=1, FILE='opt11.out', STATUS='UNKNOWN')
      
      d = 0.002
      valid = 1
      best_rtime = 20
      scan_steps = INT(19/0.1)

      do s=1,scan_steps

      rtime = 20 - s*0.1
c *** check if rtime satisfies condition that < 1 degree
     
c *** want to ramp from 0 - 15 degrees celcius
      rspeed = 15. / (rtime * 3600)
c *** delta t in s
      step = 100.
      tot_steps = INT((rtime * 3600)/step)

c *** time evolution where t-1 is the present state
c *** t = 1 is initial time
      do t=2,tot_steps

c *** update boundary temp via rspeed 
      u(1,:,t) = rspeed*step*(t-1) 
      u(9,:,t) = rspeed*step*(t-1) 
      u(:,1,t) = rspeed*step*(t-1) 
      u(:,9,t) = rspeed*step*(t-1)

c *** time evolve the interior temp value
      do i= 2,8
      do j= 2,8
 
      delta = u(i-1,j,t-1) + u(i, j-1,t-1)
      delta = delta + u(i+1,j,t-1) + u(i, j+1, t-1)
      delta = delta - 4*u(i,j,t-1)
 
      u(i,j,t) = u(i,j,t-1) + d*step*delta
 
      end do
      end do

c *** find max gradient at current time
c *** curr time in seconds is step * (t - 1)      

      gradt = MAXVAL(u(:,:,t)) - MINVAL(u(:,:,t))

      if (rtime .eq. 11.) then 
c      WRITE(*,*) rspeed
      WRITE(1,*) step*(t-1), gradt
      end if

      if (gradt .GE. 1.) then
c      WRITE(*,*) rtime
      GOTO 17
      end if

      end do 

c *** finish with rtime 
      best_rtime = rtime

   17 continue
c *** reset before trying the next rtime
      u = 0.0
      end do 

      WRITE(*,*)"BEST RTIME[hrs]: ", best_rtime
      STOP
      END
