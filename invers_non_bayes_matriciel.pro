;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;          CODE AVEC GEOMETRIE FIXEE PAR LES DONNEES          ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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


pro invers_non_bayes_matriciel

total_fileout='/home/fandrieu/Inversion/results/idl_files/results_inversion_fixed_geom_3p_ln_300513_3.sav'
t=systime(1)
nc=247
;xm=5 ; time
;ym=2 ; place



restore, '/home/fandrieu/Inversion/results/idl_files/mat_covar_coef_renorm_noise_3percent_level_0dot3.sav' ; Matrice de covariance




; Observation

;;;;;; 1. observation as a gaussian pdf  : 

; Spectral Cube
input_file = '/home/fandrieu/Simu_IPAG/Nouveaux_calculs_septembre2012/Dark_spots_spectral_cube.SER'
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
geo_path = '/home/fandrieu/data/Richardson/Dark_spots_donnees_geo.PDS'
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
for i=0,nspectres-1 do temp[i,*]=spectres[12*(8*5+2)+1+i,*]
spectres=temp
dates=dblarr(nspectres)
temp=fltarr(nspectres)
temp=date[12*(8*5+2)+1:12*(8*5+2)+nspectres]
date=temp
temp=incid[12*(8*5+2)+1:12*(8*5+2)+nspectres]
incid=temp
temp=emer[12*(8*5+2)+1:12*(8*5+2)+nspectres]
emer=temp
temp=pha[12*(8*5+2)+1:12*(8*5+2)+nspectres]
pha=temp

estim_spectres_sd=fltarr(nspectres, nc)
estim_spectres_gs=fltarr(nspectres, nc)
estim_param_gs=fltarr(nspectres, 7)
estim_param_sd=fltarr(nspectres, 7)







path_fichiers_param = '/home/fandrieu/Inversion/Simulations/'


restore, '/data/fschmidt/fandrieu/Param_cube_sd.sav'
restore, '/data/fschmidt/fandrieu/Cube_sd.sav'
restore, '/home/fandrieu/Inversion/Simulations/Param_cube_gs.sav'
restore, '/home/fandrieu/Inversion/Simulations/Cube_gs.sav'

ngeom_gs=48
ngeom_sd=48

inc_sd=Param_cube_sd[*,*,0]
emer_sd=Param_cube_sd[*,*,1]
azim_sd=Param_cube_sd[*,*,2]
hslab_sd=Param_cube_sd[*,*,3]
cslab_sd=Param_cube_sd[*,*,4]
fracH2Oslab_sd=Param_cube_sd[*,*,5]
grainsizeH2Oslab_sd=Param_cube_sd[*,*,6]
Param_cube_sd=reform(Param_cube_sd, npix_sd, 7)
Lcube_sd=dblarr(2l*nconf_sd,nspectres)

inc_gs=Param_cube_gs[*,*,0]
emer_gs=Param_cube_gs[*,*,1]
azim_gs=Param_cube_gs[*,*,2]
fracH2Ogranul_gs=Param_cube_gs[*,*,3]
fracdustgranul_gs=Param_cube_gs[*,*,4]
grainsizeH2Ogranul_gs=Param_cube_gs[*,*,5]
grainsizeCO2granul_gs=Param_cube_gs[*,*,6]

Param_cube_gs=reform(Param_cube_gs, npix_gs, 7)
Lcube_gs=dblarr(2l*nconf_gs,nspectres)



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

a = fracH2Ogranul_gs
frac_H2O_granul_mod = a[uniq(a,sort(a))]
s_frac_H2O_granul =  n_elements(frac_H2O_granul_mod)
propH2Ogranul_x=frac_H2O_granul_mod

a = fracdustgranul_gs
frac_dust_granul_mod = a[uniq(a,sort(a))]
s_frac_dust_granul = n_elements(frac_dust_granul_mod)
propdustgranul_x=frac_dust_granul_mod

a= grainsizeH2Ogranul_gs
grainsize_H2O_granul_mod = a[uniq(a,sort(a))]
s_grainsize_H2O_granul = n_elements(grainsize_H2O_granul_mod)
grainH2Ogranul_x=grainsize_H2O_granul_mod

