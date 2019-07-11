module m_progress_bar
  implicit none

contains

  subroutine progress_bar(iter,max_iter,o_bar_char,o_bar_length)
    implicit none
    integer,intent(in) :: iter     ! current iteration
    integer,intent(in) :: max_iter ! final iteration

    character,optional :: o_bar_char   ! optional for bar loading character
    integer  ,optional :: o_bar_length ! optional for progress bar length

    character,parameter :: default_bar_char='#'  ! default value for bar_char
    integer  ,parameter :: default_bar_length=50 ! default value for bar_length

    integer                            :: bar_length
    integer                            :: table_length
    character,dimension(:),allocatable :: table
    character                          :: bar_char
    character(len=30)                  :: fmt

    integer :: fraction,pourcentage,i

    if(present(o_bar_char)) then
       bar_char=o_bar_char
    else
       bar_char=default_bar_char
    end if

    if (present(o_bar_length)) then
       bar_length=o_bar_length
       table_length=bar_length+4
    else
       bar_length=default_bar_length
       table_length=bar_length+4
    end if

    allocate(table(table_length))

    fraction=floor(real(iter*bar_length/max_iter))
    pourcentage=floor(iter*100.0/max_iter)

    table(1)='['
    do i=2,fraction+1
       table(i)=bar_char
    end do
    do i=fraction+2,bar_length+1
       table(i)=' '
    end do
    table(bar_length+2)=']'
    table(bar_length+3)='-'
    table(bar_length+4)='['

    ! NB : write can't read and flush a string, we need a table of character
    write(fmt,"(a,i0,a)") "(1a1,(a,i0,a,i0,a,",table_length,"a,i0,a),$)"
    write(*,fmt)  char(13),'Iteration ',iter,'/',max_iter,' ',table,pourcentage,'%]'

    deallocate(table)

    if (iter.eq.max_iter) then
       write(*,*)
    end if

  end subroutine progress_bar

end module m_progress_bar
