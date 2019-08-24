pro test_cons_ener

nb=150
nb_fi=40
v=fltarr(nb) 
vv=fltarr(nb, nb_fi) 
vv2=fltarr(nb, nb_fi) 
dv=fltarr(nb, nb_fi) 
dvv2=fltarr(nb, nb_fi) 
u=fltarr(nb)      
az=fltarr(nb, nb_fi)
daz=fltarr(nb, nb_fi)
dj=fltarr(nb, nb_fi)
dj2=fltarr(nb, nb_fi)
be=fltarr(nb, nb_fi)
fifi=fltarr(nb, nb_fi)
dfifi=fltarr(nb, nb_fi)
dvv=fltarr(nb, nb_fi)
dksi=fltarr(nb, nb_fi)
dksi2=fltarr(nb, nb_fi)
fifilim=fltarr(nb)
ksi=fltarr(nb, nb_fi)
ksi2=fltarr(nb, nb_fi)
fi_ar=fltarr(nb_fi)
nfi_ar=fltarr(nb)
proba_spec=dblarr(nb, nb_fi)
proba_spec2=dblarr(nb, nb_fi)
alpha=dblarr(nb, nb_fi)
prodt=fltarr(nb)
pseudo_unif_prop=0.9
dzeta=0.5*!pi/180.
dem=fltarr(nb, nb_fi) 
em=fltarr(nb, nb_fi)
isfi=intarr(nb, nb_fi) 
isfi2=intarr(nb, nb_fi) 
eps=5e-6
dtheta0=0.
dvv[*,*]=0.
dksi[*,*]=0.
isfi[*,*]=0
n_inc=90
sep=fltarr(n_inc)
inc=fltarr(n_inc)
sample=0.8

for incid=0, n_inc-1 do begin

theta0=!pi/180.*float(incid)
inc[incid]=theta0
muo=cos(theta0)

;u1=randomu(seed, nb)*float(nb)
for i=0,nb-1 do v[i]=eps+float(i)*(theta0+!pi/2.-1./nb)/(nb)
;for i=0,nb-1 do v[i]=eps+u1[i]*(theta0+!pi/2.-1./nb)/(nb)
;for i=0,nb_fi-1 do fi_ar[i]=float(i+1)*2.*!pi/(nb_fi+1)
pv=1./(!pi/2.+theta0)


if (dzeta lt 10.*!pi/180.) then begin
for i=0, fix(sample*nb)-1 do v[i]=eps+float(i)*(10.*dzeta)/float(fix(sample*nb)-1)
for i=fix(sample*nb), nb-1  do v[i]=eps+10.*dzeta+float(i-fix(sample*nb))*(theta0+!pi/2.-1./nb-10.*dzeta)/((1.-sample)*nb)
endif

for i=0,nb-1 do begin

if (dzeta lt 10.*!pi/180.) then begin
if (i lt fix(sample*nb)) then begin
  pv=sample/(10.*dzeta)
endif else begin
  pv=(1.-sample)/(theta0+!pi/2.-10.*dzeta)
endelse
endif

nfi=min([fix(abs(sin(v[i])*nb_fi/2.-1))+20,fix(nb_fi/2.)])


     if((theta0 eq 0.) or (v[i] eq 0.) or (v[i] eq !pi/2.)) then begin
        prodt=2.
     endif else begin
        prodt=1./(tan(theta0)*tan(v[i]))
     endelse

filim=0.
if( prodt le 1.) then begin
filim=acos(prodt)
nfi=fix((!pi-filim)/!pi*nfi)
endif
;nfi=fix(0.5*nb)
fifilim[i]=filim 
nfi_ar[i]=2*nfi-1


