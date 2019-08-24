function vraissemblance_ln_mat, d, dd, invertC, npix ; pour 1 spectre observé d, plusieurs spectre de la base de donnee dd
;L=dblarr(npix)
d2=fltarr(npix, n_elements(d))
for i=0,n_elements(d)-1 do d2[*,i]=replicate(d[i], npix)
mat1 = invertC ## (dd-d2) 
dif=dd-d2 
;for i=0,npix-1 do begin
;diff=dif[i,*]
;line=mat1[i,*]
;L[i]=-0.5* transpose(diff)  ## line
;endfor
L=-0.5*total(dif*mat1,2)
return, L
end
function vraissemblance_ln_vec, d, dd, invertC, npix ; pour 1 spectre observé d, plusieurs spectre de la base de donnee dd
L=dblarr(npix)
d2=fltarr(npix, n_elements(d))
for i=0,npix-1 do begin
dif=dd[i,*]-d 
L[i]=-0.5*total(invertc*dif^2)
endfor
return, L
end



function convert_phi_alpha, theta0, theta, phi

  mu=cos(!pi*theta/180.)        ;   cosinus of theta
  muo=cos(!pi*theta0/180.)      ;   cosinus of theta0 
  c_phi=cos(!pi*phi/180.)       ;   cosinus of the azimuth angle

; scattering angle (rad)
  if((muo EQ mu) AND (phi EQ 0.)) then alpha=!pi else $
     alpha=acos(-muo*mu-sqrt(1-muo^2)*sqrt(1-mu^2)*c_phi)

; phase angle (deg)
  return,(!pi-alpha)/!pi*180.
  


end


pro invers_spectres_IPAG_4
plot_option=0 ; 0=X ; 1=Z
;marginal_densities=1
;incidence=60.
;emergence=20.
;azimut=90.
errfact=1.
sigma=0.0004;0.0025
sigma2=0.0001
wavelength=1.1
waves=[1.,1.,1.]
;n=30

thick_1e=1.42
sigma_1e=0.27
thick_3e=7.45
sigma_3e=0.42
thick_6e=12.51
sigma_6e=1.35
thick=[1.42,7.45,12.51]
err=2.*[0.27,0.42,1.35]
names=['Sample 1','Sample 2','Sample 3']


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
cd, '/home/fandrieu/Simu_IPAG/pro/'
resolve_routine, 'colorbar'
resolve_routine, 'legend'
resolve_routine, 'tv_plot'
resolve_routine, 'errorplot';, /is_function
cd, '/home/fandrieu'



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
plot_fit_1='/home/fandrieu/Inversion/Spectres_eau_IPAG/Valid_results/rough_0.42/fit_glace1e.png'
plot_fit_2='/home/fandrieu/Inversion/Spectres_eau_IPAG/Valid_results/rough_0.42/fit_glace3e.png'
plot_fit_3='/home/fandrieu/Inversion/Spectres_eau_IPAG/Valid_results/rough_0.42/fit_glace6e.png'
plot_err_1='/home/fandrieu/Inversion/Spectres_eau_IPAG/Valid_results/rough_0.42/plot_diffs_glace1e.png'
plot_err_2='/home/fandrieu/Inversion/Spectres_eau_IPAG/Valid_results/rough_0.42/plot_diffs_glace3e.png'
plot_err_3='/home/fandrieu/Inversion/Spectres_eau_IPAG/Valid_results/rough_0.42/plot_diffs_glace6e.png'
plot_par_1='/home/fandrieu/Inversion/Spectres_eau_IPAG/Valid_results/rough_0.42/plot_grain_glace1e.png'
plot_par_2='/home/fandrieu/Inversion/Spectres_eau_IPAG/Valid_results/rough_0.42/plot_grain_glace3e.png'
plot_par_3='/home/fandrieu/Inversion/Spectres_eau_IPAG/Valid_results/rough_0.42/plot_grain_glace6e.png'
plot_par_1b='/home/fandrieu/Inversion/Spectres_eau_IPAG/Valid_results/rough_0.42/plot_h_glace1e.png'
plot_par_2b='/home/fandrieu/Inversion/Spectres_eau_IPAG/Valid_results/rough_0.42/plot_h_glace3e.png'
plot_par_3b='/home/fandrieu/Inversion/Spectres_eau_IPAG/Valid_results/rough_0.42/plot_h_glace6e.png'
plot_par_123='/home/fandrieu/Inversion/Spectres_eau_IPAG/Valid_results/rough_0.42/plot_grain_glace1e3e6e.png'
plot_par_123b='/home/fandrieu/Inversion/Spectres_eau_IPAG/Valid_results/rough_0.42/plot_h_glace1e3e6e.png'
plot_fit_123='/home/fandrieu/Inversion/Spectres_eau_IPAG/Valid_results/rough_0.42/fit_glace1e3e6e.png'
plot_err_123='/home/fandrieu/Inversion/Spectres_eau_IPAG/Valid_results/rough_0.42/plot_diffs_glace1e3e6e.png'
plot_fit_err_1='/home/fandrieu/Inversion/Spectres_eau_IPAG/Valid_results/rough_0.42/fit_and_diff_glace1e.png'
plot_fit_err_2='/home/fandrieu/Inversion/Spectres_eau_IPAG/Valid_results/rough_0.42/fit_and_diff_glace3e.png'
plot_fit_err_3='/home/fandrieu/Inversion/Spectres_eau_IPAG/Valid_results/rough_0.42/fit_and_diff_glace6e.png'
plot_par_2d_1='/home/fandrieu/Inversion/Spectres_eau_IPAG/Valid_results/rough_0.42/plot_L_2d_glace1e.png'
plot_par_2d_2='/home/fandrieu/Inversion/Spectres_eau_IPAG/Valid_results/rough_0.42/plot_L_2d_glace3e.png'
plot_par_2d_3='/home/fandrieu/Inversion/Spectres_eau_IPAG/Valid_results/rough_0.42/plot_L_2d_glace6e.png'
plot_inv_res='/home/fandrieu/Inversion/Spectres_eau_IPAG/Valid_results/rough_0.42/Inversion_final_result.png'
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
restore, '/home/fandrieu/Inversion/Spectres_eau_IPAG/data_neige_slab_136e.sav'
sg=size(param_cub_data1)
sps=size(param_cub_simu)
a=param_cub_simu[0,*,sps[3]-1]
h_slab_mod=a[uniq(a,sort(a))]
s_h = n_elements(h_slab_mod)
h_x=h_slab_mod
a=param_cub_simu[0,*,sps[3]-2]
g_mod=a[uniq(a,sort(a))]
s_g = n_elements(g_mod)
g_x=g_mod
lh1=fltarr(sg[1], s_h)
lg1=fltarr(sg[1], s_g)
h1=fltarr(sg[1])
g1=fltarr(sg[1])
sig_h1=fltarr(sg[1])
sig_g1=fltarr(sg[1])
n_waves=n_elements(wavelengths)
tutu=systime(1)

wavelength=waves[0]
wawa=where(abs(wavelength-wavelengths) lt 0.005)
n=wawa[0]
if(n eq -1) then n=0
w_cut=wavelengths[n]

renorm_factor_sd6=fltarr(sg[1])
ini=0
maxl1=0
maxl3=0
maxl6=0
mind1=100.
mind3=100.
mind6=100.
for gege=0, sg[1]-1 do begin
incidence=param_cub_data1[gege,0]
emergence=param_cub_data1[gege,1]
azimut=param_cub_data1[gege,2]

