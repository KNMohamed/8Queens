with ada.Text_IO; use Ada.Text_IO;
with ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure eightqueens is

	type vector is array(integer range <>) of boolean;
	type arr is array(positive range <>) of integer;
	outfp : file_type;
	a : vector(1..8);
	b : vector(2..16);
	c : vector(-7..7);	
	x : arr(1..8);
	count : integer;

	procedure print(x : in arr) is
	begin
		eightqueens.count := eightqueens.count + 1;
		put("Solution #: ");
		put_line(integer'image(eightqueens.count));
		for k in 1 .. 8 loop
			for j in 1..8 loop
				if j = x(k) then
					put('Q');
				else
					put('.');
				end if;
			end loop;
			new_line;
		end loop;
		new_line;
	end print;

	procedure try(i: in integer; a : in out vector; b : in out vector; c : in out vector; x : in out arr) is
	begin
		for j in 1 .. 8 loop
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
	create(outfp, out_file, "8Queens.txt");
	set_output(outfp);
	count := 1;
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
	if is_open(outfp) then
		close(outfp);
	end if;
end eightqueens;
