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
;L=dblarr(npix)
d2=fltarr(npix, n_elements(d))
for i=0,n_elements(d)-1 do d2[*,i]=replicate(d[i], npix) 
dif=dd-d2 
;for i=0,npix-1 do begin
;diff=dif[i,*]
;line=mat1[i,*]
;L[i]=-0.5* transpose(diff)  ## line
;endfor
L=-0.5*total(invertc*dif^2,2)
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


pro invers_spectres_IPAG_3
plot_option=0 ; 0=X ; 1=Z
marginal_densities=1
incidence=40.
emergence=0.
azimut=180.
errfact=1.
sigma=0.0004;0.0025
sigma2=0.0001
;n=0
wavelength=1.1

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
restore, '/home/fandrieu/Inversion/Spectres_eau_IPAG/data_neige_slab_1eb.sav'
tutu=systime(1)

wawa=where(abs(wavelength-wavelengths) lt 0.005)
n=wawa[0]
if(n eq -1) then n=0
w_cut=wavelengths[n]

n_waves=n_elements(wavelengths)
sd=size(cub_data)
ss=size(cub_simu)
n_par=ss[2]
wline=where(param_cub_simu[*,*,0] eq emergence and param_cub_simu[*,*,1] eq azimut and param_cub_simu[*,*,2] eq incidence)
line=wline[0]
print, line
dd=cub_simu[line,*,n:n_waves-1]
dd=reform(dd, n_par,n_waves-n)
ggd=  where(param_cub_data[*,0] eq incidence and param_cub_data[*,1] eq emergence and param_cub_data[*,2] eq azimut)
d=cub_data[ggd[0],n:n_waves-1];*cos(60*!pi/180.)
gbl=where(finite(d)); and (wavelengths lt 0.9 or wavelengths gt 1.1))
du=d[gbl]
du1=du
dude=dd[*, gbl]
waves=wavelengths[n:n_waves-1]
wl=wavelengths
wavelengths=waves
ru=fltarr(n_elements(gbl))
rustu=fltarr(n_elements(gbl))
for rustuk=0, n_elements(gbl)-1 do begin
ru[rustuk]=max([sigma*(d[rustuk])^2,sigma2])
rustu[rustuk]=1./ru[rustuk]
endfor
invertC=diag_matrix(rustu)
;invertC = diag_matrix(replicate(1./sigma,n_elements(gbl))) ; !!!ONLY FOR LEAST SQUARES METHOD!!!
L1=vraissemblance_ln_mat(du, dude, invertC, n_par)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
bf=where(l1 eq max(l1))
print,'inversion time : '
invtutu=systime(1)
print, invtutu-tutu
print, param_cub_simu[line,bf[0],*]
bf1=bf[0]
max1=max(dude[bf1[0]])
max2=max(du)
mama=max([max1,max2])+0.01

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
if (plot_option eq 0) then begin
window, 1
device,  decomposed=0
LOADCT,39 
erase,255
!P.BACKGROUND=255
!P.COLOR=0
!P.Font=1
;plot, wavelengths, d+0.3, thick=2, yrange=[-0.1,1.15],xtitle='Wavelength ('+string(181B)+'m)',$
;ytitle='Reflectance', xrange=[min(wavelengths),max(wavelengths)],xstyle=1,ystyle=1, charsize=2,$
;charthick=4
;oplot, wavelengths, dd[bf[0],*]+0.3, color=250, thick=2
plot, wl, cub_data[ggd,*]+0.3, thick=2, yrange=[-0.1,1.15],xtitle='Wavelength ('+string(181B)+'m)',$
ytitle='Reflectance', xrange=[0.6,max(wavelengths)],xstyle=1,ystyle=1, charsize=2,$
charthick=4
oplot, wl, cub_simu[line,bf[0],*]+0.3, color=250, thick=2
oplot, wavelengths, (dd[bf[0],*]-d)*errfact, color=250, thick=2
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
;plot, wavelengths, d, thick=4,xtitle='Wavelength ('+string(181B)+'m)',ytitle='Reflectance',charsize=2,$
;charthick=4, yrange=[0.,mama], ystyle=1, xthick=4, ythick=4
;oplot, wavelengths, dd[bf[0],*], color=250, thick=4
plot, wl, cub_data[ggd,*], thick=4,xtitle='Wavelength ('+string(181B)+'m)',ytitle='Reflectance',charsize=2,$
charthick=4, yrange=[0.,1.], ystyle=1, xthick=4, ythick=4
oplot, wl, cub_simu[line,bf[0],*], color=250, thick=4
legend, ['Measure'], psym=0, thick=4, pos=[680, 740],CHARTHICK=2,CHARSIZE=2,COLORS=0,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
legend, ['Simulation'], psym=0, thick=4, pos=[680, 710],CHARTHICK=2,CHARSIZE=2,COLORS=250,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
t=tvrd(true=1)
write_png, plot_fit_1, t
device, /close
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

