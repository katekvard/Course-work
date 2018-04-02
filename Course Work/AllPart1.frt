( Even )
: isEven 
	dup 2 % not 
;
( Prime number )
: isPrime 
	dup 2 < if
		drop 0
	else 
		dup 2 = if
			drop 1
		else	
		isEven 1 = if 
		drop
		0
			else 
			dup dup 1 + 2 do
			r@ % 0 = if
				1 swap dup 
				else
				0 swap dup 
				then
			loop
			drop 2 do
				+
			loop 
			1 = if
				1
			else
				0
				then
			then
			then
		then
;

( Memory cell )
: memCell
	isPrime	1 cells allot dup rot swap ! 
;	


( variant 2 m" Алябьева" )
: radicall

	dup isPrime 1 = if
		else
			1 swap dup
			2 do 
				r@ isPrime 1 = if
					dup	r@ % 0 = if
						swap r@ * swap

						else
						then
				else
				then
			loop
	drop
		then
;

( copy string )
: copy-str
	dup count 
	swap 1 - swap
	1 + 0 do 
		1 + 
		over over 
		c@ swap r@ + c!
	loop heap-free 
;

( Concatenation)
: concat
	over over count swap count dup >r +
	1 + heap-alloc
	rot
	copy-str 
	dup r> +
	rot copy-str drop 
;

