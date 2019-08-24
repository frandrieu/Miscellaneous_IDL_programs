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


pro invers_spectres_IPAG_5
plot_option=0 ; 0=X ; 1=Z
marginal_densities=1
incidence=60.
emergence=20.
azimut=90.
errfact=1.
sigma=0.0004;0.0025
sigma2=0.0001
;sigma=0.0025;0.0025
;sigma2=0.0001
wavelength=1.1
;n=23

;num_wave :  0 <--> 0.6µm 
;           10 <--> 0.8µm 
;           20 <--> 1.0µm 
;           31 <--> 1.2µm 
;           46 <--> 1.5µm 
;           61 <--> 1.8µm 
;  

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
plot_fit_1='/home/fandrieu/Inversion/Spectres_eau_IPAG/Valid_results/rough_0.42_brdf/fit_glace1e.png'
plot_fit_2='/home/fandrieu/Inversion/Spectres_eau_IPAG/Valid_results/rough_0.42_brdf/fit_glace3e.png'
plot_fit_3='/home/fandrieu/Inversion/Spectres_eau_IPAG/Valid_results/rough_0.42_brdf/fit_glace6e.png'
plot_err_1='/home/fandrieu/Inversion/Spectres_eau_IPAG/Valid_results/rough_0.42_brdf/plot_diffs_glace1e.png'
plot_err_2='/home/fandrieu/Inversion/Spectres_eau_IPAG/Valid_results/rough_0.42_brdf/plot_diffs_glace3e.png'
plot_err_3='/home/fandrieu/Inversion/Spectres_eau_IPAG/Valid_results/rough_0.42_brdf/plot_diffs_glace6e.png'
plot_par_1='/home/fandrieu/Inversion/Spectres_eau_IPAG/Valid_results/rough_0.42_brdf/plot_grain_glace1e.png'
plot_par_2='/home/fandrieu/Inversion/Spectres_eau_IPAG/Valid_results/rough_0.42_brdf/plot_grain_glace3e.png'
plot_par_3='/home/fandrieu/Inversion/Spectres_eau_IPAG/Valid_results/rough_0.42_brdf/plot_grain_glace6e.png'
plot_par_1b='/home/fandrieu/Inversion/Spectres_eau_IPAG/Valid_results/rough_0.42_brdf/plot_h_glace1e.png'
plot_par_2b='/home/fandrieu/Inversion/Spectres_eau_IPAG/Valid_results/rough_0.42_brdf/plot_h_glace3e.png'
plot_par_3b='/home/fandrieu/Inversion/Spectres_eau_IPAG/Valid_results/rough_0.42_brdf/plot_h_glace6e.png'
plot_par_123='/home/fandrieu/Inversion/Spectres_eau_IPAG/Valid_results/rough_0.42_brdf/plot_grain_glace1e3e6e.png'
plot_par_123b='/home/fandrieu/Inversion/Spectres_eau_IPAG/Valid_results/rough_0.42_brdf/plot_h_glace1e3e6e.png'
plot_fit_123='/home/fandrieu/Inversion/Spectres_eau_IPAG/Valid_results/rough_0.42_brdf/fit_glace1e3e6e.png'
plot_err_123='/home/fandrieu/Inversion/Spectres_eau_IPAG/Valid_results/rough_0.42_brdf/plot_diffs_glace1e3e6e.png'
plot_fit_err_1='/home/fandrieu/Inversion/Spectres_eau_IPAG/Valid_results/rough_0.42_brdf/fit_and_diff_glace1e.png'
plot_fit_err_2='/home/fandrieu/Inversion/Spectres_eau_IPAG/Valid_results/rough_0.42_brdf/fit_and_diff_glace3e.png'
plot_fit_err_3='/home/fandrieu/Inversion/Spectres_eau_IPAG/Valid_results/rough_0.42_brdf/fit_and_diff_glace6e.png'
plot_par_2d_1='/home/fandrieu/Inversion/Spectres_eau_IPAG/Valid_results/rough_0.42_brdf/plot_L_2d_glace1e.png'
plot_par_2d_2='/home/fandrieu/Inversion/Spectres_eau_IPAG/Valid_results/rough_0.42_brdf/plot_L_2d_glace3e.png'
plot_par_2d_3='/home/fandrieu/Inversion/Spectres_eau_IPAG/Valid_results/rough_0.42_brdf/plot_L_2d_glace6e.png'
plot_inv_res='/home/fandrieu/Inversion/Spectres_eau_IPAG/Valid_results/rough_0.42_brdf/Inversion_final_result.png'
plot_phase_11='/home/fandrieu/Inversion/Spectres_eau_IPAG/Valid_results/rough_0.42_brdf/plot_phase_11.png'
plot_phase_12='/home/fandrieu/Inversion/Spectres_eau_IPAG/Valid_results/rough_0.42_brdf/plot_phase_12.png'
plot_phase_13='/home/fandrieu/Inversion/Spectres_eau_IPAG/Valid_results/rough_0.42_brdf/plot_phase_13.png'
plot_phase_14='/home/fandrieu/Inversion/Spectres_eau_IPAG/Valid_results/rough_0.42_brdf/plot_phase_14.png'
plot_phase_31='/home/fandrieu/Inversion/Spectres_eau_IPAG/Valid_results/rough_0.42_brdf/plot_phase_31.png'
plot_phase_32='/home/fandrieu/Inversion/Spectres_eau_IPAG/Valid_results/rough_0.42_brdf/plot_phase_32.png'
plot_phase_33='/home/fandrieu/Inversion/Spectres_eau_IPAG/Valid_results/rough_0.42_brdf/plot_phase_33.png'
plot_phase_34='/home/fandrieu/Inversion/Spectres_eau_IPAG/Valid_results/rough_0.42_brdf/plot_phase_34.png'
plot_phase_61='/home/fandrieu/Inversion/Spectres_eau_IPAG/Valid_results/rough_0.42_brdf/plot_phase_61.png'
plot_phase_62='/home/fandrieu/Inversion/Spectres_eau_IPAG/Valid_results/rough_0.42_brdf/plot_phase_62.png'
plot_phase_63='/home/fandrieu/Inversion/Spectres_eau_IPAG/Valid_results/rough_0.42_brdf/plot_phase_63.png'
plot_phase_64='/home/fandrieu/Inversion/Spectres_eau_IPAG/Valid_results/rough_0.42_brdf/plot_phase_64.png'

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