device, set_resolution=[1000,800], SET_FONT='Times',decomposed=0, z_buffering=1, set_pixel_depth=24
LOADCT,39 
erase,255
!P.BACKGROUND=255
!P.COLOR=0
!P.Font=1
;plot, wavelengths, d, thick=4,xtitle='Wavelength ('+string(181B)+'m)',ytitle='Reflectance & error',charsize=2,$
;charthick=4, yrange=[0.,mama], ystyle=1, xthick=4, ythick=4
;oplot, wavelengths, dd[bf[0],*], color=250, thick=4
plot, wl, cub_data[ggd,*], thick=4,xtitle='Wavelength ('+string(181B)+'m)',ytitle='Reflectance & error',charsize=2,$
charthick=4,  yrange=[0.,1.], ystyle=1, xthick=4, ythick=4
oplot, wl, cub_simu[line,bf[0],*], color=250, thick=4
oplot, wavelengths, abs(dd[bf[0],*]-d)*errfact, color=50, thick=4
legend, ['Measure'], psym=0, thick=4, pos=[680, 740],CHARTHICK=2,CHARSIZE=2,COLORS=0,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
legend, ['Simulation'], psym=0, thick=4, pos=[680, 710],CHARTHICK=2,CHARSIZE=2,COLORS=250,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
legend, ['Error'], psym=0, thick=4, pos=[680, 680],CHARTHICK=2,CHARSIZE=2,COLORS=50,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
t=tvrd(true=1)
write_png, plot_fit_err_1, t
device, /close
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

device, set_resolution=[1000,800], SET_FONT='Times',decomposed=0, z_buffering=1, set_pixel_depth=24
LOADCT,39 
erase,255
!P.BACKGROUND=255
!P.COLOR=0
!P.Font=1
plot, wavelengths, d-dd[bf[0],*], thick=4,xtitle='Wavelength ('+string(181B)+'m)',ytitle='Error',charsize=2,$
charthick=4, xthick=4, ythick=4
oplot, wavelengths, d*0.
t=tvrd(true=1)
write_png, plot_err_1, t
device, /close
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
set_plot, 'X'
endelse
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


restore, '/home/fandrieu/Inversion/Spectres_eau_IPAG/data_neige_slab_3eb.sav'
n_waves=n_elements(wavelengths)
sd=size(cub_data)
ss=size(cub_simu)
n_par=ss[2]
dd=cub_simu[line,*,n:n_waves-1]
dd=reform(dd, n_par,n_waves-n)
ggd=  where(param_cub_data[*,0] eq incidence and param_cub_data[*,1] eq emergence and param_cub_data[*,2] eq azimut)
d=cub_data[ggd[0],n:n_waves-1];*cos(60*!pi/180.)
gbl=where(finite(d)); and (wavelengths lt 0.9 or wavelengths gt 1.1))
du=d[gbl]
du3=du
dude=dd[*, gbl]
waves=wavelengths[n:n_waves-1]
wavelengths=waves
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
bf3=bf[0]
print, param_cub_simu[line,bf[0],*]
max1=max(dude[bf3[0]])
max2=max(du)
mama=max([max1,max2])+0.01

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
if (plot_option eq 0) then begin
;oplot, wavelengths, d+0.2, thick=2
;oplot, wavelengths, dd[bf[0],*]+0.2, color=150, thick=2
oplot, wl, cub_data[ggd,*]+0.2, thick=2
oplot, wl, cub_simu[line,bf[0],*]+0.2, color=150, thick=2