a = grainsizeCO2granul_gs
grainsize_CO2_granul_mod = a[uniq(a,sort(a))]
s_grainsize_CO2_granul = n_elements(grainsize_CO2_granul_mod)
grainCO2granul_x=grainsize_CO2_granul_mod

incid_mod = [55., 60., 65., 70., 75., 80.]
s_incid = 6

emerg_mod = [0., 10., 20., 30.]
s_emerg = 4

azim_mod = [60., 150.]
s_azim = 2
azim_x=[azim_mod]


grainH2Ogranul_gs=dblarr(nspectres, s_grainsize_H2O_granul)

grainCO2granul_gs=dblarr(nspectres, s_grainsize_CO2_granul)

propH2Ogranul_gs=dblarr(nspectres, s_frac_H2O_granul)

propdustgranul_gs=dblarr(nspectres, s_frac_dust_granul)

hslab=dblarr(nspectres, s_h_slab)

cslab=dblarr(nspectres, s_c_slab)

propH2Oslab=dblarr(nspectres, s_frac_H2O_slab)

grainH2Oslab=dblarr(nspectres, s_grainsize_H2O_slab)

incid_sd=dblarr(nspectres, s_incid)
emerg_sd=dblarr(nspectres, s_emerg)
az_sd=dblarr(nspectres, s_azim)

Param_cube_gs=reform(Param_cube_gs, npix_gs, 7)
Param_cube_sd=reform(Param_cube_sd, npix_sd, 7)


grainCO2_evo=fltarr(nspectres, /nozero)
hslab_evo=fltarr(nspectres, /nozero)
cslab_evo=fltarr(nspectres, /nozero)
proph2oslab_evo=fltarr(nspectres, /nozero)
grainh2oslab_evo=fltarr(nspectres, /nozero)
azim_evo=fltarr(nspectres, /nozero)

stat_spectres_sd=fltarr(nspectres,nc)


renorm_factor_sd=dblarr(nspectres)
renorm_factor_gs=dblarr(nspectres)

;bbl = where(d eq 65535.)
t1=systime(1)-t
print, "openning time :   ", t1
print, "Calculating..............................."



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
w_sd=where( inc_sd eq incid_return and emer_sd eq emerg_return )
mat_sd_temp=cub_sd[w_sd,*]
mat_sd=mat_sd_temp[*,gbl]

L_sd=dblarr(2l*nconf_sd)
L_sd=vraissemblance_ln_mat(d,mat_sd,invertC,2l*nconf_sd) 
renorm_factor_sd[i]=min(abs(L_sd))
L_sd=exp(L_sd+renorm_factor_sd[i])
Lcube_sd[*,i]=L_sd
t2=systime(1)-t1
print, "done sd, time =   ", t2


w_gs=where( inc_gs eq incid_return and emer_gs eq emerg_return )
mat_gs_temp=cub_gs[w_gs,*]
mat_gs=mat_gs_temp[*,gbl]

L_gs=dblarr(2l*nconf_gs)
L_gs=vraissemblance_ln_mat(d,mat_gs,invertC,2l*nconf_gs) 
renorm_factor_gs[i]=min(abs(L_gs))
L_gs=exp(L_gs+renorm_factor_gs[i])
Lcube_gs[*,i]=L_gs
t3=systime(1)-t1-t2
print, "done gs, time =   ", t3



print, "computing statistics....."

Interm_par_gs=Param_cube_gs[w_gs,*]
Interm_par_sd=Param_cube_sd[w_sd,*]
Interm_cub_gs=cub_gs[w_gs,*]
Interm_cub_sd=cub_sd[w_sd,*]

w=where(L_gs eq max(L_gs))
estim_spectres_gs[i,*]=Interm_cub_gs[w[0],*]
estim_param_gs[i,*]=Interm_par_gs[w[0],*] 

w=where(L_sd eq max(L_sd))
estim_spectres_sd[i,*]=Interm_cub_sd[w[0],*]
estim_param_sd[i,*]=Interm_par_sd[w[0],*] 

coor=Param_cube_gs[w_gs,5]
for j=0,s_grainsize_H2O_granul-1 do begin
w=where(coor eq grainsize_H2O_granul_mod[j])
Lw=L_gs[w]
grainH2Ogranul_gs[i,j]=total(Lw, /double, /nan)
endfor