wawa=where(abs(wavelength-wavelengths) lt 0.005)
n=wawa[0]
if(n eq -1) then n=0
w_cut=wavelengths[n]

sd=size(cub_data)
ss=size(cub_simu)
n_par=ss[2]
ltot1=fltarr(sg[1],ss[2])
renorm_factor_sd6=fltarr(sg[1])
dutot=fltarr(sg[1]*(n_waves-n))
dudetot=fltarr(n_par,sg[1]*(n_waves-n))
rustutot=fltarr(sg[1]*(n_waves-n))
for gege=0, sg[1]-1 do begin
incidence=param_cub_data1[gege,0]
emergence=param_cub_data1[gege,1]
azimut=param_cub_data1[gege,2]

cub_data=cub_data1

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


dutot[gege*(n_waves-n):(gege+1)*(n_waves-n)-1]=du
dudetot[*,gege*(n_waves-n):(gege+1)*(n_waves-n)-1]=dude
rustutot[gege*(n_waves-n):(gege+1)*(n_waves-n)-1]=rustu
endif else begin 
h1[gege]=-1.
sig_h1[gege]=-1.
g1[gege]=-1.
sig_g1[gege]=-1.
endelse
endfor
;invertC=diag_matrix(rustutot)
;L1=vraissemblance_ln_mat(dutot, dudetot, invertC, n_par)
invertC=rustutot
L1=vraissemblance_ln_vec(dutot, dudetot, invertC, n_par)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
bf=where(l1 eq max(l1))
renorm_factor_1=min(abs(L1))
L1=L1+renorm_factor_1
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
h_1e=total(h_x*l_h_1e*0.1)
sigma_h_1e=sqrt(total(l_h_1e*0.1*(h_x-h_1e)^2))
g_1e=total(g_x[w1]*0.5*l_g_1e[w1])+total(g_x[w2]*5.*l_g_1e[w2])+total(g_x[w3]*25.*l_g_1e[w3])
sigma_g_1e=sqrt(total(l_g_1e[w1]*0.5*(g_x[w1]-g_1e)^2)+total(l_g_1e[w2]*5.*(g_x[w2]-g_1e)^2)+$
total(l_g_1e[w3]*25.*(g_x[w3]-g_1e)^2))

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
ss=size(cub_simu)
n_par=ss[2]
ltot3=fltarr(sg[1],ss[2])
for gege=0, sg[1]-1 do begin
incidence=param_cub_data3[gege,0]
emergence=param_cub_data3[gege,1]
azimut=param_cub_data3[gege,2]

cub_data=cub_data3
sd=size(cub_data)

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
dutot[gege*(n_waves-n):(gege+1)*(n_waves-n)-1]=du
dudetot[*,gege*(n_waves-n):(gege+1)*(n_waves-n)-1]=dude
rustutot[gege*(n_waves-n):(gege+1)*(n_waves-n)-1]=rustu
endif else begin 
h3[gege]=-1.
sig_h3[gege]=-1.
g3[gege]=-1.
sig_g3[gege]=-1.
endelse
endfor
;invertC=diag_matrix(rustutot)
;L3=vraissemblance_ln_mat(dutot, dudetot, invertC, n_par)
invertC=rustutot
L3=vraissemblance_ln_vec(dutot, dudetot, invertC, n_par)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
bf=where(l3 eq max(l3))
renorm_factor_3=min(abs(L3))
L3=L3+renorm_factor_3
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
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
h_3e=total(h_x*l_h_3e*0.1)
sigma_h_3e=sqrt(total(l_h_3e*0.1*(h_x-h_3e)^2))
g_3e=total(g_x[w1]*0.5*l_g_3e[w1])+total(g_x[w2]*5.*l_g_3e[w2])+total(g_x[w3]*25.*l_g_3e[w3])
sigma_g_3e=sqrt(total(l_g_3e[w1]*0.5*(g_x[w1]-g_3e)^2)+total(l_g_3e[w2]*5.*(g_x[w2]-g_3e)^2)+$
total(l_g_3e[w3]*25.*(g_x[w3]-g_3e)^2))


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
ss=size(cub_simu)
n_par=ss[2]
ltot6=fltarr(sg[1], n_par)
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
dutot[gege*(n_waves-n):(gege+1)*(n_waves-n)-1]=du
dudetot[*,gege*(n_waves-n):(gege+1)*(n_waves-n)-1]=dude
rustutot[gege*(n_waves-n):(gege+1)*(n_waves-n)-1]=rustu
endif else begin 
h3[gege]=-1.
sig_h3[gege]=-1.
g3[gege]=-1.
sig_g3[gege]=-1.
endelse
endfor
;invertC=diag_matrix(rustutot)
;L6=vraissemblance_ln_mat(dutot, dudetot, invertC, n_par)
invertC=rustutot
L6=vraissemblance_ln_vec(dutot, dudetot, invertC, n_par)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
bf=where(l6 eq max(l6))
renorm_factor_6=min(abs(L6))
L6=L6+renorm_factor_6
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
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
h_6e=total(h_x*l_h_6e*0.1)
sigma_h_6e=sqrt(total(l_h_6e*0.1*(h_x-h_6e)^2))
g_6e=total(g_x[w1]*0.5*l_g_6e[w1])+total(g_x[w2]*5.*l_g_6e[w2])+total(g_x[w3]*25.*l_g_6e[w3])
sigma_g_6e=sqrt(total(l_g_6e[w1]*0.5*(g_x[w1]-g_6e)^2)+total(l_g_6e[w2]*5.*(g_x[w2]-g_6e)^2)+$
total(l_g_6e[w3]*25.*(g_x[w3]-g_6e)^2))

print,'inversion time : '
invtutu=systime(1)
print, invtutu-tutu

simthick=[h_1e, h_3e, h_6e]
simerr=2.*[sigma_h_1e, sigma_h_3e, sigma_h_6e]

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

;6e  0:20 1:21 2:23 3:28
;3e  0:10 1:23 2:28 3:29
;1e  0:16 1:23 2:24 1:27
if (plot_option eq 0) then begin