oplot, wavelengths, (dd[bf[0],*]-d)*errfact, color=150, thick=2
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
;plot, wavelengths, d, thick=4,xtitle='Wavelength ('+string(181B)+'m)',ytitle='Reflectance',charsize=2,$
;charthick=4, yrange=[0.,mama], ystyle=1, xthick=4, ythick=4
;oplot, wavelengths, dd[bf[0],*], color=250, thick=4
plot, wl, cub_data[ggd,*], thick=4,xtitle='Wavelength ('+string(181B)+'m)',ytitle='Reflectance',charsize=2,$
charthick=4,  yrange=[0.,1.], ystyle=1, xthick=4, ythick=4
oplot, wl, cub_simu[line,bf[0],*], color=250, thick=4
legend, ['Measure'], psym=0, thick=4, pos=[680, 740],CHARTHICK=2,CHARSIZE=2,COLORS=0,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
legend, ['Simulation'], psym=0, thick=4, pos=[680, 710],CHARTHICK=2,CHARSIZE=2,COLORS=250,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
t=tvrd(true=1)
write_png, plot_fit_2, t
device, /close
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

device, set_resolution=[1000,800], SET_FONT='Times',decomposed=0, z_buffering=1, set_pixel_depth=24
LOADCT,39 
erase,255
!P.BACKGROUND=255
!P.COLOR=0
!P.Font=1
;plot, wavelengths, d, thick=4,xtitle='Wavelength ('+string(181B)+'m)',ytitle='Reflectance & error',charsize=2,$
;charthick=4, yrange=[0.,mama], ystyle=1, xthick=4, ythick=4
;oplot, wavelengths, dd[bf[0],*], color=250, thick=4
plot, wl, cub_data[ggd,*], thick=4,xtitle='Wavelength ('+string(181B)+'m)',ytitle='Reflectance',charsize=2,$
charthick=4,  yrange=[0.,1.], ystyle=1, xthick=4, ythick=4
oplot, wl, cub_simu[line,bf[0],*], color=250, thick=4
oplot, wavelengths, abs(dd[bf[0],*]-d)*errfact, color=50, thick=4
legend, ['Measure'], psym=0, thick=4, pos=[680, 740],CHARTHICK=2,CHARSIZE=2,COLORS=0,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
legend, ['Simulation'], psym=0, thick=4, pos=[680, 710],CHARTHICK=2,CHARSIZE=2,COLORS=250,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
legend, ['Error'], psym=0, thick=4, pos=[680, 680],CHARTHICK=2,CHARSIZE=2,COLORS=50,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
t=tvrd(true=1)
write_png, plot_fit_err_2, t
device, /close
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

device, set_resolution=[1000,800], SET_FONT='Times',decomposed=0, z_buffering=1, set_pixel_depth=24
LOADCT,39 
erase,255
!P.BACKGROUND=255
!P.COLOR=0
!P.Font=1
plot, wavelengths, d-dd[bf[0],*], thick=4,xtitle='Wavelength ('+string(181B)+'m)',ytitle='Error',charsize=2,$
charthick=4, xthick=4, ythick=4
oplot, wavelengths, d*0.
t=tvrd(true=1)
write_png, plot_err_2, t
device, /close
set_plot, 'X'
endelse

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


sps=size(param_cub_simu)

