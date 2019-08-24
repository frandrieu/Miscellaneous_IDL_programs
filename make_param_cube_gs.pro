pro make_param_cube_gs


output_file = '/data/fschmidt/fandrieu/Cube_gs_v2.sav'
output_file_param = '/data/fschmidt/fandrieu/Param_cube_gs.sav'
nc=247
path_fichiers_param = '/home/fandrieu/Inversion/Simulations/'

path_spectres = path_fichiers_param+'param_granul_seul_1_120814/param_granul_seul_1_120814_em0_V.cub'
        envi_open_file, path_spectres, r_fid=data_fid_gs_1
        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
        cub_gs_1=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nc)
        for ii=3,nc+2 do cub_gs_1[*,ii-3] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
        ;for ii=0,245 do cub_gs[*,ii] = ENVI_GET_DATA(fid=data_fid_gs, dims=dims_data_gs, pos=[ii+3] )
        
npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
 path = path_fichiers_param+'param_granul_seul_1_120814/param_granul_seul_1_120814_em0.param'
      
      A = pdsread(path,  /bsq)
      cub_gs_par_1 = A.core
      label_gs_1 = A.label
      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 


path_spectres = path_fichiers_param+'param_granul_seul_2_120814/param_granul_seul_2_120814_em0_V.cub'
        envi_open_file, path_spectres, r_fid=data_fid_gs_2
        envi_file_query, data_fid_gs_2, dims=dims_data_gs_2, wl=wl, nb=nb
        cub_gs_2=fltarr((dims_data_gs_2[2]+1)*(dims_data_gs_2[4]+1),nc)
        for ii=3,nc+2 do cub_gs_2[*,ii-3] = ENVI_GET_DATA(fid=data_fid_gs_2, dims=dims_data_gs_2, pos=[ii] )
        ;for ii=0,245 do cub_gs[*,ii] = ENVI_GET_DATA(fid=data_fid_gs, dims=dims_data_gs, pos=[ii+3] )
        
npix_gs_2=(dims_data_gs_2[2]+1)*(dims_data_gs_2[4]+1)
n_int_2=npix_gs_1+npix_gs_2
 path = path_fichiers_param+'param_granul_seul_2_120814/param_granul_seul_2_120814_em0.param'
      
      A = pdsread(path,  /bsq)
      cub_gs_par_2 = A.core
      label_gs_2 = A.label
      wave_gs_2 = get_keyword(A.label, 'BAND_BIN_CENTER') 


path_spectres = path_fichiers_param+'param_granul_seul_3_120814/param_granul_seul_3_120814_em0_V.cub'
        envi_open_file, path_spectres, r_fid=data_fid_gs_3
        envi_file_query, data_fid_gs_3, dims=dims_data_gs_3, wl=wl, nb=nb
        cub_gs_3=fltarr((dims_data_gs_3[2]+1)*(dims_data_gs_3[4]+1),nc)
        for ii=3,nc+2 do cub_gs_3[*,ii-3] = ENVI_GET_DATA(fid=data_fid_gs_3, dims=dims_data_gs_3, pos=[ii] )
        ;for ii=0,245 do cub_gs[*,ii] = ENVI_GET_DATA(fid=data_fid_gs, dims=dims_data_gs, pos=[ii+3] )
        
npix_gs_3=(dims_data_gs_3[2]+1)*(dims_data_gs_3[4]+1)
n_int_3=n_int_2+npix_gs_3
 path = path_fichiers_param+'param_granul_seul_3_120814/param_granul_seul_3_120814_em0.param'
      
      A = pdsread(path,  /bsq)
      cub_gs_par_3 = A.core
      label_gs_3 = A.label
      wave_gs_3 = get_keyword(A.label, 'BAND_BIN_CENTER') 