;num_wave1=38
;plot_simu=cub_simu[*,*,num_wave1]
;window, 0
;device,  decomposed=0
;LOADCT,39 
;erase,255
;!P.BACKGROUND=255
;!P.COLOR=0
;!P.Font=1
;plot, phase_dat3, cub_data3[*,num_wave1], psym=1, symsize=2,  $;yrange=[0.,0.01],
;title='Diffuse reflectance at '+'!9l'+'!1 ='+string(wavelengths[num_wave1], format='(f3.1)')+' '+string(181B)+'m', $
;xtitle='Phase angle '+'!9a'+'!1 ('+string(176B)+')', ytitle='R'
;oplot, phase2[*,wbest3], plot_simu[wbest3], psym=1, color=250, symsize=2
;;oplot, phase_dat3, cub_data23[*,26], psym=1, symsize=2
;;oplot, phase2[*,wbest3], plot_simu[wbest3], psym=1, color=150, symsize=2
;;oplot, phase_dat6, cub_data6[*,26], psym=1, symsize=2
;;oplot, phase2[*,wbest3], plot_simu[wbest6], psym=1, color=50, symsize=2
;num_wave2=39
;plot_simu=cub_simu[*,*,num_wave2]
;window, 1
;device,  decomposed=0
;LOADCT,39 
;erase,255
;!P.BACKGROUND=255
;!P.COLOR=0
;!P.Font=1
;plot, phase_dat3, cub_data3[*,num_wave2], psym=1, symsize=2, $
;title='Diffuse reflectance at '+'!9l'+'!1 ='+string(wavelengths[num_wave2], format='(f3.1)')+' '+string(181B)+'m', $
;xtitle='Phase angle '+'!9a'+'!1 ('+string(176B)+')', ytitle='R'
;oplot, phase2[*,wbest3], plot_simu[wbest3], psym=1, color=250, symsize=2
;
;num_wave2=40
;plot_simu=cub_simu[*,*,num_wave2]
;window, 2
;device,  decomposed=0
;LOADCT,39 
;erase,255
;!P.BACKGROUND=255
;!P.COLOR=0
;!P.Font=1
;plot, phase_dat3, cub_data3[*,num_wave2], psym=1, symsize=2, $
;title='Diffuse reflectance at '+'!9l'+'!1 ='+string(wavelengths[num_wave2], format='(f3.1)')+' '+string(181B)+'m', $
;xtitle='Phase angle '+'!9a'+'!1 ('+string(176B)+')', ytitle='R'
;oplot, phase2[*,wbest3], plot_simu[wbest3], psym=1, color=250, symsize=2
;
;num_wave2=41
;plot_simu=cub_simu[*,*,num_wave2]
;window, 3
;device,  decomposed=0
;LOADCT,39 
;erase,255
;!P.BACKGROUND=255
;!P.COLOR=0
;!P.Font=1
;plot, phase_dat3, cub_data3[*,num_wave2], psym=1, symsize=2, $
;title='Diffuse reflectance at '+'!9l'+'!1 ='+string(wavelengths[num_wave2], format='(f3.1)')+' '+string(181B)+'m', $
;xtitle='Phase angle '+'!9a'+'!1 ('+string(176B)+')', ytitle='R'
;oplot, phase2[*,wbest3], plot_simu[wbest3], psym=1, color=250, symsize=2
;
;num_wave2=42
;plot_simu=cub_simu[*,*,num_wave2]
;window, 4
;device,  decomposed=0
;LOADCT,39 
;erase,255
;!P.BACKGROUND=255
;!P.COLOR=0
;!P.Font=1
;plot, phase_dat3, cub_data3[*,num_wave2], psym=1, symsize=2, $
;title='Diffuse reflectance at '+'!9l'+'!1 ='+string(wavelengths[num_wave2], format='(f3.1)')+' '+string(181B)+'m', $
;xtitle='Phase angle '+'!9a'+'!1 ('+string(176B)+')', ytitle='R'
;oplot, phase2[*,wbest3], plot_simu[wbest3], psym=1, color=250, symsize=2
wust=where(param_cub_data6[*,0] lt 65.)
num_wave1=30
plot_simu=cub_simu[*,*,num_wave1]
window, 0
device,  decomposed=0
LOADCT,39 
erase,255
!P.BACKGROUND=255
!P.COLOR=0
!P.Font=1
plot, phase_dat6[wust], cub_data6[wust,num_wave1], psym=1, symsize=2,  $;yrange=[0.,0.01],
title='Diffuse reflectance at '+'!9l'+'!1 ='+string(wavelengths[num_wave1], format='(f3.1)')+' '+string(181B)+'m', $
xtitle='Phase angle '+'!9a'+'!1 ('+string(176B)+')', ytitle='R'
oplot, phase2[*,wbest6], plot_simu[wbest6], psym=1, color=250, symsize=2
;oplot, phase_dat6, cub_data23[*,26], psym=1, symsize=2
;oplot, phase2[*,wbest6], plot_simu[wbest6], psym=1, color=150, symsize=2
;oplot, phase_dat6, cub_data6[*,26], psym=1, symsize=2
;oplot, phase2[*,wbest6], plot_simu[wbest6], psym=1, color=50, symsize=2
num_wave2=31
plot_simu=cub_simu[*,*,num_wave2]
window, 1
device,  decomposed=0
LOADCT,39 
erase,255
!P.BACKGROUND=255
!P.COLOR=0
!P.Font=1
plot, phase_dat6[wust], cub_data6[wust,num_wave2], psym=1, symsize=2, $
title='Diffuse reflectance at '+'!9l'+'!1 ='+string(wavelengths[num_wave2], format='(f3.1)')+' '+string(181B)+'m', $
xtitle='Phase angle '+'!9a'+'!1 ('+string(176B)+')', ytitle='R'
oplot, phase2[*,wbest6], plot_simu[wbest6], psym=1, color=250, symsize=2

num_wave2=32
plot_simu=cub_simu[*,*,num_wave2]
window, 2
device,  decomposed=0
LOADCT,39 
erase,255
!P.BACKGROUND=255
!P.COLOR=0
!P.Font=1
plot, phase_dat6[wust], cub_data6[wust,num_wave2], psym=1, symsize=2, $
title='Diffuse reflectance at '+'!9l'+'!1 ='+string(wavelengths[num_wave2], format='(f3.1)')+' '+string(181B)+'m', $
xtitle='Phase angle '+'!9a'+'!1 ('+string(176B)+')', ytitle='R'
oplot, phase2[*,wbest6], plot_simu[wbest6], psym=1, color=250, symsize=2

