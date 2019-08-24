pro cons_ener_sep_2

n=100
;dtheta=0.0174533
dtheta=!pi/2./float(n)
eps=1.e-6 
dzeta=0.1
theta0=45.
theta_list=float(indgen(n))/float(n)*90.
;theta_list=[30.]
phi_list=float(indgen(2*n))/float(2*n)*180.
;phi_list=[45.*!pi/180.]
muo=cos(theta0)

cons_ener=fltarr(n,2*n)
em=fltarr(n,2*n)
om=fltarr(n,2*n)
az=fltarr(n,2*n)
prob=fltarr(n,2*n)
for emergence=0,n-1 do begin
theta=theta_list[emergence]
if (abs(theta) lt eps) then theta=eps
for azimut=0,2*n-1 do begin
phi=phi_list[azimut]*!pi/180.
if (theta eq eps ) then phi=!pi/4.

;  if(theta gt dtheta/2.) then begin
;     dphi=dtheta/sin(theta*!pi/180.)
;     omegac=dtheta^2
;  endif else begin
;     dphi=2.*!pi
;     omegac=2.*!pi*(1.-cos(dtheta/2.))
;     if( omegac eq 0.) then omegac=!pi*dtheta^2/4.
;  endelse
  dphi=dtheta
  omegac=sin(theta*!pi/180.)*dtheta^2


  ; ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  ;determining the number of integration points
  nb_max=fix(dtheta/(dzeta*!pi/180.))+5;3
  nb_max=3
  nb_h=fix(float(nb_max)/2.)
  nb_max=2*nb_h+1 ;making nb_max uneven to make sure to have the central point
  if(nb_max lt 3) then nb_max=3
  ;Allocating space for the differents variables arrays
  u1=fltarr(nb_max^2)
  u2=fltarr(nb_max^2)
  x1=fltarr(nb_max^2)
  ;;Definition of integration points around emergence
  for i=1, nb_max do begin
    for j=1,nb_max do begin
      if(theta*!pi/180. ge dtheta/2.) then begin
        u1[(i-1)*nb_max+j-1]=theta*!pi/180.+float(i-nb_h-1)*dtheta/(2.*nb_h)
        if(abs(u1[(i-1)*nb_max+j-1]) lt eps) then u1[(i-1)*nb_max+j-1]=eps
        if(abs(u1[(i-1)*nb_max+j-1]-!pi/2.) lt eps) then u1[(i-1)*nb_max+j-1]=!pi/2.-eps
        phi2=phi+float(j-nb_h-1)*dphi/(2.*nb_h)
        if( phi2 ge !pi ) then begin
          u2[(i-1)*nb_max+j-1]=abs(2*!pi-phi2)
        endif else begin
          u2[(i-1)*nb_max+j-1]=abs(phi2)
        endelse
        if( abs(u2[(i-1)*nb_max+j-1]-!pi) lt eps) then u2[(i-1)*nb_max+j-1]=!pi-eps
        if( abs(u2[(i-1)*nb_max+j-1]) lt eps) then u2[(i-1)*nb_max+j-1]=eps
      endif else begin
        if(theta*!pi/180.+float(i-nb_h-1)*dtheta/(2.*nb_h) ge 0.) then begin 
          u1[(i-1)*nb_max+j-1]=theta*!pi/180.+float(i-nb_h-1)*dtheta/(2.*nb_h)
          if(abs(u1[(i-1)*nb_max+j-1]) lt eps) then u1[(i-1)*nb_max+j-1]=eps
          if(abs(u1[(i-1)*nb_max+j-1]-!pi/2.) lt eps) then u1[(i-1)*nb_max+j-1]=!pi/2.-eps
          phi2=phi+float(j-nb_h-1)*dphi/(2.*nb_h)
          if( phi2 ge !pi ) then begin
            u2[(i-1)*nb_max+j-1]=abs(2*!pi-phi2)
          endif else begin
            u2[(i-1)*nb_max+j-1]=abs(phi2)
          endelse
          if(abs(u2[(i-1)*nb_max+j-1]-!pi) lt eps) then u2[(i-1)*nb_max+j-1]=!pi-eps
          if(abs(u2[(i-1)*nb_max+j-1]) lt eps) then u2[(i-1)*nb_max+j-1]=eps
        endif else begin
          u1[(i-1)*nb_max+j-1]=abs(theta*!pi/180.+float(i-nb_h-1)*dtheta/(2.*nb_h))
          if(abs(u1[(i-1)*nb_max+j-1]) lt eps) then u1[(i-1)*nb_max+j-1]=eps
          if(abs(u1[(i-1)*nb_max+j-1]-!pi/2.) lt eps) then u1[(i-1)*nb_max+j-1]=!pi/2.-eps
          phi2=!pi-(phi+float(j-nb_h-1)*dphi/(2.*nb_h))
          if(  phi2 le 0 ) then begin
            u2[(i-1)*nb_max+j-1]=abs(phi2)
          endif else begin
      if(  phi2 ge !pi ) then begin
              u2[(i-1)*nb_max+j-1]=abs(!pi-phi2)
            endif else begin
              u2[(i-1)*nb_max+j-1]=abs(phi2)
            endelse
            if(abs(u2[(i-1)*nb_max+j-1]-!pi) lt eps) then u2[(i-1)*nb_max+j-1]=!pi-eps
            if(abs(u2[(i-1)*nb_max+j-1]) lt eps) then u2[(i-1)*nb_max+j-1]=eps
          endelse
        endelse  
      endelse
    endfor
  endfor
  

  ; resetting the estimator
  est=0.


  muo=cos(theta0*!pi/180.)
  if(abs(muo-1.) lt eps) then muo=1.-(theta0*!pi/180.)^2/2.
  mu=cos(theta*!pi/180.)
  if(abs(mu-1.) lt eps) then mu=1.-(theta*!pi/180.)^2/2.
  x1=(sin(u1))^2+1.-muo^2+2.*( sin(u1)*sqrt(1.-muo^2)*cos(u2) )

