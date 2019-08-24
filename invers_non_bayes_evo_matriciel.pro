;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;          CODE AVEC GEOMETRIE VARIABLE          ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;; Voir invers_non_bayes_matriciel pour fixer libre la géométrie ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


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


pro invers_non_bayes_evo_matriciel

total_fileout='/home/fandrieu/Inversion/results/idl_files/results_inversion_non_bayes_evo_matriciel_test_2_noise_3percent.sav'
t=systime(1)
nc=247
;xm=5 ; time
;ym=2 ; place



restore, '/home/fandrieu/Inversion/results/idl_files/mat_covar_coef_renorm_noise_3percent.sav' ; Matrice de covariance
invertC = invert(mat_covar_coef)



; Observation

;;;;;; 1. observation as a gaussian pdf  : 

; example :

; Mean
input_file = '/home/fandrieu/Simu_IPAG/Nouveaux_calculs_septembre2012/Dark_spots_spectral_cube.SER'
envi_open_file, input_file, r_fid=data_fid
envi_file_query, data_fid, dims=dims_data, wl=wl, nb = nb
spectres=fltarr((dims_data[2]+1),(dims_data[4]+1),nc)
for ii=0,nc-1 do spectres[*,*,ii]=envi_get_data(fid=data_fid, dims = dims_data, pos=[ii+3])
inherit = envi_set_inheritance(data_fid, dims_data)
s =size(spectres)
nspectres = s(1)*s(2)
spectres=reform(spectres, nspectres,nc)


wavelenghts=fltarr(nc)
wavelenghts=wl[3:nc+2]




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

nspectres=(dims_data[2]+1)*(dims_data[4]+1)
nspectres=12
inter=spectres
spectres=fltarr(nspectres, nc)
spectres=inter[0:11,*]

dates=dblarr(nspectres)

estim_spectres_sd=fltarr(nspectres, nc)
estim_spectres_gs=fltarr(nspectres, nc)
estim_param_gs=fltarr(nspectres, 7)
estim_param_sd=fltarr(nspectres, 7)


path_fichiers_param = '/home/fandrieu/Inversion/Simulations/'





;path_spectres = path_fichiers_param+'param_slab_granul.PDS'
;        envi_open_file, path_spectres, r_fid=data_fid_sg
;        envi_file_query, data_fid_sg, dims=dims_data_sg, wl=wl, nb=nb
;        cub_sg=fltarr((dims_data_sg[2]+1)*(dims_data_sg[4]+1),nc)
;        for ii=3,nc+2 do cub_sg[*,ii-3] = ENVI_GET_DATA(fid=data_fid_sg, dims=dims_data_sg, pos=[ii] )
;        ;for ii=0,245 do cub_sg[*,ii] = ENVI_GET_DATA(fid=data_fid_sg, dims=dims_data_sg, pos=[ii+3] )
;        
;path = path_fichiers_param+'param_slab_granul_em0.param'
;      
;      A = pdsread(path,  /bsq)
;      cub_sg_par = A.core
;      label_sg = A.label
;      wave_sg = get_keyword(A.label, 'BAND_BIN_CENTER') 
;      
;
;         
;inc_sg = cub_sg_par[*,*,2]
;emer_sg = cub_sg_par[*,*,0]
;azim_sg = cub_sg_par[*,*,1]
;hslab_sg = cub_sg_par[*,*,8]
;cslab_sg = cub_sg_par[*,*,9]
;fracH2Oslab_sg = cub_sg_par[*,*,10]*100.
;fracH2Oslab_sg[ where((fracH2Oslab_sg -10.) lt 0.0001) ] =10.
;grainsizeH2Oslab_sg = cub_sg_par[*,*,13]
;fracH2Ogranul_sg = cub_sg_par[*,*,3]*100.
;fracdustgranul_sg = cub_sg_par[*,*,5]*100.
;grainsizeH2Ogranul_sg = cub_sg_par[*,*,6]
;grainsizeCO2granul_sg = cub_sg_par[*,*,7]     
;
;Lcube_sg=dblarr(dims_data_sg[2]+1,dims_data_sg[4]+1,12)    
;Lcube_sg[*,*,1]=inc_sg
;Lcube_sg[*,*,2]=emer_sg
;Lcube_sg[*,*,3]=azim_sg
;Lcube_sg[*,*,4]=hslab_sg
;Lcube_sg[*,*,5]=cslab_sg
;Lcube_sg[*,*,6]=fracH2Oslab_sg
;Lcube_sg[*,*,7]=grainsizeH2Oslab_sg
;Lcube_sg[*,*,8]=fracH2Ogranul_sg
;Lcube_sg[*,*,9]=fracdustgranul_sg
;Lcube_sg[*,*,10]=grainsizeH2Ogranul_sg
;Lcube_sg[*,*,11]=grainsizeCO2granul_sg
      