restore, '/home/fandrieu/Inversion/Spectres_eau_IPAG/data_neige_slab_6eb.sav'
n_waves=n_elements(wavelengths)
sd=size(cub_data)
ss=size(cub_simu)
n_par=ss[2]
dd=cub_simu[line,*,n:n_waves-1]
dd=reform(dd, n_par,n_waves-n)
ggd=  where(param_cub_data[*,0] eq incidence and param_cub_data[*,1] eq emergence and param_cub_data[*,2] eq azimut)
d=cub_data[ggd[0],n:n_waves-1];*cos(60*!pi/180.)
gbl=where(finite(d)); and (wavelengths lt 0.9 or wavelengths gt 1.1))
du=d[gbl]
du6=du
dude=dd[*, gbl]
waves=wavelengths[n:n_waves-1]
wavelengths=waves
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
bf6=bf[0]
print, param_cub_simu[line,bf[0],*]
max1=max(dude[bf6[0]])
max2=max(du)
mama=max([max1,max2])+0.01
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
if (plot_option eq 0) then begin
;oplot, wavelengths, d+0.1, thick=2
;oplot, wavelengths, dd[bf[0],*]+0.1, color=50, thick=2

oplot, wl, cub_data[ggd,*]+0.1, thick=2
oplot, wl, cub_simu[line,bf[0],*]+0.1, color=50, thick=2

oplot, wavelengths, (dd[bf[0],*]-d)*errfact, color=50, thick=2
oplot, wavelengths, abs(dd[bf[0],*]-d)*0
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
;plot, wavelengths, d, thick=4,xtitle='Wavelength ('+string(181B)+'m)',ytitle='Reflectance',charsize=2,$
;charthick=4, yrange=[0.,mama], ystyle=1, xthick=4, ythick=4
;oplot, wavelengths, dd[bf[0],*], color=250, thick=4
plot, wl, cub_data[ggd,*], thick=4,xtitle='Wavelength ('+string(181B)+'m)',ytitle='Reflectance',charsize=2,$
charthick=4, yrange=[0.,1.], ystyle=1, xthick=4, ythick=4
oplot, wl, cub_simu[line,bf[0],*], color=250, thick=4
legend, ['Measure'], psym=0, thick=4, pos=[680, 740],CHARTHICK=2,CHARSIZE=2,COLORS=0,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
legend, ['Simulation'], psym=0, thick=4, pos=[680, 710],CHARTHICK=2,CHARSIZE=2,COLORS=250,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
t=tvrd(true=1)
write_png, plot_fit_3, t
device, /close
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

device, set_resolution=[1000,800], SET_FONT='Times',decomposed=0, z_buffering=1, set_pixel_depth=24
LOADCT,39 
erase,255
!P.BACKGROUND=255
!P.COLOR=0
!P.Font=1
;plot, wavelengths, d, thick=4,xtitle='Wavelength ('+string(181B)+'m)',ytitle='Reflectance & error',charsize=2,$
;charthick=4, yrange=[0.,mama], ystyle=1, xthick=4, ythick=4
;oplot, wavelengths, dd[bf[0],*], color=250, thick=4
plot, wl, cub_data[ggd,*], thick=4,xtitle='Wavelength ('+string(181B)+'m)',ytitle='Reflectance & error',charsize=2,$
charthick=4, yrange=[0.,1.], ystyle=1, xthick=4, ythick=4
oplot, wl, cub_simu[line,bf[0],*], color=250, thick=4
oplot, wavelengths, abs(dd[bf[0],*]-d)*errfact, color=50, thick=4
legend, ['Measure'], psym=0, thick=4, pos=[680, 740],CHARTHICK=2,CHARSIZE=2,COLORS=0,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
legend, ['Simulation'], psym=0, thick=4, pos=[680, 710],CHARTHICK=2,CHARSIZE=2,COLORS=250,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
legend, ['Error'], psym=0, thick=4, pos=[680, 680],CHARTHICK=2,CHARSIZE=2,COLORS=50,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
t=tvrd(true=1)
write_png, plot_fit_err_3, t
device, /close
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

