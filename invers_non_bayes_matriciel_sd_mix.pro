;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;          CODE AVEC GEOMETRIE FIXEE PAR LES DONNEES          ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;                 UNIQUEMENT OPUR SLAB SUR DUST               ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;; Voir invers_non_bayes_evo_matriciel pour laisser libre la géométrie ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


function vraissemblance_ln_mat, d, dd, invertC, npix
L=dblarr(npix)
d2=fltarr(npix, n_elements(d))
for i=0,n_elements(d)-1 do d2[*,i]=replicate(d[i], npix)
mat1 = invertC ## (dd-d2) 
dif=dd-d2 
for i=0,npix-1 do begin
diff=dif[i,*]
line=mat1[i,*]
L[i]=-0.5* transpose(diff)  ## line
endfor

return, L

end


pro invers_non_bayes_matriciel_sd_mix

total_fileout='/home/fandrieu/Inversion/results/idl_files/results_inversion_fixed_geom_noise_3percent_level_0dot05_ln_060913_mix_ds6_control_v3.sav' ; Fichier contenant les résultats de l'inversion
t=systime(1)
nc=247
nmix=10


restore, '/home/fandrieu/Inversion/results/idl_files/mat_covar_coef_renorm_noise_3percent_level_0dot05.sav' ; Matrice de covariance




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

cub=reform(cub, (dims_data[2]+1)*(dims_data[4]+1),nb)
incid=reform(incid, nspectres)
emer=reform(emer, nspectres)
nspectres=(dims_data[2]+1)*(dims_data[4]+1)

;nspectres=12
;inter=spectres
;spectres=fltarr(nspectres, nc)
;spectres=inter[0:11,*]



nspectres=9
temp=fltarr(nspectres,nc)
for i=0,nspectres-1 do temp[i,*]=spectres[12*(8*4+2)+1+i,*]
spectres=temp
dates=dblarr(nspectres)
temp=fltarr(nspectres)
temp=date[12*(8*4+2)+1:12*(8*4+2)+nspectres]
date=temp
temp=incid[12*(8*4+2)+1:12*(8*4+2)+nspectres]
incid=temp
temp=emer[12*(8*4+2)+1:12*(8*4+2)+nspectres]
emer=temp
temp=pha[12*(8*4+2)+1:12*(8*4+2)+nspectres]
pha=temp

estim_spectres_sd=fltarr(nspectres, nc)
estim_param_sd=fltarr(nspectres, 8)



;incid=incid+10.



;path_fichiers_param = '/home/fandrieu/Inversion/Simulations/'


restore, '/data/fschmidt/fandrieu/Param_cube_sd.sav'
restore, '/data/fschmidt/fandrieu/Cube_sd_v3.sav'

print, 'cubes restored'

inc_sd=Param_cube_sd[*,*,0]
emer_sd=Param_cube_sd[*,*,1]
azim_sd=Param_cube_sd[*,*,2]
hslab_sd=Param_cube_sd[*,*,3]
cslab_sd=Param_cube_sd[*,*,4]
fracH2Oslab_sd=Param_cube_sd[*,*,5]
grainsizeH2Oslab_sd=Param_cube_sd[*,*,6]
Param_cube_sd=reform(Param_cube_sd, npix_sd, 7)
Lcube_sd=dblarr(2l*nconf_sd*(nmix+1),nspectres)


ngeom_sd=48
Param_cube_sd_mix=fltarr(npix_sd*(nmix+1),8)
for mix=0,nmix do begin
for pp=0,6 do Param_cube_sd_mix[npix_sd*mix:npix_sd*(mix+1)-1, pp]=Param_cube_sd[*,pp]
Param_cube_sd_mix[npix_sd*mix:npix_sd*(mix+1)-1, 7]=1./nmix*mix*100.
endfor


inc_sd_mix=Param_cube_sd_mix[*,0]
emer_sd_mix=Param_cube_sd_mix[*,1]
azim_sd_mix=Param_cube_sd_mix[*,2]
hslab_sd_mix=Param_cube_sd_mix[*,3]
cslab_sd_mix=Param_cube_sd_mix[*,4]
fracH2Oslab_sd_mix=Param_cube_sd_mix[*,5]
grainsizeH2Oslab_sd_mix=Param_cube_sd_mix[*,6]
propdustmix_sd=Param_cube_sd_mix[*,7]