path_spectres = path_fichiers_param+'param_slab_dust_0313/param_slab_dust_0313_em0_V.cub'
     envi_open_file, path_spectres, r_fid=data_fid_sd_1
     envi_file_query, data_fid_sd_1, dims=dims_data_sd_1, wl=wl, nb=nb
     cub_sd_1=fltarr((dims_data_sd_1[2]+1)*(dims_data_sd_1[4]+1),nc)
     for ii=3,nc+2 do cub_sd_1[*,ii-3] = ENVI_GET_DATA(fid=data_fid_sd_1, dims=dims_data_sd_1, pos=[ii] )     
     ;for ii=0,245 do cub_sd[*,ii] = ENVI_GET_DATA(fid=data_fid_sd, dims=dims_data_sd, pos=[ii+3] )
path = path_fichiers_param+'param_slab_dust_0313/param_slab_dust_0313_em0.param'
      
      A = pdsread(path,  /bsq)
      cub_sd_par_1 = A.core
      label_sd_1 = A.label
      wave_sd_1 = get_keyword(A.label, 'BAND_BIN_CENTER')

path_spectres = path_fichiers_param+'param_slab_dust_180313/param_slab_dust_180313_em0_V.cub'
     envi_open_file, path_spectres, r_fid=data_fid_sd_2
     envi_file_query, data_fid_sd_2, dims=dims_data_sd_2, wl=wl, nb=nb
     cub_sd_2=fltarr((dims_data_sd_2[2]+1)*(dims_data_sd_2[4]+1),nc)
     for ii=3,nc+2 do cub_sd_2[*,ii-3] = ENVI_GET_DATA(fid=data_fid_sd_2, dims=dims_data_sd_2, pos=[ii] )     
     ;for ii=0,245 do cub_sd[*,ii] = ENVI_GET_DATA(fid=data_fid_sd, dims=dims_data_sd, pos=[ii+3] )
path = path_fichiers_param+'param_slab_dust_180313/param_slab_dust_180313_em0.param'
      
      A = pdsread(path,  /bsq)
      cub_sd_par_2 = A.core
      label_sd_2 = A.label
      wave_sd_2 = get_keyword(A.label, 'BAND_BIN_CENTER')
      

path_spectres = path_fichiers_param+'param_slab_dust_200313/param_slab_dust_200313_em0_V.cub'
     envi_open_file, path_spectres, r_fid=data_fid_sd_3
     envi_file_query, data_fid_sd_3, dims=dims_data_sd_3, wl=wl, nb=nb
     cub_sd_3=fltarr((dims_data_sd_3[2]+1)*(dims_data_sd_3[4]+1),nc)
     for ii=3,nc+2 do cub_sd_3[*,ii-3] = ENVI_GET_DATA(fid=data_fid_sd_3, dims=dims_data_sd_3, pos=[ii] )     
     ;for ii=0,245 do cub_sd[*,ii] = ENVI_GET_DATA(fid=data_fid_sd, dims=dims_data_sd, pos=[ii+3] )
path = path_fichiers_param+'param_slab_dust_200313/param_slab_dust_200313_em0.param'
      
      A = pdsread(path,  /bsq)
      cub_sd_par_3 = A.core
      label_sd_3 = A.label
      wave_sd_3 = get_keyword(A.label, 'BAND_BIN_CENTER')


