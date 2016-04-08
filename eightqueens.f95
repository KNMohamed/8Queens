program eightqueens

integer :: i
logical, dimension(1:8) :: a
logical, dimension(2:16) :: b
logical, dimension(-7:7) :: c
integer, dimension(1:8) :: x
integer :: outfile

outfile = 20
open(outfile,file="8Queens.txt",status='replace',action='write')

do i = 1,8
    a(i) = .TRUE.
end do
do i = 2,16
    b(i) = .TRUE.
end do
do i = -7,7
    c(i) = .TRUE.
end do

call try(1,a,b,c,x)

close(outfile,status='keep')

end program eightqueens

recursive subroutine try(i,a,b,c,x)
integer, intent(in) :: i
logical, intent(inout), dimension(1:8) :: a
logical, intent(inout), dimension(2:16) :: b
logical, intent(inout), dimension(-7:7) :: c
integer, intent(inout), dimension(1:8) :: x
integer :: j

do j = 1,8
    if (a(j) .and. b(i+j) .and. c(i-j)) then
        x(i) = j
        a(j) = .FALSE.
        b(i+j) = .FALSE.
        c(i-j) = .FALSE.        
        if (i < 8) then
            call try(i+1,a,b,c,x)
        else
            call printOut(x,i)
        end if
        a(j) = .TRUE.
        b(i+j) = .TRUE.
        c(i-j) = .TRUE.
    end if 
end do
end subroutine try

subroutine printOut(x,i)
integer, intent(inout), dimension(1:8) :: x
integer, intent(inout) :: i

character (len = 1), dimension(1:8) :: arr
integer :: k,j
integer :: counter
save counter

if(i == 0) then
    counter = 1
end if

write(20,"(9A)", advance='no') "Solution "
write(20,"(I2)") counter
counter = counter + 1
    
do k = 1,8
    arr(x(k)) = "Q"

    do j = 1,8
        if (arr(j) == "Q") then
            write(20,"(A)", advance='no') "Q"
        else
            write(20,"(A)", advance='no') "."
        end if
    end do
    arr(x(k)) = "."
    write(20,*)
end do
write(20,*)
end subroutine printOut
