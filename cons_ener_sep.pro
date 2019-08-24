pro cons_ener_sep

cd, '/home/fandrieu/Simu_IPAG/pro/'
resolve_routine, 'legend'
cd, '/home/fandrieu'
plot_option=1
nb=10
nb_fi=10
rough=[0.1,0.25,0.5,0.75,1.,1.5, 2.,5., 7.5,10. ]
dzeta_list=rough*!pi/180.
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
dem=fltarr(nb, nb_fi) 
em=fltarr(nb, nb_fi)
isfi=intarr(nb, nb_fi) 
isfi2=intarr(nb, nb_fi) 
eps=5e-9
dtheta0=0.
dvv[*,*]=0.
dksi[*,*]=0.
isfi[*,*]=0
n_inc=90
sep=fltarr(n_inc)
inc=fltarr(n_inc)
sample=0.8
inc2=fltarr(n_inc,n_elements(dzeta_list))
sep2=fltarr(n_inc,n_elements(dzeta_list))
roug2=fltarr(n_inc,n_elements(dzeta_list))
for roughness=0,n_elements(dzeta_list)-1 do begin

dzeta=dzeta_list[roughness]

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

if roughness eq 0 then begin

if (plot_option eq 1) then begin
;;;;;; X ;;;;;;;;;;;;;;
window,1, xsize=1300, ysize=900
device,  decomposed=0;,set_color=256
endif else begin
;;;;;; Z ;;;;;;;;;;;;;;
set_plot, 'z'
device, set_resolution=[1300,900], SET_FONT='Times',decomposed=0, z_buffering=1, set_pixel_depth=24;,set_color=256
;;;;;;;;;;;;;;;;;;;;;;;
endelse
x=1
y=1
sx=[-x,-x,x,x]
sy=[-y,y,y,-y]
USERSYM, sx, sy, THICK=1, /FILL
LOADCT,39
erase,255
!P.BACKGROUND=255
!P.COLOR=0
!P.Font=1

endif

if roughness eq 0 then begin
plot, inc*180./!pi, sep, charsize=3, charthick=3, xtitle='Incidence angle  ('+string(176B)+ ')', thick=4, $
ytitle='Q', xthick=3, ythick=3, xtickformat='(f5.1)', ytickformat='(f5.1)', xstyle=1, $
title='Energy conservation versus incidence', xrange=[0.,95.], yrange=[0.,1.1], ystyle=1 
legend, ['!9q'+'!1 ='+string(dzeta*180./!pi, format='(f5.2)')+string(176B)], psym=[0], thick=3, pos=[250, 650],CHARTHICK=3,CHARSIZE=3,COLORS=0,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
endif else begin
oplot, inc*180./!pi, sep, thick=4, color=fix(float(roughness)/float(n_elements(dzeta_list))*255.) 
legend, ['!9q'+'!1 ='+string(dzeta*180./!pi, format='(f5.2)')+string(176B)], psym=[0], thick=3, pos=[250, 650-roughness*50],CHARTHICK=3,CHARSIZE=3, $
COLORS=fix(float(roughness)/float(n_elements(dzeta_list))*255.) , TEXTCOLORS=0, OUTLINE_COLOR=255, /device
endelse

inc2[*,roughness]=inc*180./!pi
sep2[*,roughness]=sep
roug2[*,roughness]=dzeta*180./!pi
endfor


if (plot_option ne 1) then begin
;;;;;; Z ;;;;;;;;;;;;;;
;if (dzeta*180./!pi lt 10.) then plot_file='/home/fandrieu/Inversion/Tests_model/Energy_conservation_Sep'+string(dzeta*180./!pi, format='(f3.1)')+'.png'
;if (dzeta*180./!pi ge 10.) then plot_file='/home/fandrieu/Inversion/Tests_model/Energy_conservation_Sep'+string(dzeta*180./!pi, format='(f4.1)')+'.png'
plot_file='/home/fandrieu/Inversion/Tests_model/Energy_conservation_Sep_multi_8.png'
t=tvrd(true=1)
write_png, plot_file, t
device, /close
set_plot, 'X'
;;;;;;;;;;;;;;;;;;;;;;;
endif


end 