path_spectres = path_fichiers_param+'param_slab_dust_200313_2/param_slab_dust_200313_2_em0_V.cub'
     envi_open_file, path_spectres, r_fid=data_fid_sd_4
     envi_file_query, data_fid_sd_4, dims=dims_data_sd_4, wl=wl, nb=nb
     cub_sd_4=fltarr((dims_data_sd_4[2]+1)*(dims_data_sd_4[4]+1),nc)
     for ii=3,nc+2 do cub_sd_4[*,ii-3] = ENVI_GET_DATA(fid=data_fid_sd_4, dims=dims_data_sd_4, pos=[ii] )     
     ;for ii=0,245 do cub_sd[*,ii] = ENVI_GET_DATA(fid=data_fid_sd, dims=dims_data_sd, pos=[ii+3] )
path = path_fichiers_param+'param_slab_dust_200313_2/param_slab_dust_200313_2_em0.param'
      
      A = pdsread(path,  /bsq)
      cub_sd_par_4 = A.core
      label_sd_4 = A.label
      wave_sd_4 = get_keyword(A.label, 'BAND_BIN_CENTER')


path_spectres = path_fichiers_param+'param_slab_dust_200313_3/param_slab_dust_200313_3_em0_V.cub'
     envi_open_file, path_spectres, r_fid=data_fid_sd_5
     envi_file_query, data_fid_sd_5, dims=dims_data_sd_5, wl=wl, nb=nb
     cub_sd_5=fltarr((dims_data_sd_5[2]+1)*(dims_data_sd_5[4]+1),nc)
     for ii=3,nc+2 do cub_sd_5[*,ii-3] = ENVI_GET_DATA(fid=data_fid_sd_5, dims=dims_data_sd_5, pos=[ii] )     
     ;for ii=0,245 do cub_sd[*,ii] = ENVI_GET_DATA(fid=data_fid_sd, dims=dims_data_sd, pos=[ii+3] )
path = path_fichiers_param+'param_slab_dust_200313_3/param_slab_dust_200313_3_em0.param'
      
      A = pdsread(path,  /bsq)
      cub_sd_par_5 = A.core
      label_sd_5 = A.label
      wave_sd_5 = get_keyword(A.label, 'BAND_BIN_CENTER')


path_spectres = path_fichiers_param+'param_slab_dust_200313_5/param_slab_dust_200313_5_em0_V.cub'
     envi_open_file, path_spectres, r_fid=data_fid_sd_6
     envi_file_query, data_fid_sd_6, dims=dims_data_sd_6, wl=wl, nb=nb
     cub_sd_6=fltarr((dims_data_sd_6[2]+1)*(dims_data_sd_6[4]+1),nc)
     for ii=3,nc+2 do cub_sd_6[*,ii-3] = ENVI_GET_DATA(fid=data_fid_sd_6, dims=dims_data_sd_6, pos=[ii] )     
     ;for ii=0,245 do cub_sd[*,ii] = ENVI_GET_DATA(fid=data_fid_sd, dims=dims_data_sd, pos=[ii+3] )
path = path_fichiers_param+'param_slab_dust_200313_5/param_slab_dust_200313_5_em0.param'
      
      A = pdsread(path,  /bsq)
      cub_sd_par_6 = A.core
      label_sd_6 = A.label
      wave_sd_6 = get_keyword(A.label, 'BAND_BIN_CENTER')      


path_spectres = path_fichiers_param+'param_slab_dust_200313_6/param_slab_dust_200313_6_em0_V.cub'
     envi_open_file, path_spectres, r_fid=data_fid_sd_7
     envi_file_query, data_fid_sd_7, dims=dims_data_sd_7, wl=wl, nb=nb
     cub_sd_7=fltarr((dims_data_sd_7[2]+1)*(dims_data_sd_7[4]+1),nc)
     for ii=3,nc+2 do cub_sd_7[*,ii-3] = ENVI_GET_DATA(fid=data_fid_sd_7, dims=dims_data_sd_7, pos=[ii] )     
     ;for ii=0,245 do cub_sd[*,ii] = ENVI_GET_DATA(fid=data_fid_sd, dims=dims_data_sd, pos=[ii+3] )