num_wave2=33
plot_simu=cub_simu[*,*,num_wave2]
window, 3
device,  decomposed=0
LOADCT,39 
erase,255
!P.BACKGROUND=255
!P.COLOR=0
!P.Font=1
plot, phase_dat6[wust], cub_data6[wust,num_wave2], psym=1, symsize=2, $
title='Diffuse reflectance at '+'!9l'+'!1 ='+string(wavelengths[num_wave2], format='(f3.1)')+' '+string(181B)+'m', $
xtitle='Phase angle '+'!9a'+'!1 ('+string(176B)+')', ytitle='R'
oplot, phase2[*,wbest6], plot_simu[wbest6], psym=1, color=250, symsize=2

num_wave2=34
plot_simu=cub_simu[*,*,num_wave2]
window, 4
device,  decomposed=0
LOADCT,39 
erase,255
!P.BACKGROUND=255
!P.COLOR=0
!P.Font=1
plot, phase_dat6[wust], cub_data6[wust,num_wave2], psym=1, symsize=2, $
title='Diffuse reflectance at '+'!9l'+'!1 ='+string(wavelengths[num_wave2], format='(f3.1)')+' '+string(181B)+'m', $
xtitle='Phase angle '+'!9a'+'!1 ('+string(176B)+')', ytitle='R'
oplot, phase2[*,wbest6], plot_simu[wbest6], psym=1, color=250, symsize=2

num_wave=35
plot_simu=cub_simu[*,*,num_wave2]
window, 5
device,  decomposed=0
LOADCT,39 
erase,255
!P.BACKGROUND=255
!P.COLOR=0
!P.Font=1
plot, phase_dat6[wust], cub_data6[wust,num_wave2], psym=1, symsize=2, $
title='Diffuse reflectance at '+'!9l'+'!1 ='+string(wavelengths[num_wave2], format='(f3.1)')+' '+string(181B)+'m', $
xtitle='Phase angle '+'!9a'+'!1 ('+string(176B)+')', ytitle='R'
oplot, phase2[*,wbest6], plot_simu[wbest6], psym=1, color=250, symsize=2


num_wave2=36
plot_simu=cub_simu[*,*,num_wave2]
window, 6
device,  decomposed=0
LOADCT,39 
erase,255
!P.BACKGROUND=255
!P.COLOR=0
!P.Font=1
plot, phase_dat6[wust], cub_data6[wust,num_wave2], psym=1, symsize=2, $
title='Diffuse reflectance at '+'!9l'+'!1 ='+string(wavelengths[num_wave2], format='(f3.1)')+' '+string(181B)+'m', $
xtitle='Phase angle '+'!9a'+'!1 ('+string(176B)+')', ytitle='R'
oplot, phase2[*,wbest6], plot_simu[wbest6], psym=1, color=250, symsize=2


num_wave2=37
plot_simu=cub_simu[*,*,num_wave2]
window, 7
device,  decomposed=0
LOADCT,39 
erase,255
!P.BACKGROUND=255
!P.COLOR=0
!P.Font=1
plot, phase_dat6[wust], cub_data6[wust,num_wave2], psym=1, symsize=2, $
title='Diffuse reflectance at '+'!9l'+'!1 ='+string(wavelengths[num_wave2], format='(f3.1)')+' '+string(181B)+'m', $
xtitle='Phase angle '+'!9a'+'!1 ('+string(176B)+')', ytitle='R'
oplot, phase2[*,wbest6], plot_simu[wbest6], psym=1, color=250, symsize=2


num_wave2=38
plot_simu=cub_simu[*,*,num_wave2]
window, 8
device,  decomposed=0
LOADCT,39 
erase,255
!P.BACKGROUND=255
!P.COLOR=0
!P.Font=1
plot, phase_dat6[wust], cub_data6[wust,num_wave2], psym=1, symsize=2, $
title='Diffuse reflectance at '+'!9l'+'!1 ='+string(wavelengths[num_wave2], format='(f3.1)')+' '+string(181B)+'m', $
xtitle='Phase angle '+'!9a'+'!1 ('+string(176B)+')', ytitle='R'
oplot, phase2[*,wbest6], plot_simu[wbest6], psym=1, color=250, symsize=2

num_wave2=39
plot_simu=cub_simu[*,*,num_wave2]
window, 9
device,  decomposed=0
LOADCT,39 
erase,255
!P.BACKGROUND=255
!P.COLOR=0
!P.Font=1
plot, phase_dat6[wust], cub_data6[wust,num_wave2], psym=1, symsize=2, $
title='Diffuse reflectance at '+'!9l'+'!1 ='+string(wavelengths[num_wave2], format='(f3.1)')+' '+string(181B)+'m', $
xtitle='Phase angle '+'!9a'+'!1 ('+string(176B)+')', ytitle='R'
oplot, phase2[*,wbest6], plot_simu[wbest6], psym=1, color=250, symsize=2



window, 5
device,  decomposed=0
LOADCT,39 
erase,255
!P.BACKGROUND=255
!P.COLOR=0
!P.Font=1
plot, h_x, l_h_1e, title='Marginal Probability Density Functions for the Thickness of the slab', ytitle='Marginal PDF',$
xtitle='Thickness of the slab (mm)',ystyle=1., charsize=1, charthick=2, xthick=2, ythick=2
oplot, h_x, l_h_1e, color=250, thick=2
oplot, h_x, l_h_3e, color=150, thick=2
oplot, h_x, l_h_6e, color=50, thick=2
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
plot, g_x, l_g_3e, title='Marginal Probability Density Functions for the Grainsize of the snow', ytitle='Marginal PDF',$
xtitle='Grainsize of the snow ('+string(181B)+'m)',charsize=1, charthick=2, xthick=2, ythick=2, yrange=[0.,1.5*max(l_g_1e)]
oplot, g_x, l_g_6e, color=50, thick=2
oplot, g_x, l_g_3e, color=150, thick=2
oplot, g_x, l_g_1e, color=250, thick=2
legend, ['Sample 1'], psym=0, thick=2, pos=[580, 480],CHARTHICK=2,CHARSIZE=1,COLORS=250,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
legend, ['Sample 2'], psym=0, thick=2, pos=[580, 450],CHARTHICK=2,CHARSIZE=1,COLORS=150,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
legend, ['Sample 3'], psym=0, thick=2, pos=[580, 420],CHARTHICK=2,CHARSIZE=1,COLORS=50,TEXTCOLORS=0,OUTLINE_COLOR=255,/device

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
oplot, xval, simthick, color=250, psym=1, thick=2
errplot,xval, simthick-simerr, simthick+simerr, color=250, thick=2
legend, ['Measure'], psym=0, thick=2, pos=[140, 460],CHARTHICK=2,CHARSIZE=1,COLORS=0,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
legend, ['Inversion'], psym=0, thick=2, pos=[140, 430],CHARTHICK=2,CHARSIZE=1,COLORS=250,TEXTCOLORS=0,OUTLINE_COLOR=255,/device

