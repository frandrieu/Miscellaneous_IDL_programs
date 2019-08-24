pro cons_ener_sep_plot2d

cd, '/home/fandrieu/Simu_IPAG/pro/'
resolve_routine, 'legend'
cd, '/home/fandrieu'

print, systime()
plot_option=1
save_opt=0
plot_name='/home/fandrieu/Inversion/Tests_model/Energy_conservation_Sep_2d.png'
savefile='/home/fandrieu/Inversion/Tests_model/cons_sep_plot2d_0to15_1000_200.sav'
nb=50
nb_fi=20
nroug=15
n_inc=18
maxroug=15.
;rough=[0.1,0.25,0.5,0.75,1.,1.5, 2.,5., 7.5,10. ]
rough=float(indgen(nroug))/float(nroug)*(maxroug-0.1)+0.1
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
sep=fltarr(n_inc)
inc=fltarr(n_inc)
sample=0.8
inc2=fltarr(n_inc,n_elements(dzeta_list))
sep2=fltarr(n_inc,n_elements(dzeta_list))
roug2=fltarr(n_inc,n_elements(dzeta_list))
for roughness=0,n_elements(dzeta_list)-1 do begin

dzeta=dzeta_list[roughness]

for incid=0, n_inc-1 do begin

theta0=!pi/180.*float(incid)*90./float(n_inc)
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
isfi[i,j]=1

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


dj2[i,j]=detjacvfi


tgv2=((x1+sqrt(1.-muo^2))^2+y1^2)/(z1+muo)^2
vv[i,j]=atan(sqrt(tgv2))

proba_spec[i,j]=2./(!pi*tan(dzeta)^2)*sqrt(tgv2)*sqrt(1+tgv2)*exp(-tgv2/(!pi*tan(dzeta)^2)) ;a(v)


endfor
endfor

w=where(isfi eq 1)
sep[incid]=total(cos(alpha[w]*!pi/360.)*proba_spec[w]*dv[w]*dfifi[w]*dj2[w])/2./!pi/muo
endfor
inc2[*,roughness]=inc*180./!pi
sep2[*,roughness]=sep
roug2[*,roughness]=dzeta*180./!pi
endfor

if (save_opt eq 1 ) then save, inc2, roug2, sep2, filename=savefile



if (plot_option ne 0) then begin


if (plot_option eq 1) then begin
;;;;;; X ;;;;;;;;;;;;;;
window,0, xsize=1300, ysize=900
device,  decomposed=0;,set_color=256
endif else begin
;;;;;; Z ;;;;;;;;;;;;;;
set_plot, 'z'
device, set_resolution=[1300,900], SET_FONT='Times',decomposed=0, z_buffering=1, set_pixel_depth=24;,set_color=256
;;;;;;;;;;;;;;;;;;;;;;;
endelse
x=1
y=1
;factx=0.5
;facty=0.5
factx=10.
facty=10.
sx=factx*[-x,-x,x,x]
sy=facty*[-y,y,y,-y]
USERSYM, sx, sy, THICK=1, /FILL
LOADCT,39
erase,255
!P.BACKGROUND=255
!P.COLOR=0
!P.Font=1

plot, inc2, roug2, psym=3
w1=where(abs(sep2-1.) le 0.01)
w2=where(abs(sep2-1.) le 0.02 and abs(sep2-1.) gt 0.01)
w3=where(abs(sep2-1.) le 0.03 and abs(sep2-1.) gt 0.02)
w4=where(abs(sep2-1.) le 0.04 and abs(sep2-1.) gt 0.03)
w5=where(abs(sep2-1.) le 0.05 and abs(sep2-1.) gt 0.04)
w10=where(abs(sep2-1.) le 0.1 and abs(sep2-1.) gt 0.05)
wsp=where(abs(sep2-1.) gt 0.1)

for i=0,n_elements(w1)-1 do oplot, [0,inc2[w1[i]]], [0,roug2[w1[i]]], color=255, psym=8, symsize=1
for i=0,n_elements(w2)-1 do oplot, [0,inc2[w2[i]]], [0,roug2[w2[i]]], color=220, psym=8, symsize=1
for i=0,n_elements(w3)-1 do oplot, [0,inc2[w3[i]]], [0,roug2[w3[i]]], color=180, psym=8, symsize=1
for i=0,n_elements(w4)-1 do oplot, [0,inc2[w4[i]]], [0,roug2[w4[i]]], color=150, psym=8, symsize=1
for i=0,n_elements(w5)-1 do oplot, [0,inc2[w5[i]]], [0,roug2[w5[i]]], color=100., psym=8, symsize=1
for i=0,n_elements(w10)-1 do oplot, [0,inc2[w10[i]]], [0,roug2[w10[i]]], color=50., psym=8, symsize=1
for i=0,n_elements(wsp)-1 do oplot, [0,inc2[wsp[i]]], [0,roug2[wsp[i]]], color=5., psym=8, symsize=1

if (plot_option ne 1) then begin
;;;;;; Z ;;;;;;;;;;;;;;
;if (dzeta*180./!pi lt 10.) then plot_file='/home/fandrieu/Inversion/Tests_model/Energy_conservation_Sep'+string(dzeta*180./!pi, format='(f3.1)')+'.png'
;if (dzeta*180./!pi ge 10.) then plot_file='/home/fandrieu/Inversion/Tests_model/Energy_conservation_Sep'+string(dzeta*180./!pi, format='(f4.1)')+'.png'
plot_file=plot_name
t=tvrd(true=1)
write_png, plot_file, t
device, /close
set_plot, 'X'
;;;;;;;;;;;;;;;;;;;;;;;
endif

endif
;for i=0,n_elements(inc2)-1 do oplot, [0,inc2[i]], [0,roug2[i]], color=abs(sep2[i]-1.)/(max(abs(sep2-1.)))*255., psym=8, symsize=1
;print, n_elements(w1)+n_elements(w2)+n_elements(w3)+n_elements(w4)+n_elements(w5)+n_elements(w10)+n_elements(wsp)
;print, n_elements(inc2)
end 