a=hslab_sd
h_slab_mod=a[uniq(a,sort(a))]
s_h_slab = n_elements(h_slab_mod)
hslab_x=h_slab_mod
;
;h_granul_mod = [0.01, 0.1, 1., 10., 100.] 
;s_h_granul = 5
;h_granul_mod0 = 0.001

a=cslab_sd
c_slab_mod =  a[uniq(a,sort(a))]
s_c_slab = n_elements(c_slab_mod)
cslab_x=c_slab_mod

a=fracH2Oslab_sd
frac_H2O_slab_mod =  a[uniq(a,sort(a))]
s_frac_H2O_slab = n_elements(frac_H2O_slab_mod)
propH2Oslab_x=frac_H2O_slab_mod

a=grainsizeH2Oslab_sd
grainsize_H2O_slab_mod =  a[uniq(a,sort(a))]
s_grainsize_H2O_slab = n_elements(grainsize_H2O_slab_mod)
grainH2Oslab_x=grainsize_H2O_slab_mod


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

hslab=dblarr(nspectres, s_h_slab)

cslab=dblarr(nspectres, s_c_slab)

propH2Oslab=dblarr(nspectres, s_frac_H2O_slab)

grainH2Oslab=dblarr(nspectres, s_grainsize_H2O_slab)

propdustmix=dblarr(nspectres, s_propdustmix)

incid_sd=dblarr(nspectres, s_incid)
emerg_sd=dblarr(nspectres, s_emerg)
az_sd=dblarr(nspectres, s_azim)

Param_cube_sd=reform(Param_cube_sd, npix_sd, 7)


hslab_evo=fltarr(nspectres, /nozero)
cslab_evo=fltarr(nspectres, /nozero)
proph2oslab_evo=fltarr(nspectres, /nozero)
grainh2oslab_evo=fltarr(nspectres, /nozero)
azim_evo=fltarr(nspectres, /nozero)
propdustmix_evo=fltarr(nspectres, /nozero)
stat_spectres_sd=fltarr(nspectres,nc)




;bbl = where(d eq 65535.)
t1=systime(1)-t
print, "openning time :   ", t1
print, "Calculating..............................."


renorm_factor_sd=dblarr(nspectres)

for i=0, nspectres-1 do begin

t1=systime(1)

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
;w_sd1=where( inc_sd eq incid_mod[incid_index] or inc_sd eq incid_mod[incid_index+2] )
;endif else begin
;if incid_index gt 3 then w_sd1=where( inc_sd eq incid_mod[incid_index] or inc_sd eq incid_mod[incid_index-2] ) $
;else w_sd1=where( inc_sd eq incid_mod[incid_index] or inc_sd eq incid_mod[incid_index-2] or inc_sd eq incid_mod[incid_index+2] )
;endelse
;if emerg_index lt 1 then begin
;w_sd2=where( emer_sd eq emerg_mod[emerg_index] or emer_sd eq emerg_mod[emerg_index+1] )
;endif else begin
;if emerg_index gt 2 then w_sd2=where( emer_sd eq emerg_mod[emerg_index] or emer_sd eq emerg_mod[emerg_index-1] ) $
;else w_sd2=where( emer_sd eq emerg_mod[emerg_index] or emer_sd eq emerg_mod[emerg_index-1] or emer_sd eq emerg_mod[emerg_index+1] )
;endelse
;
;w_sdt=[w_sd1,w_sd2]
;w_sdt=w_sdt(sort(w_sdt))
;indices = where(w_sdt eq shift(w_sdt, -1), count)
;w_sd=w_sdt[indices]
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;; Pas de tolérance sur la géométrie (fixée par les données)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

w_sd=where( inc_sd eq incid_return and emer_sd eq emerg_return )
mat_sd_temp=cub_sd[w_sd,*]
mat_sd=mat_sd_temp[*,gbl]

w_mix=where(inc_sd eq incid_mod[incid_index] and emer_sd eq emerg_mod[emerg_index] and hslab_sd eq 0. and frach2oslab_sd eq 0.)
pos_dust=w_mix[0]
dust=cub_sd[pos_dust,*]
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;restore, '/home/fandrieu/data/Richardson/Dust_spectrum.sav' ; varname='dust'

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;; Calcul matriciel de la vraissemblance de tous les spectres simulés
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

