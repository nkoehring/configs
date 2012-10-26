#!/usr/bin/awk -f

BEGIN {
	curpos = 5 # predefined cursor position for testing
	z = 0
	len = 0    # the current length
	arg = "hans im glueck"
	orig = arg

	#while ( z < ARGC || ( len < curpos )) {
	arg = substr(arg, curpos);
	if ( substr(arg, 1, 1) == " " ) arg = substr(arg, 2);
	curpos += index(arg, " ");
	print curpos;
	print orig;
	while ( z < curpos ) {
		printf("%d", z);
		z++;
	}
	print "\n";
}
