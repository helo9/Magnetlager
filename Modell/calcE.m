function y=calcE(x)
%Compute Elliptic Integral 2.Kind: E(k)
%Input Range: 0<=x<=1

dim = size(x);

for ii = 1:dim(1)
	for jj = 1:dim(2)

		y(ii,jj)=0.5*pi;
		Apara = 1;
		Bpara = 1-x(ii,jj)^2;
		ari = 1;
		geo = sqrt(Bpara);
		if(x(ii,jj)<1)
			diff=1;
			while(diff>1e-14)
				diff = abs(1-geo/ari);
				ari_neu = (ari+geo);
				geo_neu = 2*sqrt(ari*geo);
				Apara_neu = Apara+Bpara/ari;
				Bpara_neu=2*(Bpara+geo*Apara);
				ari=ari_neu;
				geo=geo_neu;
				Apara=Apara_neu;
				Bpara=Bpara_neu;
			end %while
			Apara_neu = Apara+Bpara/ari;
			y(ii,jj) = pi*Apara_neu/(4*ari);
		end%if
	end %for
	
end %for

end %function

%!test
%! # compares compelli2 Results width Table Values
%! a = [0;15;30;45;60;75;89];
%! k = sind(a);
%! E = [1.5708;1.5442;1.4675;1.3506;1.2111;1.0764;1.0008];
%! res = calcE(k);
%! assert(E,res,1e-4);