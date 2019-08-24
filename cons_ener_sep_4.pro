pro cons_ener_sep_4
cd, '/home/fandrieu/Simu_IPAG/pro/'
resolve_routine, 'colorbar'
resolve_routine, 'tv_polar'
cd, '/home/fandrieu'





n=90l
;dtheta=0.0174533
rapp_phi=1.
dtheta=!pi/2./float(n)
dphi=dtheta/rapp_phi
eps=1.e-10
dzeta=1.
theta0=30.
theta_list=float(indgen(n))/float(n)*90.
;theta_list=[30.]
phi_list=float(indgen(2*n*rapp_phi))/float(2*n*rapp_phi)*180.+dphi/2.*180./!pi
;phi_list=[45.*!pi/180.]


cons_ener=fltarr(2*n^2*rapp_phi)
dd=fltarr(2*n^2*rapp_phi)
em=fltarr(2*n^2*rapp_phi)
om=dblarr(2*n^2*rapp_phi)
om2=dblarr(2*n^2*rapp_phi)
az=fltarr(2*n^2*rapp_phi)
prob=fltarr(2*n^2*rapp_phi)
jac=fltarr(2*n^2*rapp_phi)
tgv=fltarr(2*n^2*rapp_phi)


  


  ;Allocating space for the differents variables arrays
  emer=fltarr(2*n^2*rapp_phi)
  azim=fltarr(2*n^2*rapp_phi)
  ;;Definition of integration points around emergence 
  for i=0, n-1 do begin
    for j=0, 2*n*rapp_phi-1 do begin
      emer[2*n*rapp_phi*i+j]=theta_list[i]
      azim[2*n*rapp_phi*i+j]=phi_list[j]
    endfor
  endfor 
  ; resetting the estimator
  est=0.

  if(dzeta gt 45.) then dzeta=45. ; protection

  ; cosine of the incidence angle
  muo=cos(theta0*!pi/180.)
  if(abs(muo-1.) lt eps) then muo=1.-(theta0*!pi/180.)^2/2.
  ;mu=cos(theta*!pi/180.)
  ;if(abs(mu-1.) lt eps) then mu=1.-(theta*!pi/180.)^2/2.
  nb_max=fix(dtheta/(dzeta*!pi/180.))+3;3
  ;nb_max=3
  nb_h=fix(float(nb_max)/2.)
  nb_max=long(2*nb_h+1) ;making nb_max uneven to make sure to have the central point
  x1=fltarr(nb_max^2)
  u1=fltarr(nb_max^2)
  u2=fltarr(nb_max^2)
  emtot=fltarr(2*n^2*rapp_phi*nb_max^2)
  aztot=fltarr(2*n^2*rapp_phi*nb_max^2)
  tgvtot=fltarr(2*n^2*rapp_phi*nb_max^2)
  probatot=fltarr(2*n^2*rapp_phi*nb_max^2)
  alphatot=fltarr(2*n^2*rapp_phi*nb_max^2)
  xtot=fltarr(2*n^2*rapp_phi*nb_max^2)
  
 sumtot=0. 
  
    for i=0,2*n^2*rapp_phi-1 do begin
  
        theta=emer[i]
        phi=azim[i]*!pi/180.

      omegacp=sin(theta*!pi/180.)*double(dtheta)*dphi
      if (omegacp eq 0.) then omegacp=2.*!pi*(1.-cos(dtheta/2.))

 x=(sin(theta*!pi/180.))^2+1.-muo^2+2.*( sin(theta*!pi/180.)*sqrt(1.-muo^2)*cos(phi) )
 ;if far from sepecular, avoid calculations
 x=0.
  if(x/(cos(theta*!pi/180.)+muo)^2 gt 5.*dzeta*!pi/180.+dtheta) then begin
     fct_reflectance_SC_spec=0.
     cons_ener[i]=fct_reflectance_SC_spec
     em[i]=emer[i]
     az[i]=azim[i]
     om[i]=omegacp
     om2[i]=omegacp
     
  endif else begin
 
  nerr=0




  fct_reflectance_SC_spec=0.