path = path_fichiers_param+'param_slab_dust_200313_6/param_slab_dust_200313_6_em0.param'
      
      A = pdsread(path,  /bsq)
      cub_sd_par_7 = A.core
      label_sd_7 = A.label
      wave_sd_7 = get_keyword(A.label, 'BAND_BIN_CENTER')      


np1=(dims_data_sd_1[2]+1)*(dims_data_sd_1[4]+1)
np2=(dims_data_sd_2[2]+1)*(dims_data_sd_2[4]+1)
np3=(dims_data_sd_3[2]+1)*(dims_data_sd_3[4]+1)
np4=(dims_data_sd_4[2]+1)*(dims_data_sd_4[4]+1)
np5=(dims_data_sd_5[2]+1)*(dims_data_sd_5[4]+1)
np6=(dims_data_sd_6[2]+1)*(dims_data_sd_6[4]+1)
np7=(dims_data_sd_7[2]+1)*(dims_data_sd_7[4]+1)
npix_sd = np1+np2+np3+np4+np5+np6+np7

nconf_sd=dims_data_sd_1[4]+dims_data_sd_2[4]+dims_data_sd_3[4]+dims_data_sd_4[4]+dims_data_sd_5[4]+dims_data_sd_6[4]+dims_data_sd_7[4]+7

cub_sd=fltarr(npix_sd,nc)
cub_sd[0:np1-1,*]=cub_sd_1
cub_sd[np1:np1+np2-1,*]=cub_sd_2
cub_sd[np1+np2:np1+np2+np3-1,*]=cub_sd_3
cub_sd[np1+np2+np3:np1+np2+np3+np4-1,*]=cub_sd_4
cub_sd[np1+np2+np3+np4:np1+np2+np3+np4+np5-1,*]=cub_sd_5
cub_sd[np1+np2+np3+np4+np5:np1+np2+np3+np4+np5+np6-1,*]=cub_sd_6
cub_sd[np1+np2+np3+np4+np5+np6:npix_sd-1,*]=cub_sd_7

s_par_1=size(cub_sd_par_1)
s_par_2=size(cub_sd_par_2)
s_par_3=size(cub_sd_par_3)
s_par_4=size(cub_sd_par_4)
s_par_5=size(cub_sd_par_5)
s_par_6=size(cub_sd_par_6)
s_par_7=size(cub_sd_par_7)

s1=s_par_1[2]
s2=s_par_2[2]
s3=s_par_3[2]
s4=s_par_4[2]
s5=s_par_5[2]
s6=s_par_6[2]
s7=s_par_7[2]
spar1=s_par_1[1]
spar2=s1+s2+s3+s4+s5+s6+s7
spar3=s_par_1[3]

cub_sd_par=fltarr(spar1, spar2 , spar3)
cub_sd_par[*,0:s1-1,*]=cub_sd_par_1
cub_sd_par[*,s1:s1+s2-1,*]=cub_sd_par_2
cub_sd_par[*,s1+s2:s1+s2+s3-1,*]=cub_sd_par_3
cub_sd_par[*,s1+s2+s3:s1+s2+s3+s4-1,*]=cub_sd_par_4
cub_sd_par[*,s1+s2+s3+s4:s1+s2+s3+s4+s5-1,*]=cub_sd_par_5
cub_sd_par[*,s1+s2+s3+s4+s5:s1+s2+s3+s4+s5+s6-1,*]=cub_sd_par_6
cub_sd_par[*,s1+s2+s3+s4+s5+s6:spar2-1,*]=cub_sd_par_7
 
inc_sd = cub_sd_par[*,*,2]
emer_sd = cub_sd_par[*,*,0]
azim_sd = cub_sd_par[*,*,1]
hslab_sd = cub_sd_par[*,*,3]
cslab_sd = cub_sd_par[*,*,4]
fracH2Oslab_sd = cub_sd_par[*,*,5]*100
fracH2Oslab_sd[ where((fracH2Oslab_sd -10.) lt 0.0001) ] =10.      
grainsizeH2Oslab_sd = cub_sd_par[*,*,8]