cub_data=cub_data1
sd=size(cub_data)
ss=size(cub_simu)
n_par=ss[2]
wline=where(param_cub_simu[*,*,0] eq emergence and param_cub_simu[*,*,1] eq azimut and param_cub_simu[*,*,2] eq incidence)
line=wline[0]
dd=cub_simu[line,*,n:n_waves-1]
dd=reform(dd, n_par,n_waves-n)
ggd=  where(param_cub_data1[*,0] eq incidence and param_cub_data1[*,1] eq emergence and param_cub_data1[*,2] eq azimut)
d=cub_data[ggd[0],n:n_waves-1];*cos(60*!pi/180.)
gbl=where(finite(d)); and (wavelengths lt 0.9 or wavelengths gt 1.1))
if(n_elements(gbl) gt 2) then begin
du=d[gbl]
du1=du
dude=dd[*, gbl]
ru=fltarr(n_elements(gbl))
rustu=fltarr(n_elements(gbl))
for rustuk=0, n_elements(gbl)-1 do begin
ru[rustuk]=max([sigma*(d[rustuk])^2,sigma2])
rustu[rustuk]=1./ru[rustuk]
endfor
invertC=diag_matrix(rustu)
L1=vraissemblance_ln_mat(du, dude, invertC, n_par)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
bf=where(l1 eq max(l1))
if(max(l1) gt maxl1 or ini eq 0) then begin
maxl1=max(l1) 
bestgeom1=ggd[0]
bestfit1=bf[0]
line1=line
bestgege1=gege
endif
;print, param_cub_simu[line,bf[0],*]
bf1=bf[0]
max1=max(dude[bf1[0]])
max2=max(du)
mama=max([max1,max2])+0.01

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
l_stack=dblarr(n_elements(h_x))
for i=0,n_elements(h_x)-1 do begin
  l_stack[i]=0.
  w=where(param_cub_simu[line,*,sps[3]-1] eq h_x[i])
  l_h=double(exp(l1[w]))
  partemp=param_cub_simu[line,w,sps[3]-2]
  w1=where(partemp le 5.)
  l_stack[i]=l_stack[i]+total(l_h[w1])*0.5
  w2=where(partemp gt 5. and partemp le 25.)
  l_stack[i]=l_stack[i]+total(l_h[w2])*5.
  w3=where(partemp gt 25.)
  l_stack[i]=l_stack[i]+total(l_h[w3])*25.
endfor
l_h_1e=l_stack/total(l_stack)/0.1
lh1[gege,*]=l_h_1e
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
l_stack=dblarr(n_elements(g_x))
for i=0,n_elements(g_x)-1 do begin
  l_stack[i]=0d
  w=where(param_cub_simu[line,*,sps[3]-2] eq g_x[i])
  l_g=double(exp(l1[w]))
  if (g_x[i] eq 800. or g_x[i] eq 400. or g_x[i] eq 25. or g_x[i] eq 5.) then l_g=l_g/2. ;doublons dans la base...
  partemp=param_cub_simu[line,w,sps[3]-1]
  l_stack[i]=l_stack[i]+total(l_g)*0.1
endfor
fact=0.
w1=where(g_x le 5.)
fact=fact+total(l_stack[w1])*0.5
w2=where(g_x gt 5. and g_x le 25.)
fact=fact+total(l_stack[w2])*5.
w3=where(g_x gt 25.)
fact=fact+total(l_stack[w3])*25.
l_g_1e=l_stack/fact
lg1[gege,*]=l_g_1e

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
h_1e=total(h_x*l_h_1e*0.1)
sigma_h_1e=sqrt(total(l_h_1e*0.1*(h_x-h_1e)^2))
g_1e=total(g_x[w1]*0.5*l_g_1e[w1])+total(g_x[w2]*5.*l_g_1e[w2])+total(g_x[w3]*25.*l_g_1e[w3])
sigma_g_1e=sqrt(total(l_g_1e[w1]*0.5*(g_x[w1]-g_1e)^2)+total(l_g_1e[w2]*5.*(g_x[w2]-g_1e)^2)+$
total(l_g_1e[w3]*25.*(g_x[w3]-g_1e)^2))
h1[gege]=h_1e
sig_h1[gege]=sigma_h_1e
g1[gege]=g_1e
sig_g1[gege]=sigma_g_1e

;if(abs(h_1e-thick[0]) lt mind1) then begin
;mind1= abs(h_1e-thick[0] )
;bestgeom1=ggd[0]
;bestfit1=bf[0]
;line1=line
;bestgege1=gege
;endif



ini=1
endif else begin 
h1[gege]=-1.
sig_h1[gege]=-1.
g1[gege]=-1.
sig_g1[gege]=-1.
endelse

endfor

lg1_mean=l_g_1e
for i=0,n_elements(l_g_1e)-1 do lg1_mean[i]=total(lg1[*,i])
lh1_mean=l_h_1e
for i=0,n_elements(l_h_1e)-1 do lh1_mean[i]=total(lh1[*,i])

print,'inversion time : '
invtutu=systime(1)
print, invtutu-tutu

lh3=fltarr(sg[1], s_h)
lg3=fltarr(sg[1], s_g)
h3=fltarr(sg[1])
g3=fltarr(sg[1])
sig_h3=fltarr(sg[1])
sig_g3=fltarr(sg[1])
n_waves=n_elements(wavelengths)
tutu=systime(1)

wavelength=waves[1]
wawa=where(abs(wavelength-wavelengths) lt 0.005)
n=wawa[0]
if(n eq -1) then n=0
w_cut=wavelengths[n]

ini=0
for gege=0, sg[1]-1 do begin
incidence=param_cub_data3[gege,0]
emergence=param_cub_data3[gege,1]
azimut=param_cub_data3[gege,2]

cub_data=cub_data3
sd=size(cub_data)
ss=size(cub_simu)
n_par=ss[2]
wline=where(param_cub_simu[*,*,0] eq emergence and param_cub_simu[*,*,1] eq azimut and param_cub_simu[*,*,2] eq incidence)
line=wline[0]
dd=cub_simu[line,*,n:n_waves-1]
dd=reform(dd, n_par,n_waves-n)
ggd=  where(param_cub_data3[*,0] eq incidence and param_cub_data3[*,1] eq emergence and param_cub_data3[*,2] eq azimut)
d=cub_data[ggd[0],n:n_waves-1];*cos(60*!pi/180.)
gbl=where(finite(d)); and (wavelengths lt 0.9 or wavelengths gt 1.1))
if(n_elements(gbl) gt 2) then begin
du=d[gbl]
du1=du
dude=dd[*, gbl]
ru=fltarr(n_elements(gbl))
rustu=fltarr(n_elements(gbl))
for rustuk=0, n_elements(gbl)-1 do begin
ru[rustuk]=max([sigma*(d[rustuk])^2,sigma2])
rustu[rustuk]=1./ru[rustuk]
endfor
invertC=diag_matrix(rustu)
;invertC = diag_matrix(replicate(1./sigma,n_elements(gbl))) ; !!!ONLY FOR LEAST SQUARES METHOD!!!
L3=vraissemblance_ln_mat(du, dude, invertC, n_par)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
bf=where(l3 eq max(l3))
if(max(l3) gt maxl3 or ini eq 0) then begin
maxl3=max(l3) 
bestgeom3=ggd[0]
bestfit3=bf[0]
line3=line
bestgege3=gege
endif
;print, param_cub_simu[line,bf[0],*]
bf3=bf[0]
max1=max(dude[bf3[0]])
max2=max(du)
mama=max([max1,max2])+0.01

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
l_stack=dblarr(n_elements(h_x))
for i=0,n_elements(h_x)-1 do begin
  l_stack[i]=0.
  w=where(param_cub_simu[line,*,sps[3]-1] eq h_x[i])
  l_h=double(exp(l3[w]))
  partemp=param_cub_simu[line,w,sps[3]-2]
  w1=where(partemp le 5.)
  l_stack[i]=l_stack[i]+total(l_h[w1])*0.5
  w2=where(partemp gt 5. and partemp le 25.)
  l_stack[i]=l_stack[i]+total(l_h[w2])*5.
  w3=where(partemp gt 25.)
  l_stack[i]=l_stack[i]+total(l_h[w3])*25.