endif else begin 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

set_plot, 'z'

device, set_resolution=[1000,800], SET_FONT='Times',decomposed=0, z_buffering=1, set_pixel_depth=24
LOADCT,39 
erase,255
!P.BACKGROUND=255
!P.COLOR=0
!P.Font=1
plot, g_x, l_g_3e, ytitle='Marginal PDF',$;, title='Marginal Probability Density Functions for the Grainsize of the snow'
xtitle='Grainsize of the snow ('+string(181B)+'m)',charsize=4, charthick=4, /nodata, xthick=4, ythick=4, yrange=[0.,1.5*max(l_g_1e)]
oplot, g_x, l_g_6e, color=50, thick=4
oplot, g_x, l_g_3e, color=150, thick=4
oplot, g_x, l_g_1e, color=250, thick=4
legend, ['Sample 1'], psym=0, thick=4, pos=[530, 690],CHARTHICK=2,CHARSIZE=3,COLORS=250,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
legend, ['Sample 2'], psym=0, thick=4, pos=[530, 650],CHARTHICK=2,CHARSIZE=3,COLORS=150,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
legend, ['Sample 3'], psym=0, thick=4, pos=[530, 610],CHARTHICK=2,CHARSIZE=3,COLORS=50,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
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
plot, g_x, l_g_1e, title='Marginal Probability Density Functions for the Grainsize of the snow', ytitle='Marginal PDF',$
xtitle='Grainsize of the snow ('+string(181B)+'m)',subtitle='Sample 1', charsize=2, charthick=4, /nodata, xthick=4, ythick=4
oplot, g_x, l_g_1e, thick=4
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
plot, g_x, l_g_3e, title='Marginal Probability Density Functions for the Grainsize of the snow', ytitle='Marginal PDF',$
xtitle='Grainsize of the snow ('+string(181B)+'m)',subtitle='Sample 2',charsize=2, charthick=4, /nodata, xthick=4, ythick=4
oplot, g_x, l_g_3e, thick=4
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
plot, g_x, l_g_6e, title='Marginal Probability Density Functions for the Grainsize of the snow', ytitle='Marginal PDF',$
xtitle='Grainsize of the snow ('+string(181B)+'m)',subtitle='Sample 3',charsize=2, charthick=4, /nodata, xthick=4, ythick=4
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
plot, h_x, l_h_1e, title='Marginal Probability Density Functions for the Thickness of the slab', ytitle='Marginal PDF',$
xtitle='Thickness of the slab (mm)',subtitle='Sample 1', charsize=2, charthick=4, /nodata, xthick=4, ythick=4
oplot, h_x, l_h_1e, thick=4
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
plot, h_x, l_h_3e, title='Marginal Probability Density Functions for the Thickness of the slab', ytitle='Marginal PDF',$
xtitle='Thickness of the slab (mm)',subtitle='Sample 2',charsize=2, charthick=4, /nodata, xthick=4, ythick=4
oplot, h_x, l_h_3e, thick=4
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
plot, h_x, l_h_6e, ytitle='Marginal PDF',$;, title='Marginal Probability Density Functions for the Thickness of the slab'
xtitle='Thickness of the slab (mm)',subtitle='Sample 3',charsize=4, charthick=4, /nodata, xthick=4, ythick=4
oplot, h_x, l_h_6e, thick=4
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
plot, h_x, l_h_1e, ytitle='Marginal PDF', yrange=[0.,15.],$
xtitle='Thickness of the slab (mm)',ystyle=1., charsize=4, charthick=4, /nodata, xthick=4, ythick=4;, title='Marginal Probability Density Functions for the Thickness of the slab'
oplot, h_x, l_h_1e, color=250, thick=4
oplot, h_x, l_h_3e, color=150, thick=4
oplot, h_x, l_h_6e, color=50, thick=4
legend, ['Sample 1'], psym=0, thick=4, pos=[530, 690],CHARTHICK=2,CHARSIZE=3,COLORS=250,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
legend, ['Sample 2'], psym=0, thick=4, pos=[530, 650],CHARTHICK=2,CHARSIZE=3,COLORS=150,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
legend, ['Sample 3'], psym=0, thick=4, pos=[530, 610],CHARTHICK=2,CHARSIZE=3,COLORS=50,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
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
xval=(findgen(3)+1)/4.
plot, xval, thick, psym=1, xticks=2, ytitle='Slab thickness (mm)', xtickname=names,xrange=[0.,1.],$
yrange=[0,max(thick+err)+0.1], charsize=2, xtickv=xval, thick=4, xthick=4, ythick=4
errplot,xval, thick-err, thick+err, thick=4
oplot, xval, simthick, color=250, psym=1, thick=4
errplot,xval, simthick-simerr, simthick+simerr, color=250, thick=4
legend, ['Measure'], psym=0, thick=4, pos=[200, 740],CHARTHICK=2,CHARSIZE=3,COLORS=0,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
legend, ['Inversion'], psym=0, thick=4, pos=[200, 710],CHARTHICK=2,CHARSIZE=3,COLORS=250,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
t=tvrd(true=1)
write_png, plot_inv_res, t
device, /close


;6e  0:20 1:21 2:23 3:28
;3e  0:10 1:23 2:28 3:29
;1e  0:16 1:23 2:24 1:27
num_wave1=22
plot_simu=cub_simu[*,*,num_wave1]
device, set_resolution=[1000,800], SET_FONT='Times',decomposed=0, z_buffering=1, set_pixel_depth=24
LOADCT,39 
erase,255
!P.BACKGROUND=255
!P.COLOR=0
!P.Font=1
plot, phase_dat1, cub_data1[*,num_wave1],psym=1,symsize=3, thick=4,charsize=4, xrange=[20.,80.], $
title='Diffuse reflectance at  '+'!9l'+'!1 ='+string(wavelengths[num_wave1], format='(f3.1)')+' '+string(181B)+'m', $
xtitle='Phase angle '+'!9a'+'!1  ('+string(176B)+')', ytitle='R', charthick=4, xthick=4, ythick=4, yrange=[0.,0.7], ystyle=1
oplot, phase2[*,wbest1], plot_simu[wbest1], psym=6, symsize=3,  thick=3, color=250
legend, ['Measure'], psym=1, thick=4, pos=[340, 300],CHARTHICK=2,CHARSIZE=3,COLORS=0,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
legend, ['Simulation'], psym=6, thick=3, pos=[340, 260],CHARTHICK=2,CHARSIZE=3,COLORS=250,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
;legend, ['Snow'], psym=1, thick=4, pos=[140, 450],CHARthick=4,CHARSIZE=2,COLORS=0,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
;legend, ['Snow covered by a thin ice slab'], psym=6, thick=4, pos=[140, 420],CHARthick=4,CHARSIZE=2,COLORS=250,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
t=tvrd(true=1)
write_png, plot_phase_11, t
device, /close