;; Integration



;  for k=1, nb_max do begin
;    for j=1,nb_max do begin
;      if(theta*!pi/180. ge dtheta/2.) then begin
;        u1[(k-1)*nb_max+j-1]=theta*!pi/180.+float(k-nb_h-1)*dtheta/(nb_max)
;        if(abs(u1[(k-1)*nb_max+j-1]) lt eps) then u1[(k-1)*nb_max+j-1]=eps
;        if(abs(u1[(k-1)*nb_max+j-1]-!pi/2.) lt eps) then u1[(k-1)*nb_max+j-1]=!pi/2.-eps
;        phi2=phi+float(j-nb_h-1)*dphi/(nb_max)
;        if( phi2 ge !pi ) then begin
;          u2[(k-1)*nb_max+j-1]=abs(2*!pi-phi2)
;        endif else begin
;          u2[(k-1)*nb_max+j-1]=abs(phi2)
;        endelse
;        if( abs(u2[(k-1)*nb_max+j-1]-!pi) lt eps) then u2[(k-1)*nb_max+j-1]=!pi-eps
;        if( abs(u2[(k-1)*nb_max+j-1]) lt eps) then u2[(k-1)*nb_max+j-1]=eps
;      endif else begin
;        if(theta*!pi/180.+float(k-nb_h-1)*dtheta/(nb_max) ge 0.) then begin 
;          u1[(k-1)*nb_max+j-1]=theta*!pi/180.+float(k-nb_h-1)*dtheta/(nb_max)
;          if(abs(u1[(k-1)*nb_max+j-1]) lt eps) then u1[(k-1)*nb_max+j-1]=eps
;          if(abs(u1[(k-1)*nb_max+j-1]-!pi/2.) lt eps) then u1[(k-1)*nb_max+j-1]=!pi/2.-eps
;          phi2=phi+float(j-nb_h-1)*dphi/(nb_max)
;          if( phi2 ge !pi ) then begin
;            u2[(k-1)*nb_max+j-1]=abs(2*!pi-phi2)
;          endif else begin
;            u2[(k-1)*nb_max+j-1]=abs(phi2)
;          endelse
;          if(abs(u2[(k-1)*nb_max+j-1]-!pi) lt eps) then u2[(k-1)*nb_max+j-1]=!pi-eps
;          if(abs(u2[(k-1)*nb_max+j-1]) lt eps) then u2[(k-1)*nb_max+j-1]=eps
;        endif else begin
;          u1[(k-1)*nb_max+j-1]=abs(theta*!pi/180.+float(k-nb_h-1)*dtheta/(nb_max))
;          if(abs(u1[(k-1)*nb_max+j-1]) lt eps) then u1[(k-1)*nb_max+j-1]=eps
;          if(abs(u1[(k-1)*nb_max+j-1]-!pi/2.) lt eps) then u1[(k-1)*nb_max+j-1]=!pi/2.-eps
;          phi2=!pi-(phi+float(j-nb_h-1)*dphi/(nb_max))
;          if(  phi2 le 0 ) then begin
;            u2[(k-1)*nb_max+j-1]=abs(phi2)
;          endif else begin
;      if(  phi2 ge !pi ) then begin
;              u2[(k-1)*nb_max+j-1]=abs(!pi-phi2)
;            endif else begin
;              u2[(k-1)*nb_max+j-1]=abs(phi2)
;            endelse
;            if(abs(u2[(k-1)*nb_max+j-1]-!pi) lt eps) then u2[(k-1)*nb_max+j-1]=!pi-eps
;            if(abs(u2[(k-1)*nb_max+j-1]) lt eps) then u2[(k-1)*nb_max+j-1]=eps
;          endelse
;        endelse  
;      endelse
;    endfor
;  endfor
;  

  for k=1, nb_max do begin
    for j=1,nb_max do begin
      theta2=abs(theta*!pi/180.+float(k-nb_h-1)*dtheta/(nb_max))
      if(theta2 gt !pi/2.) then begin
        u1[(k-1)*nb_max+j-1]=!pi-theta2
      endif else begin
        u1[(k-1)*nb_max+j-1]=theta2
      endelse
      phi2=abs(phi+float(j-nb_h-1)*dphi/(nb_max))
      if(phi2 gt !pi) then begin
        u2[(k-1)*nb_max+j-1]=2.*!pi-phi2
      endif else begin
        u2[(k-1)*nb_max+j-1]=phi2
      endelse     
    endfor
  endfor

  x1=(sin(double(u1)))^2+1.-muo^2+2.*( sin(u1)*sqrt(1.-muo^2)*cos(u2) )

      est=0.
      est_omegac=0.
  for k=0,nb_max^2-1 do begin 
  x1[k]=(sin(double(u1[k])))^2+1.-muo^2+2.*( sin(u1[k])*sqrt(1.-muo^2)*cos(u2[k]) )
      omegac=sin(u1[k])*double(dtheta)*dphi/nb_max^2
      if (omegac eq 0.) then omegac=2.*!pi*(1.-cos(dtheta/2./nb_max))
      ;if (omegac eq 0.) then omegac=omegacp/nb_max^2
      ;omegac=omegacp/nb_max^2
      mu=double(cos(u1[k]))
      c_phi=cos(u2[k])
      s_phi=sin(u2[k])
      if(c_phi gt 1.) then c_phi=1.
      if(c_phi lt -1.) then c_phi=-1.
      if(c_phi eq -1.) then c_phi=-1.+(!pi-u2[k])^2/2.
      if(mu gt 1.) then mu=1.
      if(abs(mu-1.) lt eps) then mu=1.-(u1[k])^2/2.
      if(mu eq 1.) then mu=1.-eps
      c_alpha=muo*mu+sqrt(1.-muo^2)*sqrt(1.-mu^2)*c_phi
      if(c_alpha gt 1.) then c_alpha=1.
      alpha=acos(c_alpha)*180./!pi
      if( x1[k] lt 0.) then x1[k]=0. ;protection
            
    if(abs(muo-1.) lt eps) then begin
      detjacepsi=0.5
    endif else begin
    if(abs(mu-1.) lt eps) then begin
      detjacepsi=0.
    endif else begin
      if(muo eq mu) then begin
        if(c_phi eq -1.) then begin
          detjacepsi=0.5;1./eps
        endif else begin
          if(c_phi eq 1.) then begin
            detjacepsi=0.5
          endif else begin
            dx1e=2.*mu*( sqrt(1.-mu^2)+sqrt(1.-muo^2)*c_phi )
            dx1psi=-2.*sqrt(1.-mu^2)*sqrt(1.-muo^2)*s_phi
            dg1e=sqrt(x1[k])/( x1[k]+(mu+muo)^2 )*( (mu+muo)*dx1e/(2.*x1[k]) + sqrt(1.-mu^2) )
            dg1psi=(mu+muo)/( x1[k]+(mu+muo)^2 )*dx1psi/(2.*sqrt(x1[k]))
            dg2e=-1./sqrt(( 1.-c_phi^2 )*(1.-mu^2))*( mu*c_phi-$
                     ( sqrt(1.-muo^2)+sqrt(1.-mu^2)*c_phi )*dx1e/(2.*x1[k]) )
            dg2psi=1./sqrt(( 1.-c_phi^2 )*(1.-mu^2))*( sqrt(1.-mu^2)*s_phi+$
                     ( sqrt(1.-muo^2)+sqrt(1.-mu^2)*c_phi )*dx1psi/(2.*x1[k]) )
            detjacepsi=abs(dg1e*dg2psi-dg1psi*dg2e)
          endelse  
        endelse
      endif else begin       
        if(c_phi eq -1.) then begin
          dg1e=( cos(2.*u1[k])+cos(u1[k]-theta0*!pi/180.) )/( 2.*( 1.+cos(u1[k]+theta0*!pi/180.) ) )
          if(muo ge mu) then dg1e=-dg1e
          dg1psi=0.
          dg2e=0.
          ;if(abs(sqrt(1.-muo^2)-sqrt(1.-mu^2)) le eps) then begin
          ;  dg2psi=1.-1./eps
          ;endif else begin
            dg2psi=1.-sqrt(1.-muo^2)/(sqrt(1.-muo^2)-sqrt(1.-mu^2))        
          ;endif
           detjacepsi=abs(dg1e*dg2psi-dg1psi*dg2e)
        endif else begin
          if(c_phi eq 1.) then begin
            detjacepsi=0.5
          endif else begin
            dx1e=2.*mu*( sqrt(1.-mu^2)+sqrt(1.-muo^2)*c_phi )
            dx1psi=-2.*sqrt(1.-mu^2)*sqrt(1.-muo^2)*s_phi
            dg1e=sqrt(x1[k])/( x1[k]+(mu+muo)^2 )*( (mu+muo)*dx1e/(2.*x1[k]) + sqrt(1.-mu^2) )
            dg1psi=(mu+muo)/( x1[k]+(mu+muo)^2 )*dx1psi/(2.*sqrt(x1[k]))