endfor
l_h_3e=l_stack/total(l_stack)/0.1
lh3[gege,*]=l_h_3e
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
l_stack=dblarr(n_elements(g_x))
for i=0,n_elements(g_x)-1 do begin
  l_stack[i]=0.
  w=where(param_cub_simu[line,*,sps[3]-2] eq g_x[i])
  l_g=double(exp(l3[w]))
  if (g_x[i] eq 800. or g_x[i] eq 400. or g_x[i] eq 25. or g_x[i] eq 5.) then l_g=l_g/2. ;doublons dans la base...
  partemp=param_cub_simu[line,w,sps[3]-1]
  l_stack[i]=l_stack[i]+total(l_g)*0.1
endfor
fact=0.
w1=where(g_x le 5.)
fact=fact+total(l_stack[w1])*0.5
w2=where(g_x gt 5. and g_x le 25.)
fact=fact+total(l_stack[w2])*5.
w3=where(g_x gt 25.)
fact=fact+total(l_stack[w3])*25.
l_g_3e=l_stack/fact
lg3[gege,*]=l_g_3e
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
h_3e=total(h_x*l_h_3e*0.1)
sigma_h_3e=sqrt(total(l_h_3e*0.1*(h_x-h_3e)^2))
g_3e=total(g_x[w1]*0.5*l_g_3e[w1])+total(g_x[w2]*5.*l_g_3e[w2])+total(g_x[w3]*25.*l_g_3e[w3])
sigma_g_3e=sqrt(total(l_g_3e[w1]*0.5*(g_x[w1]-g_3e)^2)+total(l_g_3e[w2]*5.*(g_x[w2]-g_3e)^2)+$
total(l_g_3e[w3]*25.*(g_x[w3]-g_3e)^2))
h3[gege]=h_3e
sig_h3[gege]=sigma_h_3e
g3[gege]=g_3e
sig_g3[gege]=sigma_g_3e

if(abs(h_3e-thick[1]) lt mind3) then begin
mind3= abs(h_3e-thick[1] )
bestgeom3=ggd[0]
bestfit3=bf[0]
line3=line
bestgege3=gege
endif


ini=1
endif else begin 
h3[gege]=-1.
sig_h3[gege]=-1.
g3[gege]=-1.
sig_g3[gege]=-1.
endelse

endfor

lg3_mean=l_g_3e
for i=0,n_elements(l_g_3e)-1 do lg3_mean[i]=total(lg3[*,i])
lh3_mean=l_h_3e
for i=0,n_elements(l_h_3e)-1 do lh3_mean[i]=total(lh3[*,i])


print,'inversion time : '
invtutu=systime(1)
print, invtutu-tutu


lh6=fltarr(sg[1], s_h)
lg6=fltarr(sg[1], s_g)
h6=fltarr(sg[1])
g6=fltarr(sg[1])
sig_h6=fltarr(sg[1])
sig_g6=fltarr(sg[1])
n_waves=n_elements(wavelengths)
tutu=systime(1)

wavelength=waves[2]
wawa=where(abs(wavelength-wavelengths) lt 0.005)
n=wawa[0]
if(n eq -1) then n=0
w_cut=wavelengths[n]

ini=0
for gege=0, sg[1]-1 do begin
incidence=param_cub_data1[gege,0]
emergence=param_cub_data1[gege,1]
azimut=param_cub_data1[gege,2]

cub_data=cub_data6
sd=size(cub_data)
ss=size(cub_simu)
n_par=ss[2]
wline=where(param_cub_simu[*,*,0] eq emergence and param_cub_simu[*,*,1] eq azimut and param_cub_simu[*,*,2] eq incidence)
line=wline[0]
dd=cub_simu[line,*,n:n_waves-1]
dd=reform(dd, n_par,n_waves-n)
ggd=  where(param_cub_data6[*,0] eq incidence and param_cub_data6[*,1] eq emergence and param_cub_data6[*,2] eq azimut)
d=cub_data[ggd[0],n:n_waves-1];*cos(60*!pi/180.)
gbl=where(finite(d)); and (wavelengths lt 0.9 or wavelengths gt 1.1))
if(n_elements(gbl) gt 2) then begin
;if(cub_data[ggd[0],2] lt 0.95) then begin
du=d[gbl]
du1=du
dude=dd[*, gbl]
ru=fltarr(n_elements(gbl))
rustu=fltarr(n_elements(gbl))
for rustuk=0, n_elements(gbl)-1 do begin
ru[rustuk]=max([sigma*(d[rustuk])^2,sigma2])
rustu[rustuk]=1./ru[rustuk]
endfor
invertC=diag_matrix(rustu)
;invertC = diag_matrix(replicate(1./sigma,n_elements(gbl))) ; !!!ONLY FOR LEAST SQUARES METHOD!!!
L6=vraissemblance_ln_mat(du, dude, invertC, n_par)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
bf=where(l6 eq max(l6))
if(max(l6) gt maxl6 or ini eq 0) then begin
maxl6=max(l6) 
bestgeom6=ggd[0]
bestfit6=bf[0]
line6=line
bestgege6=gege
endif
;print, param_cub_simu[line,bf[0],*]
bf6=bf[0]
max1=max(dude[bf1[0]])
max2=max(du)
mama=max([max1,max2])+0.01

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
l_stack=dblarr(n_elements(h_x))
for i=0,n_elements(h_x)-1 do begin
  l_stack[i]=0.
  w=where(param_cub_simu[line,*,sps[3]-1] eq h_x[i])  
  l_h=double(exp(l6[w]))
  partemp=param_cub_simu[line,w,sps[3]-2]
  w1=where(partemp le 5.)
  l_stack[i]=l_stack[i]+total(l_h[w1])*0.5
  w2=where(partemp gt 5. and partemp le 25.)
  l_stack[i]=l_stack[i]+total(l_h[w2])*5.
  w3=where(partemp gt 25.)
  l_stack[i]=l_stack[i]+total(l_h[w3])*25.
endfor
l_h_6e=l_stack/total(l_stack)/0.1
lh6[gege,*]=l_h_6e
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
l_stack=dblarr(n_elements(g_x))
for i=0,n_elements(g_x)-1 do begin
  l_stack[i]=0.
  w=where(param_cub_simu[line,*,sps[3]-2] eq g_x[i])
  l_g=double(exp(l6[w]))
  if (g_x[i] eq 800. or g_x[i] eq 400. or g_x[i] eq 25. or g_x[i] eq 5.) then l_g=l_g/2. ;doublons dans la base...
  partemp=param_cub_simu[line,w,sps[3]-1]
  l_stack[i]=l_stack[i]+total(l_g)*0.1
endfor
fact=0.
w1=where(g_x le 5.)
fact=fact+total(l_stack[w1])*0.5
w2=where(g_x gt 5. and g_x le 25.)
fact=fact+total(l_stack[w2])*5.
w3=where(g_x gt 25.)
fact=fact+total(l_stack[w3])*25.
l_g_6e=l_stack/fact
lg6[gege,*]=l_g_6e
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
h_6e=total(h_x*l_h_6e*0.1)
sigma_h_6e=sqrt(total(l_h_6e*0.1*(h_x-h_6e)^2))
g_6e=total(g_x[w1]*0.5*l_g_6e[w1])+total(g_x[w2]*5.*l_g_6e[w2])+total(g_x[w3]*25.*l_g_6e[w3])
sigma_g_6e=sqrt(total(l_g_6e[w1]*0.5*(g_x[w1]-g_6e)^2)+total(l_g_6e[w2]*5.*(g_x[w2]-g_6e)^2)+$
total(l_g_6e[w3]*25.*(g_x[w3]-g_6e)^2))
h6[gege]=h_6e
sig_h6[gege]=sigma_h_6e
g6[gege]=g_6e
sig_g6[gege]=sigma_g_6e