mat_sd_mix=mat_sd
L_sd=dblarr(2l*nconf_sd*(nmix+1))  ; facteur pour 2 azimuth dans chaque configuration

for mix=0,nmix do begin
  L_mix=dblarr(2l*nconf_sd)
  for wave=0, n_elements(gbl)-1 do mat_sd_mix[*,wave]=(1.-1./nmix*mix)*mat_sd[*,wave]+1./nmix*mix*dust[wave] 
  L_mix=vraissemblance_ln_mat(d,mat_sd_mix,invertC,2l*nconf_sd) 
  L_sd[2l*nconf_sd*mix:2l*nconf_sd*(mix+1)-1]=L_mix
endfor
renorm_factor_sd[i]=min(abs(L_sd))
L_sd=exp(L_sd+renorm_factor_sd[i])
Lcube_sd[*,i]=L_sd

t2=systime(1)-t1
print, "done, time =   ", t2

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


print, "computing statistics....."


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;; Identification du meilleur fit et des paramètres correspondants
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;inc_sd=Param_cube_sd[*,*,0]
;emer_sd=Param_cube_sd[*,*,1]
;azim_sd=Param_cube_sd[*,*,2]
;hslab_sd=Param_cube_sd[*,*,3]
;cslab_sd=Param_cube_sd[*,*,4]
;fracH2Oslab_sd=Param_cube_sd[*,*,5]
;grainsizeH2Oslab_sd=Param_cube_sd[*,*,6]
w_sd=where( inc_sd_mix eq incid_return and emer_sd_mix eq emerg_return )

Interm_par_sd=Param_cube_sd_mix[w_sd,*]
w=where(L_sd eq max(L_sd))
pospar=w[0]
for pa=0,7 do estim_param_sd[i,pa]=Interm_par_sd[pospar,pa] 
pos_sp=where(inc_sd eq estim_param_sd[i,0] and emer_sd eq estim_param_sd[i,1] and azim_sd eq estim_param_sd[i,2] and hslab_sd eq estim_param_sd[i,3] and $
cslab_sd eq estim_param_sd[i,4] and frach2oslab_sd eq estim_param_sd[i,5] and grainsizeh2oslab_sd eq estim_param_sd[i,6])
estim_spectres_sd[i,*]=cub_sd[pos_sp[0],*]*(1.-0.01*estim_param_sd[i,7])+dust*0.01*estim_param_sd[i,7]

;if incid_index lt 2 then begin
;w_sd1=where( inc_sd_mix eq incid_mod[incid_index] or inc_sd_mix eq incid_mod[incid_index+2] )
;endif else begin
;if incid_index gt 3 then w_sd1=where( inc_sd_mix eq incid_mod[incid_index] or inc_sd_mix eq incid_mod[incid_index-2] ) $
;else w_sd1=where( inc_sd_mix eq incid_mod[incid_index] or inc_sd_mix eq incid_mod[incid_index-2] or inc_sd_mix eq incid_mod[incid_index+2] )
;endelse
;if emerg_index lt 1 then begin
;w_sd2=where( emer_sd_mix eq emerg_mod[emerg_index] or emer_sd_mix eq emerg_mod[emerg_index+1] )
;endif else begin
;if emerg_index gt 2 then w_sd2=where( emer_sd_mix eq emerg_mod[emerg_index] or emer_sd_mix eq emerg_mod[emerg_index-1] ) $
;else w_sd2=where( emer_sd_mix eq emerg_mod[emerg_index] or emer_sd_mix eq emerg_mod[emerg_index-1] or emer_sd_mix eq emerg_mod[emerg_index+1] )
;endelse
;
;w_sdt=[w_sd1,w_sd2]
;w_sdt=w_sdt(sort(w_sdt))
;indices = where(w_sdt eq shift(w_sdt, -1), count)
;w_sd=w_sdt[indices]


;Interm_cub_sd=cub_sd[w_sd,*]

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;; Calcul des vrassembleance pour chacun des paramètres (moyenne avec 1 paramètre fixé)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

coor=Param_cube_sd_mix[w_sd,3]
for j=0,s_h_slab-1 do begin
w=where(coor eq h_slab_mod[j])
Lw=L_sd[w]
hslab[i,j]=mean(Lw, /double, /nan)
endfor