num_wave2=24
plot_simu=cub_simu[*,*,num_wave2]
device, set_resolution=[1000,800], SET_FONT='Times',decomposed=0, z_buffering=1, set_pixel_depth=24
LOADCT,39 
erase,255
!P.BACKGROUND=255
!P.COLOR=0
!P.Font=1
plot, phase_dat1, cub_data1[*,num_wave2],psym=1,symsize=3, thick=4,charsize=4, xrange=[20.,80.], $
title='Diffuse reflectance at  '+'!9l'+'!1 ='+string(wavelengths[num_wave2], format='(f3.1)')+' '+string(181B)+'m', $
xtitle='Phase angle '+'!9a'+'!1  ('+string(176B)+')', ytitle='R', charthick=4, xthick=4, ythick=4, yrange=[0.,0.7], ystyle=1
oplot, phase2[*,wbest1], plot_simu[wbest1], psym=6, symsize=3,  thick=3, color=250
legend, ['Measure'], psym=1, thick=4, pos=[340, 300],CHARTHICK=2,CHARSIZE=3,COLORS=0,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
legend, ['Simulation'], psym=6, thick=3, pos=[340, 260],CHARTHICK=2,CHARSIZE=3,COLORS=250,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
;legend, ['Snow'], psym=1, thick=4, pos=[140, 450],CHARthick=4,CHARSIZE=2,COLORS=0,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
;legend, ['Snow covered by a thin ice slab'], psym=6, thick=4, pos=[140, 420],CHARthick=4,CHARSIZE=2,COLORS=250,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
t=tvrd(true=1)
write_png, plot_phase_12, t
device, /close

;num_wave3=27
;plot_simu=cub_simu[*,*,num_wave3]
;device, set_resolution=[1000,800], SET_FONT='Times',decomposed=0, z_buffering=1, set_pixel_depth=24
;LOADCT,39 
;erase,255
;!P.BACKGROUND=255
;!P.COLOR=0
;!P.Font=1
;plot, phase_dat1, cub_data1[*,num_wave3],psym=1,symsize=2, thick=4,charsize=2, xrange=[20.,80.], $
;title='Diffuse reflectance at  '+'!9l'+'!1 ='+string(wavelengths[num_wave3], format='(f3.1)')+' '+string(181B)+'m', $
;xtitle='Phase angle '+'!9a'+'!1  ('+string(176B)+')', ytitle='R', charthick=4, xthick=4, ythick=4, yrange=[0.,0.7], ystyle=1
;oplot, phase2[*,wbest1], plot_simu[wbest1], psym=6, symsize=2,  thick=3, color=250
;legend, ['Measure'], psym=1, thick=4, pos=[340, 300],CHARTHICK=2,CHARSIZE=2,COLORS=0,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
;legend, ['Inversion'], psym=6, thick=3, pos=[340, 260],CHARTHICK=2,CHARSIZE=2,COLORS=250,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
;;legend, ['Snow'], psym=1, thick=4, pos=[140, 450],CHARthick=4,CHARSIZE=2,COLORS=0,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
;;legend, ['Snow covered by a thin ice slab'], psym=6, thick=4, pos=[140, 420],CHARthick=4,CHARSIZE=2,COLORS=250,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
;t=tvrd(true=1)
;write_png, plot_phase_13, t
;device, /close

;num_wave3=28
;plot_simu=cub_simu[*,*,num_wave3]
;device, set_resolution=[1000,800], SET_FONT='Times',decomposed=0, z_buffering=1, set_pixel_depth=24
;LOADCT,39 
;erase,255
;!P.BACKGROUND=255
;!P.COLOR=0
;!P.Font=1
;plot, phase_dat1, cub_data1[*,num_wave3],psym=1,symsize=2, thick=4,charsize=2, xrange=[20.,80.], $
;title='Diffuse reflectance at  '+'!9l'+'!1 ='+string(wavelengths[num_wave3], format='(f3.1)')+' '+string(181B)+'m', $
;xtitle='Phase angle '+'!9a'+'!1  ('+string(176B)+')', ytitle='R', charthick=4, xthick=4, ythick=4, yrange=[0.,0.7], ystyle=1
;oplot, phase2[*,wbest1], plot_simu[wbest1], psym=6, symsize=2,  thick=3, color=250
;legend, ['Measure'], psym=1, thick=4, pos=[340, 300],CHARTHICK=2,CHARSIZE=2,COLORS=0,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
;legend, ['Inversion'], psym=6, thick=3, pos=[340, 260],CHARTHICK=2,CHARSIZE=2,COLORS=250,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
;;legend, ['Snow'], psym=1, thick=4, pos=[140, 450],CHARthick=4,CHARSIZE=2,COLORS=0,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
;;legend, ['Snow covered by a thin ice slab'], psym=6, thick=4, pos=[140, 420],CHARthick=4,CHARSIZE=2,COLORS=250,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
;t=tvrd(true=1)
;write_png, plot_phase_14, t
;device, /close