Param_cube_sd=dblarr(dims_data_sd_1[2]+1,nconf_sd,7)

Param_cube_sd[*,*,0]=inc_sd
Param_cube_sd[*,*,1]=emer_sd
Param_cube_sd[*,*,2]=azim_sd
Param_cube_sd[*,*,3]=hslab_sd
Param_cube_sd[*,*,4]=cslab_sd
Param_cube_sd[*,*,5]=fracH2Oslab_sd
Param_cube_sd[*,*,6]=grainsizeH2Oslab_sd

Lcube_sd=dblarr(dims_data_sd_1[2]+1,nconf_sd,nspectres)

;path_spectres = path_fichiers_param+'param_granul_dust_em0_final.output.crism_deresol.PDS'
;        envi_open_file, path_spectres, r_fid=data_fid_gd
;        envi_file_query, data_fid_gd, dims=dims_data_gd, wl=wl, nb=nb
;        cub_gd=fltarr((dims_data_gd[2]+1)*(dims_data_gd[4]+1),nc)
;        for ii=3,nc+2 do cub_gd[*,ii-3] = ENVI_GET_DATA(fid=data_fid_gd, dims=dims_data_gd, pos=[ii] )
;        ;for ii=0,245 do cub_gd[*,ii] = ENVI_GET_DATA(fid=data_fid_gd, dims=dims_data_gd, pos=[ii+3] )
;        
;
;path = path_fichiers_param+'param_granul_dust.param'
;      
;      A = pdsread(path,  /bsq)
;      cub_gd_par = A.core
;      label_gd = A.label
;      wave_gd = get_keyword(A.label, 'BAND_BIN_CENTER')
;
;
;inc_gd = cub_gd_par[*,*,2]
;emer_gd = cub_gd_par[*,*,0]
;azim_gd = cub_gd_par[*,*,1]
;hgranul_gd = cub_gd_par[*,*,3]
;fracH2Ogranul_gd = cub_gd_par[*,*,4]*100
;fracdustgranul_gd = cub_gd_par[*,*,6]*100
;grainsizeH2Ogranul_gd = cub_gd_par[*,*,7]
;grainsizeCO2granul_gd = cub_gd_par[*,*,8]
;  
;Lcube_gd=dblarr(dims_data_gd[2]+1,dims_data_gd[4]+1,9)
;Lcube_gd[*,*,1]=inc_gd
;Lcube_gd[*,*,2]=emer_gd
;Lcube_gd[*,*,3]=azim_gd
;Lcube_gd[*,*,4]=hgranul_gd
;Lcube_gd[*,*,5]=fracH2Ogranul_gd
;Lcube_gd[*,*,6]=fracdustgranul_gd
;Lcube_gd[*,*,7]=grainsizeH2Ogranul_gd
;Lcube_gd[*,*,8]=grainsizeCO2granul_gd
;  
;  

path_spectres = path_fichiers_param+'param_granul_seul_0313/param_granul_seul_0313_em0_V.cub'
        envi_open_file, path_spectres, r_fid=data_fid_gs_1
        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
        cub_gs_1=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nc)
        for ii=3,nc+2 do cub_gs_1[*,ii-3] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
        ;for ii=0,245 do cub_gs[*,ii] = ENVI_GET_DATA(fid=data_fid_gs, dims=dims_data_gs, pos=[ii+3] )
        
npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
 path = path_fichiers_param+'param_granul_seul_0313/param_granul_seul_0313_em0.param'
      
      A = pdsread(path,  /bsq)
      cub_gs_par_1 = A.core
      label_gs_1 = A.label
      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 


path_spectres = path_fichiers_param+'param_granul_seul_290313/param_granul_seul_290313_em0_V.cub'
        envi_open_file, path_spectres, r_fid=data_fid_gs_2
        envi_file_query, data_fid_gs_2, dims=dims_data_gs_2, wl=wl, nb=nb
        cub_gs_2=fltarr((dims_data_gs_2[2]+1)*(dims_data_gs_2[4]+1),nc)
        for ii=3,nc+2 do cub_gs_2[*,ii-3] = ENVI_GET_DATA(fid=data_fid_gs_2, dims=dims_data_gs_2, pos=[ii] )
        ;for ii=0,245 do cub_gs[*,ii] = ENVI_GET_DATA(fid=data_fid_gs, dims=dims_data_gs, pos=[ii+3] )
        