;            dg2e1=-1./sqrt( x1[k]-( sqrt(1.-muo^2)+sqrt(1.-mu^2)*c_phi )^2 )*( mu*c_phi-$
;                     ( sqrt(1.-muo^2)-sqrt(1.-mu^2)*c_phi )*dx1e/(2.*x1[k]) )
;            dg2psi2=1./sqrt( x1[k]-( sqrt(1.-muo^2)+sqrt(1.-mu^2)*c_phi )^2 )*( sqrt(1.-mu^2)*s_phi+$
;                     ( sqrt(1.-muo^2)-sqrt(1.-mu^2)*c_phi )*dx1psi/(2.*x1[k]) )
            dg2e=-1./sqrt(( 1.-c_phi^2 )*(1.-mu^2))*( mu*c_phi-$
                     ( sqrt(1.-muo^2)+sqrt(1.-mu^2)*c_phi )*dx1e/(2.*x1[k]) )
            dg2psi=1./sqrt(( 1.-c_phi^2 )*(1.-mu^2))*( sqrt(1.-mu^2)*s_phi+$
                     ( sqrt(1.-muo^2)+sqrt(1.-mu^2)*c_phi )*dx1psi/(2.*x1[k]) )
            detjacepsi=abs(dg1e*dg2psi-dg1psi*dg2e)
         endelse 
        endelse

      endelse
    endelse
    endelse
      ;if ( isnan(detjacepsi) ) detjacepsi=0.;!pi/dphi
      ;if(detjacepsi gt !pi) then detjacepsi=!pi
      ;if(cos(phi) eq -1.) then detjacepsi=0.5*detjacepsi
      tgv2=x1[k]/(mu+muo)^2
   
      proba_spec=2./(!pi*tan(dzeta*!pi/180.)^2)*sqrt(tgv2)*sqrt(1+tgv2)*exp(-tgv2/(!pi*tan(dzeta*!pi/180.)^2))