;6e  0:20 1:21 2:23 3:28
;3e  0:10 1:23 2:28 3:29
;1e  0:16 1:23 2:24 1:27
num_wave1=22
plot_simu=cub_simu[*,*,num_wave1]
device, set_resolution=[1000,800], SET_FONT='Times',decomposed=0, z_buffering=1, set_pixel_depth=24
LOADCT,39 
erase,255
!P.BACKGROUND=255
!P.COLOR=0
!P.Font=1
plot, phase_dat3, cub_data3[*,num_wave1],psym=1,symsize=3, thick=4,charsize=4, xrange=[20.,80.], $
title='Diffuse reflectance at  '+'!9l'+'!1 ='+string(wavelengths[num_wave1], format='(f3.1)')+' '+string(181B)+'m', $
xtitle='Phase angle '+'!9a'+'!1  ('+string(176B)+')', ytitle='R', charthick=4, xthick=4, ythick=4, yrange=[0.,0.7], ystyle=1
oplot, phase2[*,wbest3], plot_simu[wbest3], psym=6, symsize=3,  thick=3, color=250
legend, ['Measure'], psym=1, thick=4, pos=[340, 300],CHARTHICK=2,CHARSIZE=3,COLORS=0,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
legend, ['Simulation'], psym=6, thick=3, pos=[340, 260],CHARTHICK=2,CHARSIZE=3,COLORS=250,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
;legend, ['Snow'], psym=1, thick=4, pos=[140, 450],CHARthick=4,CHARSIZE=2,COLORS=0,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
;legend, ['Snow covered by a thin ice slab'], psym=6, thick=4, pos=[140, 420],CHARthick=4,CHARSIZE=2,COLORS=250,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
t=tvrd(true=1)
write_png, plot_phase_31, t
device, /close

;num_wave2=23
;plot_simu=cub_simu[*,*,num_wave2]
;device, set_resolution=[1000,800], SET_FONT='Times',decomposed=0, z_buffering=1, set_pixel_depth=24
;LOADCT,39 
;erase,255
;!P.BACKGROUND=255
;!P.COLOR=0
;!P.Font=1
;plot, phase_dat3, cub_data3[*,num_wave2],psym=1,symsize=2, thick=4,charsize=2, xrange=[20.,80.], $
;title='Diffuse reflectance at  '+'!9l'+'!1 ='+string(wavelengths[num_wave2], format='(f3.1)')+' '+string(181B)+'m', $
;xtitle='Phase angle '+'!9a'+'!1  ('+string(176B)+')', ytitle='R', charthick=4, xthick=4, ythick=4, yrange=[0.,0.7], ystyle=1
;oplot, phase2[*,wbest3], plot_simu[wbest3], psym=6, symsize=2,  thick=3, color=250
;legend, ['Measure'], psym=1, thick=4, pos=[340, 300],CHARTHICK=2,CHARSIZE=2,COLORS=0,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
;legend, ['Inversion'], psym=6, thick=3, pos=[340, 260],CHARTHICK=2,CHARSIZE=2,COLORS=250,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
;;legend, ['Snow'], psym=1, thick=4, pos=[140, 450],CHARthick=4,CHARSIZE=2,COLORS=0,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
;;legend, ['Snow covered by a thin ice slab'], psym=6, thick=4, pos=[140, 420],CHARthick=4,CHARSIZE=2,COLORS=250,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
;t=tvrd(true=1)
;write_png, plot_phase_32, t
;device, /close
;
;num_wave3=27
;plot_simu=cub_simu[*,*,num_wave3]
;device, set_resolution=[1000,800], SET_FONT='Times',decomposed=0, z_buffering=1, set_pixel_depth=24
;LOADCT,39 
;erase,255
;!P.BACKGROUND=255
;!P.COLOR=0
;!P.Font=1
;plot, phase_dat3, cub_data3[*,num_wave3],psym=1,symsize=2, thick=4,charsize=2, xrange=[20.,80.], $
;title='Diffuse reflectance at  '+'!9l'+'!1 ='+string(wavelengths[num_wave3], format='(f3.1)')+' '+string(181B)+'m', $
;xtitle='Phase angle '+'!9a'+'!1  ('+string(176B)+')', ytitle='R', charthick=4, xthick=4, ythick=4, yrange=[0.,0.7], ystyle=1
;oplot, phase2[*,wbest3], plot_simu[wbest3], psym=6, symsize=2,  thick=3, color=250
;legend, ['Measure'], psym=1, thick=4, pos=[340, 300],CHARTHICK=2,CHARSIZE=2,COLORS=0,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
;legend, ['Inversion'], psym=6, thick=3, pos=[340, 260],CHARTHICK=2,CHARSIZE=2,COLORS=250,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
;;legend, ['Snow'], psym=1, thick=4, pos=[140, 450],CHARthick=4,CHARSIZE=2,COLORS=0,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
;;legend, ['Snow covered by a thin ice slab'], psym=6, thick=4, pos=[140, 420],CHARthick=4,CHARSIZE=2,COLORS=250,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
;t=tvrd(true=1)
;write_png, plot_phase_33, t
;device, /close

num_wave3=28
plot_simu=cub_simu[*,*,num_wave3]
device, set_resolution=[1000,800], SET_FONT='Times',decomposed=0, z_buffering=1, set_pixel_depth=24
LOADCT,39 
erase,255
!P.BACKGROUND=255
!P.COLOR=0
!P.Font=1
plot, phase_dat3, cub_data3[*,num_wave3],psym=1,symsize=3, thick=4,charsize=4, xrange=[20.,80.], $
title='Diffuse reflectance at  '+'!9l'+'!1 ='+string(wavelengths[num_wave3], format='(f3.1)')+' '+string(181B)+'m', $
xtitle='Phase angle '+'!9a'+'!1  ('+string(176B)+')', ytitle='R', charthick=4, xthick=4, ythick=4, yrange=[0.,0.7], ystyle=1
oplot, phase2[*,wbest3], plot_simu[wbest3], psym=6, symsize=3,  thick=3, color=250
legend, ['Measure'], psym=1, thick=4, pos=[340, 300],CHARTHICK=2,CHARSIZE=3,COLORS=0,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
legend, ['Simulation'], psym=6, thick=3, pos=[340, 260],CHARTHICK=2,CHARSIZE=3,COLORS=250,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
;legend, ['Snow'], psym=1, thick=4, pos=[140, 450],CHARthick=4,CHARSIZE=2,COLORS=0,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
;legend, ['Snow covered by a thin ice slab'], psym=6, thick=4, pos=[140, 420],CHARthick=4,CHARSIZE=2,COLORS=250,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
t=tvrd(true=1)
write_png, plot_phase_34, t
device, /close


