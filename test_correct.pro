pro test_correct

dzeta=0.1*!pi/180.
theta0=40.*!pi/180.
theta=20.*!pi/180.
phi=40.*!pi/180.

xidz=1./sqrt(1.+!pi*tan(dzeta)^2)
e10=exp(-2./!pi*1./tan(dzeta)*1./tan(theta0))
e20=exp(-1./!pi*1./tan(dzeta)^2*1./tan(theta0)^2)
e1=exp(-2./!pi*1./tan(dzeta)*1./tan(theta))
e2=exp(-1./!pi*1./tan(dzeta)^2*1./tan(theta)^2)
muo=(cos(theta0)+sin(theta0)*tan(dzeta)* $
      (e20-sin(phi/2.)^2*e2) $
      /(2.-e10-(phi/!pi)*e1))*xidz

mu=(cos(theta)+sin(theta)*tan(dzeta)* $
      (cos(phi)*e20+sin(phi/2.)^2*e2) $
      /(2.-e10-(phi/!pi)*e1))*xidz

     muo_b=(cos(theta0)+sin(theta0)*tan(dzeta)* $
      e20/(2.-e10))*xidz


     mu_b=(cos(theta)+sin(theta)*tan(dzeta)* $
      e20/(2.-e10))*xidz
      
print, muo, mu, muo_b, mu_b


  if(abs(phi) eq !pi) then begin
     f=0. 
  endif else begin
     f=exp(-2.*tan(phi/2.))
  endelse

xidz=1./sqrt(1.+!pi*tan(dzeta)^2)

     fct_S=mu_b*muo_b*(1-f+f*xidz*cos(theta)/mu_b)
     fct_S=mu*cos(theta0)*xidz/fct_S
     
 print, fct_s
 
 
 end