; if far from sepecular, avoid calculations
;  if(min(x1/(cos(u1)+muo)^2) gt 8.*dzeta*!pi/180.+dtheta) then begin
;     fct_reflectance_SC_spec=0.
;     return
;  endif 
 
  nerr=0
  ; cosine of the incidence angle

  ; exponent of the specular Phong model
  if(dzeta gt 45.) then dzeta=45. ; protection
;  nphong=log(0.5)/log(cos(2.*!pi/180.*dzeta))


  fct_reflectance_SC_spec=0.



;; Integration
  for i=0,nb_max^2-1 do begin




      mu=cos(u1[i])
      c_phi=cos(u2[i])
      s_phi=sin(u2[i])
      if(c_phi gt 1.) then c_phi=1.
      if(c_phi lt -1.) then c_phi=-1.
      if(c_phi eq -1.) then c_phi=-1.+(!pi-u2[i])^2/2.
      if(mu gt 1.) then mu=1.
      if(abs(mu-1.) lt eps) then mu=1.-(u1[i])^2/2.

      c_alpha=muo*mu+sqrt(1.-muo^2)*sqrt(1.-mu^2)*c_phi
      if(c_alpha gt 1.) then c_alpha=1.
      alpha=acos(c_alpha)*180./!pi
      if( x1[i] lt 0.) then x1[i]=0.

      ; Partial derivatives of x1
          ;;;;;;;;;;;;;;;;;;;;;;;;;
          ; Terms of the jacobian for the change e, psi --> v, ksi
          ; using g1(e, psi)=v, g2(e, psi)=ksi
          ;dg'N''X' is the partial derivative of gN by the var X
          ;;;;;;;;;;;;;;;;;;;;;;;;;
 
    if(abs(muo-1.) lt eps) then begin
      detjacepsi=0.5
    endif else begin
    if(abs(mu-1.) lt eps) then begin
      detjacepsi=0.
    endif else begin
      if(muo eq mu) then begin
        if(c_phi eq -1.) then begin
          detjacepsi=0.
        endif else begin
          if(c_phi eq 1.) then begin
            detjacepsi=1./4.
          endif else begin
            dx1e=2.*mu*( sqrt(1.-mu^2)+sqrt(1.-muo^2)*c_phi )
            dx1psi=-2.*sqrt(1.-mu^2)*sqrt(1.-muo^2)*s_phi
            dg1e=sqrt(x1[i])/( x1[i]+(mu+muo)^2 )*( (mu+muo)*dx1e/(2.*x1[i]) + sqrt(1.-mu^2) )
            dg1psi=(mu+muo)/( x1[i]+(mu+muo)^2 )*dx1psi/(2.*sqrt(x1[i]))
            dg2e=-1./sqrt(( 1.+c_phi^2 )*(1.-mu^2))*( mu*c_phi-$
                     ( sqrt(1.-muo^2)-sqrt(1.-mu^2)*c_phi )*dx1e/(2.*x1[i]) )
            dg2psi=1./sqrt(( 1.+c_phi^2 )*(1.-mu^2))*( sqrt(1.-mu^2)*s_phi+$
                     ( sqrt(1.-muo^2)-sqrt(1.-mu^2)*c_phi )*dx1psi/(2.*x1[i]) )
            detjacepsi=abs(dg1e*dg2psi-dg1psi*dg2e)
          endelse  
        endelse
      endif else begin       
        if(c_phi eq -1.) then begin
          dg1e=( cos(2.*u1[i])+cos(u1[i]-theta0*!pi/180.) )/( 2.*( 1.+cos(u1[i]+theta0*!pi/180.) ) )
          if(muo ge mu) then dg1e=-dg1e
          dg1psi=0.
          dg2e=0.
          ;if(abs(sqrt(1.-muo^2)-sqrt(1.-mu^2)) le eps) then begin
          ;  dg2psi=1.-1./eps
          ;endif else begin
            dg2psi=1.-sqrt(1.-muo^2)/(sqrt(1.-muo^2)-sqrt(1.-mu^2))        
          ;endif
        endif else begin
          if(c_phi eq 1.) then begin
            detjacepsi=1./4.
          endif else begin
            dx1e=2.*mu*( sqrt(1.-mu^2)+sqrt(1.-muo^2)*c_phi )
            dx1psi=-2.*sqrt(1.-mu^2)*sqrt(1.-muo^2)*s_phi
            dg1e=sqrt(x1[i])/( x1[i]+(mu+muo)^2 )*( (mu+muo)*dx1e/(2.*x1[i]) + sqrt(1.-mu^2) )
            dg1psi=(mu+muo)/( x1[i]+(mu+muo)^2 )*dx1psi/(2.*sqrt(x1[i]))
