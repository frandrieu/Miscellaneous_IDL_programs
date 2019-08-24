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


pro invers_spectres_IPAG_L2d
plot_option=0
incidence=60.
emergence=20.
azimut=0.
errfact=1.
sigma=0.004;
n=0
plot_fit_1='/home/fandrieu/Inversion/Spectres_eau_IPAG/Valid_results/fit_glace1e.pgn'
plot_fit_2='/home/fandrieu/Inversion/Spectres_eau_IPAG/Valid_results/fit_glace3e.pgn'
plot_fit_3='/home/fandrieu/Inversion/Spectres_eau_IPAG/Valid_results/fit_glace6e.pgn'
plot_err_1='/home/fandrieu/Inversion/Spectres_eau_IPAG/Valid_results/plot_diffs_glace1e.pgn'
plot_err_2='/home/fandrieu/Inversion/Spectres_eau_IPAG/Valid_results/plot_diffs_glace3e.pgn'
plot_err_3='/home/fandrieu/Inversion/Spectres_eau_IPAG/Valid_results/plot_diffs_glace6e.pgn'
plot_par_1='/home/fandrieu/Inversion/Spectres_eau_IPAG/Valid_results/plot_grain_glace1e.pgn'
plot_par_2='/home/fandrieu/Inversion/Spectres_eau_IPAG/Valid_results/plot_grain_glace3e.pgn'
plot_par_3='/home/fandrieu/Inversion/Spectres_eau_IPAG/Valid_results/plot_grain_glace6e.pgn'
plot_par_1b='/home/fandrieu/Inversion/Spectres_eau_IPAG/Valid_results/plot_h_glace1e.pgn'
plot_par_2b='/home/fandrieu/Inversion/Spectres_eau_IPAG/Valid_results/plot_h_glace1e.pgn'
plot_par_3b='/home/fandrieu/Inversion/Spectres_eau_IPAG/Valid_results/plot_h_glace1e.pgn'
plot_par_123='/home/fandrieu/Inversion/Spectres_eau_IPAG/Valid_results/plot_grain_glace1e3e6e.pgn'
plot_par_123b='/home/fandrieu/Inversion/Spectres_eau_IPAG/Valid_results/plot_h_glace1e3e6e.pgn'
plot_fit_123='/home/fandrieu/Inversion/Spectres_eau_IPAG/Valid_results/fit_glace1e3e6e.pgn'
plot_err_123='/home/fandrieu/Inversion/Spectres_eau_IPAG/Valid_results/plot_diffs_glace1e3e6e.pgn'
plot_fit_err_1='/home/fandrieu/Inversion/Spectres_eau_IPAG/Valid_results/fit_and_diff_glace1e.pgn'
plot_fit_err_2='/home/fandrieu/Inversion/Spectres_eau_IPAG/Valid_results/fit_and_diff_glace3e.pgn'
plot_fit_err_3='/home/fandrieu/Inversion/Spectres_eau_IPAG/Valid_results/fit_and_diff_glace6e.pgn'
plot_par_2d_1='/home/fandrieu/Inversion/Spectres_eau_IPAG/Valid_results/plot_L_2d_glace1e.pgn'
plot_par_2d_2='/home/fandrieu/Inversion/Spectres_eau_IPAG/Valid_results/plot_L_2d_glace3e.pgn'
plot_par_2d_3='/home/fandrieu/Inversion/Spectres_eau_IPAG/Valid_results/plot_L_2d_glace6e.pgn'

cd, '/home/fandrieu/Simu_IPAG/pro/'
resolve_routine, 'colorbar'
resolve_routine, 'legend'
resolve_routine, 'tv_plot'
cd, '/home/fandrieu'


restore, '/home/fandrieu/Inversion/Spectres_eau_IPAG/data_neige_slab_1e.sav'
n_waves=n_elements(wavelengths)
sd=size(cub_data)
ss=size(cub_simu)
n_par=ss[2]
wline=where(param_cub_simu[*,*,0] eq emergence and param_cub_simu[*,*,1] eq azimut and param_cub_simu[*,*,2] eq incidence)
line=wline[0]
dd=cub_simu[line,*,n:n_waves-1]
dd=reform(dd, n_par,n_waves-n)
ggd=  where(param_cub_data[*,0] eq incidence and param_cub_data[*,1] eq emergence and param_cub_data[*,2] eq azimut)
d=cub_data[ggd[0],n:n_waves-1];*cos(60*!pi/180.)
gbl=where(finite(d)); and (wavelengths lt 0.9 or wavelengths gt 1.1))
du=d[gbl]
du1=du
dude=dd[*, gbl]
waves=wavelengths[n:n_waves-1]
wavelengths=waves
invertC = diag_matrix(replicate(1./sigma,n_elements(gbl))) ; !!!ONLY FOR LEAST SQUARES METHOD!!!
L1=vraissemblance_ln_mat(du, dude, invertC, n_par)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
bf=where(l1 eq max(l1))
print, param_cub_simu[line,bf[0],*]
bf1=bf[0]