coor=Param_cube_sd_mix[w_sd,4]
for j=0,s_c_slab-1 do begin
w=where(coor eq c_slab_mod[j])
Lw=L_sd[w]
cslab[i,j]=mean(Lw, /double, /nan)
endfor

coor=Param_cube_sd_mix[w_sd,5]
for j=0,s_frac_H2O_slab-1 do begin
w=where(coor eq frac_H2O_slab_mod[j])
Lw=L_sd[w]
propH2Oslab[i,j]=mean(Lw, /double, /nan)
endfor

coor=Param_cube_sd_mix[w_sd,6]
for j=0,s_grainsize_h2o_slab-1 do begin
w=where(coor eq grainsize_h2o_slab_mod[j])
Lw=L_sd[w]
grainh2oslab[i,j]=mean(Lw, /double, /nan)
endfor

coor=Param_cube_sd_mix[w_sd,7]
for j=0,s_propdustmix-1 do begin
w=where(coor eq propdustmix_x[j])
Lw=L_sd[w]
propdustmix[i,j]=mean(Lw, /double, /nan)
endfor

coor=Param_cube_sd_mix[w_sd,2]
for j=0,s_azim-1 do begin
w=where(coor eq azim_mod[j])
Lw=L_sd[w]
az_sd[i,j]=mean(Lw, /double, /nan)
endfor

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;; Valeurs des paramètres au maximum de vraissemblance
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ma=where(hslab[i,*] eq max(hslab[i,*]))
if n_elements(ma) eq 1 then hslab_evo[i]=hslab_x[ma]
ma=where(cslab[i,*] eq max(cslab[i,*]))
if n_elements(ma) eq 1 then cslab_evo[i]=cslab_x[ma]
ma=where(grainh2oslab[i,*] eq max(grainh2oslab[i,*]))
if n_elements(ma) eq 1 then grainh2oslab_evo[i]=grainh2oslab_x[ma]
ma=where(proph2oslab[i,*] eq max(proph2oslab[i,*]))
if n_elements(ma) eq 1 then proph2oslab_evo[i]=proph2oslab_x[ma]
ma=where(az_sd[i,*] eq max(az_sd[i,*]))
if n_elements(ma) eq 1 then azim_evo[i]=azim_x[ma]
ma=where(propdustmix[i,*] eq max(propdustmix[i,*]))
if n_elements(ma) eq 1 then propdustmix_evo[i]=propdustmix_x[ma]

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;
;max_L=where( inc_sd eq incid_return and emer_sd eq emerg_return and hslab_sd eq hslab_evo[i] and azim_sd eq azim_evo[i] and $
;cslab_sd eq cslab_evo[i] and grainsizeH2Oslab_sd eq grainh2oslab_evo[i] and fracH2Oslab_sd eq proph2oslab_evo[i])
;
;stat_sp=cub_sd[max_L[0],*]
;stat_spectres_sd[i,*]=stat_sp

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;; Sauvegarde des résultats
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

print, "statistics done" 
print, "computation done for mesure ", i+1, "    time =   ", systime(1)-t1
print,""

endfor


Param_cube_sd=reform(Param_cube_sd, ngeom_sd,nconf_sd,7)
time=systime(1)-t

var = 'hslab_x, cslab_x, propH2Oslab_x, grainH2Oslab_x, propdustmix_x, azim_x, hslab, cslab, propH2Oslab, grainH2Oslab, az_sd,' +$
'propdustmix, Lcube_sd, Param_cube_sd, nspectres, npix_sd, wavelengths, var, spectres, estim_spectres_sd, estim_param_sd, dates,' +$
'hslab_evo, azim_evo, cslab_evo, propH2Oslab_evo, grainH2Oslab_evo, propdustmix_evo, renorm_factor_sd, filename=total_fileout'

save, hslab_x, cslab_x, propH2Oslab_x, grainH2Oslab_x, propdustmix_x, azim_x, hslab, cslab, propH2Oslab, grainH2Oslab, az_sd, $
propdustmix, Lcube_sd, Param_cube_sd, nspectres, npix_sd, wavelengths, var, spectres, estim_spectres_sd, estim_param_sd, dates, $
hslab_evo, azim_evo, cslab_evo, propH2Oslab_evo, grainH2Oslab_evo, propdustmix_evo, renorm_factor_sd, time, filename=total_fileout
print, 'output file : ', total_fileout

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


print, "total execution time : ", time

end