npix_gs_2=(dims_data_gs_2[2]+1)*(dims_data_gs_2[4]+1)
 path = path_fichiers_param+'param_granul_seul_290313/param_granul_seul_290313_em0.param'
      
      A = pdsread(path,  /bsq)
      cub_gs_par_2 = A.core
      label_gs_2 = A.label
      wave_gs_2 = get_keyword(A.label, 'BAND_BIN_CENTER') 


npix_gs=npix_gs_1+npix_gs_2

nconf_gs=dims_data_gs_1[4]+dims_data_gs_2[4]+2

cub_gs=fltarr(npix_gs,nc)
cub_gs[0:npix_gs_1-1,*]=cub_gs_1
cub_gs[npix_gs_1:npix_gs-1,*]=cub_gs_2


s_par_1=size(cub_gs_par_1)
s_par_2=size(cub_gs_par_2)

s1=s_par_1[2]
s2=s_par_2[2]

spar1=s_par_1[1]
spar2=s1+s2
spar3=s_par_1[3]

cub_gs_par=fltarr(spar1, spar2 , spar3)
cub_gs_par[*,0:s1-1,*]=cub_gs_par_1
cub_gs_par[*,s1:s1+s2-1,*]=cub_gs_par_2

inc_gs = cub_gs_par[*,*,2]
emer_gs = cub_gs_par[*,*,0]
azim_gs = cub_gs_par[*,*,1]
fracH2Ogranul_gs = cub_gs_par[*,*,3]*100
fracdustgranul_gs = cub_gs_par[*,*,5]*100
grainsizeH2Ogranul_gs = cub_gs_par[*,*,6]
grainsizeCO2granul_gs = cub_gs_par[*,*,7]


Lcube_gs=dblarr(dims_data_gs_1[2]+1,nconf_gs,nspectres)    

Param_cube_gs=dblarr(dims_data_gs_1[2]+1,nconf_gs,7)    

Param_cube_gs[*,*,0]=inc_gs
Param_cube_gs[*,*,1]=emer_gs
Param_cube_gs[*,*,2]=azim_gs
Param_cube_gs[*,*,3]=fracH2Ogranul_gs
Param_cube_gs[*,*,4]=fracdustgranul_gs
Param_cube_gs[*,*,5]=grainsizeH2Ogranul_gs
Param_cube_gs[*,*,6]=grainsizeCO2granul_gs






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

incid_mod = [50., 60., 70., 80.]
s_incid = 4

emerg_mod = [0., 10., 20., 30.]
s_emerg = 4

azim_mod = [60., 150.]
s_azim = 2



grainH2Ogranul_gs=dblarr(nspectres, s_grainsize_H2O_granul)

grainCO2granul_gs=dblarr(nspectres, s_grainsize_CO2_granul)

propH2Ogranul_gs=dblarr(nspectres, s_frac_H2O_granul)

propdustgranul_gs=dblarr(nspectres, s_frac_dust_granul)

hslab_sd=dblarr(nspectres, s_h_slab)

cslab_sd=dblarr(nspectres, s_c_slab)

propH2Oslab_sd=dblarr(nspectres, s_frac_H2O_slab)

grainH2Oslab_sd=dblarr(nspectres, s_grainsize_H2O_slab)

incid_sd=dblarr(nspectres, s_incid)
emerg_sd=dblarr(nspectres, s_emerg)
azim_sd=dblarr(nspectres, s_azim)

Param_cube_gs=reform(Param_cube_gs, npix_gs, 7)
Param_cube_sd=reform(Param_cube_sd, npix_sd, 7)




;bbl = where(d eq 65535.)
t1=systime(1)-t
print, "openning time :   ", t1
print, "Calculating..............................."