;      proba_spec=2./(!pi*tan(dzeta*!pi/180.)^2)*sqrt(tgv2)*sqrt(1+tgv2)*exp(-tgv2/(!pi*tan(dzeta*!pi/180.)^2))


      rf=1. 

      reflectance_SC_spec=cos(alpha*!pi/360.)/(2.*muo*mu)*rf*proba_spec*dtheta*dphi*detjacepsi/nb_max^2
      ;reflectance_SC_spec=cos(alpha*!pi/360.)/(2.*muo)*rf*proba_spec*dtheta*dphi*detjacepsi/nb_max^2

     
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
;     fct_reflectance_SC_spec=est/2*float(n^2)/omegac
est_omegac=est_omegac+omegac
tgvtot[nb_max^2*i+k]=tgv2
alphatot[nb_max^2*i+k]=alpha
probatot[nb_max^2*i+k]=proba_spec
sumtot=sumtot+reflectance_SC_spec
  endfor
emtot[nb_max^2*i:nb_max^2*(i+1)-1]=u1
aztot[nb_max^2*i:nb_max^2*(i+1)-1]=u2
xtot[nb_max^2*i:nb_max^2*(i+1)-1]=x1
;if (theta gt 0.) then begin
;  fct_reflectance_SC_spec=est/(sin(theta)*dtheta*dphi) 
;endif else begin
;  fct_reflectance_SC_spec=est/(2.*!pi*(1.-cos(dtheta/2.))) 
;endelse
fct_reflectance_SC_spec=est/omegacp;
cons_ener[i]=fct_reflectance_SC_spec
em[i]=emer[i]
az[i]=azim[i]
om[i]=est_omegac
om2[i]=omegacp
  endelse ;;fin du "if far from specular"