device, set_resolution=[1000,800], SET_FONT='Times',decomposed=0, z_buffering=1, set_pixel_depth=24
LOADCT,39 
erase,255
!P.BACKGROUND=255
!P.COLOR=0
!P.Font=1
plot, wavelengths, d-dd[bf[0],*], thick=4,xtitle='Wavelength ('+string(181B)+'m)',ytitle='Error',charsize=2,$
charthick=4, xthick=4, ythick=4
oplot, wavelengths, d*0.
t=tvrd(true=1)
write_png, plot_err_3, t
device, /close
set_plot, 'X'

endelse
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


print, exp(max(l1)), exp(max(l3)), exp(max(l6))

a=param_cub_simu[line,*,sps[3]-1]
h_slab_mod=a[uniq(a,sort(a))]
s_h = n_elements(h_slab_mod)
h_x=h_slab_mod
a=param_cub_simu[line,*,sps[3]-2]
g_mod=a[uniq(a,sort(a))]
s_g = n_elements(g_mod)
g_x=g_mod


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
h_1e=total(h_x*l_h_1e*0.1)
h_3e=total(h_x*l_h_3e*0.1)
h_6e=total(h_x*l_h_6e*0.1)
sigma_h_1e=sqrt(total(l_h_1e*0.1*(h_x-h_1e)^2))
sigma_h_3e=sqrt(total(l_h_3e*0.1*(h_x-h_3e)^2))
sigma_h_6e=sqrt(total(l_h_6e*0.1*(h_x-h_6e)^2))
g_1e=total(g_x[w1]*0.5*l_g_1e[w1])+total(g_x[w2]*5.*l_g_1e[w2])+total(g_x[w3]*25.*l_g_1e[w3])
g_3e=total(g_x[w1]*0.5*l_g_3e[w1])+total(g_x[w2]*5.*l_g_3e[w2])+total(g_x[w3]*25.*l_g_3e[w3])
g_6e=total(g_x[w1]*0.5*l_g_6e[w1])+total(g_x[w2]*5.*l_g_6e[w2])+total(g_x[w3]*25.*l_g_6e[w3])
sigma_g_1e=sqrt(total(l_g_1e[w1]*0.5*(g_x[w1]-g_1e)^2)+total(l_g_1e[w2]*5.*(g_x[w2]-g_1e)^2)+$
total(l_g_1e[w3]*25.*(g_x[w3]-g_1e)^2))
sigma_g_3e=sqrt(total(l_g_3e[w1]*0.5*(g_x[w1]-g_3e)^2)+total(l_g_3e[w2]*5.*(g_x[w2]-g_3e)^2)+$
total(l_g_3e[w3]*25.*(g_x[w3]-g_3e)^2))
sigma_g_6e=sqrt(total(l_g_6e[w1]*0.5*(g_x[w1]-g_6e)^2)+total(l_g_6e[w2]*5.*(g_x[w2]-g_6e)^2)+$
total(l_g_6e[w3]*25.*(g_x[w3]-g_6e)^2))
print, 'mean thickness for 1e, 3e, 6e :'
PRINT, h_1e,h_3e,h_6e
print, 'associated standard deviations :'
print, sigma_h_1e,sigma_h_3e,sigma_h_6e
print, 'mean snow grainsize for 1e, 3e, 6e :'
PRINT, g_1e,g_3e,g_6e
print, 'associated standard deviations :'
print, sigma_g_1e,sigma_g_3e,sigma_g_6e


simthick=[h_1e, h_3e, h_6e]
simerr=2.*[sigma_h_1e, sigma_h_3e, sigma_h_6e]
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Verifs Normalisation
;print, total(l_h_1e*0.1)
;print, total(l_h_3e*0.1)
;print, total(l_h_6e*0.1)
;print, total(0.5*l_g_1e[w1])+total(5.*l_g_1e[w2])+total(25.*l_g_1e[w3])
;print, total(0.5*l_g_3e[w1])+total(5.*l_g_3e[w2])+total(25.*l_g_3e[w3])
;print, total(0.5*l_g_6e[w1])+total(5.*l_g_6e[w2])+total(25.*l_g_6e[w3])
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
if (plot_option eq 0) then begin
window, 2
device,  decomposed=0
LOADCT,39 
erase,255
!P.BACKGROUND=255
!P.COLOR=0
!P.Font=1