;pos_sg=0
;estim_d_sg=cub_sg[0,*]
;dd=cub_sg[0,*]
;L_sg=vraissemblance(d,dd,invertC)
;L_sg_tot=dblarr(dims_data_sg[2]+1,dims_data_sg[4]+1)
;for i=1,(dims_data_sg[2]+1)*(dims_data_sg[4]+1)-1 do begin
;dd=cub_sg[i,*]
;L_sg_1=vraissemblance(d,dd,invertC)
;L_sg_tot[i]=L_sg_1
;if L_sg_1 gt L_sg then begin
;  L_sg=L_sg_1
;  estim_d_sg=dd
;  pos_sg=i
;endif
;endfor

;Lcube_sg[*,*,0]=L_sg_tot
;print, "done sg"


for i=0, nspectres-1 do begin

t1=systime(1)
d=spectres[i,*]
dates[i]=date[i]

L_sd=dblarr(npix_sd)
L_sd=vraissemblance_mat(d,cub_sd,invertC,npix_sd) 
Lcube_sd[*,*,i]=L_sd
t2=systime(1)-t1
print, "done sd, time =   ", t2


;pos_gd=0
;estim_d_gd=cub_gd[0,*]
;dd=cub_gd[0,*]
;L_gd=vraissemblance(d,dd,invertC)
;L_gd_tot=dblarr(dims_data_gd[2]+1,dims_data_gd[4]+1)
;for i=1,(dims_data_gd[2]+1)*(dims_data_gd[4]+1) -1 do begin
;dd=cub_gd[i,*]
;L_gd_1=vraissemblance(d,dd,invertC)
;L_gd_tot[i]=L_gd_1
;if L_gd_1 gt L_gd then begin
;  L_gd=L_gd_1
;  estim_d_gd=dd
;  pos_gd=i
;endif
;endfor
;
;Lcube_gd[*,*,0]=L_gd_tot
;print, "done gd"

L_gs=dblarr(npix_gs)
L_gs=vraissemblance_mat(d,cub_gs,invertC,npix_gs) 
Lcube_gs[*,*,i]=L_gs
t3=systime(1)-t1-t2
print, "done gs, time =   ", t3



print, "computing statistics....."

w=where(L_gs eq max(L_gs))
estim_spectres_gs[i,*]=cub_gs[w[0],*]
estim_param_gs[i,*]=Param_cube_gs[w[0],*] 

w=where(L_sd eq max(L_sd))
estim_spectres_sd[i,*]=cub_sd[w[0],*]
estim_param_sd[i,*]=Param_cube_sd[w[0],*] 

coor=Param_cube_gs[*,5]
for j=0,s_grainsize_H2O_granul-1 do begin
w=where(coor eq grainsize_H2O_granul_mod[j])
Lw=L_gs[w]
grainH2Ogranul_gs[i,j]=mean(Lw, /double, /nan)
endfor

coor=Param_cube_gs[*,6]
for j=0,s_grainsize_CO2_granul-1 do begin
w=where(coor eq grainsize_CO2_granul_mod[j])
Lw=L_gs[w]
grainCO2granul_gs[i,j]=mean(Lw, /double, /nan)
endfor

coor=Param_cube_gs[*,3]
for j=0,s_frac_H2O_granul-1 do begin
w=where(coor eq frac_H2O_granul_mod[j])
Lw=L_gs[w]
propH2Ogranul_gs[i,j]=mean(Lw, /double, /nan)
endfor

coor=Param_cube_gs[*,4]
for j=0,s_frac_dust_granul-1 do begin
w=where(coor eq frac_dust_granul_mod[j])
Lw=L_gs[w]
propdustgranul_gs[i,j]=mean(Lw, /double, /nan)
endfor

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


coor=Param_cube_sd[*,3]
for j=0,s_h_slab-1 do begin
w=where(coor eq h_slab_mod[j])
Lw=L_sd[w]
hslab_sd[i,j]=mean(Lw, /double, /nan)
endfor

coor=Param_cube_sd[*,4]
for j=0,s_c_slab-1 do begin
w=where(coor eq c_slab_mod[j])
Lw=L_sd[w]
cslab_sd[i,j]=mean(Lw, /double, /nan)
endfor