;            dg2e1=-1./sqrt( x1[i]-( sqrt(1.-muo^2)+sqrt(1.-mu^2)*c_phi )^2 )*( mu*c_phi-$
;                     ( sqrt(1.-muo^2)-sqrt(1.-mu^2)*c_phi )*dx1e/(2.*x1[i]) )
;            dg2psi2=1./sqrt( x1[i]-( sqrt(1.-muo^2)+sqrt(1.-mu^2)*c_phi )^2 )*( sqrt(1.-mu^2)*s_phi+$
;                     ( sqrt(1.-muo^2)-sqrt(1.-mu^2)*c_phi )*dx1psi/(2.*x1[i]) )
            dg2e=-1./sqrt(( 1.+c_phi^2 )*(1.-mu^2))*( mu*c_phi-$
                     ( sqrt(1.-muo^2)-sqrt(1.-mu^2)*c_phi )*dx1e/(2.*x1[i]) )
            dg2psi=1./sqrt(( 1.+c_phi^2 )*(1.-mu^2))*( sqrt(1.-mu^2)*s_phi+$
                     ( sqrt(1.-muo^2)-sqrt(1.-mu^2)*c_phi )*dx1psi/(2.*x1[i]) )
         endelse 
        endelse
      detjacepsi=abs(dg1e*dg2psi-dg1psi*dg2e)
      endelse
    endelse
    endelse
      ;if ( isnan(detjacepsi) ) detjacepsi=0.;!pi/dphi
      ;if(detjacepsi gt !pi/dphi) detjacepsi=!pi/dphi
      tgv2=x1[i]/(mu+muo)^2
   
      proba_spec=2./(!pi*tan(dzeta*!pi/180.)^2)*sqrt(tgv2)*sqrt(1+tgv2)*exp(-tgv2/(!pi*tan(dzeta*!pi/180.)^2))