for j=0, 2*(nfi-1) do begin
;if (v le theta0) then fi=!pi else fi=0.
;fi=!pi;*!pi/180.
isfi[i,j]=1
be[i,j]=v[i]
dv[i,j]=1./(pv*nb)

 if( prodt gt 1.) then begin
         fi=(2.*!pi-eps)*(j)/(2.*nfi-1)+!pi ;! azimuth angle in the specular coordinate system
         fi=fi mod (2.*!pi)
         dfi=2.*!pi/(2.*nfi-1.) ;! probability to pull out azimuth fi
 endif else begin
         ;! emergence sometimes below the horizon
         filim=acos(prodt)
         fi=(2.*(!pi-filim)-eps)*(j)/(2.*nfi-1)+filim ;! azimuth angle in the specular coordinate system
         dfi=(2.*!pi-2.*filim)/(2.*nfi-1.) ;! probability to pull out azimuth fi
 endelse
if (nfi eq 1) then begin
fi=!pi
;dfi=0.
endif 
fifi[i,j]=fi
dfifi[i,j]=dfi
    
      x1=-muo*sin(v[i])*cos(fi)-sqrt(1-muo^2)*cos(v[i])
      y1=-sin(v[i])*sin(fi)
      z1=-sqrt(1-muo^2)*sin(v[i])*cos(fi)+muo*cos(v[i])   ;z1=cos(theta_emergence) in the local coordinate (non spec) system
      theta=acos(z1)*180./!pi ; in deg : emergence angle
em[i,j]=theta
;print, theta
      mu=z1
      c_phi=x1/sqrt(x1^2+y1^2)
      s_phi=y1/sqrt(x1^2+y1^2)
      if(c_phi gt 1.) then c_phi=1.
      if(c_phi lt -1.) then c_phi=-1.
      alpha[i,j]=acos(muo*mu+sqrt(1.-muo^2)*sqrt(1.-mu^2)*c_phi)*180./!pi
      phi=acos(c_phi)
      if(s_phi lt 0.) then phi=2.*!pi-phi
  
  
  ;;;;;;;;OK;;;;;;;;;;;;;;;;
  kksi=atan(y1/(x1+sqrt(1.-muo^2)))
  if (x1+sqrt(1.-muo^2) lt 0. ) then kksi=!pi+kksi
  kksi= (kksi+2.*!pi) mod (2.*!pi)
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;
  ;;;;;;;NOT OK;;;;;;;;;;;;;;;;;
  ;kksi=acos((x1+sqrt(1.-muo))/sqrt((x1+sqrt(1.-muo))^2+y1^2))
  ;if (y1 lt 0. ) then kksi=2.*!pi-kksi
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;  if (abs(sin(kksi)) lt eps) then begin
;   tgv2=((x1+sqrt(1.-muo^2))/((z1+muo)*cos(kksi)))^2
;   vv[i,j]=atan((x1+sqrt(1.-muo^2))/((z1+muo)*cos(kksi))) 
;  endif else begin
;   tgv2=(y1/((z1+muo)*sin(kksi)))^2
;   vv[i,j]=atan(y1/((z1+muo)*sin(kksi)))
;  endelse
  ksi[i,j]=kksi*180./!pi
  
      dx1v=-muo*cos(v[i])*cos(fi)+sqrt(1-muo^2)*sin(v[i])
      dx1fi=muo*sin(v[i])*sin(fi)
      dy1v=-cos(v[i])*sin(fi)
      dy1fi=-sin(v[i])*cos(fi)
      dz1v=-sqrt(1.-muo^2)*cos(v[i])*cos(fi)-muo*sin(v[i])
      dz1fi=sqrt(1.-muo^2)*sin(v[i])*sin(fi)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
