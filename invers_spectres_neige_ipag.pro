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


pro invers_spectres_neige_IPAG

t=systime()
restore, '/home/fandrieu/Inversion/Spectres_eau_IPAG/data_neige_sub.sav'
n_waves=n_elements(wavelengths)
s=size(cub_data)
d=fltarr(s[1]*s[2])
n=0
nfit=5
for i=0,s[1]-1 do begin ;geom
  for j=n, s[2]-1 do begin ;waves (exept n first)
    d[s[2]*i+j]=cub_data[i,j]
  endfor
endfor
n_p=size(param_cub_simu)
s2=size(cub_simu)
n_par=n_p[1]
;n_par=n_p[2]
;dd=fltarr(n_par, s2[1]*s2[3])
;for i=0,n_par-1 do begin
;  for j=0,s2[1]-1 do begin ;geom
;    for k=n, s2[3]-1 do begin ;waves (exept n first)
;      dd[i,s2[3]*j+k]=cub_simu[j,i,k]
;    endfor
;  endfor
;endfor

lmax=fltarr(nfit)
ggeo=intarr(nfit)
gbf=intarr(nfit)

inc=[0.,20.,30.,40.,50.,60.,65.]
em=[0.,20.,30.,40.,50.,65.]
az=[0.,45.,90.,140.,160.,180.]
n_geom=n_elements(em)*n_elements(inc)*n_elements(az)
for i=0,n_elements(az)-1 do begin
  for j=0,n_elements(em)-1 do begin
    for k=0,n_elements(inc)-1 do begin


incid=inc[k]
emer=em[j]
azim=az[i]

;gg=  where(param_cub_simu[*,*,2] eq 40. and param_cub_simu[*,*,0] eq 10. and param_cub_simu[*,*,1] eq 0.)
ggd=  where(param_cub_data[*,0] eq incid and param_cub_data[*,1] eq emer and param_cub_data[*,2] eq azim)
d=cub_data[ggd[0],n:n_waves-1]
;dd=cub_simu[gg[0],*,n:n_waves-1]
;dd=reform(dd, n_par,n_waves-n)
dd=cub_simu

gbl=where(finite(d))
if (finite(d[0]) and finite(d[70]) and emer le 20. and azim eq 180. and incid ge 40. and incid le 60.) then begin
du=d[gbl]
dude=dd[*, gbl]
waves=wavelengths[n:n_waves-1]
wavelengths=waves
invertC = diag_matrix(replicate(1,n_elements(gbl))) ; !!!ONLY FOR LEAST SQUARES METHOD!!!
L=vraissemblance_ln_mat(du, dude, invertC, n_par)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
bf=where(l eq max(l))
;print, param_cub_simu[gg[0],bf[0],*]
if (lmax[0] lt exp(max(l))) then begin
  for ng=1,nfit-1 do begin
    lmax[ng]=lmax[ng-1] 
    ggeo[ng]=ggeo[ng-1]
    gbf[ng]=gbf[ng-1]
  endfor
  lmax[0]=exp(max(l)) 
  ggeo[0]=ggd[0]
  gbf[0]=bf[0]
endif
endif
    endfor 
  endfor
endfor

d=cub_data[ggeo[0],n:n_waves-1]
gbl=where(finite(d))
du=d[gbl]
print, 'best fit for parameters :' 
print, param_cub_simu[gbf[0],*]
print, 'at the geometry i, e , az :'
print, param_cub_data[ggeo,*] 
plot, wavelengths, du
oplot, wavelengths, dude[gbf[0],*], color=250
for ng=1,nfit-1 do begin
d=cub_data[ggeo[ng],n:n_waves-1]
gbl=where(finite(d))
du=d[gbl]
oplot, wavelengths, du+float(ng)/20.
oplot, wavelengths, dude[gbf[ng],*]+float(ng)/20., color=250
endfor

print, "computing statistics....."


w_gs=where( inc_gs_mix eq incid_return and emer_gs_mix eq emerg_return )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

print, "total execution time : ", systime()-t

end
