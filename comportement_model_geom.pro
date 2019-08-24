pro comportement_model_geom

num_wave=0
rough=0.5
num_wave=0
h0=10.
c0=0.999
g0=10.
i0=60.


cd, '/home/fandrieu/Simu_IPAG/pro/'
resolve_routine, 'colorbar'
resolve_routine, 'tv_polar'
cd, '/home/fandrieu'


if rough eq 0.5 then begin

;rough=0.5 ouverture source 0.0° ouverture observateur 1°
path_spectres = '/home/fandrieu/Inversion/Simulations/comportement_model_0.5_geom_a/comportement_model_0.5_geom_a_em0_C.cub'
envi_open_file, path_spectres, r_fid=data_fid_a
envi_file_query, data_fid_a, dims=dims_data_a, wl=wl, nb=nb
cub_a=fltarr((dims_data_a[2]+1)*(dims_data_a[4]+1),nb)
for ii=0,nb-1 do cub_a[*,ii] = ENVI_GET_DATA(fid=data_fid_a, dims=dims_data_a, pos=[ii] )
npix_a=(dims_data_a[2]+1)*(dims_data_a[4]+1)
path = '/home/fandrieu/Inversion/Simulations/comportement_model_0.5_geom_a/comportement_model_0.5_geom_a_em0.param'
A = pdsread(path,  /bsq)
param_cub_a = A.core
label_a = A.label
wave_a = get_keyword(A.label, 'BAND_BIN_CENTER')
     
path_spectres = '/home/fandrieu/Inversion/Simulations/comportement_model_0.5_geom_b/comportement_model_0.5_geom_b_em0_C.cub'
envi_open_file, path_spectres, r_fid=data_fid_b
envi_file_query, data_fid_b, dims=dims_data_b, wl=wl, nb=nb
cub_b=fltarr((dims_data_b[2]+1)*(dims_data_b[4]+1),nb)
for ii=0,nb-1 do cub_b[*,ii] = ENVI_GET_DATA(fid=data_fid_b, dims=dims_data_b, pos=[ii] )
npix_b=(dims_data_b[2]+1)*(dims_data_b[4]+1)
path = '/home/fandrieu/Inversion/Simulations/comportement_model_0.5_geom_b/comportement_model_0.5_geom_b_em0.param'
A = pdsread(path,  /bsq)
param_cub_b = A.core
label_b = A.label
wave_b = get_keyword(A.label, 'BAND_BIN_CENTER')
     
path_spectres = '/home/fandrieu/Inversion/Simulations/comportement_model_0.5_geom_c/comportement_model_0.5_geom_c_em0_C.cub'
envi_open_file, path_spectres, r_fid=data_fid_c
envi_file_query, data_fid_c, dims=dims_data_c, wl=wl, nb=nb
cub_c=fltarr((dims_data_c[2]+1)*(dims_data_c[4]+1),nb)
for ii=0,nb-1 do cub_c[*,ii] = ENVI_GET_DATA(fid=data_fid_c, dims=dims_data_c, pos=[ii] )
npix_c=(dims_data_c[2]+1)*(dims_data_c[4]+1)
path = '/home/fandrieu/Inversion/Simulations/comportement_model_0.5_geom_c/comportement_model_0.5_geom_c_em0.param'
A = pdsread(path,  /bsq)
param_cub_c = A.core
label_c = A.label
wave_c = get_keyword(A.label, 'BAND_BIN_CENTER')

s=size(param_cub_a)
cub_05=fltarr(dims_data_a[2]+dims_data_b[2]+dims_data_c[2]+3, dims_data_a[4]+1)
param_cub_05=fltarr(dims_data_a[2]+dims_data_b[2]+dims_data_c[2]+3, s[2]*s[3])
cub_05[0:dims_data_a[2],*]=cub_a[*,num_wave]
cub_05[dims_data_a[2]+1:dims_data_a[2]+dims_data_b[2]+1,*]=cub_b[*,num_wave]
cub_05[dims_data_a[2]+dims_data_b[2]+2:dims_data_a[2]+dims_data_b[2]+dims_data_c[2]+2,*]=cub_c[*,num_wave]
param_cub_05[0:dims_data_a[2],*]=param_cub_a
param_cub_05[dims_data_a[2]+1:dims_data_a[2]+dims_data_b[2]+1,*]=param_cub_b
param_cub_05[dims_data_a[2]+dims_data_b[2]+2:dims_data_a[2]+dims_data_b[2]+dims_data_c[2]+2,*]=param_cub_c
param_cub_05=reform(param_cub_05, dims_data_a[2]+dims_data_b[2]+dims_data_c[2]+3, s[2],s[3])

cub_simu=cub_05
param_cub_simu=param_cub_05


endif

if rough eq 1. then begin

;rough=1.0 ouverture source 0.0° ouverture observateur 1°
path_spectres = '/home/fandrieu/Inversion/Simulations/comportement_model_1.0_geom_a/comportement_model_1.0_geom_a_em0_C.cub'
envi_open_file, path_spectres, r_fid=data_fid_a
envi_file_query, data_fid_a, dims=dims_data_a, wl=wl, nb=nb
cub_a=fltarr((dims_data_a[2]+1)*(dims_data_a[4]+1),nb)
for ii=0,nb-1 do cub_a[*,ii] = ENVI_GET_DATA(fid=data_fid_a, dims=dims_data_a, pos=[ii] )
npix_a=(dims_data_a[2]+1)*(dims_data_a[4]+1)
path = '/home/fandrieu/Inversion/Simulations/comportement_model_1.0_geom_a/comportement_model_1.0_geom_a_em0.param'
A = pdsread(path,  /bsq)
param_cub_a = A.core
label_a = A.label
wave_a = get_keyword(A.label, 'BAND_BIN_CENTER')
     
