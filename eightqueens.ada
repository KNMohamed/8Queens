with ada.Text_IO; use Ada.Text_IO;
with ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure eightqueens is

	type vector is array(integer range <>) of boolean;
	i : integer;
	a : vector(1..8);
	b : vector(2..16);
	c : vector(-7..7);	
	x : array(1..8) of integer;

	procedure print(x : in array(1..8) of integer)
	k : integer;	
	begin
		for k in 1 to 8 loop
			put(x(k), width => 4);
		end loop;
	end print

	procedure try(i: in integer; a : inout vector; b : inout vector; c : inout vector; x : inout array(1..8) of integer)
	j : integer;
	begin
		for j in 1 to 8 loop
			if a(j) = true and b(i+j) = true and c(i-j) = true then
				x(i) := j;
				a(j) := false;
				b(i+j) := false;
				c(i-j) := false;
				if i < 8 then
					try(i+1,a,b,c,x);
				else
					print(x);
				end if;
				a(j) := true;
				b(i+j) := true;
				c(i-j) := true;
			end if;
		end loop;
	end try;

begin
	for i in 1 .. 8 loop
		a(i) := true;
	end loop;
	for i in 2 .. 16 loop
		b(i) := true;
	end loop;
	for i in -7 .. 7 loop
		c(i) := true;
	end loop;
	try(1,a,b,c,x);
end eightqueens;