dg1beta=1./((x1+sqrt(1.-muo^2))^2+y1^2+(z1+muo)^2)*((z1+muo)/sqrt((x1+sqrt(1.-muo^2))^2+y1^2)*((x1+sqrt(1.-muo^2))*dx1v+y1*dy1v)-sqrt((x1+sqrt(1.-muo^2))^2+y1^2)*dz1v)
dg1fi=1./((x1+sqrt(1.-muo^2))^2+y1^2+(z1+muo)^2)*((z1+muo)/sqrt((x1+sqrt(1.-muo^2))^2+y1^2)*((x1+sqrt(1.-muo^2))*dx1fi+y1*dy1fi)-sqrt((x1+sqrt(1.-muo^2))^2+y1^2)*dz1fi)
;dg2beta=1./sqrt(y1^2*((x1+sqrt(1.-muo^2))^2+y1^2))*(sqrt((x1+sqrt(1.-muo^2))^2+y1^2)*dx1v-(x1+sqrt(1.-muo^2))/sqrt((x1+sqrt(1.-muo^2))^2+y1^2)*((x1+sqrt(1.-muo^2))*dx1v+y1*dy1v))
;dg2fi=1./sqrt(y1^2*((x1+sqrt(1.-muo^2))^2+y1^2))*(sqrt((x1+sqrt(1.-muo^2))^2+y1^2)*dx1fi-(x1+sqrt(1.-muo^2))/sqrt((x1+sqrt(1.-muo^2))^2+y1^2)*((x1+sqrt(1.-muo^2))*dx1fi+y1*dy1fi))
dg2beta=((x1+sqrt(1.-muo^2))*dy1v-y1*dx1v)/((x1+sqrt(1.-muo^2))^2+y1^2)
dg2fi=((x1+sqrt(1.-muo^2))*dy1fi-y1*dx1fi)/((x1+sqrt(1.-muo^2))^2+y1^2)
detjacvfi=abs(dg1beta*dg2fi-dg1fi*dg2beta)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

az[i,j]=phi*180./!pi

      dgv=1./sqrt(x1^2+y1^2)*(1.-x1^2/(x1^2+y1^2))*dx1v-x1*y1/( (x1^2+y1^2)*sqrt(x1^2+y1^2) )*dy1v
      dgfi=1./sqrt(x1^2+y1^2)*(1.-x1^2/(x1^2+y1^2))*dx1fi-x1*y1/( (x1^2+y1^2)*sqrt(x1^2+y1^2) )*dy1fi
      detjac=abs( -( sqrt(1.-muo^2)*cos(v[i])*cos(fi)+muo*sin(v[i]) )/sqrt(1.-z1^2)*dgfi/abs(s_phi) - sqrt(1.-muo^2)*sin(v[i])*sin(fi)/sqrt(1.-z1^2)*dgv/abs(s_phi)  )
      dtheta=abs(1./sqrt(1.-mu^2)*(( sqrt(1.-muo^2)*cos(v[i])*cos(fi)+muo*sin(v[i]) )*dv[i,j]-sqrt(1.-muo^2)*sin(v[i])*sin(fi)*dfi));/sqrt(real(nb_max))
      dphi=abs(-1./y1*(1.-x1^2/(x1^2+y1^2))*(dx1v*dv[i,j]+dx1fi*dfi)+x1/(x1^2+y1^2)*(dy1v*dv[i,j]+dy1fi*dfi))
      if (theta lt eps) then begin
      dtheta=dv[i,j]
      dphi=2.*!pi
      endif

dj[i,j]=detjac
dj2[i,j]=detjacvfi

;tgv2=(2-mu^2-muo^2+2.*sqrt(1-mu^2)*sqrt(1-muo^2)*c_phi)/(mu+muo)^2
tgv2=((x1+sqrt(1.-muo^2))^2+y1^2)/(z1+muo)^2
vv[i,j]=atan(sqrt(tgv2))