;if(abs(h_6e-thick[2]) lt mind6) then begin
;mind6= abs(h_6e-thick[2] )
;bestgeom6=ggd[0]
;bestfit6=bf[0]
;line6=line
;bestgege6=gege
;endif

ini=1

;endif else begin 
;h6[gege]=-1.
;sig_h6[gege]=-1.
;g6[gege]=-1.
;sig_g6[gege]=-1.
;endelse
endif else begin 
h6[gege]=-1.
sig_h6[gege]=-1.
g6[gege]=-1.
sig_g6[gege]=-1.
endelse

endfor

lg6_mean=l_g_6e
for i=0,n_elements(l_g_6e)-1 do lg6_mean[i]=total(lg6[*,i])
lh6_mean=l_h_6e
for i=0,n_elements(l_h_6e)-1 do lh6_mean[i]=total(lh6[*,i])

print,'inversion time : '
invtutu=systime(1)
print, invtutu-tutu


wgg1=where(h1 ne -1.)
h_1=h1[wgg1]
sig_h_1=sig_h1[wgg1]
g_1=g1[wgg1]
sig_g_1=sig_g1[wgg1]
h_1_dat=replicate(thick[0], n_elements(wgg1))
sig_h_1_dat=replicate(err[0], n_elements(wgg1))

wgg3=where(h3 ne -1.)
h_3=h3[wgg3]
sig_h_3=sig_h3[wgg3]
g_3=g3[wgg3]
sig_g_3=sig_g3[wgg3]
h_3_dat=replicate(thick[1], n_elements(wgg3))
sig_h_3_dat=replicate(err[1], n_elements(wgg3))


wgg6=where(h6 ne -1.)
h_6=h6[wgg6]
sig_h_6=sig_h6[wgg6]
g_6=g6[wgg6]
sig_g_6=sig_g6[wgg6]
h_6_dat=replicate(thick[2], n_elements(wgg6))
sig_h_6_dat=replicate(err[2], n_elements(wgg6))

h_dat=[h_1_dat,h_3_dat,h_6_dat ]
sig_h_dat=[sig_h_1_dat,sig_h_3_dat,sig_h_6_dat ]
h_inv=[h_1,h_3,h_6 ]
sig_h_inv=2.*[sig_h_1,sig_h_3,sig_h_6 ]

print, 'mean thickness for 1e, 3e, 6e :'
PRINT, mean(h_1),mean(h_3),mean(h_6)
print, 'associated standard deviations :'
print, mean(sig_h_1),mean(sig_h_3),mean(sig_h_6)
print, 'mean snow grainsize for 1e, 3e, 6e :'
PRINT, mean(g_1),mean(g_3),mean(g_6)
print, 'associated standard deviations :'
print, mean(sig_g_1),mean(sig_g_3),mean(sig_g_6)



lh1_mean=lh1_mean/total(lh1_mean*0.1)
lh3_mean=lh3_mean/total(lh3_mean*0.1)
lh6_mean=lh6_mean/total(lh6_mean*0.1)
h_1e=total(h_x*lh1_mean*0.1)
h_3e=total(h_x*lh3_mean*0.1)
h_6e=total(h_x*lh6_mean*0.1)
sigma_h_1e=sqrt(total(lh1_mean*0.1*(h_x-h_1e)^2))
sigma_h_3e=sqrt(total(lh3_mean*0.1*(h_x-h_3e)^2))
sigma_h_6e=sqrt(total(lh6_mean*0.1*(h_x-h_6e)^2))
lg1_mean=lg1_mean/(total(0.5*lg1_mean[w1])+total(5.*lg1_mean[w2])+total(25.*lg1_mean[w3]))
lg3_mean=lg3_mean/(total(0.5*lg3_mean[w1])+total(5.*lg3_mean[w2])+total(25.*lg3_mean[w3]))
lg6_mean=lg6_mean/(total(0.5*lg6_mean[w1])+total(5.*lg6_mean[w2])+total(25.*lg6_mean[w3]))
g_1e=total(g_x[w1]*0.5*lg1_mean[w1])+total(g_x[w2]*5.*lg1_mean[w2])+total(g_x[w3]*25.*lg1_mean[w3])
g_3e=total(g_x[w1]*0.5*lg3_mean[w1])+total(g_x[w2]*5.*lg3_mean[w2])+total(g_x[w3]*25.*lg3_mean[w3])
g_6e=total(g_x[w1]*0.5*lg6_mean[w1])+total(g_x[w2]*5.*lg6_mean[w2])+total(g_x[w3]*25.*lg6_mean[w3])
sigma_g_1e=sqrt(total(l_g_1e[w1]*0.5*(g_x[w1]-g_1e)^2)+total(l_g_1e[w2]*5.*(g_x[w2]-g_1e)^2)+$
total(l_g_1e[w3]*25.*(g_x[w3]-g_1e)^2))
sigma_g_3e=sqrt(total(l_g_3e[w1]*0.5*(g_x[w1]-g_3e)^2)+total(l_g_3e[w2]*5.*(g_x[w2]-g_3e)^2)+$
total(l_g_3e[w3]*25.*(g_x[w3]-g_3e)^2))
sigma_g_6e=sqrt(total(l_g_6e[w1]*0.5*(g_x[w1]-g_6e)^2)+total(l_g_6e[w2]*5.*(g_x[w2]-g_6e)^2)+$
total(l_g_6e[w3]*25.*(g_x[w3]-g_6e)^2))

simthick=[h_1e, h_3e, h_6e]
simerr=2.*[sigma_h_1e, sigma_h_3e, sigma_h_6e]

simthick=[h1[bestgege1], h3[bestgege3], h6[bestgege6]]
simerr=2.*[sig_h1[bestgege1], sig_h3[bestgege3], sig_h6[bestgege6]]



;Verif normalisation
;print, total(lh1_mean*0.1)
;print, total(lh3_mean*0.1)
;print, total(lh6_mean*0.1)
;print, total(0.5*l_g_1e[w1])+total(5.*l_g_1e[w2])+total(25.*l_g_1e[w3])
;print, total(0.5*l_g_3e[w1])+total(5.*l_g_3e[w2])+total(25.*l_g_3e[w3])
;print, total(0.5*l_g_6e[w1])+total(5.*l_g_6e[w2])+total(25.*l_g_6e[w3])
cluvu=abs(param_cub_simu[*,*,3]-g_1e)
cluvustu=abs(param_cub_simu[*,*,4]-h_1e)
wbest1=where(cluvu eq min(cluvu) and cluvustu eq min(cluvustu))
cluvu=abs(param_cub_simu[*,*,3]-g_3e)
cluvustu=abs(param_cub_simu[*,*,4]-h_3e)
wbest3=where(cluvu eq min(cluvu) and cluvustu eq min(cluvustu))
cluvu=abs(param_cub_simu[*,*,3]-g_6e)
cluvustu=abs(param_cub_simu[*,*,4]-h_6e)
wbest6=where(cluvu eq min(cluvu) and cluvustu eq min(cluvustu))

phase2=fltarr(sps[1],sps[2])
phase_dat1=param_cub_data1[*,3]
phase_dat3=param_cub_data3[*,3]
phase_dat6=param_cub_data6[*,3]
for i=0,n_elements(phase_dat1)-1 do phase2[i,*]=convert_phi_alpha(param_cub_simu[i,0,2], param_cub_simu[i,0,0], param_cub_simu[i,0,1])
num_wave=43
plot_simu=cub_simu[*,*,num_wave]



