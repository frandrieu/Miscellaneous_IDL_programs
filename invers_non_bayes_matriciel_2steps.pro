;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;          CODE AVEC GEOMETRIE FIXEE PAR LES DONNEES          ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;; ALGORITHME D'INVERSION EN DEUX ETAPES EN RESSERANT LE MAILLAGE AUTOUR DE LA SOLUTION DE LA PREMIERE ETAPE ;;;;;;;;;
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


function vraissemblance_mat, d, dd, invertC, npix
L=dblarr(npix)
d2=fltarr(npix, n_elements(d))
for i=0,n_elements(d)-1 do d2[*,i]=replicate(d[i], npix)
mat1 = invertC ## (dd-d2) 
dif=dd-d2 
for i=0,npix-1 do begin
diff=dif[i,*]
line=mat1[i,*]
L[i]=exp(-0.5* transpose(diff)  ## line)
endfor

return, L

end

pro invers_non_bayes_matriciel_2steps

total_fileout='/home/fandrieu/Inversion/results/idl_files/results_inversion_fixed_geom_noise_5percent_ln_2steps_130513.sav'
t=systime(1)
nc=247
;xm=5 ; time
;ym=2 ; place



restore, '/home/fandrieu/Inversion/results/idl_files/mat_covar_coef_renorm_noise_5percent.sav' ; Matrice de covariance




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

; Withdraw the bad bands
sp=spectres[0,*]
bbl_tot=where(~finite(sp))
for i=1,nspectres-1 do begin
sp=spectres[i,*]
bbl=where(~finite(sp))
bbl_tot=[bbl_tot, bbl] 
endfor

bbl=bbl_tot[uniq(bbl_tot,sort(bbl_tot))]
nbbl=n_elements(bbl)
if bbl[0] eq -1 then bbl=bbl[1:nbbl-1]
mask=intarr(nc)
mask[*]=1
mask[bbl]=0
gbl=where(mask eq 1)
new_covar=dblarr(n_elements(gbl), n_elements(gbl))
for i=0,n_elements(gbl)-1 do new_covar[i,*]=mat_covar_coef[gbl[i], gbl]


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

dates=dblarr(nspectres)

nspectres=10
temp=fltarr(10,nc)
for i=0,nspectres-1 do temp[i,*]=spectres[i,*]
spectres=temp



estim_spectres_sd=fltarr(nspectres, nc)
estim_param_sd=fltarr(nspectres, 7)
first_estim_spectres_sd=fltarr(nspectres, nc)
first_estim_param_sd=fltarr(nspectres, 7)




invertC = invert(new_covar)

path_fichiers_param = '/home/fandrieu/Inversion/Simulations/'


restore, '/home/fandrieu/Inversion/Simulations/Param_cube_sd.sav'
restore, '/home/fandrieu/Inversion/Simulations/Cube_sd.sav'
restore, '/home/fandrieu/Inversion/Simulations/Param_cube_sd_first_step.sav'
restore, '/home/fandrieu/Inversion/Simulations/Cube_sd_first_step.sav'


ngeom_sd=48

inc_sd_first_step=Param_cube_sd_first_step[*,*,0]
emer_sd_first_step=Param_cube_sd_first_step[*,*,1]
azim_sd_first_step=Param_cube_sd_first_step[*,*,2]
hslab_sd_first_step=Param_cube_sd_first_step[*,*,3]
cslab_sd_first_step=Param_cube_sd_first_step[*,*,4]
fracH2Oslab_sd_first_step=Param_cube_sd_first_step[*,*,5]
grainsizeH2Oslab_sd_first_step=Param_cube_sd_first_step[*,*,6]
Param_cube_sd_first_step=reform(Param_cube_sd_first_step, npix_sd_first_step, 7)
Lcube_sd_first_step=dblarr(2l*nconf_sd_first_step,nspectres)

inc_sd=Param_cube_sd[*,*,0]
emer_sd=Param_cube_sd[*,*,1]
azim_sd=Param_cube_sd[*,*,2]
hslab_sd=Param_cube_sd[*,*,3]
cslab_sd=Param_cube_sd[*,*,4]
fracH2Oslab_sd=Param_cube_sd[*,*,5]
grainsizeH2Oslab_sd=Param_cube_sd[*,*,6]
Param_cube_sd=reform(Param_cube_sd, npix_sd, 7)
Lcube_sd=dblarr(npix_sd,nspectres)
Lcube_sd[*]=0d
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



hslab=dblarr(nspectres, s_h_slab)

cslab=dblarr(nspectres, s_c_slab)

propH2Oslab=dblarr(nspectres, s_frac_H2O_slab)

grainH2Oslab=dblarr(nspectres, s_grainsize_H2O_slab)

incid_sd=dblarr(nspectres, s_incid)
emerg_sd=dblarr(nspectres, s_emerg)
az_sd=dblarr(nspectres, s_azim)

grainCO2_evo=fltarr(nspectres, /nozero)
hslab_evo=fltarr(nspectres, /nozero)
cslab_evo=fltarr(nspectres, /nozero)
proph2oslab_evo=fltarr(nspectres, /nozero)
grainh2oslab_evo=fltarr(nspectres, /nozero)
azim_evo=fltarr(nspectres, /nozero)

stat_spectres_sd=fltarr(nspectres,nc)


renorm_factor_sd=dblarr(nspectres)

;bbl = where(d eq 65535.)
t1=systime(1)-t
print, "openning time :   ", t1
print, "Calculating..............................."



for i=0, nspectres-1 do begin

t1=systime(1)
d=spectres[i,gbl]
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

if incid_index lt 1 then begin
w_sd1=where( inc_sd_first_step eq incid_mod[incid_index] or inc_sd_first_step eq incid_mod[incid_index+1] )
endif else begin
if incid_index gt 4 then w_sd1=where( inc_sd_first_step eq incid_mod[incid_index] or inc_sd_first_step eq incid_mod[incid_index-1] ) $
else w_sd1=where( inc_sd_first_step eq incid_mod[incid_index] or inc_sd_first_step eq incid_mod[incid_index-1] or inc_sd_first_step eq incid_mod[incid_index+1] )
endelse
if emerg_index lt 1 then begin
w_sd2=where( emer_sd_first_step eq emerg_mod[emerg_index] or emer_sd_first_step eq emerg_mod[emerg_index+1] )
endif else begin
if emerg_index gt 2 then w_sd2=where( emer_sd_first_step eq emerg_mod[emerg_index] or emer_sd_first_step eq emerg_mod[emerg_index-1] ) $
else w_sd2=where( emer_sd_first_step eq emerg_mod[emerg_index] or emer_sd_first_step eq emerg_mod[emerg_index-1] or emer_sd_first_step eq emerg_mod[emerg_index+1] )
endelse
w_sdt=[w_sd1,w_sd2]
w_sdt=w_sdt(sort(w_sdt))
indices = where(w_sdt eq shift(w_sdt, -1), count)
w_sd=w_sdt[indices]
mat_sd_temp=cub_sd_first_step[w_sd,*]
mat_sd=mat_sd_temp[*,gbl]
temp=mat_sd[*,0]
nconf=n_elements(temp)
temp=0
L_sd=dblarr(nconf)
L_sd=vraissemblance_ln_mat(d,mat_sd,invertC,nconf) 

Interm_par_sd=Param_cube_sd_first_step[w_sd,*]
Interm_cub_sd=cub_sd_first_step[w_sd,*]


w=where(L_sd eq max(L_sd))
first_estim_spectres_sd[i,*]=Interm_cub_sd[w[0],*]
first_estim_param_sd[i,*]=Interm_par_sd[w[0],*] 
pos_h=where(hslab_x eq first_estim_param_sd[i,3])
pos_c=where(cslab_x eq first_estim_param_sd[i,4]) 

t2=systime(1)-t1
print, "done first step, time =   ", t2


w_geo=where( inc_sd eq first_estim_param_sd[i,0] and emer_sd eq first_estim_param_sd[i,1] and azim_sd eq first_estim_param_sd[i,2] )
if pos_h lt 10 then begin 
w_h=where(hslab_sd le hslab_x[pos_h[0]+10]) 
endif else begin
if n_elements(hslab_x)-1-pos_h[0] lt 10 then w_h=where(hslab_sd ge hslab_x[pos_h[0]-10]) else w_h=where(hslab_sd le hslab_x[pos_h[0]+10] and hslab_sd ge hslab_x[pos_h[0]-10])
endelse
w_geoht=[w_geo,w_h]
w_geoht=w_geoht(sort(w_geoht))
indices = where(w_geoht eq shift(w_geoht, -1), count)
w_geoh=w_geoht[indices]
if pos_c[0] lt 5 then begin 
w_c=where(cslab_sd le cslab_x[pos_c[0]+5]) 
endif else begin
if n_elements(cslab_x)-1-pos_c[0] lt 5 then w_c=where(cslab_sd ge cslab_x[pos_c[0]-5]) else w_c=where(cslab_sd le cslab_x[pos_c[0]+5] and cslab_sd ge cslab_x[pos_c[0]-5])
endelse
w_sdt=[w_geoh,w_c]
w_sdt=w_sdt(sort(w_sdt))
indices = where(w_sdt eq shift(w_sdt, -1), count)
w_sd=w_sdt[indices]

mat_sd_temp=cub_sd[w_sd,*]
mat_sd=mat_sd_temp[*,gbl]
temp=mat_sd[*,0]
nconf=n_elements(temp)
temp=0
L_sd=dblarr(nconf)
L_sd=vraissemblance_mat(d,mat_sd,invertC,nconf) 
;renorm_factor_sd[i]=min(abs(L_sd))
;L_sd=exp(L_sd+renorm_factor_sd[i])
Lcube_sd[w_sd,i]=L_sd



t3=systime(1)-t1-t2
print, "done second step, time =   ", t3

;nc_sd=Param_cube_sd[*,*,0]
;emer_sd=Param_cube_sd[*,*,1]
;azim_sd=Param_cube_sd[*,*,2]
;hslab_sd=Param_cube_sd[*,*,3]
;cslab_sd=Param_cube_sd[*,*,4]
;fracH2Oslab_sd=Param_cube_sd[*,*,5]
;grainsizeH2Oslab_sd=Param_cube_sd[*,*,6]
;Param_cube_sd=reform(Param_cube_sd, npix_sd, 7)
;Lcube_sd=dblarr(2l*nconf_sd,nspectres)
;
;inc_gs=Param_cube_gs[*,*,0]
;emer_gs=Param_cube_gs[*,*,1]
;azim_gs=Param_cube_gs[*,*,2]
;fracH2Ogranul_gs=Param_cube_gs[*,*,3]
;fracdustgranul_gs=Param_cube_gs[*,*,4]
;grainsizeH2Ogranul_gs=Param_cube_gs[*,*,5]
;grainsizeCO2granul_gs=Param_cube_gs[*,*,6]


print, "computing statistics....."

Interm_par_sd=Param_cube_sd[w_sd,*]
Interm_cub_sd=cub_sd[w_sd,*]

w=where(L_sd eq max(L_sd))
estim_spectres_sd[i,*]=Interm_cub_sd[w[0],*]
estim_param_sd[i,*]=Interm_par_sd[w[0],*] 


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



;LINFIT
;x=wavelengths
;s=size(wavelengths)
;nb=s[1]
;y=fltarr(nb)
;d=spectres[4+(1+0*8)*12,*]
;estim_d=estim_spectres_sd[4+(1+0*8)*12,*]
;y=d-estim_d
;fit_coef=linfit(x,y,chisq=chisq, prob=prob, sigma=sigma)
;corr=fltarr(nb)
;for i=0,246 do corr[i]=fit_coef[0]+fit_coef[1]*wavelengths[i]
;estim_d_sd_corr=estim_d+corr
;plot, x, d, xrange=[1,2.7], xstyle=1
;oplot, x, estim_d+corr, color=150

Param_cube_sd=reform(Param_cube_sd, ngeom_sd,nconf_sd,7)



var = 'hslab_x, cslab_x, propH2Oslab_x, grainH2Oslab_x, azim_x, hslab, cslab, propH2Oslab, grainH2Oslab, az_sd, Lcube_sd,'+ $
'Param_cube_sd, nspectres, npix_sd, wavelengths, var, spectres, estim_spectres_sd, estim_param_sd, dates, hslab_evo, azim_evo,'+ $
'cslab_evo, propH2Oslab_evo, grainH2Oslab_evo, renorm_factor_sd,'

save, hslab_x, cslab_x, propH2Oslab_x, grainH2Oslab_x, azim_x, hslab, cslab, propH2Oslab, grainH2Oslab, az_sd, Lcube_sd, $
Param_cube_sd, nspectres, npix_sd, wavelengths, var, spectres, estim_spectres_sd, estim_param_sd, dates, hslab_evo, azim_evo, $
cslab_evo, propH2Oslab_evo, grainH2Oslab_evo, renorm_factor_sd, filename=total_fileout
print, 'output file : ', total_fileout
time=systime(1)-t

print, "Total execution time : ", time

end
