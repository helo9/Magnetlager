function y=calcK(x)
% Complete Elliptic Integral 1.Kind: K(k)
% Input Range: 0<=x<=1

%disp(x);

dim = size(x);

y = zeros(dim);

for ii = 1:dim(1)
	for jj = 1:dim(2)
		y(ii,jj)=1;

		if(x(ii,jj)<1)
			ari=1;
			geo = sqrt(1-x(ii,jj)^2);
			while(abs(ari-geo)>1e-15*ari)
				ari_neu=(ari+geo)/2;
				geo_neu=sqrt(ari*geo);
				ari=ari_neu;
				geo=geo_neu;
			end %while
			y(ii,jj)=pi/2/ari;
		else
			y(ii,jj) = inf;
		end %if
	end %for
end %for

end %function

%!test
%! # compares compelli1 Results with Table Values
%! a = [0;15;30;45;60;75;89];
%! k = sind(a);
%! K = [1.5708;1.5981;1.6858;1.8541;2.1565;2.7681;5.4349];
%! res = calcK(k);
%! assert(K,res,1e-4);