;phased1=phase_dat1[wgg1]
;sort1=sort(phased1)
;phased3=phase_dat3[wgg3]
;sort3=sort(phased3)
;phased6=phase_dat6[wgg6]
;sort6=sort(phased6)
;
;azimd1=param_cub_data1[wgg1,2]
;sort1=sort(azimd1)
;azimd3=param_cub_data3[wgg3,2]
;sort3=sort(azimd3)
;azimd6=param_cub_data6[wgg6,2]
;sort6=sort(azimd6)
;h_inv=[h_1[sort1],h_3[sort3],h_6[sort6] ]
;sig_h_inv=2.*[sig_h_1[sort1],sig_h_3[sort3],sig_h_6[sort6] ]
;
;
;emd1=param_cub_data1[wgg1,1]
;sort1=sort(emd1)
;emd3=param_cub_data3[wgg3,1]
;sort3=sort(emd3)
;emd6=param_cub_data6[wgg6,1]
;sort6=sort(emd6)
;h_inv=[h_1[sort1],h_3[sort3],h_6[sort6] ]
;sig_h_inv=2.*[sig_h_1[sort1],sig_h_3[sort3],sig_h_6[sort6] ]

incd1=param_cub_data1[wgg1,0]
sort1=sort(incd1)
incd3=param_cub_data3[wgg3,0]
sort3=sort(incd3)
incd6=param_cub_data6[wgg6,0]
sort6=sort(incd6)
h_inv=[h_1[sort1],h_3[sort3],h_6[sort6] ]
sig_h_inv=2.*[sig_h_1[sort1],sig_h_3[sort3],sig_h_6[sort6] ]

if (plot_option eq 0 ) then begin

window, 0
device,  decomposed=0
LOADCT,39 
erase,255
!P.BACKGROUND=255
!P.COLOR=0
!P.Font=1
xval=[1./6.,0.5,5./6.]
xval2=(findgen(n_elements(wgg1)+n_elements(wgg3)+n_elements(wgg6))+1)/(n_elements(wgg1)+n_elements(wgg3)+n_elements(wgg6)+1)
plot, xval, thick, psym=3, xticks=2, ytitle='Slab thickness (mm)', xtickname=names,xrange=[0.,1.],$
yrange=[0,max(thick+err)+0.1], charsize=1, xtickv=xval, thick=2, xthick=2, ythick=2
oplot,[0,1./3.],[thick[0], thick[0]], thick=2
oplot,[0,1./3.],[thick[0]+err[0], thick[0]+err[0]],linestyle=2, thick=2
oplot,[0,1./3.],[thick[0]-err[0], thick[0]-err[0]],linestyle=2, thick=2
oplot,[1./3., 2./3.],[thick[1], thick[1]], thick=2
oplot,[1./3., 2./3.],[thick[1]+err[1], thick[1]+err[1]],linestyle=2, thick=2
oplot,[1./3., 2./3.],[thick[1]-err[1], thick[1]-err[1]],linestyle=2, thick=2
oplot,[2./3.,1.],[thick[2], thick[2]], thick=2
oplot,[2./3.,1.],[thick[2]+err[2], thick[2]+err[2]],linestyle=2, thick=2
oplot,[2./3.,1.],[thick[2]-err[2], thick[2]-err[2]],linestyle=2, thick=2
;errplot,xval, thick-err, thick+err, thick=2
oplot, xval2, h_inv, color=250, psym=3, thick=2
for i=0,n_elements(xval2)-1 do begin
    plots,  [xval2[i]-0.01*max(xval2),xval2[i]+0.01*max(xval2)] ,[h_inv[i],h_inv[i]]  , color=250,thick=2, psym=0
endfor
errplot,xval2, h_inv-sig_h_inv,  h_inv+sig_h_inv, color=250, thick=2
legend, ['Measure'], psym=0, thick=2, pos=[140, 460],CHARTHICK=2,CHARSIZE=1,COLORS=0,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
legend, ['Inversion'], psym=0, thick=2, pos=[140, 430],CHARTHICK=2,CHARSIZE=1,COLORS=250,TEXTCOLORS=0,OUTLINE_COLOR=255,/device


window, 2
device,  decomposed=0
LOADCT,39 
erase,255
!P.BACKGROUND=255
!P.COLOR=0
!P.Font=1
;plot, thick, thick, psym=1, ytitle='Slab thickness (mm)',$
;yrange=[0,max(h_dat+sig_h_dat)], xrange=[0,max(h_dat+sig_h_dat)], charsize=1, thick=2, xthick=2, ythick=2
;oplot, thick, thick, thick=2
;errplot,thick, thick-err, thick+err, thick=2
plot, [0,max(h_dat+sig_h_dat)],[0,max(h_dat+sig_h_dat)] , ytitle='Slab thickness (mm)',$
yrange=[0,max(h_dat+sig_h_dat)], xrange=[0,max(h_dat+sig_h_dat)], charsize=1, thick=2, xthick=2, ythick=2
;for i=0,n_elements(thick)-1 do begin
;    plots, [thick[i]-err[i],thick[i]+err[i]] , [thick[i],thick[i]] , color=0,thick=2 
;    plots, [thick[i]-err[i],thick[i]-err[i]] ,[thick[i]+0.01*max(h_dat+sig_h_dat),thick[i]-0.01*max(h_dat+sig_h_dat)] , color=0,thick=2 ;make some little tick marks on the ends if you want
;    plots, [thick[i]+err[i],thick[i]+err[i]] ,[thick[i]+0.01*max(h_dat+sig_h_dat),thick[i]-0.01*max(h_dat+sig_h_dat)] , color=0,thick=2
;endfor
oplot, h_dat, h_inv, color=0, psym=1, thick=2
;for i=0,n_elements(h_dat)-1 do begin
;    plots, [h_dat[i]-sig_h_dat[i],h_dat[i]+sig_h_dat[i]] , [h_inv[i],h_inv[i]] , color=250,thick=2 
;    plots, [h_dat[i]-sig_h_dat[i],h_dat[i]-sig_h_dat[i]] ,[h_inv[i]+0.01*max(h_inv+sig_h_dat),h_inv[i]-0.01*max(h_inv+sig_h_dat)] , color=250,thick=2 ;make some little tick marks on the ends if you want
;    plots, [h_dat[i]+sig_h_dat[i],h_dat[i]+sig_h_dat[i]] ,[h_inv[i]+0.01*max(h_inv+sig_h_dat),h_inv[i]-0.01*max(h_inv+sig_h_dat)] , color=250,thick=2
;endfor
for i=0,n_elements(h_dat)-1 do begin
    plots, [h_dat[i]-sig_h_dat[i],h_dat[i]+sig_h_dat[i]] , [h_inv[i]-sig_h_inv[i],h_inv[i]-sig_h_inv[i]] , color=250,thick=2, psym=3
    plots, [h_dat[i]-sig_h_dat[i],h_dat[i]+sig_h_dat[i]] , [h_inv[i]+sig_h_inv[i],h_inv[i]+sig_h_inv[i]] , color=250,thick=s, psym=3
    ;plots, [h_dat[i]-sig_h_dat[i],h_dat[i]-sig_h_dat[i]] ,[h_inv[i]+0.01*max(h_inv+sig_h_dat),h_inv[i]-0.01*max(h_inv+sig_h_dat)] , color=250,thick=2 ;make some little tick marks on the ends if you want
    ;plots, [h_dat[i]+sig_h_dat[i],h_dat[i]+sig_h_dat[i]] ,[h_inv[i]+0.01*max(h_inv+sig_h_dat),h_inv[i]-0.01*max(h_inv+sig_h_dat)] , color=250,thick=2
endfor
;errplot, h_dat,h_inv-2.*sig_h_inv, h_inv+2.*sig_h_inv, color=250, thick=2
legend, ['Measure'], psym=0, thick=2, pos=[140, 460],CHARTHICK=2,CHARSIZE=1,COLORS=0,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
legend, ['Inversion'], psym=0, thick=2, pos=[140, 430],CHARTHICK=2,CHARSIZE=1,COLORS=250,TEXTCOLORS=0,OUTLINE_COLOR=255,/device