coor=Param_cube_sd[*,5]
for j=0,s_frac_H2O_slab-1 do begin
w=where(coor eq frac_H2O_slab_mod[j])
Lw=L_sd[w]
propH2Oslab_sd[i,j]=mean(Lw, /double, /nan)
endfor

coor=Param_cube_sd[*,3]
for j=0,s_h_slab-1 do begin
w=where(coor eq h_slab_mod[j])
Lw=L_sd[w]
hslab_sd[i,j]=mean(Lw, /double, /nan)
endfor

coor=Param_cube_sd[*,0]
for j=0,s_incid-1 do begin
w=where(coor eq incid_mod[j])
Lw=L_sd[w]
incid_sd[i,j]=mean(Lw, /double, /nan)
endfor

coor=Param_cube_sd[*,1]
for j=0,s_emerg-1 do begin
w=where(coor eq emerg_mod[j])
Lw=L_sd[w]
emerg_sd[i,j]=mean(Lw, /double, /nan)
endfor


coor=Param_cube_sd[*,2]
for j=0,s_azim-1 do begin
w=where(coor eq azim_mod[j])
Lw=L_sd[w]
azim_sd[i,j]=mean(Lw, /double, /nan)
endfor



print, "done statistics, 
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
;x=wavelenghts
;y=d-estim_d_sd
;fit_coef=linfit(x,y,chisq=chisq, prob=prob, sigma=sigma)
;s=size(wavelengths)
;nb=s[1]
;corr=fltarr(nb)
;for i=0,246 do corr[i]=fit_coef[0]+fit_coef[1]*wavelenghts[i]
;estim_d_sd_corr=estim_d_sd+corr
;plot, d, yrange=[0,0.6]
;oplot, estim_d_sd+corr, color=150
;



Param_cube_gs=reform(Param_cube_gs, dims_data_gs_1[2]+1,nconf_gs,7)
Param_cube_sd=reform(Param_cube_sd, dims_data_sd_1[2]+1,nconf_sd,7)


;
;save, hslab_sg, grainH2Oslab_sg, cslab_sg, propH2Oslab_sg, grainH2Ogranul_sg, grainCO2granul_sg, propH2Ogranul_sg, propdustgranul_sg,$
;hslab_sd, cslab_sd, propH2Oslab_sd, grainH2Oslab_sd, grainH2Ogranul_gs, grainCO2granul_gs, propH2Ogranul_gs, propdustgranul_gs, $
;hgranul_gd, grainH2Ogranul_gd, grainCO2granul_gd, propH2Ogranul_gd, propdustgranul_gd, filename=fileout


var = 'hslab_x, cslab_x, propH2Oslab_x, grainH2Oslab_x, grainH2Ogranul_x, grainCO2granul_x, propH2Ogranul_x, propdustgranul_x, '+$
'hslab_sd, cslab_sd, propH2Oslab_sd, grainH2Oslab_sd, grainH2Ogranul_gs, grainCO2granul_gs, propH2Ogranul_gs, propdustgranul_gs,'+$
'Lcube_sd, Lcube_gs, Param_cube_sd, Param_cube_gs, nspectres, npix_sd, npix_gs, wavelenghts, var, spectres, estim_spectres_sd, '+$
'estim_spectres_gs, estim_param_gs, estim_param_sd, dates,incid_sd, emerg_sd, azim_sd'

save, hslab_x, cslab_x, propH2Oslab_x, grainH2Oslab_x, grainH2Ogranul_x, grainCO2granul_x, propH2Ogranul_x, propdustgranul_x, $
hslab_sd, cslab_sd, propH2Oslab_sd, grainH2Oslab_sd, incid_sd, emerg_sd, azim_sd, grainH2Ogranul_gs, grainCO2granul_gs, $
propH2Ogranul_gs, propdustgranul_gs, Lcube_sd, Lcube_gs, Param_cube_sd, Param_cube_gs, nspectres, npix_sd, npix_gs, wavelenghts, $
var, spectres, estim_spectres_sd, estim_spectres_gs, estim_param_gs, estim_param_sd, dates, filename=total_fileout
print, 'output file : ', total_fileout
time=systime(1)-t

print, "execution time : ", time

end
