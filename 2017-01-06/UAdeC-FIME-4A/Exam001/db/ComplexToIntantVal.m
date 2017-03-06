function ValueInstant = ComplexToIntantVal( ComplexVar, Omega, Time )
%COMPLEXTOINTANTVAL Summary of this function goes here
%   Detailed explanation goes here
    ValueInstant = sqrt(2)*abs(ComplexVar)*sin(Omega*Time + angle(ComplexVar));

end

