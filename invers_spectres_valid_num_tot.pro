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


pro invers_spectres_valid_num_tot


;;;;NOISE;;;;
sigma1=0.02
sigma2=0.
mean=0.
;;;;;;;;;;;;;
t=systime(1)
restore, '/home/fandrieu/Inversion/valid_num_cube.sav'
n_waves=n_elements(wavelengths)

;;;;;;;;;;
cub_data=cub_simu
param_cub_data=param_cub_simu
;;;;;;;;;;


s=size(cub_data)
d=fltarr(s[1]*s[2])
n=0
nfit=5
n_p=size(param_cub_simu)
n_d=size(param_cub_data)
s2=size(cub_simu)

n_par=n_p[2]
n_data=n_d[2]
lmax=fltarr(nfit)



;gg=  where(param_cub_simu[*,*,2] eq 40. and param_cub_simu[*,*,0] eq 10. and param_cub_simu[*,*,1] eq 0.)
;ggd=  where(param_cub_data[*,0] eq incid and param_cub_data[*,1] eq emer and param_cub_data[*,2] eq azim)
simu=cub_simu[0,*,*]
simu=reform(simu,n_par, n_waves)
data_tot=cub_data[0,*,*]
data_tot=reform(data_tot,n_data,n_waves)
l_tot=dblarr(n_data, n_par)
bf=intarr(n_data)
for i=0, n_data-1 do begin

data=data_tot[i,*]
data=reform(data,n_waves)
array = RANDOMN(seed, n_waves)
noise1= array * sigma1 + mean
array = RANDOMN(seed, n_waves)
noise2= array * sigma2

invertC = diag_matrix(replicate(1./(sigma1^2+sigma2^2),n_waves)) ; !!!ONLY FOR LEAST SQUARES METHOD!!!
L=vraissemblance_ln_mat(data+data*noise1+noise2, simu, invertC, n_par)
l_tot[i, *]=l
bf[i]=where(l eq max(l))
endfor
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
time=systime(1)-t
print, 'inversion time =', systime(1)-t
save, time, l_tot, bf, filename='/home/fandrieu/Inversion/valid_num_results_s1_002s2_0.sav'

window, 1
device,  decomposed=0
LOADCT,39 
erase,255
!P.BACKGROUND=255
!P.COLOR=0
!P.Font=1
plot, param_cub_simu[0,bf,2], param_cub_data[0,*,2], psym=1


window, 2
device,  decomposed=0
LOADCT,39 
erase,255
!P.BACKGROUND=255
!P.COLOR=0
!P.Font=1
plot, param_cub_simu[0,bf,1], param_cub_data[0,*,1], psym=1
a=param_cub_simu[0,*,2]
h_slab_mod=a[uniq(a,sort(a))]
s_h = n_elements(h_slab_mod)
h_x=h_slab_mod
l_h=dblarr(n_elements(h_x))
for i=0,n_elements(h_x)-1 do begin
  l_h[i]=0.
  w=where(param_cub_simu[0,*,2] eq h_x[i])
  l_h[i]=total(double(exp(l[w])))
endfor
l_h=l_h/total(l_h)*10.


; set_plot, 'z'
;!P.FONT=1
;!P.BACKGROUND=255
;!P.COLOR=0
;device, set_resolution=[2000,1600], SET_FONT='Times',decomposed=0, z_buffering=1, set_pixel_depth=24;,set_color=256
;image_colortable=color
;erase,255
window, 1
device,  decomposed=0
LOADCT,39 
erase,255
!P.BACKGROUND=255
!P.COLOR=0
!P.Font=1
plot, h_x,l_h


a=param_cub_simu[0,*,1]
h_slab_mod=a[uniq(a,sort(a))]
s_h = n_elements(h_slab_mod)
g_x=h_slab_mod
l_g=dblarr(n_elements(g_x))
for i=0,n_elements(g_x)-1 do begin
  l_g[i]=0.
  w=where(param_cub_simu[0,*,1] eq g_x[i])
  l_g[i]=total(double(exp(l[w])))
endfor
l_g=l_g/total(l_g)/10.
window, 2
device,  decomposed=0
LOADCT,39 
erase,255
!P.BACKGROUND=255
!P.COLOR=0
!P.Font=1
plot, g_x,l_g


window, 3
device,  decomposed=0
LOADCT,39 
erase,255
!P.BACKGROUND=255
!P.COLOR=0
!P.Font=1
plot, wavelengths, data+noise
oplot, wavelengths, cub_simu[0,bf[0],*], color=150
oplot, wavelengths, data


print, "total execution time : ", systime()-t

end