if (plot_option eq 0) then begin
window, 1
device,  decomposed=0
LOADCT,39 
erase,255
!P.BACKGROUND=255
!P.COLOR=0
!P.Font=1
plot, wavelengths, d+0.3, thick=2, yrange=[-0.1,1.15],xtitle='Wavelength ('+string(181B)+'m)',$
ytitle='Reflectance', xrange=[min(wavelengths),max(wavelengths)],xstyle=1,ystyle=1
oplot, wavelengths, dd[bf[0],*]+0.3, color=250, thick=2
oplot, wavelengths, (dd[bf[0],*]-d)*errfact, color=250, thick=2
endif else begin

endelse



restore, '/home/fandrieu/Inversion/Spectres_eau_IPAG/data_neige_slab_3e.sav'
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
invertC = diag_matrix(replicate(1./sigma,n_elements(gbl))) ; !!!ONLY FOR LEAST SQUARES METHOD!!!
L3=vraissemblance_ln_mat(du, dude, invertC, n_par)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
bf=where(l3 eq max(l3))
bf3=bf[0]
print, param_cub_simu[line,bf[0],*]

if (plot_option eq 0) then begin
oplot, wavelengths, d+0.2, thick=2
oplot, wavelengths, dd[bf[0],*]+0.2, color=150, thick=2
oplot, wavelengths, (dd[bf[0],*]-d)*errfact, color=150, thick=2
endif else begin

endelse



sps=size(param_cub_simu)

restore, '/home/fandrieu/Inversion/Spectres_eau_IPAG/data_neige_slab_6e.sav'
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
invertC = diag_matrix(replicate(1./sigma,n_elements(gbl))) ; !!!ONLY FOR LEAST SQUARES METHOD!!!
L6=vraissemblance_ln_mat(du, dude, invertC, n_par)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
bf=where(l6 eq max(l6))
bf6=bf[0]
print, param_cub_simu[line,bf[0],*]

if (plot_option eq 0) then begin
oplot, wavelengths, d+0.1, thick=2
oplot, wavelengths, dd[bf[0],*]+0.1, color=50, thick=2
oplot, wavelengths, (dd[bf[0],*]-d)*errfact, color=50, thick=2
oplot, wavelengths, abs(dd[bf[0],*]-d)*0
endif else begin

endelse


print, exp(max(l1)), exp(max(l3)), exp(max(l6))

a=param_cub_simu[line,*,sps[3]-1]
h_slab_mod=a[uniq(a,sort(a))]
s_h = n_elements(h_slab_mod)
h_x=h_slab_mod
a=param_cub_simu[line,*,sps[3]-2]
g_mod=a[uniq(a,sort(a))]
s_g = n_elements(g_mod)
g_x=g_mod

window,0
device,  decomposed=0
LOADCT,39 
erase,255
!P.BACKGROUND=255
!P.COLOR=0
!P.Font=1
x=1.
y=1.
factx=1.
facty=1.2
sx=factx*[-x,-x,x,x]
sy=facty*[-y,y,y,-y]
USERSYM, sx, sy, THICK=1, /FILL
plot, param_cub_simu[line,*,3], param_cub_simu[line,*,4], psym=3, yrange=[0.,5.], xrange=[100.,1500.], xstyle=1
;for i=0,n_par-1 do oplot, [0, param_cub_simu[line,i,3]], [0,param_cub_simu[line,i,4]] , color=(-min(l1)+l1[i])/(-min(l1))*255., psym=8
for i=0,n_par-1 do oplot, [0, param_cub_simu[line,i,3]], [0,param_cub_simu[line,i,4]] , color=exp(l1[i])/max(exp(l1))*255., psym=8

