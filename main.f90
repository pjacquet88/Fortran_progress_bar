program main
  use m_progress_bar

  implicit none

  integer,parameter :: i_max=15
  integer           :: i_current

  print*,'The objective is to test the progress bar fortran subroutine :'
  print*,' '

  do i_current=1,i_max
     call sleep(1)
     call progress_bar(i_current,i_max)
  end do
  
  print*,' '
  print*,'Let us try it with the optional parameters :'
  print*,' '
  
  do i_current=1,i_max
     call sleep(1)
     call progress_bar(i_current,i_max,o_bar_char='%',o_bar_length=25)
  end do

  print*,' '
  print*,' '
  print*,'Thank you for using this progress bar fortran subroutine !'
  print*,'Pierre Jacquet : pierre.jac.23@gmail.com'

end program main