window, 3
device,  decomposed=0
LOADCT,39 
erase,255
!P.BACKGROUND=255
!P.COLOR=0
!P.Font=1
plot, h_x, lh1[bestgege1,*], title='Marginal Probability Density Functions for the Thickness of the slab', ytitle='Marginal PDF',$
xtitle='Thickness of the slab (mm)',ystyle=1., charsize=1, charthick=2, xthick=2, ythick=2, /nodata
oplot, h_x, lh1[bestgege1,*], color=250, thick=2
oplot, h_x, lh3[bestgege3,*], color=150, thick=2
oplot, h_x, lh6[bestgege6,*], color=50, thick=2
legend, ['Sample 1'], psym=0, thick=2, pos=[580, 480],CHARTHICK=2,CHARSIZE=1,COLORS=250,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
legend, ['Sample 2'], psym=0, thick=2, pos=[580, 450],CHARTHICK=2,CHARSIZE=1,COLORS=150,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
legend, ['Sample 3'], psym=0, thick=2, pos=[580, 420],CHARTHICK=2,CHARSIZE=1,COLORS=50,TEXTCOLORS=0,OUTLINE_COLOR=255,/device

window, 4
device,  decomposed=0
LOADCT,39 
erase,255
!P.BACKGROUND=255
!P.COLOR=0
!P.Font=1
plot, h_x, lh1_mean, title='Marginal Probability Density Functions for the Thickness of the slab', ytitle='Marginal PDF',$
xtitle='Thickness of the slab (mm)',ystyle=1., charsize=1, charthick=2, xthick=2, ythick=2, /nodata
oplot, h_x, lh1_mean, color=250, thick=2
oplot, h_x, lh3_mean, color=150, thick=2
oplot, h_x, lh6_mean, color=50, thick=2
legend, ['Sample 1'], psym=0, thick=2, pos=[580, 480],CHARTHICK=2,CHARSIZE=1,COLORS=250,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
legend, ['Sample 2'], psym=0, thick=2, pos=[580, 450],CHARTHICK=2,CHARSIZE=1,COLORS=150,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
legend, ['Sample 3'], psym=0, thick=2, pos=[580, 420],CHARTHICK=2,CHARSIZE=1,COLORS=50,TEXTCOLORS=0,OUTLINE_COLOR=255,/device


window, 5
device,  decomposed=0
LOADCT,39 
erase,255
!P.BACKGROUND=255
!P.COLOR=0
!P.Font=1
x=1.
y=1.
factx=0.2
facty=0.2
sx=factx*[-x,-x,x,x]
sy=facty*[-y,y,y,-y]
USERSYM, sx, sy, THICK=1, /FILL
plot, g_x, lg3_mean, title='Marginal Probability Density Functions for the Grainsize of the snow', ytitle='Marginal PDF',$
xtitle='Grainsize of the snow ('+string(181B)+'m)',charsize=1, charthick=2, xthick=2, ythick=2, yrange=[0.,1.5*max(lg1_mean)]
oplot, g_x, lg6_mean, color=50, thick=2
oplot, g_x, lg3_mean, color=150, thick=2
oplot, g_x, lg1_mean, color=250, thick=2
legend, ['Sample 1'], psym=0, thick=2, pos=[580, 480],CHARTHICK=2,CHARSIZE=1,COLORS=250,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
legend, ['Sample 2'], psym=0, thick=2, pos=[580, 450],CHARTHICK=2,CHARSIZE=1,COLORS=150,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
legend, ['Sample 3'], psym=0, thick=2, pos=[580, 420],CHARTHICK=2,CHARSIZE=1,COLORS=50,TEXTCOLORS=0,OUTLINE_COLOR=255,/device

window, 6
device,  decomposed=0
LOADCT,39 
erase,255
!P.BACKGROUND=255
!P.COLOR=0
!P.Font=1
x=1.
y=1.
factx=0.2
facty=0.2
sx=factx*[-x,-x,x,x]
sy=facty*[-y,y,y,-y]
USERSYM, sx, sy, THICK=1, /FILL
plot, g_x, lg3[bestgege3,*], title='Marginal Probability Density Functions for the Grainsize of the snow', ytitle='Marginal PDF',$
xtitle='Grainsize of the snow ('+string(181B)+'m)',charsize=1, charthick=2, xthick=2, ythick=2, yrange=[0.,1.5*max(lg1[bestgege1,*])]
oplot, g_x, lg6[bestgege6,*], color=50, thick=2
oplot, g_x, lg3[bestgege3,*], color=150, thick=2
oplot, g_x, lg1[bestgege1,*], color=250, thick=2
legend, ['Sample 1'], psym=0, thick=2, pos=[580, 480],CHARTHICK=2,CHARSIZE=1,COLORS=250,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
legend, ['Sample 2'], psym=0, thick=2, pos=[580, 450],CHARTHICK=2,CHARSIZE=1,COLORS=150,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
legend, ['Sample 3'], psym=0, thick=2, pos=[580, 420],CHARTHICK=2,CHARSIZE=1,COLORS=50,TEXTCOLORS=0,OUTLINE_COLOR=255,/device


;plot, g_x, lg3[bestfit3], title='Marginal Probability Density Functions for the Grainsize of the snow', ytitle='Marginal PDF',$
;xtitle='Grainsize of the snow ('+string(181B)+'m)',charsize=2, charthick=4, /nodata, xthick=4, ythick=4, yrange=[0.,1.5*max(l_g_1e)]

window, 7
device,  decomposed=0
LOADCT,39 
erase,255
!P.BACKGROUND=255
!P.COLOR=0
!P.Font=1
xval=(findgen(3)+1)/4.
plot, xval, thick, psym=1, xticks=2, ytitle='Slab thickness (mm)', xtickname=names,xrange=[0.,1.],$
yrange=[0,max(thick+err)+0.1], charsize=1, xtickv=xval, thick=2, xthick=2, ythick=2
errplot,xval, thick-err, thick+err, thick=2
oplot, xval, simthick, color=250, psym=3, thick=2
for i=0,n_elements(xval)-1 do begin
    plots,  [xval[i]-0.01*max(xval),xval[i]+0.01*max(xval)] ,[simthick[i],simthick[i]]  , color=250,thick=2, psym=0
endfor
errplot,xval, simthick-simerr, simthick+simerr, color=250, thick=2
legend, ['Measure'], psym=0, thick=2, pos=[140, 460],CHARTHICK=2,CHARSIZE=1,COLORS=0,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
legend, ['Inversion'], psym=0, thick=2, pos=[140, 430],CHARTHICK=2,CHARSIZE=1,COLORS=250,TEXTCOLORS=0,OUTLINE_COLOR=255,/device

window, 8
device,  decomposed=0
LOADCT,39 
erase,255
!P.BACKGROUND=255
!P.COLOR=0
!P.Font=1
plot, wavelengths, cub_data1[bestgeom1,*], thick=2,xtitle='Wavelength ('+string(181B)+'m)',ytitle='Reflectance & error',charsize=1,$
charthick=2,  yrange=[0.,1.], ystyle=1, xthick=2, ythick=2, xrange=[0.8,2.], xstyle=1
oplot, wavelengths, cub_simu[line1,bestfit1,*], color=250, thick=2
oplot, wavelengths, abs(cub_simu[line1,bestfit1,*]-cub_data1[bestgeom1,*]), color=50, thick=2
legend, ['Measure'], psym=0, thick=2, pos=[580, 480],CHARTHICK=2,CHARSIZE=1,COLORS=0,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
legend, ['Simulation'], psym=0, thick=2, pos=[580, 450],CHARTHICK=2,CHARSIZE=1,COLORS=250,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
legend, ['Error'], psym=0, thick=2, pos=[580, 420],CHARTHICK=2,CHARSIZE=1,COLORS=50,TEXTCOLORS=0,OUTLINE_COLOR=255,/device

