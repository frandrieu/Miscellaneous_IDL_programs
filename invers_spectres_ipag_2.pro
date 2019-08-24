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


pro invers_spectres_IPAG_2

tol_geom=1
restore, '/home/fandrieu/Inversion/Spectres_eau_IPAG/data_neige_slab_3e.sav'
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

n_geom=s[1]
;dd=reform(dd, n_par,n_waves-n)

waves=wavelengths[n:n_waves-1]
wavelengths=waves

;param_cub_simu2=param_cub_simu[*,0:199,*]
;n_par=200
;param_cub_simu=param_cub_simu2
;cub_simu2=cub_simu[*,0:199,*]
;cub_simu=cub_simu2

a=param_cub_simu[0,*,3]
par_h =  a[uniq(a,sort(a))]
s_h = n_elements(par_h)

a=param_cub_simu[0,*,4]
par_rug =  a[uniq(a,sort(a))]
s_rug = n_elements(par_rug)

h=fltarr(n_geom, s_h)
rug=fltarr(n_geom, s_rug)


Lmat=fltarr(n_geom,n_par)
bestpar=intarr(n_geom)
besth=fltarr(n_geom)
bestrug=fltarr(n_geom)
bestL=fltarr(n_geom)

for i=0,n_geom-1 do begin 

inc=param_cub_data[i,0]
em=param_cub_data[i,1]
az=param_cub_data[i,2]

gg=  where(param_cub_simu[*,*,2] eq inc and param_cub_simu[*,*,0] eq em and param_cub_simu[*,*,1] eq az)
ggd=  where(param_cub_data[*,0] eq 40. and param_cub_data[*,1] eq 10. and param_cub_data[*,2] eq 0.)
d=cub_data[i,n:n_waves-1];*cos(inc*!pi/180.)
dd=cub_simu[gg[0],*,n:n_waves-1]
dd=reform(dd, n_par,n_waves-n)


  ;d=cub_data[i,n:n_waves-1]
  ;dd=cub_simu[i,*,n:n_waves-1]
  gbl=where(finite(d)); and (wavelengths lt 0.9 or wavelengths gt 1.1))

  if (gbl ne [-1]) then begin
    du=d[gbl]
    dude=dd[*, gbl]
    dude=reform(dude, n_par,n_elements(gbl))
    invertC = diag_matrix(replicate(1,n_elements(gbl))) ; !!!ONLY FOR LEAST SQUARES METHOD!!!
    L=vraissemblance_ln_mat(du, dude, invertC, n_par)
    Lmat[i,*]=exp(L)
    w=where(l eq max(l))
    bestpar(i)=w[0]
    besth[i]=param_cub_simu[i,bestpar[i],3]
    bestrug[i]=param_cub_simu[i,bestpar[i],4]
    bestL[i]=max(exp(L))
        coor=Param_cub_simu[i,*,3]
    for j=0,s_h-1 do begin
    w=where(coor eq par_h[j])
    Lw=L[w]
    h[i,j]=mean(Lw, /nan)
    endfor

    
    coor=Param_cub_simu[i,*,4]
    for j=0,s_rug-1 do begin
    w=where(coor eq par_rug[j])
    Lw=L[w]
    rug[i,j]=mean(Lw, /nan)
    endfor

    
  endif else begin
    bestpar(i)=-1
    besth[i]=-1.
    bestl[i]=-1.
    bestrug[i]=-1.
    h[i,*]=-1
    rug[i,*]=-1
  endelse  
endfor



tvh=congrid(h, 600, 720)
tvrug=congrid(rug, 600, 720)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
besth[where(besth[*] eq -1.)] = !Values.F_NAN
bestl[where(bestl[*] eq -1.)] = !Values.F_NAN
bestrug[where(bestrug[*] eq -1.)] = !Values.F_NAN
h[where(h[*] eq -1.)] = !Values.F_NAN
rug[where(rug[*] eq -1.)] = !Values.F_NAN
tvh=congrid(h, 600, 720)
tvrug=congrid(rug, 600, 720)


t2=systime(1)-tpixel
print, "done, time =   ", t2

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


print, "computing statistics....."


w_gs=where( inc_gs_mix eq incid_return and emer_gs_mix eq emerg_return )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

print, "total execution time : ", time

end