window,1
device,  decomposed=0
LOADCT,39 
erase,255
!P.BACKGROUND=255
!P.COLOR=0
!P.Font=1
x=1.
y=1.
factx=1.
facty=1.2
sx=factx*[-x,-x,x,x]
sy=facty*[-y,y,y,-y]
USERSYM, sx, sy, THICK=1, /FILL
plot, param_cub_simu[line,*,3], param_cub_simu[line,*,4], psym=3, yrange=[5.,10.], xrange=[0.,1500.]
;for i=0,n_par-1 do oplot, [0, param_cub_simu[line,i,3]], [0,param_cub_simu[line,i,4]] , color=(-min(l1)+l1[i])/(-min(l1))*255., psym=8
for i=0,n_par-1 do oplot, [0, param_cub_simu[line,i,3]], [0,param_cub_simu[line,i,4]] , color=exp(l3[i])/max(exp(l3))*255., psym=8


window,2
device,  decomposed=0
LOADCT,39 
erase,255
!P.BACKGROUND=255
!P.COLOR=0
!P.Font=1
x=1.
y=1.
factx=1.2
facty=1.2
sx=factx*[-x,-x,x,x]
sy=facty*[-y,y,y,-y]
USERSYM, sx, sy, THICK=1, /FILL
plot, param_cub_simu[line,*,3], param_cub_simu[line,*,4], psym=3, yrange=[5,15], xrange=[0.,20.]
;for i=0,n_par-1 do oplot, [0, param_cub_simu[line,i,3]], [0,param_cub_simu[line,i,4]] , color=(-min(l1)+l1[i])/(-min(l1))*255., psym=8
for i=0,n_par-1 do oplot, [0, param_cub_simu[line,i,3]], [0,param_cub_simu[line,i,4]] , color=exp(l6[i])/max(exp(l6))*255., psym=8

g_x2=fltarr(1500)
for i=0,4 do g_x2[i]=g_x[2*i]
for i=0,3 do for j=0,4 do g_x2[5+i*5+j]=g_x[8+i]+j+1
for i=0,58 do for j=0,24 do g_x2[25+i*25+j]=g_x[12+i]+j+1
h_x2=fltarr(1000)
for i=0,199 do for j=0,4 do h_x2[5*i+j]=h_x[i]+0.1/5.*j-0.08
l1b=l1
l1b=reform(l1,s_h,s_g+4)
l1c=fltarr(1000,1500)
for m=0,199 do begin
  for k=0,4 do begin
    for i=0,4 do  l1c[5*m+k,i]=l1b[2*i,m]
    for i=0,3 do for j=0,4 do l1c[5*m+k,5+i*5+j]=l1b[8+i,m]
    for i=0,58 do for j=0,24 do l1c[5*m+k,25+i*25+j]=l1b[12+i,m]
  endfor
endfor
window,2
tv_plot, l1c, h_x2, g_x2

if (plot_option eq 0) then begin
window, 2
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
;plot, param_cub_simu[line,*,sps[3]-2],exp(l3), yrange=[0., exp(max(l1))], ystyle=1., psym=3
;oplot, param_cub_simu[line,*,sps[3]-2],exp(l3), color=150, psym=8, symsize=1
;oplot, param_cub_simu[line,*,sps[3]-2],exp(l1), color=250, psym=8, symsize=1
;oplot, param_cub_simu[line,*,sps[3]-2],exp(l6), color=50, psym=8, symsize=1
plot, param_cub_simu[line,*,sps[3]-2],exp(l3)/exp(max(l3)), yrange=[0., 1.], ystyle=1., psym=3
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
plot, param_cub_simu[line,*,sps[3]-1],exp(l3)/exp(max(l3)), yrange=[0., 1.], ystyle=1., psym=3
oplot, param_cub_simu[line,*,sps[3]-1],exp(l3)/exp(max(l3)), color=150, psym=8, symsize=1
oplot, param_cub_simu[line,*,sps[3]-1],exp(l1)/exp(max(l1)), color=250, psym=8, symsize=1
oplot, param_cub_simu[line,*,sps[3]-1],exp(l6)/exp(max(l6)), color=50, psym=8, symsize=1
endif else begin 

endelse


t2=systime(1)-tpixel
print, "done, time =   ", t2

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


print, "computing statistics....."


w_gs=where( inc_gs_mix eq incid_return and emer_gs_mix eq emerg_return )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

print, "total execution time : ", time

end