;6e  0:20 1:21 2:23 3:28
;3e  0:10 1:23 2:28 3:29
;1e  0:16 1:23 2:24 1:27
wust=where(param_cub_data6[*,0] lt 65.)
num_wave1=21
plot_simu=cub_simu[*,*,num_wave1]
device, set_resolution=[1000,800], SET_FONT='Times',decomposed=0, z_buffering=1, set_pixel_depth=24
LOADCT,39 
erase,255
!P.BACKGROUND=255
!P.COLOR=0
!P.Font=1
plot, phase_dat6[wust], cub_data6[wust,num_wave1],psym=1,symsize=3, thick=4,charsize=4, xrange=[20.,80.], $
title='Diffuse reflectance at  '+'!9l'+'!1 ='+string(wavelengths[num_wave1], format='(f3.1)')+' '+string(181B)+'m', $
xtitle='Phase angle '+'!9a'+'!1  ('+string(176B)+')', ytitle='R', charthick=4, xthick=4, ythick=4, yrange=[0.,0.7], ystyle=1
oplot, phase2[*,wbest6], plot_simu[wbest6], psym=6, symsize=3,  thick=3, color=250
legend, ['Measure'], psym=1, thick=4, pos=[340, 300],CHARTHICK=2,CHARSIZE=3,COLORS=0,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
legend, ['Simulation'], psym=6, thick=3, pos=[340, 260],CHARTHICK=2,CHARSIZE=3,COLORS=250,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
;legend, ['Snow'], psym=1, thick=4, pos=[140, 450],CHARthick=4,CHARSIZE=2,COLORS=0,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
;legend, ['Snow covered by a thin ice slab'], psym=6, thick=4, pos=[140, 420],CHARthick=4,CHARSIZE=2,COLORS=250,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
t=tvrd(true=1)
write_png, plot_phase_61, t
device, /close

;num_wave1=24
;plot_simu=cub_simu[*,*,num_wave1]
;device, set_resolution=[1000,800], SET_FONT='Times',decomposed=0, z_buffering=1, set_pixel_depth=24
;LOADCT,39 
;erase,255
;!P.BACKGROUND=255
;!P.COLOR=0
;!P.Font=1
;plot, phase_dat6[wust], cub_data6[wust,num_wave1],psym=1,symsize=2, thick=4,charsize=2, xrange=[20.,80.], $
;title='Diffuse reflectance at  '+'!9l'+'!1 ='+string(wavelengths[num_wave1], format='(f3.1)')+' '+string(181B)+'m', $
;xtitle='Phase angle '+'!9a'+'!1  ('+string(176B)+')', ytitle='R', charthick=4, xthick=4, ythick=4, yrange=[0.,0.7], ystyle=1
;oplot, phase2[*,wbest6], plot_simu[wbest6], psym=6, symsize=2,  thick=3, color=250
;legend, ['Measure'], psym=1, thick=4, pos=[340, 300],CHARTHICK=2,CHARSIZE=2,COLORS=0,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
;legend, ['Inversion'], psym=6, thick=3, pos=[340, 260],CHARTHICK=2,CHARSIZE=2,COLORS=250,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
;;legend, ['Snow'], psym=1, thick=4, pos=[140, 450],CHARthick=4,CHARSIZE=2,COLORS=0,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
;;legend, ['Snow covered by a thin ice slab'], psym=6, thick=4, pos=[140, 420],CHARthick=4,CHARSIZE=2,COLORS=250,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
;t=tvrd(true=1)
;write_png, plot_phase_62, t
;device, /close
;
;num_wave1=25
;plot_simu=cub_simu[*,*,num_wave1]
;device, set_resolution=[1000,800], SET_FONT='Times',decomposed=0, z_buffering=1, set_pixel_depth=24
;LOADCT,39 
;erase,255
;!P.BACKGROUND=255
;!P.COLOR=0
;!P.Font=1
;plot, phase_dat6[wust], cub_data6[wust,num_wave1],psym=1,symsize=2, thick=4,charsize=2, xrange=[20.,80.], $
;title='Diffuse reflectance at  '+'!9l'+'!1 ='+string(wavelengths[num_wave1], format='(f3.1)')+' '+string(181B)+'m', $
;xtitle='Phase angle '+'!9a'+'!1  ('+string(176B)+')', ytitle='R', charthick=4, xthick=4, ythick=4, yrange=[0.,0.7], ystyle=1
;oplot, phase2[*,wbest6], plot_simu[wbest6], psym=6, symsize=2,  thick=3, color=250
;legend, ['Measure'], psym=1, thick=4, pos=[340, 300],CHARTHICK=2,CHARSIZE=2,COLORS=0,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
;legend, ['Inversion'], psym=6, thick=3, pos=[340, 260],CHARTHICK=2,CHARSIZE=2,COLORS=250,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
;;legend, ['Snow'], psym=1, thick=4, pos=[140, 450],CHARthick=4,CHARSIZE=2,COLORS=0,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
;;legend, ['Snow covered by a thin ice slab'], psym=6, thick=4, pos=[140, 420],CHARthick=4,CHARSIZE=2,COLORS=250,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
;t=tvrd(true=1)
;write_png, plot_phase_63, t
;device, /close

num_wave1=28
plot_simu=cub_simu[*,*,num_wave1]
device, set_resolution=[1000,800], SET_FONT='Times',decomposed=0, z_buffering=1, set_pixel_depth=24
LOADCT,39 
erase,255
!P.BACKGROUND=255
!P.COLOR=0
!P.Font=1
plot, phase_dat6[wust], cub_data6[wust,num_wave1],psym=1,symsize=3, thick=4,charsize=4, xrange=[20.,80.], $
title='Diffuse reflectance at  '+'!9l'+'!1 ='+string(wavelengths[num_wave1], format='(f3.1)')+' '+string(181B)+'m', $
xtitle='Phase angle '+'!9a'+'!1  ('+string(176B)+')', ytitle='R', charthick=4, xthick=4, ythick=4, yrange=[0.,0.7], ystyle=1
oplot, phase2[*,wbest6], plot_simu[wbest6], psym=6, symsize=3,  thick=3, color=250
legend, ['Measure'], psym=1, thick=4, pos=[340, 300],CHARTHICK=2,CHARSIZE=3,COLORS=0,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
legend, ['Simulation'], psym=6, thick=3, pos=[340, 260],CHARTHICK=2,CHARSIZE=3,COLORS=250,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
;legend, ['Snow'], psym=1, thick=4, pos=[140, 450],CHARthick=4,CHARSIZE=2,COLORS=0,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
;legend, ['Snow covered by a thin ice slab'], psym=6, thick=4, pos=[140, 420],CHARthick=4,CHARSIZE=2,COLORS=250,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
t=tvrd(true=1)
write_png, plot_phase_64, t
device, /close


;6e  0:20 1:21 2:23 3:28
;3e  0:10 1:23 2:28 3:29
;1e  0:16 1:23 2:24 1:27
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

set_plot, 'X'
endelse


print, "done"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

end