window, 9
device,  decomposed=0
LOADCT,39 
erase,255
!P.BACKGROUND=255
!P.COLOR=0
!P.Font=1
plot, wavelengths, cub_data3[bestgeom3,*], thick=2,xtitle='Wavelength ('+string(181B)+'m)',ytitle='Reflectance & error',charsize=1,$
charthick=2,  yrange=[0.,1.], ystyle=1, xthick=2, ythick=2, xrange=[0.8,2.], xstyle=1
oplot, wavelengths, cub_simu[line3,bestfit3,*], color=250, thick=2
oplot, wavelengths, abs(cub_simu[line3,bestfit3,*]-cub_data3[bestgeom3,*]), color=50, thick=2
legend, ['Measure'], psym=0, thick=2, pos=[580, 480],CHARTHICK=2,CHARSIZE=1,COLORS=0,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
legend, ['Simulation'], psym=0, thick=2, pos=[580, 450],CHARTHICK=2,CHARSIZE=1,COLORS=250,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
legend, ['Error'], psym=0, thick=2, pos=[580, 420],CHARTHICK=2,CHARSIZE=1,COLORS=50,TEXTCOLORS=0,OUTLINE_COLOR=255,/device

window, 10
device,  decomposed=0
LOADCT,39 
erase,255
!P.BACKGROUND=255
!P.COLOR=0
!P.Font=1
plot, wavelengths, cub_data6[bestgeom6,*], thick=2,xtitle='Wavelength ('+string(181B)+'m)',ytitle='Reflectance & error',charsize=1,$
charthick=2,  yrange=[0.,1.], ystyle=1, xthick=2, ythick=2, xrange=[0.8,2.], xstyle=1
oplot, wavelengths, cub_simu[line6,bestfit6,*], color=250, thick=2
oplot, wavelengths, abs(cub_simu[line6,bestfit6,*]-cub_data6[bestgeom6,*]), color=50, thick=2
legend, ['Measure'], psym=0, thick=2, pos=[580, 480],CHARTHICK=2,CHARSIZE=1,COLORS=0,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
legend, ['Simulation'], psym=0, thick=2, pos=[580, 450],CHARTHICK=2,CHARSIZE=1,COLORS=250,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
legend, ['Error'], psym=0, thick=2, pos=[580, 420],CHARTHICK=2,CHARSIZE=1,COLORS=50,TEXTCOLORS=0,OUTLINE_COLOR=255,/device



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
endif else begin
set_plot, 'z'

device, set_resolution=[1000,800], SET_FONT='Times',decomposed=0, z_buffering=1, set_pixel_depth=24
LOADCT,39 
erase,255
!P.BACKGROUND=255
!P.COLOR=0
!P.Font=1
plot, g_x, lg3[bestgege3,*], ytitle='Marginal PDF',$
xtitle='Grainsize of the snow ('+string(181B)+'m)',charsize=4, charthick=4, /nodata, xthick=4, ythick=4, yrange=[0.,1.5*max(l_g_1e)];, title='Marginal Probability Density Functions for the Grainsize of the snow'
oplot, g_x, lg6[bestgege6,*], color=50, thick=4
oplot, g_x, lg3[bestgege3,*], color=150, thick=4
oplot, g_x, lg1[bestgege1,*], color=250, thick=4
legend, ['Sample 1'], psym=0, thick=4, pos=[530, 690],CHARTHICK=2,charsize=3,COLORS=250,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
legend, ['Sample 2'], psym=0, thick=4, pos=[530, 650],CHARTHICK=2,charsize=3,COLORS=150,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
legend, ['Sample 3'], psym=0, thick=4, pos=[530, 610],CHARTHICK=2,charsize=3,COLORS=50,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
t=tvrd(true=1)
write_png, plot_par_123, t
device, /close
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

device, set_resolution=[1000,800], SET_FONT='Times',decomposed=0, z_buffering=1, set_pixel_depth=24
LOADCT,39 
erase,255
!P.BACKGROUND=255
!P.COLOR=0
!P.Font=1
plot, g_x, lg1[bestgege1,*], title='Marginal Probability Density Functions for the Grainsize of the snow', ytitle='Marginal PDF',$
xtitle='Grainsize of the snow ('+string(181B)+'m)',subtitle='Sample 1', charsize=4, charthick=4, /nodata, xthick=4, ythick=4
oplot, g_x, lg1[bestgege1,*], thick=4
t=tvrd(true=1)
write_png, plot_par_1, t
device, /close
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

device, set_resolution=[1000,800], SET_FONT='Times',decomposed=0, z_buffering=1, set_pixel_depth=24
LOADCT,39 
erase,255
!P.BACKGROUND=255
!P.COLOR=0
!P.Font=1
plot, g_x, lg3[bestgege3,*], title='Marginal Probability Density Functions for the Grainsize of the snow', ytitle='Marginal PDF',$
xtitle='Grainsize of the snow ('+string(181B)+'m)',subtitle='Sample 2',charsize=4, charthick=4, /nodata, xthick=4, ythick=4
oplot, g_x, lg3[bestgege3,*], thick=4
t=tvrd(true=1)
write_png, plot_par_2, t
device, /close
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

device, set_resolution=[1000,800], SET_FONT='Times',decomposed=0, z_buffering=1, set_pixel_depth=24
LOADCT,39 
erase,255
!P.BACKGROUND=255
!P.COLOR=0
!P.Font=1
plot, g_x, lg6[bestgege6,*], title='Marginal Probability Density Functions for the Grainsize of the snow', ytitle='Marginal PDF',$
xtitle='Grainsize of the snow ('+string(181B)+'m)',subtitle='Sample 3',charsize=4, charthick=4, /nodata, xthick=4, ythick=4
oplot, g_x, l_g_6e, thick=4
t=tvrd(true=1)
write_png, plot_par_3, t
device, /close
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


device, set_resolution=[1000,800], SET_FONT='Times',decomposed=0, z_buffering=1, set_pixel_depth=24
LOADCT,39 
erase,255
!P.BACKGROUND=255
!P.COLOR=0
!P.Font=1
plot, h_x, lh1[bestgege1,*], title='Marginal Probability Density Functions for the Thickness of the slab', ytitle='Marginal PDF',$
xtitle='Thickness of the slab (mm)',subtitle='Sample 1', charsize=4, charthick=4, /nodata, xthick=4, ythick=4
oplot, h_x, lh1[bestgege1,*], thick=4
t=tvrd(true=1)
write_png, plot_par_1b, t
device, /close
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

device, set_resolution=[1000,800], SET_FONT='Times',decomposed=0, z_buffering=1, set_pixel_depth=24
LOADCT,39 
erase,255
!P.BACKGROUND=255
!P.COLOR=0
!P.Font=1
plot, h_x, lh3[bestgege3,*], title='Marginal Probability Density Functions for the Thickness of the slab', ytitle='Marginal PDF',$
xtitle='Thickness of the slab (mm)',subtitle='Sample 2',charsize=4, charthick=4, /nodata, xthick=4, ythick=4
oplot, h_x, lh3[bestgege3,*], thick=4
t=tvrd(true=1)
write_png, plot_par_2b, t
device, /close
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

device, set_resolution=[1000,800], SET_FONT='Times',decomposed=0, z_buffering=1, set_pixel_depth=24
LOADCT,39 
erase,255
!P.BACKGROUND=255
!P.COLOR=0
!P.Font=1
plot, h_x, lh6[bestgege6,*], title='Marginal Probability Density Functions for the Thickness of the slab', ytitle='Marginal PDF',$
xtitle='Thickness of the slab (mm)',subtitle='Sample 3',charsize=4, charthick=4, /nodata, xthick=4, ythick=4
oplot, h_x, lh6[bestgege6,*], thick=4
t=tvrd(true=1)
write_png, plot_par_3b, t
device, /close
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