path_spectres = path_fichiers_param+'param_granul_seul_4_120814/param_granul_seul_4_120814_em0_V.cub'
        envi_open_file, path_spectres, r_fid=data_fid_gs_4
        envi_file_query, data_fid_gs_4, dims=dims_data_gs_4, wl=wl, nb=nb
        cub_gs_4=fltarr((dims_data_gs_4[2]+1)*(dims_data_gs_4[4]+1),nc)
        for ii=3,nc+2 do cub_gs_4[*,ii-3] = ENVI_GET_DATA(fid=data_fid_gs_4, dims=dims_data_gs_4, pos=[ii] )
        ;for ii=0,245 do cub_gs[*,ii] = ENVI_GET_DATA(fid=data_fid_gs, dims=dims_data_gs, pos=[ii+3] )
        
npix_gs_4=(dims_data_gs_4[2]+1)*(dims_data_gs_4[4]+1)
n_int_4=n_int_3+npix_gs_4
 path = path_fichiers_param+'param_granul_seul_4_120814/param_granul_seul_4_120814_em0.param'
      
      A = pdsread(path,  /bsq)
      cub_gs_par_4 = A.core
      label_gs_4 = A.label
      wave_gs_4 = get_keyword(A.label, 'BAND_BIN_CENTER') 


npix_gs=npix_gs_1+npix_gs_2+npix_gs_3+npix_gs_4

nconf_gs=dims_data_gs_1[4]+dims_data_gs_2[4]+dims_data_gs_3[4]+dims_data_gs_4[4]+4

cub_gs=fltarr(npix_gs,nc)
cub_gs[0:npix_gs_1-1,*]=cub_gs_1
cub_gs[npix_gs_1:n_int_2-1,*]=cub_gs_2
cub_gs[n_int_2:n_int_3-1,*]=cub_gs_3
cub_gs[n_int_3:n_int_4-1,*]=cub_gs_4

s_par_1=size(cub_gs_par_1)
s_par_2=size(cub_gs_par_2)
s_par_3=size(cub_gs_par_3)
s_par_4=size(cub_gs_par_4)

s1=s_par_1[2]
s2=s_par_2[2]
s3=s_par_3[2]
s4=s_par_4[2]

spar1=s_par_1[1]
spar2=nconf_gs
spar3=s_par_1[3]

cub_gs_par=fltarr(spar1, spar2 , spar3)
cub_gs_par[*,0:s1-1,*]=cub_gs_par_1
cub_gs_par[*,s1:s1+s2-1,*]=cub_gs_par_2
sint=s1+s2
cub_gs_par[*,sint:sint+s3-1,*]=cub_gs_par_3
sint=sint+s3
cub_gs_par[*,sint:sint+s4-1,*]=cub_gs_par_4

inc_gs = cub_gs_par[*,*,2]
emer_gs = cub_gs_par[*,*,0]
azim_gs = cub_gs_par[*,*,1]
fracH2Ogranul_gs = cub_gs_par[*,*,3]*100
fracCO2granul_gs = cub_gs_par[*,*,4]*100
fracdustgranul_gs = cub_gs_par[*,*,5]*100
grainsizeH2Ogranul_gs = cub_gs_par[*,*,6]
grainsizeCO2granul_gs = cub_gs_par[*,*,7]  

Param_cube_gs=dblarr(dims_data_gs_1[2]+1,nconf_gs,8)    

Param_cube_gs[*,*,0]=inc_gs
Param_cube_gs[*,*,1]=emer_gs
Param_cube_gs[*,*,2]=azim_gs
Param_cube_gs[*,*,3]=fracH2Ogranul_gs
Param_cube_gs[*,*,4]=fracCO2granul_gs
Param_cube_gs[*,*,5]=fracdustgranul_gs
Param_cube_gs[*,*,6]=grainsizeH2Ogranul_gs
Param_cube_gs[*,*,7]=grainsizeCO2granul_gs



save, cub_gs, filename=output_file
save, Param_cube_gs, npix_gs, nconf_gs, filename=output_file_param
print, "output parameter file : ", output_file_param
print, "output spectral file : ", output_file

end