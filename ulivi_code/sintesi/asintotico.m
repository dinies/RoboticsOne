% Autore: Stefano Panzieri
%
% [mag,phase]=asintotico(num,den,om)
% Restituisce modulo (in decibel) e fase (in radianti)
% num: coefficienti del numeratore
% den: coefficienti del denominatore
% om: vettore delle pulsazioni per le quali calcola modulo e fase

function [mag,phase]=asintotico(num,den,om)

% Numeratore

rn=roots(num);
re=real(rn);
ar=abs(re);
arn=abs(rn);
nr=length(rn);

Ign=nr+1;

if not(Ign==length(num)), error('ERR: lungh num, leading zero?'), end

% Denominatore
rd=roots(den);
red=real(rd);
ard=abs(red);
arnd=abs(rd);
nrd=length(rd);

Igd=nrd+1;

nw=length(om);
if not(Igd==length(den)), error('ERR: lungh den, leading zero?'), end

%
mag=ones(nw,1)*20*log10(1); % in decibel
phase=zeros(nw,1);


complessa=0;

for i=1:nr  % per tutte le radici del numeratore
   
   
   if rn(i)==0
     % nell'origine
     for j=1:nw
        phase(j)=phase(j)+pi/2; 
        mag(j)=mag(j)+ 20*log10(om(j)); 
     end
     Ign=Ign-1;
     
   elseif rn(i)==ar(i)
      % reali positive
         for j=1:nw
            
            if om(j)>ar(i)
               mag(j)=mag(j)+ 20*log10(om(j)/ar(i));
            end   
            
            if (om(j)> 10*ar(i))
               phase(j)=phase(j)-pi/2;
            elseif (om(j)> ar(i)/10) & (om(j)< 10*ar(i))
              	phase(j)=phase(j)-  pi/2*((log10(om(j)/ar(i)/10)+2)/2);
            end
              
         end
            
   elseif rn(i)==-ar(i)
         % reali negative
         for j=1:nw
            
            if om(j)>ar(i)
               mag(j)=mag(j)+ 20*log10(om(j)/ar(i));
            end   
            
            if (om(j)> 10*ar(i))
               phase(j)=phase(j)+pi/2;
            elseif (om(j)> ar(i)/10) & (om(j)< 10*ar(i))
              	phase(j)=phase(j)+  pi/2*((log10(om(j)/ar(i)/10)+2)/2);
            end
              
         end
         
         
         
         
   elseif re(i)==ar(i)
      % complessa positiva
      complessa=complessa+1;
      if complessa==2
         complessa=0;
         for j=1:nw
            
            if om(j)>arn(i)
               mag(j)=mag(j)+ 40*log10(om(j)/arn(i));
            end   
            
            if (om(j)> 10*arn(i))
               phase(j)=phase(j)-pi;
            elseif (om(j)> arn(i)/10) & (om(j)< 10*arn(i))
              	phase(j)=phase(j)-  pi/2*((log10(om(j)/arn(i)/10)+2));
            end
              
         end
         
      end %if complessa
      
         
   else
      % complessa negativa
      complessa=complessa+1;
      if complessa==2
         complessa=0;
         for j=1:nw
            
            if om(j)>arn(i)
               mag(j)=mag(j)+ 40*log10(om(j)/arn(i));
            end   
            
            if (om(j)> 10*arn(i))
               phase(j)=phase(j)+pi;
            elseif (om(j)> arn(i)/10) & (om(j)< 10*arn(i))
              	phase(j)=phase(j)+  pi/2*((log10(om(j)/arn(i)/10)+2));
            end
              
         end         
      end

         
   end
      
end

      
%-------------------------------------------------
for i=1:nrd  % per tutte le radici del denominatore
   

   
   if rd(i)==0
     % nell'origine
     for j=1:nw
        phase(j)=phase(j)-pi/2; 
        mag(j)=mag(j)- 20*log10(om(j)); 
     end
     Igd=Igd-1;
     
   elseif rd(i)==ard(i)
      % reali positive
         for j=1:nw
            
            if om(j)>ard(i)
               mag(j)=mag(j)- 20*log10(om(j)/ard(i));
            end   
            
            if (om(j)> 10*ard(i))
               phase(j)=phase(j)+pi/2;
            elseif (om(j)> ard(i)/10) & (om(j)< 10*ard(i))
              	phase(j)=phase(j)+  pi/2*((log10(om(j)/ard(i)/10)+2)/2);
            end
              
         end
            
   elseif rd(i)==-ard(i)
         % reali negative
         for j=1:nw
            
            if om(j)>ard(i)
               mag(j)=mag(j)- 20*log10(om(j)/ard(i));
            end   
            
            if (om(j)> 10*ard(i))
               phase(j)=phase(j)-pi/2;
            elseif (om(j)> ard(i)/10) & (om(j)< 10*ard(i))
              	phase(j)=phase(j)-  pi/2*((log10(om(j)/ard(i)/10)+2)/2);
            end
              
         end
         
         
         
         
   elseif red(i)==ard(i)
      % complessa positiva
      complessa=complessa+1;
      if complessa==2
         complessa=0;
         
         for j=1:nw
            
            if om(j)>arnd(i)
               mag(j)=mag(j)- 40*log10(om(j)/ard(i));
            end   
            
            if (om(j)> 10*arnd(i))
               phase(j)=phase(j)+pi;
            elseif (om(j)> arnd(i)/10) & (om(j)< 10*arnd(i))
              	phase(j)=phase(j)+  pi/2*((log10(om(j)/arnd(i)/10)+2));
            end
              
         end
         
      end
      
         
   else
      % complessa negativa
      complessa=complessa+1;
      if complessa==2
         complessa=0;
         
         for j=1:nw
            
            if om(j)>arnd(i)
               mag(j)=mag(j)- 40*log10(om(j)/arnd(i));
            end   
            
            if (om(j)> 10*arnd(i))
               phase(j)=phase(j)-pi;
            elseif (om(j)> arnd(i)/10) & (om(j)< 10*arnd(i))
              	phase(j)=phase(j)-  pi/2*((log10(om(j)/arnd(i)/10)+2));
            end
              
         end
         
      end

         
   end
      
end



% Guadagno

mag=mag+20*log10(num(Ign));
mag=mag-20*log10(den(Igd));


if (num(Ign)*den(Igd))<0
    phase=phase-pi;
end

phase=phase*180/pi;

if nargout==0, 
    f1=figure(1); semilogx(om,mag), grid,
    set(f1,'Position',[1 1+500 710 360]), 
    
    f2=figure(2); semilogx(om,phase), 
    set(f2,'Position',[1 1 710 360]), grid
    
end
