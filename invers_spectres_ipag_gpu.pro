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


pro invers_spectres_IPAG_gpu

restore, '/home/fandrieu/Inversion/Spectres_eau_IPAG/data_neige_slab_6e.sav'
n_waves=n_elements(wavelengths)
s=size(cub_data)
d=fltarr(s[1]*s[2])
n=0
for i=0,s[1]-1 do begin ;geom
  for j=n, s[2]-1 do begin ;waves (exept n first)
    d[s[2]*i+j]=cub_data[i,j]
  endfor
endfor
n_p=size(param_cub_simu)
n_par=n_p[2]
dd=fltarr(n_par, s[1]*s[2])
for i=0,n_par-1 do begin
  for j=0,s[1]-1 do begin ;geom
    for k=n, s[2]-1 do begin ;waves (exept n first)
      dd[i,s[2]*j+k]=cub_simu[j,i,k]
    endfor
  endfor
endfor
gg=  where(param_cub_simu[*,*,2] eq 60. and param_cub_simu[*,*,0] eq 20. and param_cub_simu[*,*,1] eq 180.)
ggd=  where(param_cub_data[*,0] eq 60. and param_cub_data[*,1] eq 20. and param_cub_data[*,2] eq 180.)
d=cub_data[ggd[0],n:n_waves-1];*cos(60*!pi/180.)
dd=cub_simu[1,*,n:n_waves-1]
dd=reform(dd, n_par,n_waves-n)

gbl=where(finite(d)); and (wavelengths lt 0.9 or wavelengths gt 1.1))
du=d[gbl]
dude=dd[*, gbl]
waves=wavelengths[n:n_waves-1]
wavelengths=waves
invertC = diag_matrix(replicate(1,n_elements(gbl))) ; !!!ONLY FOR LEAST SQUARES METHOD!!!
L=vraissemblance_ln_mat(du, dude, invertC, n_par)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
bf=where(l eq max(l))
print, param_cub_simu[gg[0],bf[0],*]
plot, wavelengths, d
oplot, wavelengths, dd[bf[0],*], color=250


t2=systime(1)-tpixel
print, "done, time =   ", t2

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


print, "computing statistics....."


w_gs=where( inc_gs_mix eq incid_return and emer_gs_mix eq emerg_return )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

print, "total execution time : ", time

end