coor=Param_cube_gs[w_gs,6]
for j=0,s_grainsize_CO2_granul-1 do begin
w=where(coor eq grainsize_CO2_granul_mod[j])
Lw=L_gs[w]
grainCO2granul_gs[i,j]=total(Lw, /double, /nan)
endfor

coor=Param_cube_gs[w_gs,3]
for j=0,s_frac_H2O_granul-1 do begin
w=where(coor eq frac_H2O_granul_mod[j])
Lw=L_gs[w]
propH2Ogranul_gs[i,j]=total(Lw, /double, /nan)
endfor

coor=Param_cube_gs[w_gs,4]
for j=0,s_frac_dust_granul-1 do begin
w=where(coor eq frac_dust_granul_mod[j])
Lw=L_gs[w]
propdustgranul_gs[i,j]=total(Lw, /double, /nan)
endfor

ma=where(grainCO2granul_gs[i,*] eq max(grainCO2granul_gs[i,*]))
if n_elements(ma) eq 1 then grainCO2_evo[i]=grainCO2granul_x[ma]


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


coor=Param_cube_sd[w_sd,3]
for j=0,s_h_slab-1 do begin
w=where(coor eq h_slab_mod[j])
Lw=L_sd[w]
hslab[i,j]=total(Lw, /double, /nan)
endfor

coor=Param_cube_sd[w_sd,4]
for j=0,s_c_slab-1 do begin
w=where(coor eq c_slab_mod[j])
Lw=L_sd[w]
cslab[i,j]=total(Lw, /double, /nan)
endfor

coor=Param_cube_sd[w_sd,5]
for j=0,s_frac_H2O_slab-1 do begin
w=where(coor eq frac_H2O_slab_mod[j])
Lw=L_sd[w]
propH2Oslab[i,j]=total(Lw, /double, /nan)
endfor

coor=Param_cube_sd[w_sd,6]
for j=0,s_grainsize_h2o_slab-1 do begin
w=where(coor eq grainsize_h2o_slab_mod[j])
Lw=L_sd[w]
grainh2oslab[i,j]=total(Lw, /double, /nan)
endfor

coor=Param_cube_sd[w_sd,2]
for j=0,s_azim-1 do begin
w=where(coor eq azim_mod[j])
Lw=L_sd[w]
az_sd[i,j]=total(Lw, /double, /nan)
endfor


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


max_L=where( inc_sd eq incid_return and emer_sd eq emerg_return and hslab_sd eq hslab_evo[i] and azim_sd eq azim_evo[i] and $
cslab_sd eq cslab_evo[i] and grainsizeH2Oslab_sd eq grainh2oslab_evo[i] and fracH2Oslab_sd eq proph2oslab_evo[i])

stat_sp=cub_sd[max_L[0],*]
stat_spectres_sd[i,*]=stat_sp

print, "statistics done" 
print, "computation done for mesure ", i+1, "    time =   ", systime(1)-t1
print,""