if (marginal_densities eq 0) then begin
x=1.
y=1.
factx=0.2
facty=0.2
sx=factx*[-x,-x,x,x]
sy=facty*[-y,y,y,-y]
USERSYM, sx, sy, THICK=1, /FILL
;plot, param_cub_simu[line,*,sps[3]-2],exp(l3), yrange=[0., exp(max(l1))], ystyle=1., psym=3
;oplot, param_cub_simu[line,*,sps[3]-2],exp(l3), color=150, psym=8, symsize=1
;oplot, param_cub_simu[line,*,sps[3]-2],exp(l1), color=250, psym=8, symsize=1
;oplot, param_cub_simu[line,*,sps[3]-2],exp(l6), color=50, psym=8, symsize=1
plot, param_cub_simu[line,*,sps[3]-2],exp(l3)/exp(max(l3)), yrange=[0., 1.], ystyle=1., psym=3, ytitle='Likelihood',$
xtitle='Grainsize of the snow ('+string(181B)+'m)',charsize=1, charthick=2, xthick=2, ythick=2
oplot, param_cub_simu[line,*,sps[3]-2],exp(l3)/exp(max(l3)), color=150, psym=8, symsize=1
oplot, param_cub_simu[line,*,sps[3]-2],exp(l1)/exp(max(l1)), color=250, psym=8, symsize=1
oplot, param_cub_simu[line,*,sps[3]-2],exp(l6)/exp(max(l6)), color=50, psym=8, symsize=1
window, 0
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
;plot, param_cub_simu[line,*,sps[3]-1],exp(l3), yrange=[0., exp(max(l1))], ystyle=1., psym=3
;oplot, param_cub_simu[line,*,sps[3]-1],exp(l3), color=150, psym=8, symsize=1
;oplot, param_cub_simu[line,*,sps[3]-1],exp(l1), color=250, psym=8, symsize=1
;oplot, param_cub_simu[line,*,sps[3]-1],exp(l6), color=50, psym=8, symsize=1
plot, param_cub_simu[line,*,sps[3]-1],exp(l3)/exp(max(l3)), yrange=[0., 1.], psym=3, ytitle='Likelihood',$
xtitle='Thickness of the slab (mm)',ystyle=1., charsize=2, charthick=4, xthick=4, ythick=4
oplot, param_cub_simu[line,*,sps[3]-1],exp(l3)/exp(max(l3)), color=150, psym=8, symsize=1
oplot, param_cub_simu[line,*,sps[3]-1],exp(l1)/exp(max(l1)), color=250, psym=8, symsize=1
oplot, param_cub_simu[line,*,sps[3]-1],exp(l6)/exp(max(l6)), color=50, psym=8, symsize=1

endif else begin
plot, g_x, l_g_3e, title='Marginal Probability Density Functions for the Grainsize of the snow', ytitle='Marginal PDF',$
xtitle='Grainsize of the snow ('+string(181B)+'m)',charsize=1, charthick=2, xthick=2, ythick=2, yrange=[0.,1.5*max(l_g_1e)]
oplot, g_x, l_g_6e, color=50, thick=2
oplot, g_x, l_g_3e, color=150, thick=2
oplot, g_x, l_g_1e, color=250, thick=2
legend, ['Sample 1'], psym=0, thick=2, pos=[680, 740],CHARTHICK=2,CHARSIZE=1,COLORS=250,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
legend, ['Sample 2'], psym=0, thick=2, pos=[680, 710],CHARTHICK=2,CHARSIZE=1,COLORS=150,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
legend, ['Sample 3'], psym=0, thick=2, pos=[680, 680],CHARTHICK=2,CHARSIZE=1,COLORS=50,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
window, 0
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
legend, ['Sample 1'], psym=0, thick=2, pos=[680, 740],CHARTHICK=2,CHARSIZE=1,COLORS=250,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
legend, ['Sample 2'], psym=0, thick=2, pos=[680, 710],CHARTHICK=2,CHARSIZE=1,COLORS=150,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
legend, ['Sample 3'], psym=0, thick=2, pos=[680, 680],CHARTHICK=2,CHARSIZE=1,COLORS=50,TEXTCOLORS=0,OUTLINE_COLOR=255,/device


