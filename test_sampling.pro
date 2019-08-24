pro test_sampling

n=100000l
theta0=85
dzeta=indgen(n, /long)*45./n
f0=dzeta*!pi/180/(!pi/2+theta0*!pi/180)
a0=fltarr(n)

for i=0,n-1 do begin
f=f0[i]
;if f lt 0.003 then f=0.003
if f gt 0.025 then begin
pol=[ 117.609, -6128.77, 169251., -2.83140e+06, 3.04013e+07, -2.15661e+08, 1.01935e+09, -3.17079e+09, 6.22512e+09, -6.98488e+09, 3.41138e+09]
a=pol[10]*f^10+pol[9]*f^9+pol[8]*f^8+pol[7]*f^7+pol[6]*f^6+pol[5]*f^5+pol[4]*f^4+pol[3]*f^3+pol[2]*f^2+pol[1]*f^1+pol[0]
endif else begin
pol=[ 933.529, -357742., 7.30216e+07, -8.92752e+09, 6.93576e+11, -3.53252e+13, 1.19189e+15, -2.63536e+16, 3.66631e+17, -2.90849e+18, 1.00265e+19]
a=pol[10]*f^10+pol[9]*f^9+pol[8]*f^8+pol[7]*f^7+pol[6]*f^6+pol[5]*f^5+pol[4]*f^4+pol[3]*f^3+pol[2]*f^2+pol[1]*f^1+pol[0]
endelse
if f gt 0.25 then a=1.001 
if a lt 1.001 then a=1.001
if a gt 10. then a=10.
a0[i]=a

endfor
nb=100.
theta_min=double(1e-7)
alpha_e_min=double(acos( (cos(theta_min))^2+(sin(theta_min))^2*cos(2.*pi/nb) )  )
domega=2.*pi*(1e5*double(1.)-1e5*double(cos(alpha_e_min/2.)))
print, domega
ff=a0^(a0/(1-a0))
plot, dzeta, a0

oplot, a0, f0, color=150

end