endfor


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;hslab_sg=dblarr(s_h_slab,2)
;coor=Lcube_sg[*,*,4]
;L=Lcube_sg[*,*,0]
;for i=0,s_h_slab-1 do begin
;hslab_sg[i,0]=h_slab_mod[i]
;w=where(coor eq h_slab_mod[i])
;Lw=L[w]
;hslab_sg[i,1]=double(mean(Lw, /nan))
;endfor
;
;grainH2Oslab_sg=dblarr(s_grainsize_H2O_slab,2)
;coor=Lcube_sg[*,*,7]
;L=Lcube_sg[*,*,0]
;for i=0,s_grainsize_H2O_slab-1 do begin
;grainH2Oslab_sg[i,0]=grainsize_H2O_slab_mod[i]
;w=where(coor eq grainsize_H2O_slab_mod[i])
;Lw=L[w]
;grainH2Oslab_sg[i,1]=double(mean(Lw, /nan))
;endfor
;
;cslab_sg=dblarr(s_c_slab,2)
;coor=Lcube_sg[*,*,5]
;L=Lcube_sg[*,*,0]
;for i=0,s_c_slab-1 do begin
;cslab_sg[i,0]=c_slab_mod[i]
;w=where(coor eq c_slab_mod[i])
;Lw=L[w]
;cslab_sg[i,1]=double(mean(Lw, /nan))
;endfor
;
;propH2Oslab_sg=dblarr(s_frac_H2O_slab,2)
;coor=Lcube_sg[*,*,6]
;L=Lcube_sg[*,*,0]
;for i=0,s_frac_H2O_slab-1 do begin
;propH2Oslab_sg[i,0]=frac_H2O_slab_mod[i]
;w=where(coor eq frac_H2O_slab_mod[i])
;Lw=L[w]
;propH2Oslab_sg[i,1]=double(mean(Lw, /nan))
;endfor
;
;grainH2Ogranul_sg=dblarr(s_grainsize_H2O_granul,2)
;coor=Lcube_sg[*,*,10]
;L=Lcube_sg[*,*,0]
;for i=0,s_grainsize_H2O_granul-1 do begin
;grainH2Ogranul_sg[i,0]=grainsize_H2O_granul_mod[i]
;w=where(coor eq grainsize_H2O_granul_mod[i])
;Lw=L[w]
;grainH2Ogranul_sg[i,1]=double(mean(Lw, /nan))
;endfor
;
;grainCO2granul_sg=dblarr(s_grainsize_CO2_granul,2)
;coor=Lcube_sg[*,*,11]
;L=Lcube_sg[*,*,0]
;for i=0,s_grainsize_CO2_granul-1 do begin
;grainCO2granul_sg[i,0]=grainsize_CO2_granul_mod[i]
;w=where(coor eq grainsize_CO2_granul_mod[i])
;Lw=L[w]
;grainCO2granul_sg[i,1]=double(mean(Lw, /nan))
;endfor
;
;propH2Ogranul_sg=dblarr(s_frac_H2O_granul,2)
;coor=Lcube_sg[*,*,8]
;L=Lcube_sg[*,*,0]
;for i=0,s_frac_H2O_granul-1 do begin
;propH2Ogranul_sg[i,0]=frac_H2O_granul_mod[i]
;w=where(coor eq frac_H2O_granul_mod[i])
;Lw=L[w]
;propH2Ogranul_sg[i,1]=double(mean(Lw, /nan))
;endfor
;
;propdustgranul_sg=dblarr(s_frac_dust_granul,2)
;coor=Lcube_sg[*,*,9]
;L=Lcube_sg[*,*,0]
;for i=0,s_frac_dust_granul-1 do begin
;propdustgranul_sg[i,0]=frac_dust_granul_mod[i]
;w=where(coor eq frac_dust_granul_mod[i])
;Lw=L[w]
;propdustgranul_sg[i,1]=double(mean(Lw, /nan))
;endfor

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;hgranul_gd=dblarr(s_h_granul,2)
;coor=Lcube_gd[*,*,4]
;L=Lcube_gd[*,*,0]
;for i=0,s_h_granul-1 do begin
;hgranul_gd[i,0]=h_granul_mod[i]
;w=where(coor eq h_granul_mod[i])
;Lw=L[w]
;hgranul_gd[i,1]=double(mean(Lw, /nan))
;endfor
;
;grainH2Ogranul_gd=dblarr(s_grainsize_H2O_granul,2)
;coor=Lcube_gd[*,*,7]
;L=Lcube_gd[*,*,0]
;for i=0,s_grainsize_H2O_granul-1 do begin
;grainH2Ogranul_gd[i,0]=grainsize_H2O_granul_mod[i]
;w=where(coor eq grainsize_H2O_granul_mod[i])
;Lw=L[w]
;grainH2Ogranul_gd[i,1]=double(mean(Lw, /nan))
;endfor
;
;grainCO2granul_gd=dblarr(s_grainsize_CO2_granul,2)
;coor=Lcube_gd[*,*,8]
;L=Lcube_gd[*,*,0]
;for i=0,s_grainsize_CO2_granul-1 do begin
;grainCO2granul_gd[i,0]=grainsize_CO2_granul_mod[i]
;w=where(coor eq grainsize_CO2_granul_mod[i])
;Lw=L[w]
;grainCO2granul_gd[i,1]=double(mean(Lw, /nan))
;endfor
;
;propH2Ogranul_gd=dblarr(s_frac_H2O_granul,2)
;coor=Lcube_gd[*,*,5]
;L=Lcube_gd[*,*,0]
;for i=0,s_frac_H2O_granul-1 do begin
;propH2Ogranul_gd[i,0]=frac_H2O_granul_mod[i]
;w=where(coor eq frac_H2O_granul_mod[i])
;Lw=L[w]
;propH2Ogranul_gd[i,1]=double(mean(Lw, /nan))
;endfor
;
;propdustgranul_gd=dblarr(s_frac_dust_granul,2)
;coor=Lcube_gd[*,*,6]
;L=Lcube_gd[*,*,0]
;for i=0,s_frac_dust_granul-1 do begin
;propdustgranul_gd[i,0]=frac_dust_granul_mod[i]
;w=where(coor eq frac_dust_granul_mod[i])
;Lw=L[w]
;propdustgranul_gd[i,1]=double(mean(Lw, /nan))
;endfor