window, 4
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
endelse
endif else begin 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

set_plot, 'z'

if (marginal_densities eq 0) then begin

device, set_resolution=[1000,800], SET_FONT='Times',decomposed=0, z_buffering=1, set_pixel_depth=24
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
plot, param_cub_simu[line,*,sps[3]-2],exp(l3)/exp(max(l3)), yrange=[0., 1.], ytitle='Likelihood',$
xtitle='Grainsize of the snow ('+string(181B)+'m)',ystyle=1., psym=3, charsize=2, charthick=4, xthick=4, ythick=4
oplot, param_cub_simu[line,*,sps[3]-2],exp(l3)/exp(max(l3)), color=150, psym=8, symsize=1
oplot, param_cub_simu[line,*,sps[3]-2],exp(l1)/exp(max(l1)), color=250, psym=8, symsize=1
oplot, param_cub_simu[line,*,sps[3]-2],exp(l6)/exp(max(l6)), color=50, psym=8, symsize=1
legend, ['Sample 1'], psym=0, thick=4, pos=[680, 740],CHARTHICK=2,CHARSIZE=2,COLORS=250,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
legend, ['Sample 2'], psym=0, thick=4, pos=[680, 710],CHARTHICK=2,CHARSIZE=2,COLORS=150,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
legend, ['Sample 3'], psym=0, thick=4, pos=[680, 680],CHARTHICK=2,CHARSIZE=2,COLORS=50,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
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
plot, param_cub_simu[line,*,sps[3]-1],exp(l3)/exp(max(l3)), yrange=[0., 1.], ytitle='Likelihood',$
xtitle='Thickness of the slab (mm)',ystyle=1., psym=3, charsize=2, charthick=4, xthick=4, ythick=4
oplot, param_cub_simu[line,*,sps[3]-1],exp(l3)/exp(max(l3)), color=150, psym=8, symsize=1
oplot, param_cub_simu[line,*,sps[3]-1],exp(l1)/exp(max(l1)), color=250, psym=8, symsize=1
oplot, param_cub_simu[line,*,sps[3]-1],exp(l6)/exp(max(l6)), color=50, psym=8, symsize=1
legend, ['Sample 1'], psym=0, thick=4, pos=[680, 740],CHARTHICK=2,CHARSIZE=2,COLORS=250,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
legend, ['Sample 2'], psym=0, thick=4, pos=[680, 710],CHARTHICK=2,CHARSIZE=2,COLORS=150,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
legend, ['Sample 3'], psym=0, thick=4, pos=[680, 680],CHARTHICK=2,CHARSIZE=2,COLORS=50,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
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
plot, param_cub_simu[line,*,sps[3]-2],exp(l1)/exp(max(l1)), yrange=[0., 1.], psym=8, ytitle='Likelihood',$
xtitle='Grainsize of the snow ('+string(181B)+'m)',ystyle=1.,charsize=2, charthick=4, xthick=4, ythick=4
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
plot, param_cub_simu[line,*,sps[3]-1],exp(l1)/exp(max(l1)), yrange=[0., 1.], psym=8, ytitle='Likelihood',$
xtitle='Thickness of the slab (mm)',ystyle=1., charsize=2, charthick=4, xthick=4, ythick=4
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
plot, param_cub_simu[line,*,sps[3]-2],exp(l3)/exp(max(l3)), yrange=[0., 1.], psym=8, ytitle='Likelihood',$
xtitle='Grainsize of the snow ('+string(181B)+'m)',ystyle=1.,charsize=2, charthick=4, xthick=4, ythick=4
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
plot, param_cub_simu[line,*,sps[3]-1],exp(l3)/exp(max(l3)), yrange=[0., 1.], psym=8, ytitle='Likelihood',$
xtitle='Thickness of the slab (mm)',ystyle=1., charsize=2, charthick=4, xthick=4, ythick=4
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
USERSYM, sx, sy, THICK=1, /FILL
plot, param_cub_simu[line,*,sps[3]-2],exp(l6)/exp(max(l6)), yrange=[0., 1.], psym=8, ytitle='Likelihood',$
xtitle='Grainsize of the snow ('+string(181B)+'m)',ystyle=1.,charsize=2, charthick=4, xthick=4, ythick=4
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
plot, param_cub_simu[line,*,sps[3]-1],exp(l6)/exp(max(l6)), yrange=[0., 1.], psym=8, ytitle='Likelihood',$
xtitle='Thickness of the slab (mm)',ystyle=1., charsize=2, charthick=4, xthick=4, ythick=4
t=tvrd(true=1)
write_png, plot_par_3b, t
device, /close
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

