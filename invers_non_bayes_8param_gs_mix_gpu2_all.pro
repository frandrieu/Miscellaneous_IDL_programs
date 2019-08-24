;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;          CODE AVEC GEOMETRIE FIXEE PAR LES DONNEES          ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;                 UNIQUEMENT OPUR granul SUR DUST               ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;; Voir invers_non_bayes_evo_matriciel pour laisser libre la géométrie ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; RESET
; envi
; gpuinit, /HARDWARE
; go


function vraissemblance_ln_mat_gpu3, d2_gpu, dd_gpu, invertC_gpu, npix, nwave
; pour 1 spectre observé d, plusieurs spectre de la base de donnee dd
; npix, nombre de pixel de la base de donnée dd

;gpuinit, /HARDWARE

L_gpu = gpufltarr(npix)

;d2=fltarr(npix, n_elements(d))
;for i=0,n_elements(d)-1 do d2[*,i]=replicate(d[i], npix)
;d2_gpu = gpuPutArr(d2) 

;dd_gpu = gpuPutArr(dd) 
;invertC_gpu= gpuPutArr(float(invertC))

; mm_gpu = gpuMatrix_Multiply(b_gpu, d_gpu, /BTRANSPOSE) == transpose(b##d), car la multiplication matricielle GPU est tranpose du CPU

dif_gpu = gpuAdd(1., dd_gpu, -1., d2_gpu, 0) ; ;dif=dd-d2 
tmat1_gpu = gpuMatrix_Multiply(invertC_gpu, dif_gpu, /BTRANSPOSE) ;mat1 = transpose( invertC ## (dd-d2) )

mat1_gpu = gpuTranspose(tmat1_gpu)



dif_gpu = gpuMult(dif_gpu, mat1_gpu) ;
L_gpu = gpuTotal(dif_gpu, [2]) 
L_gpu = gpuAdd(-0.5, L_gpu, 0, L_gpu, 0) ;

;LL=-0.5*total(dif*mat1,2)

L = gpuGetArr( L_gpu )

;gpumem= gpumemgetinfo() ; 33% of free memory
;print, 'rate of free memory in GPU', float(gpumem[0])/gpumem[1]

;gpuFree, dd_gpu
;gpuFree, d_gpu
;gpuFree, invertC_gpu
gpuFree, tmat1_gpu
gpuFree, mat1_gpu
gpuFree, dif_gpu
gpuFree, L_gpu
;L[O]=-833.75334 => OK !
return, L

end


function vraissemblance_ln_mat_gpu2, d, dd, invertC, npix
; pour 1 spectre observé d, plusieurs spectre de la base de donnee dd
; npix, nombre de pixel de la base de donnée dd

;gpuinit, /HARDWARE

L=fltarr(npix)

d2=fltarr(npix, n_elements(d))
for i=0,n_elements(d)-1 do d2[*,i]=replicate(d[i], npix)

d2_gpu = gpuPutArr(d2) 
dd_gpu = gpuPutArr(dd) 
invertC_gpu= gpuPutArr(float(invertC))

; mm_gpu = gpuMatrix_Multiply(b_gpu, d_gpu, /BTRANSPOSE) == transpose(b##d), car la multiplication matricielle GPU est tranpose du CPU

dif_gpu = gpuAdd(1., dd_gpu, -1., d2_gpu, 0) ; ;dif=dd-d2 
tmat1_gpu = gpuMatrix_Multiply(invertC_gpu, dif_gpu, /BTRANSPOSE) ;mat1 = transpose( invertC ## (dd-d2) )
  
diff_gpu=gpufltarr(n_elements(d))
tline_gpu=gpufltarr(n_elements(d))

dif = gpuGetArr( dif_gpu )
mat1 = transpose(gpuGetArr( tmat1_gpu ))

for i=0,npix-1 do begin
diff=dif[i,*]
line=mat1[i,*]
L[i]=-0.5* transpose(diff)  ## line
endfor


return, L
gpuFree, dd_gpu
gpuFree, d_gpu
gpuFree, invertC_gpu
gpuFree, tmat1_gpu
gpuFree, dif_gpu
gpuFree, tline_gpu
;L[O]=-833.75334 => OK !

end


function vraissemblance_ln_mat_gpu, d, dd, invertC, npix
; pour 1 spectre observé d, plusieurs spectre de la base de donnee dd
; npix, nombre de pixel de la base de donnée dd

;gpuinit, /HARDWARE

L_gpu = gpufltarr(npix)

d2=fltarr(npix, n_elements(d))
for i=0,n_elements(d)-1 do d2[*,i]=replicate(d[i], npix)

d2_gpu = gpuPutArr(d2) 
dd_gpu = gpuPutArr(dd) 
invertC_gpu= gpuPutArr(float(invertC))

; mm_gpu = gpuMatrix_Multiply(b_gpu, d_gpu, /BTRANSPOSE) == transpose(b##d), car la multiplication matricielle GPU est tranpose du CPU

dif_gpu = gpuAdd(1., dd_gpu, -1., d2_gpu, 0) ; ;dif=dd-d2 
tmat1_gpu = gpuMatrix_Multiply(invertC_gpu, dif_gpu, /BTRANSPOSE) ;mat1 = transpose( invertC ## (dd-d2) )
  
;diff_gpu=gpufltarr(n_elements(d))
;tline_gpu=gpufltarr(n_elements(d))
;for i=0,npix-1 do begin
;  gpusubarr, dif_gpu, [i], [-1], diff_gpu, [-1] ;diff=dif[i,*]
;  gpusubarr, tmat1_gpu, [-1], [i], tline_gpu, [-1] ;line=mat1[i,*]
;  Li_gpu = gpuMatrix_Multiply(diff_gpu, tline_gpu, /ATRANSPOSE) ;L[i]=-0.5* transpose(diff)  ## line
;  Lii_gpu = gpuAdd(-0.5, Li_gpu, 0, Li_gpu, 0) ;
;  gpusubarr, Lii_gpu, [0], L_gpu, [i]
;endfor
;gpuFree, Lii_gpu
;gpuFree, Li_gpu
;gpuFree, diff_gpu
;gpuFree, tline_gpu

mat1_gpu = gpuTranspose(tmat1_gpu)
dif_gpu = gpuMult(dif_gpu, mat1_gpu) ;
L_gpu = gpuTotal(dif_gpu, [2]) 
L_gpu = gpuAdd(-0.5, L_gpu, 0, L_gpu, 0) ;

;LL=-0.5*total(dif*mat1,2)

L = gpuGetArr( L_gpu )

;a= gpumemgetinfo() ; 33% of free memory
;print, float(a[0])/a[1]

gpuFree, dd_gpu
gpuFree, d_gpu
gpuFree, invertC_gpu
gpuFree, tmat1_gpu
gpuFree, mat1_gpu
gpuFree, dif_gpu
gpuFree, L_gpu
;L[O]=-833.75334 => OK !
return, L

end

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


pro invers_non_bayes_8param_gs_mix_gpu2_all

total_fileout=strarr(48) ; Fichiers contenant les résultats de l'inversion
t=systime(1)
nc=247
nmix=10


mat_covar='/data/fschmidt/fandrieu/mat_covar_coef_renorm_noise_3percent_level_0dot02.sav'

for i=0,47 do total_fileout[i]=strcompress('/data/fschmidt/fandrieu/results_inversion_fixed_geom_noise_3percent_level_0dot02_ln_0314_mix_all_v2_pixel_'+string(i+1)+'.sav', /remove_all)



restore,mat_covar  ; Matrice de covariance

gpuinit, /HARDWARE


; Observation

;;;;;; 1. observation as a gaussian pdf  : 

; Spectral Cube
;input_file = '/home/fandrieu/Simu_IPAG/Nouveaux_calculs_septembre2012/Dark_spots_spectral_cube.SER'
input_file = '/data/fschmidt/fandrieu/Dark_spots_spectral_cube.SER'
envi_open_file, input_file, r_fid=data_fid
envi_file_query, data_fid, dims=dims_data, wl=wl, nb = nb
spectres=fltarr((dims_data[2]+1),(dims_data[4]+1),nc)
for ii=0,nc-1 do spectres[*,*,ii]=envi_get_data(fid=data_fid, dims = dims_data, pos=[ii+3])
inherit = envi_set_inheritance(data_fid, dims_data)
s =size(spectres)
nspectres = s(1)*s(2)
spectres=reform(spectres, nspectres,nc)
sp_mes=spectres

wavelengths=fltarr(nc)
wavelengths=wl[3:nc+2]


; Geo Cube
;geo_path = '/home/fandrieu/data/Richardson/Dark_spots_donnees_geo.PDS'
geo_path = '/data/fschmidt/fandrieu/Dark_spots_donnees_geo.PDS'
envi_open_file, geo_path, r_fid=data_fid
envi_file_query, data_fid, dims=dims_data, wl=wl, nb = nb
cub = dblarr(dims_data[2]+1,dims_data[4]+1,nb)
for ii=0,nb-1 do cub[*,*,ii] = ENVI_GET_DATA(fid=data_fid, dims=dims_data, pos=[ii] )
incid=fltarr(dims_data[2]+1,dims_data[4]+1)
emer=fltarr(dims_data[2]+1,dims_data[4]+1)
pha=fltarr(dims_data[2]+1,dims_data[4]+1)
incid=cub[*,*,2]
emer=cub[*,*,3]
pha=cub[*,*,4]
date=cub[*,*,6]
incid2=incid
emer2=emer
pha2=pha
date2=date


cub=reform(cub, (dims_data[2]+1)*(dims_data[4]+1),nb)
incid=reform(incid, nspectres)
emer=reform(emer, nspectres)
nspectres=(dims_data[2]+1)*(dims_data[4]+1)

;nspectres=12
;inter=spectres
;spectres=fltarr(nspectres, nc)
;spectres=inter[0:11,*]



restore, '/data/fschmidt/fandrieu/Param_cube_gs_v2.sav'
restore, '/data/fschmidt/fandrieu/Cube_gs_v2.sav'
print, 'cubes restored'
t1=systime(1)-t
print, "openning time :   ", t1
print, "Loop on the spectra..............................."



for ligne=0,47 do begin

tligne=systime(1)
nspectres=11
temp=fltarr(nspectres,nc)
for i=0,nspectres-1 do temp[i,*]=sp_mes[12*ligne+1+i,*]
spectres=temp
dates=dblarr(nspectres)
temp=fltarr(nspectres)
temp=date2[12*ligne+1:12*ligne+nspectres]
date=temp
temp=incid2[12*ligne+1:12*ligne+nspectres]
incid=temp
temp=emer2[12*ligne+1:12*ligne+nspectres]
emer=temp
temp=pha2[12*ligne+1:12*ligne+nspectres]
pha=temp

estim_spectres_gs=fltarr(nspectres, nc)
estim_param_gs=fltarr(nspectres, 9)



;incid=incid+10.



;path_fichiers_param = '/home/fandrieu/Inversion/Simulations/'
;restore, '/data/fschmidt/fandrieu/Param_cube_gs_test.sav'
;restore, '/data/fschmidt/fandrieu/Cube_gs_v2_test.sav'

; Create _test files with smaller number of spectra !
;cub_gs=cub_gs[0:9983,*]
;save, cub_gs, filename='/data/fschmidt/fandrieu/Cube_gs_v2_test.sav'
;
;NCONF_gs        LONG      =       180556
;NPIX_gs         LONG      =      8666688
;Param_cube_gs   DOUBLE    = Array[48, 180556, 7]
;
;NCONF_gs=208
;NPIX_gs=48*208;=9984
;Param_cube_gs=Param_cube_gs[*,0:207,*]
;save, NCONF_gs,NPIX_gs, Param_cube_gs , filename='/data/fschmidt/fandrieu/Param_cube_gs_test.sav'


inc_gs=Param_cube_gs[*,*,0]
emer_gs=Param_cube_gs[*,*,1]
azim_gs=Param_cube_gs[*,*,2]
fracH2Ogranul_gs=Param_cube_gs[*,*,3]
fracCO2granul_gs=Param_cube_gs[*,*,4]
fracdustgranul_gs=Param_cube_gs[*,*,5]
grainsizeH2Ogranul_gs=Param_cube_gs[*,*,6]
grainsizeCO2granul_gs=Param_cube_gs[*,*,7]
Param_cube_gs=reform(Param_cube_gs, npix_gs, 8)
Lcube_gs=dblarr(2l*nconf_gs*(nmix+1),nspectres)


ngeom_gs=48
Param_cube_gs_mix=fltarr(npix_gs*(nmix+1L),9)
for mix=0,nmix do begin
for pp=0,7 do Param_cube_gs_mix[long(npix_gs)*mix:npix_gs*(mix+1L)-1L, pp]=Param_cube_gs[*,pp]
Param_cube_gs_mix[long(npix_gs)*mix:npix_gs*(mix+1L)-1, 8]=1./nmix*mix*100.
endfor


inc_gs_mix=Param_cube_gs_mix[*,0]
emer_gs_mix=Param_cube_gs_mix[*,1]
azim_gs_mix=Param_cube_gs_mix[*,2]
fracH2Ogranul_gs_mix=Param_cube_gs_mix[*,3]
fracCO2granul_gs_mix=Param_cube_gs_mix[*,4]
fracdustgranul_gs_mix=Param_cube_gs_mix[*,5]
grainsizeH2Ogranul_gs_mix=Param_cube_gs_mix[*,6]
grainsizeCO2granul_gs_mix=Param_cube_gs_mix[*,7]
propdustmix_gs=Param_cube_gs_mix[*,8]

a=fracH2Ogranul_gs
frac_H2O_granul_mod =  a[uniq(a,sort(a))]
a=frac_H2O_granul_mod 
;for xi=0,n_elements(a)-2 do if ( abs(a[xi+1]-a[xi]) le 1e-6) then a[xi+1]=a[xi] 
;frac_H2O_granul_mod =  a[uniq(a,sort(a))]
s_frac_H2O_granul = n_elements(frac_H2O_granul_mod)
propH2Ogranul_x=frac_H2O_granul_mod

a=fracCO2granul_gs
frac_CO2_granul_mod =  a[uniq(a,sort(a))]
s_frac_CO2_granul = n_elements(frac_CO2_granul_mod)
propCO2granul_x=frac_CO2_granul_mod

a=fracdustgranul_gs
frac_dust_granul_mod =  a[uniq(a,sort(a))]
s_frac_dust_granul = n_elements(frac_dust_granul_mod)
propdustgranul_x=frac_dust_granul_mod

a=grainsizeH2Ogranul_gs
grainsize_H2O_granul_mod =  a[uniq(a,sort(a))]
s_grainsize_H2O_granul = n_elements(grainsize_H2O_granul_mod)
grainH2Ogranul_x=grainsize_H2O_granul_mod

a=grainsizeCO2granul_gs
grainsize_CO2_granul_mod =  a[uniq(a,sort(a))]
s_grainsize_CO2_granul = n_elements(grainsize_CO2_granul_mod)
grainCO2granul_x=grainsize_CO2_granul_mod


incid_mod = [55., 60., 65., 70., 75., 80.]
s_incid = 6

emerg_mod = [0., 10., 20., 30.]
s_emerg = 4

azim_mod = [60., 150.]
s_azim = 2
azim_x=[azim_mod]

if nmix eq 0 then begin
  propdustmix_x=0
endif else begin
  propdustmix_x=fltarr(nmix+1)
  for mix=0,nmix do propdustmix_x[mix]=1./nmix*mix*100.
endelse
s_propdustmix=nmix+1


propH2Ogranul=dblarr(nspectres, s_frac_H2O_granul)
propCO2granul=dblarr(nspectres, s_frac_CO2_granul)
propdustgranul=dblarr(nspectres, s_frac_dust_granul)
grainH2Ogranul=dblarr(nspectres, s_grainsize_H2O_granul)
grainCO2granul=dblarr(nspectres, s_grainsize_CO2_granul)
propdustmix=dblarr(nspectres, s_propdustmix)
incid_gs=dblarr(nspectres, s_incid)
emerg_gs=dblarr(nspectres, s_emerg)
az_gs=dblarr(nspectres, s_azim)

Param_cube_gs=reform(Param_cube_gs, npix_gs, 8)

proph2ogranul_evo=fltarr(nspectres, /nozero)
propco2granul_evo=fltarr(nspectres, /nozero)
propdustgranul_evo=fltarr(nspectres, /nozero)
grainh2ogranul_evo=fltarr(nspectres, /nozero)
grainco2granul_evo=fltarr(nspectres, /nozero)
azim_evo=fltarr(nspectres, /nozero)
propdustmix_evo=fltarr(nspectres, /nozero)
stat_spectres_gs=fltarr(nspectres,nc)




;bbl = where(d eq 65535.)


renorm_factor_gs=dblarr(nspectres)

for i=0, nspectres-1 do begin

print, "computing spectra no : ", i+1
tpixel=systime(1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Withdraw the bad bands
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
sp=spectres[i,*]
bbl=where(~finite(sp))
nbbl=n_elements(bbl)
mask=intarr(nc)
mask[*]=1
if bbl[0] NE -1 then mask[bbl]=0
gbl=where(mask eq 1)
new_covar=dblarr(n_elements(gbl), n_elements(gbl))

for j=0,n_elements(gbl)-1 do new_covar[j,*]=mat_covar_coef[gbl[j], gbl]
;new_covar=mat_covar_coef[[[gbl],[gbl]]]  ; optimisation ?

invertC = invert(new_covar)
;invertC = diag_matrix(replicate(1,n_elements(gbl))) ; !!!ONLY FOR LEAST SQUARES METHOD!!!
d=spectres[i,gbl]
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

dates[i]=date[i]

inc=incid[i]
incid_d = (incid_mod[0] - inc)^2 
incid_return = incid_mod[0]
incid_index = 0
for j=1, s_incid-1 do begin
  dst = (incid_mod[j] - inc)^2
  if dst lt incid_d then begin
    incid_d = dst
    incid_return = incid_mod[j]
    incid_index = j
  endif
endfor

em=emer[j]
emerg_d = (emerg_mod[0] - em)^2 
emerg_return = emerg_mod[0]
emerg_index = 0
for j=1, s_emerg-1 do begin
  dst = (emerg_mod[j] - em)^2
  if dst lt emerg_d then begin
    emerg_d = dst
    emerg_return = emerg_mod[j]
    emerg_index = j
  endif
endfor
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;; Tolérance sur la géométrie 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;if incid_index lt 2 then begin
;w_gs1=where( inc_gs eq incid_mod[incid_index] or inc_gs eq incid_mod[incid_index+2] )
;endif else begin
;if incid_index gt 3 then w_gs1=where( inc_gs eq incid_mod[incid_index] or inc_gs eq incid_mod[incid_index-2] ) $
;else w_gs1=where( inc_gs eq incid_mod[incid_index] or inc_gs eq incid_mod[incid_index-2] or inc_gs eq incid_mod[incid_index+2] )
;endelse
;if emerg_index lt 1 then begin
;w_gs2=where( emer_gs eq emerg_mod[emerg_index] or emer_gs eq emerg_mod[emerg_index+1] )
;endif else begin
;if emerg_index gt 2 then w_gs2=where( emer_gs eq emerg_mod[emerg_index] or emer_gs eq emerg_mod[emerg_index-1] ) $
;else w_gs2=where( emer_gs eq emerg_mod[emerg_index] or emer_gs eq emerg_mod[emerg_index-1] or emer_gs eq emerg_mod[emerg_index+1] )
;endelse
;
;w_gst=[w_gs1,w_gs2]
;w_gst=w_gst(sort(w_gst))
;indices = where(w_gst eq shift(w_gst, -1), count)
;w_gs=w_gst[indices]
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;; Pas de tolérance sur la géométrie (fixée par les données)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

w_gs=where( inc_gs eq incid_return and emer_gs eq emerg_return )
mat_gs_temp=cub_gs[w_gs,*]
mat_gs=mat_gs_temp[*,gbl]

;w_mix=where(inc_gs eq incid_mod[incid_index] and emer_gs eq emerg_mod[emerg_index] and hgranul_gs eq 0. and frach2ogranul_gs eq 0.)
;pos_dust=w_mix[0]
;dust=cub_gs[pos_dust,*]
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


restore, '/home/fandrieu/data/Richardson/Dust_spectrum.sav' ; varname='dust'

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;; Calcul matriciel de la vraissemblance de tous les spectres simulés
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;mat_gs_mix=mat_gs
L_gs=dblarr(2l*nconf_gs*(nmix+1))

ttt=systime(2)

npix=2l*nconf_gs
nwave=n_elements(d)

;d2=fltarr(npix, nwave)
;for iii=0,n_elements(d)-1 do d2[*,iii]=replicate(d[iii], npix)
;ones_npix=replicate(1,npix) ; optimisation CPU
;d22=d##ones_npix ; optimisation CPU

ones_npix=float(replicate(1,npix))
ones_npix_gpu = gpuPutArr(ones_npix) 
d_gpu = gpuPutArr(d) 
d2_gpu = gpuMatrix_Multiply(ones_npix_gpu, d_gpu)

invertC_gpu= gpuPutArr(float(invertC))

;mat_gs_gpu = gpuPutArr(mat_gs)
dustt=transpose(dust[gbl])
dust_gpu = gpuPutArr(dustt)

for mix=0,nmix do begin

 ; for wave=0, nwave-1 do mat_gs_mix[*,wave]=(1.-1./nmix*mix)*mat_gs[*,wave]+1./nmix*mix*dust[wave] ; creation de la base de donnee avec les melanges lineaires

  dust_npix_gpu = gpuMatrix_Multiply(ones_npix_gpu, dust_gpu)
  mat_gs_gpu = gpuPutArr(mat_gs)
  
  proportion_dust=1./nmix*mix
  proportion_ice=1.-proportion_dust
  
  dd_gpu=gpuAdd( proportion_ice, mat_gs_gpu, proportion_dust, dust_npix_gpu,0)

  gpuFree, mat_gs_gpu
  gpuFree, dust_npix_gpu
  
;  gpumem= gpumemgetinfo() ;
;  print, 'rate of free memory in GPU', float(gpumem[0])/gpumem[1]

;  t=systime(1)
;  dd_gpu = gpuPutArr(mat_gs_mix) 
;  L_mix3=vraissemblance_ln_mat_gpu3(d2_gpu, dd_gpu, invertC_gpu, npix, nwave)
;  print, systime(1)-t
;   
;  t=systime(1)
;  L_mix2=vraissemblance_ln_mat_gpu2(d,mat_gs_mix,invertC,2l*nconf_gs) 
;  print, systime(1)-t
;
;  t=systime(1)
;  L_mix1=vraissemblance_ln_mat_gpu(d,mat_gs_mix,invertC,2l*nconf_gs) 
;  print, systime(1)-t
;  
;  t=systime(1)
;  L_mix=vraissemblance_ln_mat(d,mat_gs_mix,invertC,2l*nconf_gs) 
;  print, systime(1)-t
;
;  print, max(abs(L_mix3-L_mix))
;  print, max(abs(L_mix2-L_mix))
;  print, max(abs(L_mix1-L_mix))

;print, mix
  L_mix=vraissemblance_ln_mat_gpu3(d2_gpu, dd_gpu, invertC_gpu, npix, nwave)
  
  L_gs[2l*nconf_gs*mix:2l*nconf_gs*(mix+1)-1]=L_mix
endfor
print, systime(1)-ttt

gpuFree, d2_gpu
gpuFree, dd_gpu
gpuFree, invertC_gpu
;gpuFree, tmat1_gpu
;gpuFree, mat1_gpu
;gpuFree, dif_gpu
;gpuFree, L_gpu


renorm_factor_gs[i]=min(abs(L_gs))
L_gs=exp(L_gs+renorm_factor_gs[i])
Lcube_gs[*,i]=L_gs


t2=systime(1)-tpixel
print, "done, time =   ", t2

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


print, "computing statistics....."


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;; Identification du meilleur fit et des paramètres correspondants
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;inc_gs=Param_cube_gs[*,*,0]
;emer_gs=Param_cube_gs[*,*,1]
;azim_gs=Param_cube_gs[*,*,2]
;hgranul_gs=Param_cube_gs[*,*,3]
;cgranul_gs=Param_cube_gs[*,*,4]
;fracH2Ogranul_gs=Param_cube_gs[*,*,5]
;grainsizeH2Ogranul_gs=Param_cube_gs[*,*,6]
w_gs=where( inc_gs_mix eq incid_return and emer_gs_mix eq emerg_return )

Interm_par_gs=Param_cube_gs_mix[w_gs,*]
w=where(L_gs eq max(L_gs))
pospar=w[0]
for pa=0,7 do estim_param_gs[i,pa]=Interm_par_gs[pospar,pa] 
pos_sp=where(inc_gs eq estim_param_gs[i,0] and emer_gs eq estim_param_gs[i,1] and azim_gs eq estim_param_gs[i,2] and frach2ogranul_gs eq estim_param_gs[i,3] and $
fracco2granul_gs eq estim_param_gs[i,4] and fracdustgranul_gs eq estim_param_gs[i,5] and grainsizeh2ogranul_gs  eq estim_param_gs[i,6] and grainsizeco2granul_gs eq estim_param_gs[i,7])
estim_spectres_gs[i,*]=cub_gs[pos_sp[0],*]*(1.-0.01*estim_param_gs[i,8])+dust*0.01*estim_param_gs[i,8]

;if incid_index lt 2 then begin
;w_gs1=where( inc_gs_mix eq incid_mod[incid_index] or inc_gs_mix eq incid_mod[incid_index+2] )
;endif else begin
;if incid_index gt 3 then w_gs1=where( inc_gs_mix eq incid_mod[incid_index] or inc_gs_mix eq incid_mod[incid_index-2] ) $
;else w_gs1=where( inc_gs_mix eq incid_mod[incid_index] or inc_gs_mix eq incid_mod[incid_index-2] or inc_gs_mix eq incid_mod[incid_index+2] )
;endelse
;if emerg_index lt 1 then begin
;w_gs2=where( emer_gs_mix eq emerg_mod[emerg_index] or emer_gs_mix eq emerg_mod[emerg_index+1] )
;endif else begin
;if emerg_index gt 2 then w_gs2=where( emer_gs_mix eq emerg_mod[emerg_index] or emer_gs_mix eq emerg_mod[emerg_index-1] ) $
;else w_gs2=where( emer_gs_mix eq emerg_mod[emerg_index] or emer_gs_mix eq emerg_mod[emerg_index-1] or emer_gs_mix eq emerg_mod[emerg_index+1] )
;endelse
;
;w_gst=[w_gs1,w_gs2]
;w_gst=w_gst(sort(w_gst))
;indices = where(w_gst eq shift(w_gst, -1), count)
;w_gs=w_gst[indices]


;Interm_cub_gs=cub_gs[w_gs,*]

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;; Calcul des vraisembleance pour chacun des paramètres (moyenne avec 1 paramètre fixé)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

coor=Param_cube_gs_mix[w_gs,3]
for j=0,s_frac_H2O_granul-1 do begin
w=where(coor eq frac_H2O_granul_mod[j])
Lw=L_gs[w]
propH2Ogranul[i,j]=mean(Lw, /double, /nan)
endfor

coor=Param_cube_gs_mix[w_gs,4]
for j=0,s_frac_CO2_granul-1 do begin
w=where(coor eq frac_CO2_granul_mod[j])
Lw=L_gs[w]
propCO2granul[i,j]=mean(Lw, /double, /nan)
endfor

coor=Param_cube_gs_mix[w_gs,5]
for j=0,s_frac_dust_granul-1 do begin
w=where(coor eq frac_dust_granul_mod[j])
Lw=L_gs[w]
propdustgranul[i,j]=mean(Lw, /double, /nan)
endfor

coor=Param_cube_gs_mix[w_gs,6]
for j=0,s_grainsize_h2o_granul-1 do begin
w=where(coor eq grainsize_h2o_granul_mod[j])
Lw=L_gs[w]
grainh2ogranul[i,j]=mean(Lw, /double, /nan)
endfor

coor=Param_cube_gs_mix[w_gs,7]
for j=0,s_grainsize_co2_granul-1 do begin
w=where(coor eq grainsize_co2_granul_mod[j])
Lw=L_gs[w]
grainco2granul[i,j]=mean(Lw, /double, /nan)
endfor

coor=Param_cube_gs_mix[w_gs,8]
for j=0,s_propdustmix-1 do begin
w=where(coor eq propdustmix_x[j])
Lw=L_gs[w]
propdustmix[i,j]=mean(Lw, /double, /nan)
endfor

coor=Param_cube_gs_mix[w_gs,2]
for j=0,s_azim-1 do begin
w=where(coor eq azim_mod[j])
Lw=L_gs[w]
az_gs[i,j]=mean(Lw, /double, /nan)
endfor

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;; Valeurs des paramètres au maximum de vraissemblance
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ma=where(propH2Ogranul[i,*] eq max(propH2Ogranul[i,*]))
if n_elements(ma) eq 1 then propH2Ogranul_evo[i]=propH2Ogranul_x[ma]
ma=where(propCO2granul[i,*] eq max(propCO2granul[i,*]))
if n_elements(ma) eq 1 then propCO2granul_evo[i]=propCO2granul_x[ma]
ma=where(propdustgranul[i,*] eq max(propdustgranul[i,*]))
if n_elements(ma) eq 1 then propdustgranul_evo[i]=propdustgranul_x[ma]
ma=where(grainh2ogranul[i,*] eq max(grainh2ogranul[i,*]))
if n_elements(ma) eq 1 then grainh2ogranul_evo[i]=grainh2ogranul_x[ma]
ma=where(grainco2granul[i,*] eq max(grainco2granul[i,*]))
if n_elements(ma) eq 1 then grainco2granul_evo[i]=grainco2granul_x[ma]
ma=where(az_gs[i,*] eq max(az_gs[i,*]))
if n_elements(ma) eq 1 then azim_evo[i]=azim_x[ma]
ma=where(propdustmix[i,*] eq max(propdustmix[i,*]))
if n_elements(ma) eq 1 then propdustmix_evo[i]=propdustmix_x[ma]

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;
;max_L=where( inc_gs eq incid_return and emer_gs eq emerg_return and hgranul_gs eq hgranul_evo[i] and azim_gs eq azim_evo[i] and $
;cgranul_gs eq cgranul_evo[i] and grainsizeH2Ogranul_gs eq grainh2ogranul_evo[i] and fracH2Ogranul_gs eq proph2ogranul_evo[i])
;
;stat_sp=cub_gs[max_L[0],*]
;stat_spectres_gs[i,*]=stat_sp

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;; Sauvegarde des résultats
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

print, "statistics done" 
print, "computation done for mesure ", i+1, "    time =   ", systime(1)-tpixel
print,""

endfor


Param_cube_gs=reform(Param_cube_gs, ngeom_gs,nconf_gs,8)
time=systime(1)-t

var = 'propH2Ogranul_x, propCO2granul_x, propdustgranul_x, grainH2Ogranul_x, grainCO2granul_x, propdustmix_x, azim_x, propH2Ogranul, propCO2granul, propdustgranul, grainH2Ogranul, grainCO2granul, az_gs,' +$
'propdustmix, Lcube_gs, Param_cube_gs, nspectres, npix_gs, wavelengths, var, spectres, estim_spectres_gs, estim_param_gs, dates,' +$
'zim_evo, cgranul_evo, propH2Ogranul_evo, propCO2granul_evo, propdustgranul_evo, grainH2Ogranul_evo, propdustmix_evo, renorm_factor_gs'

save, propH2Ogranul_x, propCO2granul_x, propdustgranul_x, grainH2Ogranul_x, grainCO2granul_x, propdustmix_x, azim_x, propH2Ogranul, $
propCO2granul, propdustgranul, grainH2Ogranul, grainCO2granul, az_gs, propdustmix, Lcube_gs, Param_cube_gs, nspectres, npix_gs, $
wavelengths, var, spectres, estim_spectres_gs, estim_param_gs, dates, azim_evo, propH2Ogranul_evo, grainH2Ogranul_evo, propCO2granul_evo, $
propdustgranul_evo, grainCO2granul_evo, propdustmix_evo, renorm_factor_gs, time, filename=total_fileout[ligne]
print, 'output file : ', total_fileout[ligne]

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
print, 'execution time for pixel', ligne+1, '=  ', systime(1)-tligne

endfor

print, "total execution time : ", time

end
