--Query using a while loop  
--replicate(string, n) --> repeats a string n times  
declare @q int;  
set @q = 1;  
  while @q <= 20  
  begin  
    print replicate('* ', @q)  
    set @q += 1;  
  end; 