endif else begin

device, set_resolution=[1000,800], SET_FONT='Times',decomposed=0, z_buffering=1, set_pixel_depth=24
LOADCT,39 
erase,255
!P.BACKGROUND=255
!P.COLOR=0
!P.Font=1
plot, g_x, l_g_3e, title='Marginal Probability Density Functions for the Grainsize of the snow', ytitle='Marginal PDF',$
xtitle='Grainsize of the snow ('+string(181B)+'m)',charsize=2, charthick=4, /nodata, xthick=4, ythick=4, yrange=[0.,1.5*max(l_g_1e)]
oplot, g_x, l_g_6e, color=50, thick=4
oplot, g_x, l_g_3e, color=150, thick=4
oplot, g_x, l_g_1e, color=250, thick=4
legend, ['Sample 1'], psym=0, thick=4, pos=[680, 740],CHARTHICK=2,CHARSIZE=2,COLORS=250,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
legend, ['Sample 2'], psym=0, thick=4, pos=[680, 710],CHARTHICK=2,CHARSIZE=2,COLORS=150,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
legend, ['Sample 3'], psym=0, thick=4, pos=[680, 680],CHARTHICK=2,CHARSIZE=2,COLORS=50,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
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
plot, h_x, l_h_6e, title='Marginal Probability Density Functions for the Thickness of the slab', ytitle='Marginal PDF',$
xtitle='Thickness of the slab (mm)',subtitle='Sample 3',charsize=2, charthick=4, /nodata, xthick=4, ythick=4
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
plot, h_x, l_h_1e, title='Marginal Probability Density Functions for the Thickness of the slab', ytitle='Marginal PDF',$
xtitle='Thickness of the slab (mm)',ystyle=1., charsize=2, charthick=4, /nodata, xthick=4, ythick=4
oplot, h_x, l_h_1e, color=250, thick=4
oplot, h_x, l_h_3e, color=150, thick=4
oplot, h_x, l_h_6e, color=50, thick=4
legend, ['Sample 1'], psym=0, thick=4, pos=[680, 740],CHARTHICK=2,CHARSIZE=2,COLORS=250,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
legend, ['Sample 2'], psym=0, thick=4, pos=[680, 710],CHARTHICK=2,CHARSIZE=2,COLORS=150,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
legend, ['Sample 3'], psym=0, thick=4, pos=[680, 680],CHARTHICK=2,CHARSIZE=2,COLORS=50,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
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
legend, ['Measure'], psym=0, thick=4, pos=[200, 740],CHARTHICK=2,CHARSIZE=2,COLORS=0,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
legend, ['Inversion'], psym=0, thick=4, pos=[200, 710],CHARTHICK=2,CHARSIZE=2,COLORS=250,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
t=tvrd(true=1)
write_png, plot_inv_res, t
device, /close
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

endelse
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

set_plot, 'X'
endelse


print, "done"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

end