path_spectres = '/home/fandrieu/Inversion/Simulations/comportement_model_1.0_geom_b/comportement_model_1.0_geom_b_em0_C.cub'
envi_open_file, path_spectres, r_fid=data_fid_b
envi_file_query, data_fid_b, dims=dims_data_b, wl=wl, nb=nb
cub_b=fltarr((dims_data_b[2]+1)*(dims_data_b[4]+1),nb)
for ii=0,nb-1 do cub_b[*,ii] = ENVI_GET_DATA(fid=data_fid_b, dims=dims_data_b, pos=[ii] )
npix_b=(dims_data_b[2]+1)*(dims_data_b[4]+1)
path = '/home/fandrieu/Inversion/Simulations/comportement_model_1.0_geom_b/comportement_model_1.0_geom_b_em0.param'
A = pdsread(path,  /bsq)
param_cub_b = A.core
label_b = A.label
wave_b = get_keyword(A.label, 'BAND_BIN_CENTER')
     
path_spectres = '/home/fandrieu/Inversion/Simulations/comportement_model_1.0_geom_c/comportement_model_1.0_geom_c_em0_C.cub'
envi_open_file, path_spectres, r_fid=data_fid_c
envi_file_query, data_fid_c, dims=dims_data_c, wl=wl, nb=nb
cub_c=fltarr((dims_data_c[2]+1)*(dims_data_c[4]+1),nb)
for ii=0,nb-1 do cub_c[*,ii] = ENVI_GET_DATA(fid=data_fid_c, dims=dims_data_c, pos=[ii] )
npix_c=(dims_data_c[2]+1)*(dims_data_c[4]+1)
path = '/home/fandrieu/Inversion/Simulations/comportement_model_1.0_geom_c/comportement_model_1.0_geom_c_em0.param'
A = pdsread(path,  /bsq)
param_cub_c = A.core
label_c = A.label
wave_c = get_keyword(A.label, 'BAND_BIN_CENTER')

s=size(param_cub_a)
cub_10=fltarr(dims_data_a[2]+dims_data_b[2]+dims_data_c[2]+3, dims_data_a[4]+1)
param_cub_10=fltarr(dims_data_a[2]+dims_data_b[2]+dims_data_c[2]+3, s[2]*s[3])
cub_10[0:dims_data_a[2],*]=cub_a[*,num_wave]
cub_10[dims_data_a[2]+1:dims_data_a[2]+dims_data_b[2]+1,*]=cub_b[*,num_wave]
cub_10[dims_data_a[2]+dims_data_b[2]+2:dims_data_a[2]+dims_data_b[2]+dims_data_c[2]+2,*]=cub_c[*,num_wave]
param_cub_10[0:dims_data_a[2],*]=param_cub_a
param_cub_10[dims_data_a[2]+1:dims_data_a[2]+dims_data_b[2]+1,*]=param_cub_b
param_cub_10[dims_data_a[2]+dims_data_b[2]+2:dims_data_a[2]+dims_data_b[2]+dims_data_c[2]+2,*]=param_cub_c
param_cub_10=reform(param_cub_10, dims_data_a[2]+dims_data_b[2]+dims_data_c[2]+3, s[2],s[3])

cub_simu=cub_10
param_cub_simu=param_cub_10

endif

s=size(param_cub_simu)
n_geom=s[1]
n_par=s[2]


;param_cub_simu=reform(param_cub_simu, n_geom*n_par,s[3])
in=param_cub_simu[*,*,2]
em=param_cub_simu[*,*,0]
az=param_cub_simu[*,*,1]
h=param_cub_simu[*,*,3]
c=param_cub_simu[*,*,4]
g=param_cub_simu[*,*,5]
w=where(h eq h0 and c eq c0 and g eq g0)
cube=cub_simu[w]

a=em
emerg_mod=a[uniq(a,sort(a))]
s_emerg = n_elements(emerg_mod)
emer_x=emerg_mod
    
a=az
azim_mod=a[uniq(a,sort(a))]
s_azim = n_elements(azim_mod)
azim_x=azim_mod

a=in
incid_mod=a[uniq(a,sort(a))]
s_incid = n_elements(incid_mod)
incid_x=incid_mod


;plot, incid, int
inc=in[*,0]
wi=where(inc eq i0)
d=cube[wi]

window,2, xsize=1300, ysize=900
device,  decomposed=0
LOADCT,39 
erase,255
!P.BACKGROUND=255
!P.COLOR=0
!P.Font=1
dd=reform(d, n_elements(emer_x), n_elements(azim_x))
;waz=where(dd gt 1.)
;dd[waz]=1.
dd=alog10(1.+dd)
maxr=max(dd)
tv_polar, transpose(dd),  azim_x, emer_x, grdres=1800, rot=2, colors=fix(indgen(256)/256.*256.),range=[0.,maxr,1./256.*maxr], style=2, c_thick=0, labels=lab, /noscale
COLORBAR, POSITION=[0.92, 0.05, 0.95, 0.98], format='(f5.1)', charsize=2, charthick=1, color=0, /vertical, maxrange=maxr, minrange=0.
;tv_polar, transpose(dd),  azim_x, emer_x, grdres=90, rot=2, colors=fix(indgen(256)/256.*256.),range=[0.685,0.695,0.01/256.], style=2, c_thick=0, labels=lab, /noscale
;COLORBAR, POSITION=[0.92, 0.05, 0.95, 0.98], maxrange=0.695, minrange=0.685, format='(f5.3)', charsize=2, charthick=1, color=0, /vertical



    


end