;      proba_spec=2./(!pi*tan(dzeta*!pi/180.)^2)*sqrt(tgv2)*sqrt(1+tgv2)*exp(-tgv2/(!pi*tan(dzeta*!pi/180.)^2))


      rf=1. 

      reflectance_SC_spec=cos(alpha*!pi/360.)/(2.*muo*mu)*rf*proba_spec*dtheta*dphi*detjacepsi
     
    ;;;;;;;;;;;;;;;;;;;;;;;;;
    ; Integration
    if (finite(reflectance_SC_spec)) then  begin
      est=est+reflectance_SC_spec
    endif else begin
      print, 'jai mal'
      reflectance_SC_spec=0.
    endelse
;    if ((.not. isnan(reflectance_SC_spec)).and.(reflectance_SC_spec le huge(reflectance_SC_spec))) est=est+reflectance_SC_spec
;    if (( isnan(reflectance_SC_spec)) or (reflectance_SC_spec gt huge(reflectance_SC_spec))) nerr=nerr+1
;    if (( isnan(reflectance_SC_spec)) or (reflectance_SC_spec gt huge(reflectance_SC_spec))) then begin
;       x=dg2psi
;       xx=dg1psi
;       xxx=dg2e
;       xxxx=dg1e
;    endif
    ;;;;;;;;;;;;;;;;;;;;;;;;;

  endfor
;  if ( isnan(est)) est=0.
  fct_reflectance_SC_spec=est/nb_max^2/omegac ;2.*!pi*(1.-cos(dtheta/2.))=captor's solid angle
;  if (nerr gt 0) print *, nerr, 'errors for ', theta, phi, x, xx, xxx, xxxx

  ;;;;;;;;;;;;;;;;;;;;;;;;;
  ; Correction of shadowing effect
;  if (dzeta/=0.) then begin
;    call correct(theta0, theta, phi, dzeta,& 
;       &muo_a, mu_a, muo_b, mu_b)
;   fct_reflectance_SC_spec=fct_reflectance_SC_spec*&
;       &fct_S(theta0, theta, muo_a, mu_a, muo_b, mu_b, phi, dzeta)
;  endif
      ;;;;;;;;;;;;;;;;;;;;;;;;;
cons_ener[emergence,azimut]=fct_reflectance_SC_spec
em[emergence,azimut]=theta
az[emergence,azimut]=phi*180./!pi
om[emergence,azimut]=omegac
prob[emergence,azimut]=proba_spec
endfor
endfor
window,0, xsize=1300, ysize=900
device,  decomposed=0
LOADCT,39 
erase,255
!P.BACKGROUND=255
!P.COLOR=0
!P.Font=1
;dd=reform(cons_ener, n_elements(emer_x), n_elements(azim_x))
dd=cons_ener
;waz=where(dd gt 1.)
;dd[waz]=1.
;dd=alog10(1.+dd)
maxr=max(dd)
tv_polar, transpose(dd),  phi_list, theta_list, grdres=180, rot=2, colors=fix(indgen(256)/256.*256.),range=[0.,maxr,1./256.*maxr], style=2, c_thick=0, labels=lab, /noscale
COLORBAR, POSITION=[0.92, 0.05, 0.95, 0.98], format='(f5.1)', charsize=2, charthick=1, color=0, /vertical, maxrange=maxr, minrange=0.
print, total(cons_ener*cos(em*!pi/180.)*sin(em*!pi/180.))*(!pi/180.)^2/!pi*2.
print, total(cons_ener*cos(em*!pi/180.)*sin(em*!pi/180.))*dtheta*dphi/!pi*2.
end 