device, set_resolution=[1000,800], SET_FONT='Times',decomposed=0, z_buffering=1, set_pixel_depth=24
LOADCT,39 
erase,255
!P.BACKGROUND=255
!P.COLOR=0
!P.Font=1
plot, h_x, lh1[bestgege1,*], ytitle='Marginal PDF',$
xtitle='Thickness of the slab (mm)',ystyle=1., charsize=4, charthick=4, /nodata, xthick=4, ythick=4;, title='Marginal Probability Density Functions for the Thickness of the slab'
oplot, h_x, lh1[bestgege1,*], color=250, thick=4
oplot, h_x, lh3[bestgege3,*], color=150, thick=4
oplot, h_x, lh6[bestgege6,*], color=50, thick=4
legend, ['Sample 1'], psym=0, thick=4, pos=[530, 690],CHARTHICK=2,charsize=3,COLORS=250,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
legend, ['Sample 2'], psym=0, thick=4, pos=[530, 650],CHARTHICK=2,charsize=3,COLORS=150,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
legend, ['Sample 3'], psym=0, thick=4, pos=[530, 610],CHARTHICK=2,charsize=3,COLORS=50,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
t=tvrd(true=1)
write_png, plot_par_123b, t
device, /close
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


device, set_resolution=[1000,800], SET_FONT='Times',decomposed=0, z_buffering=1, set_pixel_depth=24
LOADCT,39 
erase,255
!P.BACKGROUND=255
!P.COLOR=0
!P.Font=1

xval=[1./6.,0.5,5./6.]
xval2=(findgen(n_elements(wgg1)+n_elements(wgg3)+n_elements(wgg6))+1)/(n_elements(wgg1)+n_elements(wgg3)+n_elements(wgg6)+1)
plot, xval, thick, psym=3, xticks=2, ytitle='Slab thickness (mm)', xtickname=names,xrange=[0.,1.],$
yrange=[0,max(thick+err)+0.1], charsize=3, xtickv=xval, thick=4, xthick=4, ythick=4
oplot,[0,1./3.],[thick[0], thick[0]], thick=4
oplot,[0,1./3.],[thick[0]+err[0], thick[0]+err[0]],linestyle=2, thick=4
oplot,[0,1./3.],[thick[0]-err[0], thick[0]-err[0]],linestyle=2, thick=4
oplot,[1./3., 2./3.],[thick[1], thick[1]], thick=4
oplot,[1./3., 2./3.],[thick[1]+err[1], thick[1]+err[1]],linestyle=2, thick=4
oplot,[1./3., 2./3.],[thick[1]-err[1], thick[1]-err[1]],linestyle=2, thick=4
oplot,[2./3.,1.],[thick[2], thick[2]], thick=4
oplot,[2./3.,1.],[thick[2]+err[2], thick[2]+err[2]],linestyle=2, thick=4
oplot,[2./3.,1.],[thick[2]-err[2], thick[2]-err[2]],linestyle=2, thick=4
;errplot,xval, thick-err, thick+err, thick=2
oplot, xval2, h_inv, color=250, psym=3, thick=4
for i=0,n_elements(xval2)-1 do begin
    plots,  [xval2[i]-0.01*max(xval2),xval2[i]+0.01*max(xval2)] ,[h_inv[i],h_inv[i]]  , color=250,thick=4, psym=0
endfor
errplot,xval2, h_inv-sig_h_inv,  h_inv+sig_h_inv, color=250, thick=4
legend, ['Measure'], psym=0, thick=4, pos=[250, 700],CHARTHICK=2,charsize=3,COLORS=0,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
legend, ['Inversion'], psym=0, thick=4, pos=[250, 660],CHARTHICK=2,charsize=3,COLORS=250,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
t=tvrd(true=1)
write_png, plot_inv_res, t
device, /close


device, set_resolution=[1000,800], SET_FONT='Times',decomposed=0, z_buffering=1, set_pixel_depth=24
LOADCT,39 
erase,255
!P.BACKGROUND=255
!P.COLOR=0
!P.Font=1
plot, wavelengths, cub_data1[bestgeom1,*], thick=4,xtitle='Wavelength ('+string(181B)+'m)',ytitle='Reflectance & error',charsize=4,$
charthick=4,  yrange=[0.,1.], ystyle=1, xthick=4, ythick=4, xrange=[0.8,2.], xstyle=1
oplot, wavelengths, cub_simu[line1,bestfit1,*], color=250, thick=4
oplot, wavelengths, abs(cub_simu[line1,bestfit1,*]-cub_data1[bestgeom1,*]), color=50, thick=4
legend, ['Measure'], psym=0, thick=4, pos=[530, 690],CHARthick=4,charsize=3,COLORS=0,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
legend, ['Simulation'], psym=0, thick=4, pos=[530, 650],CHARthick=4,charsize=3,COLORS=250,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
legend, ['Error'], psym=0, thick=4, pos=[530, 610],CHARthick=4,charsize=3,COLORS=50,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
t=tvrd(true=1)
write_png, plot_fit_err_1, t
device, /close

device, set_resolution=[1000,800], SET_FONT='Times',decomposed=0, z_buffering=1, set_pixel_depth=24
LOADCT,39 
erase,255
!P.BACKGROUND=255
!P.COLOR=0
!P.Font=1
plot, wavelengths, cub_data3[bestgeom3,*], thick=4,xtitle='Wavelength ('+string(181B)+'m)',ytitle='Reflectance & error',charsize=4,$
charthick=4,  yrange=[0.,1.], ystyle=1, xthick=4, ythick=4, xrange=[0.8,2.], xstyle=1
oplot, wavelengths, cub_simu[line3,bestfit3,*], color=250, thick=4
oplot, wavelengths, abs(cub_simu[line3,bestfit3,*]-cub_data3[bestgeom3,*]), color=50, thick=4
legend, ['Measure'], psym=0, thick=4, pos=[530, 690],CHARthick=4,charsize=3,COLORS=0,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
legend, ['Simulation'], psym=0, thick=4, pos=[530, 650],CHARthick=4,charsize=3,COLORS=250,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
legend, ['Error'], psym=0, thick=4, pos=[530, 610],CHARthick=4,charsize=3,COLORS=50,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
t=tvrd(true=1)
write_png, plot_fit_err_2, t
device, /close


device, set_resolution=[1000,800], SET_FONT='Times',decomposed=0, z_buffering=1, set_pixel_depth=24
LOADCT,39 
erase,255
!P.BACKGROUND=255
!P.COLOR=0
!P.Font=1
plot, wavelengths, cub_data6[bestgeom6,*], thick=4,xtitle='Wavelength ('+string(181B)+'m)',ytitle='Reflectance & error',charsize=4,$
charthick=4,  yrange=[0.,1.], ystyle=1, xthick=4, ythick=4, xrange=[0.8,2.], xstyle=1
oplot, wavelengths, cub_simu[line6,bestfit6,*], color=250, thick=4
oplot, wavelengths, abs(cub_simu[line6,bestfit6,*]-cub_data6[bestgeom6,*]), color=50, thick=4
legend, ['Measure'], psym=0, thick=4, pos=[530, 690],CHARthick=4,charsize=3,COLORS=0,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
legend, ['Simulation'], psym=0, thick=4, pos=[530, 650],CHARthick=4,charsize=3,COLORS=250,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
legend, ['Error'], psym=0, thick=4, pos=[530, 610],CHARthick=4,charsize=3,COLORS=50,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
t=tvrd(true=1)
write_png, plot_fit_err_3, t
device, /close


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

set_plot, 'X'
endelse

;print, param_cub_data1[bestgeom1,*], param_cub_data3[bestgeom3,*], param_cub_data6[bestgeom6,*]
print, "done"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

end