;LINFIT
;x=wavelengths
;s=size(wavelengths)
;nb=s[1]
;y=fltarr(nb)
;d=spectres[6+(0+0*8)*12,*]
;estim_d=estim_spectres_sd[6+(0+0*8)*12,*]
;y=d-estim_d
;fit_coef=linfit(x,y,chisq=chisq, prob=prob, sigma=sigma)
;corr=fltarr(nb)
;for i=0,246 do corr[i]=fit_coef[0]+fit_coef[1]*wavelengths[i]
;estim_d_sd_corr=estim_d+corr
;plot, x, d, xrange=[1,2.7], xstyle=1
;oplot, x, estim_d+corr, color=150


Param_cube_gs=reform(Param_cube_gs, ngeom_gs,nconf_gs,7)
Param_cube_sd=reform(Param_cube_sd, ngeom_sd,nconf_sd,7)


;
;save, hslab_sg, grainH2Oslab_sg, cslab_sg, propH2Oslab_sg, grainH2Ogranul_sg, grainCO2granul_sg, propH2Ogranul_sg, propdustgranul_sg,$
;hslab_sd, cslab_sd, propH2Oslab_sd, grainH2Oslab_sd, grainH2Ogranul_gs, grainCO2granul_gs, propH2Ogranul_gs, propdustgranul_gs, $
;hgranul_gd, grainH2Ogranul_gd, grainCO2granul_gd, propH2Ogranul_gd, propdustgranul_gd, filename=fileout


var = 'hslab_x, cslab_x, propH2Oslab_x, grainH2Oslab_x, grainH2Ogranul_x, grainCO2granul_x, propH2Ogranul_x, propdustgranul_x,' +$
'azim_x, hslab, cslab, propH2Oslab, grainH2Oslab, az_sd, grainH2Ogranul_gs, grainCO2granul_gs, propH2Ogranul_gs, propdustgranul_gs,' +$
'Lcube_sd, Lcube_gs, Param_cube_sd, Param_cube_gs, nspectres, npix_sd, npix_gs, wavelengths, var, spectres, estim_spectres_sd,' +$
'estim_spectres_gs, estim_param_gs, estim_param_sd, dates, hslab_evo, grainCO2granul_evo, azim_evo, cslab_evo, propH2Oslab_evo,' +$
'grainH2Oslab_evo, renorm_factor_sd, renorm_factor_gs'

save, hslab_x, cslab_x, propH2Oslab_x, grainH2Oslab_x, grainH2Ogranul_x, grainCO2granul_x, propH2Ogranul_x, propdustgranul_x, $
azim_x, hslab, cslab, propH2Oslab, grainH2Oslab, az_sd, grainH2Ogranul_gs, grainCO2granul_gs, propH2Ogranul_gs, propdustgranul_gs, $
Lcube_sd, Lcube_gs, Param_cube_sd, Param_cube_gs, nspectres, npix_sd, npix_gs, wavelengths, var, spectres, estim_spectres_sd, $
estim_spectres_gs, estim_param_gs, estim_param_sd, dates, hslab_evo, grainCO2granul_evo, azim_evo, cslab_evo, propH2Oslab_evo, $
grainH2Oslab_evo, renorm_factor_sd, renorm_factor_gs, filename=total_fileout
print, 'output file : ', total_fileout
time=systime(1)-t

print, "Total execution time : ", time

end
