function res = isOctave()

	persistent oct;
	
	if( isempty(oct) )
		oct = exist('OCTAVE_VERSION', 'builtin') ~= 0;
	end %if
	
	res = oct;

end %function