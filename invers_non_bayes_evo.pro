function vraissemblance, d, dd, invertC
;coef=0.05
L=exp(-0.5* ( transpose(dd-d) ## invertC ## (dd-d) ))
;L=(correlate(d,dd)-coef*abs(mean(dd[5:20]-d[5:20]))+100+coef)
return, L

end


pro invers_non_bayes_evo

fileout='/home/fandrieu/Inversion/results/idl_files/results_inversion_non_bayes_evo_'
total_fileout='/home/fandrieu/Inversion/results/idl_files/results_inversion_non_bayes_evo_full_cube.sav'
fileout_name=fileout
t=systime(1)
nc=247
;xm=5 ; time
;ym=2 ; place
spectre = fltarr(nc)
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
nptot = np1+np2+np3+np4+np5+np6+np7

nconf=dims_data_sd_1[4]+dims_data_sd_2[4]+dims_data_sd_3[4]+dims_data_sd_4[4]+dims_data_sd_5[4]+dims_data_sd_6[4]+dims_data_sd_7[4]+7

cub_sd=fltarr(nptot,nc)
cub_sd[0:np1-1,*]=cub_sd_1
cub_sd[np1:np1+np2-1,*]=cub_sd_2
cub_sd[np1+np2:np1+np2+np3-1,*]=cub_sd_3
cub_sd[np1+np2+np3:np1+np2+np3+np4-1,*]=cub_sd_4
cub_sd[np1+np2+np3+np4:np1+np2+np3+np4+np5-1,*]=cub_sd_5
cub_sd[np1+np2+np3+np4+np5:np1+np2+np3+np4+np5+np6-1,*]=cub_sd_6
cub_sd[np1+np2+np3+np4+np5+np6:nptot-1,*]=cub_sd_7

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

Lcube_sd=dblarr(dims_data_sd_1[2]+1,nconf,8)
Lcube_sd[*,*,1]=inc_sd
Lcube_sd[*,*,2]=emer_sd
Lcube_sd[*,*,3]=azim_sd
Lcube_sd[*,*,4]=hslab_sd
Lcube_sd[*,*,5]=cslab_sd
Lcube_sd[*,*,6]=fracH2Oslab_sd
Lcube_sd[*,*,7]=grainsizeH2Oslab_sd

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


Lcube_gs=dblarr(dims_data_gs_1[2]+1,nconf_gs,8)    
Lcube_gs[*,*,1]=inc_gs
Lcube_gs[*,*,2]=emer_gs
Lcube_gs[*,*,3]=azim_gs
Lcube_gs[*,*,4]=fracH2Ogranul_gs
Lcube_gs[*,*,5]=fracdustgranul_gs
Lcube_gs[*,*,6]=grainsizeH2Ogranul_gs
Lcube_gs[*,*,7]=grainsizeCO2granul_gs



wavelenghts=fltarr(nc)
wavelenghts=wl[3:nc+2]


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

geo_path = '/home/fandrieu/data/Richardson/Dark_spots_donnees_geo.PDS'
envi_open_file, geo_path, r_fid=data_fid
envi_file_query, data_fid, dims=dims_data, wl=wl, nb = nb
cub = fltarr(dims_data[2]+1,dims_data[4]+1,nb)
for ii=0,nb-1 do cub[*,*,ii] = ENVI_GET_DATA(fid=data_fid, dims=dims_data, pos=[ii] )
incid=fltarr(dims_data[2]+1,dims_data[4]+1)
emer=fltarr(dims_data[2]+1,dims_data[4]+1)
pha=fltarr(dims_data[2]+1,dims_data[4]+1)
incid=cub[*,*,2]
emer=cub[*,*,3]
pha=cub[*,*,4]
date=cub[*,*,6]



restore, '/home/fandrieu/Inversion/results/idl_files/mat_covar_coef_renorm3.sav' ; Matrice de covariance
invertC = invert(mat_covar_coef)


x=fltarr(s[1])
y=fltarr(s[2])
estim_d_sd_tot=fltarr(s[1],s[2],nc)
estim_d_gs_tot=fltarr(s[1],s[2],nc)
estim_param_sd=fltarr(s[1],s[2],8)
estim_param_gs=fltarr(s[1],s[2],8)

for line=0,s[1]-1 do begin
  for column=0,s[2]-1 do begin
 
 
 fileout=fileout_name
  xm=line
  ym=column
  if xm lt 10 then sx=string(xm+1, format='(I1)')
  if xm ge 10 and xm lt 100 then sx=string(xm+1, format='(I2)')
  if xm ge 100 and xm lt 1000 then sx=string(xm+1, format='(I3)')
  
  if ym lt 10 then sy=string(column+1, format='(I1)')
  if ym ge 10 and ym lt 100 then sy=string(column+1, format='(I2)')
  if ym ge 100 and ym lt 1000 then sy=string(column+1, format='(I3)')
  fileout=fileout+'pixel_'+sx+'_'+sy+'.sav'
inc=incid[xm,ym]
em=emer[xm,ym]
g=pha[xm,ym]

az=acos( ( cos(g*!pi/180.) - cos(inc*!pi/180.)*cos(em*!pi/180.) ) / ( sin(inc*!pi/180.)*sin(em*!pi/180.) ) )*180./!pi

d=spectres[xm,ym,*]
d=transpose(d)
bbl = where(d eq 65535.)

;d=[0.5, 0.1, 0.1]
d=transpose(d)


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



s=size(cub_sd)
npix=s[1]
pos_sd=0
estim_d_sd=cub_sd[0,*]
dd=cub_sd[0,*]
L_sd=vraissemblance(d,dd,invertC)
L_sd_tot=dblarr(npix)
L2_sd=total((d-dd)^2)
estim_d_2_sd=dd
pos_sd_2=0
for i=1,npix-1 do begin
dd=cub_sd[i,*]
L_sd_1=vraissemblance(d,dd,invertC)
L_sd_tot[i]=L_sd_1
if L_sd_1 gt L_sd then begin
  L_sd=L_sd_1
  estim_d_sd=dd
  pos_sd=i
endif
if L2_sd_1 lt L2_sd then begin
  L2_sd=L2_sd_1
  estim_d_2_sd=dd
  pos_sd_2=i
endif
endfor

Lcube_sd[*,*,0]=L_sd_tot
print, "done sd, time : ", date[xm,ym], "    column : ", sy


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

pos_gs=0
estim_d_gs=cub_gs[0,*]
dd=cub_gs[0,*]
L_gs=vraissemblance(d,dd,invertC)
L_gs_tot=dblarr(npix_gs)
L2_gs=total((d-cub_gs[0,*])^2)
estim_d_2_gs=cub_gs[0,*]
pos_gs_2=0
for i=1,npix_gs-1  do begin
dd=cub_gs[i,*]
L_gs_1=vraissemblance(d,dd,invertC)
L_gs_tot[i]=L_gs_1
L2_gs_1=total((d-cub_gs[i,*])^2)
if L_gs_1 gt L_gs then begin
  L_gs=L_gs_1
  estim_d_gs=dd
  pos_gs=i
endif
if L2_gs_1 lt L2_gs then begin
  L2_gs=L2_gs_1
  estim_d_2_gs=dd
  pos_gs_2=i
endif
endfor

Lcube_gs[*,*,0]=L_gs_tot

;print, "done gs, time : ", sx, "    DS : ", sy

print, "done gs, time : ", date[xm,ym], "    column : ", sy

estim_d_sd_tot[line,column,*]=estim_d_sd
estim_d_gs_tot[line,column,*]=estim_d_gs
lcube_sd=reform(lcube_sd, npix, 8)
par=lcube_sd[pos_sd,*]
Lcube_sd=reform(Lcube_sd, dims_data_sd_1[2]+1,nconf,8)
estim_param_sd[line,column,*]=par
lcube_gs=reform(lcube_gs, npix_gs, 8)
par=lcube_gs[pos_gs,*]
Lcube_gs=reform(Lcube_gs, dims_data_gs_1[2]+1,nconf_gs,8)
estim_param_gs[line,column,*]=par


save, d, estim_d_2_gs, estim_d_2_sd, estim_d_sg, estim_d_sd, estim_d_gd, estim_d_gs, L_sg, L_sd, L_gd, L_gs, Lcube_sg, Lcube_sd, Lcube_gd, Lcube_gs, pos_sg, pos_sd, pos_gd, pos_gs, npix, wavelenghts, filename=fileout
print, fileout

endfor
endfor

save, estim_d_sd_tot, estim_d_gs_tot, estim_param_sd, estim_param_gs, wavelenghts, filename=total_fileout

time=systime(1)-t

print, "execution time : ", time

end