;prob[i]=est_proba_spec
;jac[i]=est_detjacepsi
;tgv[i]=tgv2
  endfor
;  if ( isnan(est)) est=0.
  ;2.*!pi*(1.-cos(dtheta/2.))=captor's solid angle
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
      
;dd=atan(sqrt(tgv))*180./!pi
dd=cons_ener*cos(em*!pi/180.)*sin(em*!pi/180.)*dtheta*dphi;/!pi*2.
;dd=cons_ener*om2;cos(em*!pi/180.)*om2/!pi*2.
;dd=cons_ener/!pi*2.
;dd=jac*prob
;print, total(cons_ener*cos(em*!pi/180.)*om2/!pi*2.)
print, total(dd)/!pi*2.;*cos(em*!pi/180.)/!pi*2.)
range=[min(dd), max(dd)]     
;nsym=4
;x=1.67
;y=0.48
;factx=0.6*100./float(n)
;facty=0.6*100./float(n)
;sx=factx*[-x,-x,x,x]
;sy=facty*[-y,y,y,-y]
;USERSYM, sx, sy, THICK=1, /FILL
;window,0, xsize=1300, ysize=900
;!P.BACKGROUND=255
;!P.COLOR=0
;!P.Font=1
;
;plot, em, az, psym=3,POSITION=[0.17, 0.1, 0.95, 0.75], xrange=[0.,90],xstyle=1, yrange=[0.,180],ystyle=1
;for i=0,n_elements(em)-1 do oplot, [0.,em[i]], [0.,az[i]], psym=8, symsize=1, color=fix(dd[i]/max(dd)*256)
;COLORBAR, POSITION=[0.17, 0.85, 0.95, 0.90] , TITLE='', maxrange=max(range), minrange=min(range), format='(f9.2)', charsize=2, charthick=1

dd2=fltarr(n,2*n*rapp_phi)
  for i=0, n-1 do begin
    for j=0, 2*n*rapp_phi-1 do begin
      dd2[i,j]=dd[2*n*rapp_phi*i+j]
    endfor
  endfor 

window,0, xsize=1300, ysize=900
device,  decomposed=0
LOADCT,39 
erase,255
!P.BACKGROUND=255
!P.COLOR=0
!P.Font=1

;dd=cons_ener
;dd=reform(dd, n_elements(theta_list), n_elements(phi_list))
;waz=where(dd gt 1.)
;dd[waz]=1.
;dd=alog10(1.+dd)
maxr=max(dd2)
tv_polar, transpose(dd2),  phi_list, theta_list, grdres=1000, rot=2, colors=fix(indgen(256)/256.*256.),range=[0.,maxr,1./256.*maxr], style=2, c_thick=0, labels=lab, /noscale
COLORBAR, POSITION=[0.92, 0.05, 0.95, 0.98], format='(f9.3)', charsize=2, charthick=1, color=0, /vertical, maxrange=maxr, minrange=0.


;print, total(cons_ener*cos(em*!pi/180.)*sin(em*!pi/180.))*dtheta*dphi/!pi*2., total(cons_ener*cos(em*!pi/180.)*om)/!pi*2.

;print, total(dd)
;print, total(cons_ener*cos(em*!pi/180.)*sin(em*!pi/180.))*(!pi/180.)^2/!pi*2.
end 