proba_spec[i,j]=2./(!pi*tan(dzeta)^2)*sqrt(tgv2)*sqrt(1+tgv2)*exp(-tgv2/(!pi*tan(dzeta)^2)) ;a(v)
;proba_spec[i,j]=2./(!pi*tan(dzeta)^2)*(1.+tgv2)*exp(-tgv2/(!pi*tan(dzeta)^2)) ; sans le sin(v)




  a1=(2*sqrt(1-mu^2)*muo*c_phi+2*muo*sqrt(1-muo^2)+2.*tgv2*(mu+muo)*sqrt(1-muo^2))/(mu+muo)^2

  a2=(2*sqrt(1-muo^2)*mu*c_phi+2*mu*sqrt(1-mu^2)+2.*tgv2*(mu+muo)*sqrt(1-mu^2))/(mu+muo)^2

  a3=-2*sqrt(1-muo^2)*sqrt(1-mu^2)*sqrt(1-c_phi^2)/(mu+muo)^2

dem[i,j]=dtheta
daz[i,j]=dphi
;print, dphi


     if ((c_phi+1) lt eps) then begin
        b1=0.
        b2=0.
        b3=-sqrt(1.-mu^2)*abs(sqrt(1.-muo^2)-sqrt(1.-mu^2)) ;!!MODIF
     endif else begin
        b1=-muo*sqrt(1.-mu^2)*(sqrt(1.-mu^2)*c_phi+sqrt(1.-muo^2))*(2.*sqrt(1.-muo^2)*sqrt(1.-mu^2)*c_phi+(1.-mu^2)+(1.-muo^2))^((-3.0)/2.0)*sqrt(1.-c_phi^2)

        b2=sqrt(1.-muo^2)*mu*(sqrt(1.-mu^2)*c_phi+sqrt(1.-muo^2))*(2.*sqrt(1.-muo^2)*sqrt(1.-mu^2)*c_phi+(1.-mu^2)+(1.-muo^2))^((-3.0)/2.0)*sqrt(1.-c_phi^2)

        b3=sqrt(1.-mu^2)*(2.*sqrt(1.-muo^2)*sqrt(1.-mu^2)*c_phi+(1.-mu^2)+(1.-muo^2))^((-3.0)/2.0)*(sqrt(1.-muo^2)*sqrt(1.-mu^2)*(1.-c_phi^2)+2.*sqrt(1.-muo^2)*sqrt(1.-mu^2)*c_phi^2+(1.-mu^2)*c_phi+(1.-muo^2)*c_phi)

     endelse
     
  ; calculation of  dpsi (modif 12/12/13 instead of sin(v)dpsi)
  if (((c_phi+1.) lt eps) or (abs(muo-mu) lt eps)) then begin
     cpsi=(mu+muo)/(2.*muo)
     if (theta gt theta0) then cpsi=-cpsi
  endif else begin  
     cpsi=1./(sqrt(1.-muo^2)*sqrt(tgv2))*((mu+muo)/2.*(1.+tgv2)-muo)  
  endelse
        ;sdpsi=1./sqrt(2.*(1+muo*mu-sqrt(1-muo^2)*sqrt(1-mu^2)))*b3*dphi
  dksi[i,j]=1./cpsi*(b1*dtheta0+b2*dtheta+b3*dphi);*sqrt(tgv2/(1.+tgv2)); (sin n'est plus passé dans proba_spec)
  if ((c_phi+1) lt eps) then begin
     dvv[i,j]=1./2.*abs(dtheta0-dtheta)
  endif else begin
     dvv[i,j]=1./(2.*(1.+tgv2)*sqrt(tgv2))*(a1*dtheta0+a2*dtheta+a3*dphi)
     ;dv=(a1*dtheta0+a2*dtheta+a3*dphi)
  endelse
;  kksi=acos(cpsi)
;  if (y1 lt 0. ) then kksi=2.*!pi-kksi
;  ksi[i,j]=kksi*180./!pi
  if (~finite(dksi[i,j])) then begin
;  print, theta, phi*180./!pi, vv[i,j]*180./!pi, cpsi, i, j, dvv[i,j]
  dksi[i,j]=dvv[i,j]
  endif

;for i=0,nb-1 do u[i]=float(i+1)/(nb+1)
;for i=0,nb-1 do begin
;    if(u[i] le pseudo_unif_prop) then begin
;      v[i]=(2.*dzeta*pi/180./pseudo_unif_prop)*u[i]
;      dv[i]=
;    endif else begin
;      if(u1(i-1) le pseudo_unif_prop) then ilim=i-1
;      v[i]=2.*dzeta+(pi/2+theta0*pi/180.-2*dzeta-1./nb_max)*(u1[i]-u1(ilim))/(1.-u1(ilim))
;      dv[i]=
;      ;v[i]=2.*dzeta*pi/180.+(pi/2+theta0*pi/180.-2.*dzeta*pi/180.-1./nb_max)*(u1[i]-pseudo_unif_prop)/(1.-pseudo_unif_prop)
;    endelse
;endfor


endfor
endfor

nb2=fix(nb*(!pi/2.-theta0)/2./(theta0+!pi/2.))
for i= 0, nb2-1 do begin
for j= 0, nfi_ar[i]-1 do begin
isfi2[i,j]=1
vv2[i,j]=eps+float(i)*(!pi/2.-theta0)/2./(nb2+1);!pi/2./(nb+1.);
ksi2[i,j]=eps+float(j)*2.*!pi/(nfi_ar[i]+1)
dvv2[i,j]=(!pi/2.-theta0)/2./nb2;!pi/2./nb
dksi2[i,j]=2.*!pi/nfi_ar[i]
proba_spec2[i,j]=2./(!pi*tan(dzeta)^2)*tan(vv2[i,j])*sqrt(1.+tan(vv2[i,j])^2)*exp(-tan(vv2[i,j])^2/(!pi*tan(dzeta)^2))


endfor
endfor
w=where(isfi eq 1)
sep[incid]=total(cos(alpha[w]*!pi/360.)*proba_spec[w]*dv[w]*dfifi[w]*dj2[w])/2./!pi/muo
endfor
;print, sep
;;;;;; X ;;;;;;;;;;;;;;
window,0, xsize=1300, ysize=900
device,  decomposed=0;,set_color=256
;;;;;; Z ;;;;;;;;;;;;;;
;set_plot, 'z'
;;;;;;;;;;;;;;;;;;;;;;;
x=1
y=1
sx=[-x,-x,x,x]
sy=[-y,y,y,-y]
USERSYM, sx, sy, THICK=1, /FILL


;;;;;; Z ;;;;;;;;;;;;;;
;device, set_resolution=[1300,900], SET_FONT='Times',decomposed=0, z_buffering=1, set_pixel_depth=24;,set_color=256
;;;;;;;;;;;;;;;;;;;;;;;

LOADCT,39
erase,255
!P.BACKGROUND=255
!P.COLOR=0
!P.Font=1


plot, inc*180./!pi, sep, charsize=2, charthick=2, xtitle='Incidence angle  ('+string(176B)+ ')', thick=3, $
ytitle='Er/Ei', xthick=3, ythick=3, xtickformat='(f5.1)', ytickformat='(f5.1)', xstyle=1, $
title='Energy conservation versus incidence for '+'!9q'+'!1 ='+string(dzeta*180./!pi, format='(f4.1)')+string(176B), xrange=[0.,95.], yrange=[0.,1.1], ystyle=1 



;;;;;; Z ;;;;;;;;;;;;;;
;if (dzeta*180./!pi lt 10.) then plot_file='/home/fandrieu/Inversion/Tests_model/Energy_conservation_Sep'+string(dzeta*180./!pi, format='(f3.1)')+'.png'
;if (dzeta*180./!pi ge 10.) then plot_file='/home/fandrieu/Inversion/Tests_model/Energy_conservation_Sep'+string(dzeta*180./!pi, format='(f4.1)')+'.png'
;t=tvrd(true=1)
;write_png, plot_file, t
;device, /close
;set_plot, 'X'
;;;;;;;;;;;;;;;;;;;;;;;







;proba_spec=2./(!pi*tan(dzeta)^2)*tan(v)*sqrt(1+(tan(v))^2)*exp(-(tan(v))^2/(!pi*tan(dzeta)^2)) 
;dv=!pi/2./nb
;int_proba=total(proba_spec*abs(dvv)*abs(dksi))/(2.*!pi)

;
;w=where(isfi eq 1)
;int_proba=0.
;for i=0,nb-1 do int_proba=int_proba+total(proba_spec[i,*]*sin(vv[i,*])*abs(dvv))/(2.*!pi*nfi_ar[i])
;int_proba2=total(proba_spec*sin(vv)*abs(dvv)*abs(dksi))/(2.*!pi)
;tgdzeta=0.
;;for i=0,nb-1 do tgdzeta = tgdzeta + 2./!pi*total(proba_spec[i,*]*tan(vv[i,*])*abs(dvv[i,*]))/nfi_ar[i]
;tgdzeta = tgdzeta + 2./!pi*total(proba_spec[w]*tan(vv[w])*dv[w]*dfifi[w]*dj2[w])/(2.*!pi)
;print, 'tan(dzeta) integrated, tan(dzeta) real, error (%)'
;print, tgdzeta, tan(dzeta), abs(tgdzeta-tan(dzeta))/tan(dzeta)*100.
;;print, 'int(a(v)dv) = ', int_proba, ' error (%) = ', abs(1.-int_proba)*100.
;print, 'int(proba_spec)/(2pi) = ', total(proba_spec[w]*dv[w]*dfifi[w]*dj2[w])/2./!pi, ' error (%) = ', abs(1.-total(proba_spec[w]*dv[w]*dfifi[w]*dj2[w])/2./!pi)*100.




;plot, v*180./!pi,vv*180./!pi
;plot, vv*180./!pi,proba_spec
;print,  total(sin(vv)*dv*dfifi*dj2), 2.*!pi*(1.-cos(!pi/4.))
;int=0.
;for i=0,nb-1 do int=int+1./nb*!pi/4.*2.*!pi*(!pi-fifilim[i])/!pi
;for i=0,nb-1 do if (fifilim[i] eq 0.) then int=int+1./nb*(!pi-fifilim[i])/!pi

;ww=where(vv le !pi/4.-theta0/2.)
;print,  total(dv[ww]*dfifi[ww]*dj2[ww])/( 2.*!pi*(!pi/4.-theta0/2.)), total(proba_spec[w]*dv[w]*dfifi[w]*dj2[w])/2./!pi, (!pi/4.-theta0/2.)/(!pi/4.+theta0/2.)
;print, total(proba_spec2*dvv2*dksi2)/2./!pi, total(proba_spec[w]*dv[w]*dfifi[w]*dj2[w])/2./!pi

;ww=where(vv le (!pi/2.-theta0)/2.)


;plot, vv[w]*180./!pi, ksi[w], psym=3
;for i=0,n_elements(w)-1 do oplot, [0,vv[w[i]]*180./!pi], [0,ksi[w[i]]], color=(dj2[w[i]])/max(dj2[w])*255., psym=3

;plot, em[w], az[w], psym=3
;for i=0,n_elements(w)-1 do oplot, [0,em[w[i]]], [0,az[w[i]]], color=(proba_spec[w[i]])/max(proba_spec[w])*255., psym=8, symsize=1


;print,  total(dv[ww]*dfifi[ww]*dj2[ww]), total(dvv2*dksi2), 2.*!pi*(!pi/2.-theta0)/2.

;print,  total(proba_spec[w]*dv[w]*dfifi[w]*dj2[w])/2./!pi, total(proba_spec2*dvv2*dksi2)/2./!pi

;print, 'Sep=', total(cos(alpha[w]*!pi/360.)*proba_spec[w]*dv[w]*dfifi[w]*dj2[w])/2./!pi/muo
;print, total(dv[w]*dfifi[w]*dj2[w])/(2.*!pi)/(!pi/4.)
;plot, em, proba_spec, psym=3

;plot, proba_spec

;theta0=10.*!pi/180.
;
;a=fltarr(nb)
;  mu=cos(theta)  
;  muo=cos(theta0)
;    c_phi=cos(phi)
; tgv2=(2-mu^2-muo^2+2.*sqrt(1-mu^2)*sqrt(1-muo^2)*c_phi)/(mu+muo)^2
;proba_spec=2./(pi*tan(dzeta)^2)*sqrt(tgv2)*sqrt(1+tgv2)*exp(-tgv2/(pi*tan(dzeta)^2)) 
;  a1=(2*sqrt(1-mu^2)*muo*c_phi+2*muo*sqrt(1-muo^2)+2.*tgv2*(mu+muo)*sqrt(1-muo^2))/(mu+muo)^2
;
;  a2=(2*sqrt(1-muo^2)*mu*c_phi+2*mu*sqrt(1-mu^2)+2.*tgv2*(mu+muo)*sqrt(1-mu^2))/(mu+muo)^2
;
;  a3=-2*sqrt(1-muo^2)*sqrt(1-mu^2)*sqrt(1-c_phi^2)/(mu+muo)^2
;
;
;
;
;     if ((c_phi+1) lt eps) then begin
;        b1=0.
;        b2=0.
;        b3=-sqrt(1-mu^2)*abs(sqrt(1-muo^2)-sqrt(1-mu^2)) !!MODIF
;     endif else begin 
;        b1=-muo*sqrt(1-mu^2)*(sqrt(1-mu^2)*c_phi+sqrt(1-muo^2))*&
;             & (2*sqrt(1-muo^2)*sqrt(1-mu^2)*c_phi+(1-mu^2)&
;             & +(1-muo^2))^((-3.0)/2.0)*sqrt(1-c_phi^2)
;
;        b2=sqrt(1-muo^2)*mu*(sqrt(1-mu^2)*c_phi+sqrt(1-muo^2))*&
;             & (2*sqrt(1-muo^2)*sqrt(1-mu^2)*c_phi+(1-mu^2)&
;             &  +(1-muo^2))^((-3.0)/2.0)*sqrt(1-c_phi^2)
;
;        b3=sqrt(1-mu^2)*(2*sqrt(1-muo^2)*sqrt(1-mu^2)*c_phi+&
;             & (1-mu^2)+(1-muo^2))^((-3.0)/2.0)*&
;             & (sqrt(1-muo^2)*sqrt(1-mu^2)*(1-c_phi^2)+2*&
;             & sqrt(1-muo^2)*sqrt(1-mu^2)*c_phi^2+(1-mu^2)*c_phi&
;             &   +(1-muo^2)*c_phi)
;
;     endelse
;
;  if ((c_phi+1) lt eps) then begin
;     dv=1./2.*(dtheta0-dtheta)
;  endif else begin
;     dv=1./(2.*(1+tgv2)*sqrt(tgv2))*(a1*dtheta0+a2*dtheta+a3*dphi)
;     ;dv=(a1*dtheta0+a2*dtheta+a3*dphi)
;  endelse
;
;
;  if (((c_phi+1) lt eps).and.(abs(muo-mu).lt.eps)) then begin
;     cpsi=(mu+muo)/(2.*muo)
;     if (theta gt theta0) then cpsi=-cpsi
;  endif else begin  
;     cpsi=1./(sqrt(1-muo^2)*sqrt(tgv2))*((mu+muo)/2.*(1+tgv2)-muo)  
;  endelse
;       ;sdpsi=1./sqrt(2.*(1+muo*mu-sqrt(1-muo^2)*sqrt(1-mu^2)))*b3*dphi
;  sdpsi=1./cpsi*(b1*dtheta0+b2*dtheta+b3*dphi)!*sqrt(tgv2/(1.+tgv2))! (passé dans proba_spec)
;  









end 