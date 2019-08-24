pro make_cube_valid_num

output_file='/home/fandrieu/Inversion/valid_num_cube_brfd.sav'



path_spectres = '/home/fandrieu/Inversion/Simulations/valid_num_brdf_1/valid_num_brdf_1_em0_C.cub'
        envi_open_file, path_spectres, r_fid=data_fid_gs_1
        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
         
npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
 path = '/home/fandrieu/Inversion/Simulations/valid_num_brdf_1/valid_num_brdf_1_em0.param'
      
      A = pdsread(path,  /bsq)
      param_cub_simu1 = A.core
      label_gs_1 = A.label
      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 
s1=size(param_cub_simu1)
cub_simu=cub_10nm
cub_simu1=reform(cub_simu, dims_data_gs_1[2]+1,dims_data_gs_1[4]+1,nb)

path_spectres = '/home/fandrieu/Inversion/Simulations/valid_num_brdf_2/valid_num_brdf_2_em0_C.cub'
        envi_open_file, path_spectres, r_fid=data_fid_gs_2
        envi_file_query, data_fid_gs_2, dims=dims_data_gs_2, wl=wl, nb=nb
        cub_10nm=fltarr((dims_data_gs_2[2]+1)*(dims_data_gs_2[4]+1),nb)
        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_2, dims=dims_data_gs_2, pos=[ii] )
         
npix_gs_2=(dims_data_gs_2[2]+1)*(dims_data_gs_2[4]+1)
 path = '/home/fandrieu/Inversion/Simulations/valid_num_brdf_2/valid_num_brdf_2_em0.param'
      
      A = pdsread(path,  /bsq)
      param_cub_simu2 = A.core
      label_gs_2 = A.label
      wave_gs_2 = get_keyword(A.label, 'BAND_BIN_CENTER') 
s2=size(param_cub_simu2)
cub_simu=cub_10nm
cub_simu2=reform(cub_simu, dims_data_gs_2[2]+1,dims_data_gs_2[4]+1,nb)


path_spectres = '/home/fandrieu/Inversion/Simulations/valid_num_brdf_3/valid_num_brdf_3_em0_C.cub'
        envi_open_file, path_spectres, r_fid=data_fid_gs_3
        envi_file_query, data_fid_gs_3, dims=dims_data_gs_3, wl=wl, nb=nb
        cub_10nm=fltarr((dims_data_gs_3[2]+1)*(dims_data_gs_3[4]+1),nb)
        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_3, dims=dims_data_gs_3, pos=[ii] )
         
npix_gs_3=(dims_data_gs_3[2]+1)*(dims_data_gs_3[4]+1)
 path = '/home/fandrieu/Inversion/Simulations/valid_num_brdf_3/valid_num_brdf_3_em0.param'
      
      A = pdsread(path,  /bsq)
      param_cub_simu3 = A.core
      label_gs_3 = A.label
      wave_gs_3 = get_keyword(A.label, 'BAND_BIN_CENTER') 
s3=size(param_cub_simu3)
cub_simu=cub_10nm
cub_simu3=reform(cub_simu, dims_data_gs_3[2]+1,dims_data_gs_3[4]+1,nb)


path_spectres = '/home/fandrieu/Inversion/Simulations/valid_num_brdf_4/valid_num_brdf_4_em0_C.cub'
        envi_open_file, path_spectres, r_fid=data_fid_gs_4
        envi_file_query, data_fid_gs_4, dims=dims_data_gs_4, wl=wl, nb=nb
        cub_10nm=fltarr((dims_data_gs_4[2]+1)*(dims_data_gs_4[4]+1),nb)
        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_4, dims=dims_data_gs_4, pos=[ii] )
         
npix_gs_4=(dims_data_gs_4[2]+1)*(dims_data_gs_4[4]+1)
 path = '/home/fandrieu/Inversion/Simulations/valid_num_brdf_4/valid_num_brdf_4_em0.param'
      
      A = pdsread(path,  /bsq)
      param_cub_simu4 = A.core
      label_gs_4 = A.label
      wave_gs_4 = get_keyword(A.label, 'BAND_BIN_CENTER') 
s4=size(param_cub_simu4)
cub_simu=cub_10nm
cub_simu4=reform(cub_simu, dims_data_gs_4[2]+1,dims_data_gs_4[4]+1,nb)


path_spectres = '/home/fandrieu/Inversion/Simulations/valid_num_brdf_5/valid_num_brdf_5_em0_C.cub'
        envi_open_file, path_spectres, r_fid=data_fid_gs_5
        envi_file_query, data_fid_gs_5, dims=dims_data_gs_5, wl=wl, nb=nb
        cub_10nm=fltarr((dims_data_gs_5[2]+1)*(dims_data_gs_5[4]+1),nb)
        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_5, dims=dims_data_gs_5, pos=[ii] )
         
npix_gs_5=(dims_data_gs_5[2]+1)*(dims_data_gs_5[4]+1)
 path = '/home/fandrieu/Inversion/Simulations/valid_num_brdf_5/valid_num_brdf_5_em0.param'
      
      A = pdsread(path,  /bsq)
      param_cub_simu5 = A.core
      label_gs_5 = A.label
      wave_gs_5= get_keyword(A.label, 'BAND_BIN_CENTER') 
s1=size(param_cub_simu5)
cub_simu=cub_10nm
cub_simu5=reform(cub_simu, dims_data_gs_5[2]+1,dims_data_gs_5[4]+1,nb)


path_spectres = '/home/fandrieu/Inversion/Simulations/valid_num_brdf_6/valid_num_brdf_6_em0_C.cub'
        envi_open_file, path_spectres, r_fid=data_fid_gs_6
        envi_file_query, data_fid_gs_6, dims=dims_data_gs_6, wl=wl, nb=nb
        cub_10nm=fltarr((dims_data_gs_6[2]+1)*(dims_data_gs_6[4]+1),nb)
        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_6, dims=dims_data_gs_6, pos=[ii] )
        
npix_gs_6=(dims_data_gs_6[2]+1)*(dims_data_gs_6[4]+1)
 path = '/home/fandrieu/Inversion/Simulations/valid_num_brdf_6/valid_num_brdf_6_em0.param'
      
      A = pdsread(path,  /bsq)
      param_cub_simu6 = A.core
      label_gs_6 = A.label
      wave_gs_6= get_keyword(A.label, 'BAND_BIN_CENTER') 
s1=size(param_cub_simu6)
cub_simu=cub_10nm
cub_simu6=reform(cub_simu, dims_data_gs_6[2]+1,dims_data_gs_6[4]+1,nb)



cub_simu=fltarr( dims_data_gs_3[2]+1,dims_data_gs_1[4]+dims_data_gs_2[4]+dims_data_gs_3[4]+$
dims_data_gs_4[4]+dims_data_gs_5[4]+dims_data_gs_6[4]+6,nb)
cub_simu[*,0:dims_data_gs_1[4],*]=cub_simu1
cub_simu[*,dims_data_gs_1[4]+1:dims_data_gs_1[4]+dims_data_gs_2[4]+1,*]=cub_simu2
cub_simu[*,dims_data_gs_1[4]+dims_data_gs_2[4]+2:dims_data_gs_1[4]+dims_data_gs_2[4]+dims_data_gs_3[4]+2,*]=cub_simu3
cub_simu[*,dims_data_gs_1[4]+dims_data_gs_2[4]+dims_data_gs_3[4]+3:dims_data_gs_1[4]+dims_data_gs_2[4]+dims_data_gs_3[4]+$
dims_data_gs_4[4]+3,*]=cub_simu4
cub_simu[*,dims_data_gs_1[4]+dims_data_gs_2[4]+dims_data_gs_3[4]+dims_data_gs_4[4]+4:dims_data_gs_1[4]+dims_data_gs_2[4]+$
dims_data_gs_3[4]+dims_data_gs_4[4]+dims_data_gs_5[4]+4,*]=cub_simu5
cub_simu[*,dims_data_gs_1[4]+dims_data_gs_2[4]+dims_data_gs_3[4]+dims_data_gs_4[4]+dims_data_gs_5[4]+5:dims_data_gs_1[4]+$
dims_data_gs_2[4]+dims_data_gs_3[4]+dims_data_gs_4[4]+dims_data_gs_5[4]+dims_data_gs_6[4]+5,*]=cub_simu6
param_cub_simu=fltarr( dims_data_gs_3[2]+1,dims_data_gs_1[4]+dims_data_gs_2[4]+dims_data_gs_3[4]+dims_data_gs_4[4]+dims_data_gs_5[4]+dims_data_gs_6[4]+6,s1[3])
param_cub_simu[*,0:dims_data_gs_1[4],*]=param_cub_simu1
param_cub_simu[*,dims_data_gs_1[4]+1:dims_data_gs_1[4]+dims_data_gs_2[4]+1,*]=param_cub_simu2
param_cub_simu[*,dims_data_gs_1[4]+dims_data_gs_2[4]+2:dims_data_gs_1[4]+dims_data_gs_2[4]+dims_data_gs_3[4]+2,*]=param_cub_simu3
param_cub_simu[*,dims_data_gs_1[4]+dims_data_gs_2[4]+dims_data_gs_3[4]+3:dims_data_gs_1[4]+dims_data_gs_2[4]+dims_data_gs_3[4]+$
dims_data_gs_4[4]+3,*]=param_cub_simu4
param_cub_simu[*,dims_data_gs_1[4]+dims_data_gs_2[4]+dims_data_gs_3[4]+dims_data_gs_4[4]+4:dims_data_gs_1[4]+dims_data_gs_2[4]+$
dims_data_gs_3[4]+dims_data_gs_4[4]+dims_data_gs_5[4]+4,*]=param_cub_simu5
param_cub_simu[*,dims_data_gs_1[4]+dims_data_gs_2[4]+dims_data_gs_3[4]+dims_data_gs_4[4]+dims_data_gs_5[4]+5:dims_data_gs_1[4]+$
dims_data_gs_2[4]+dims_data_gs_3[4]+dims_data_gs_4[4]+dims_data_gs_5[4]+dims_data_gs_6[4]+5,*]=param_cub_simu6

;
;path_spectres = '/home/fandrieu/Inversion/Simulations/valid_num_ter_data/valid_num_ter_data_em0_C.cub'
;        envi_open_file, path_spectres, r_fid=data_fid_gs_data
;        envi_file_query, data_fid_gs_data, dims=dims_data_gs_data, wl=wl, nb=nb
;        cub_10nm=fltarr((dims_data_gs_data[2]+1)*(dims_data_gs_data[4]+1),nb)
;        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_data, dims=dims_data_gs_data, pos=[ii] )
;         
;npix_gs_data=(dims_data_gs_data[2]+1)*(dims_data_gs_data[4]+1)
; path = '/home/fandrieu/Inversion/Simulations/valid_num_ter_data/valid_num_ter_data_em0.param'
;      
;      A = pdsread(path,  /bsq)
;      param_cub_data = A.core
;      label_gs_data = A.label
;      wave_gs_data= get_keyword(A.label, 'BAND_BIN_CENTER') 
;s1=size(param_cub_simudata)
;cub_data=cub_10nm
;cub_data=reform(cub_data, dims_data_gs_data[2]+1,dims_data_gs_data[4]+1,nb)

cub_data=cub_simu
param_cub_data=param_cub_simu

wavelengths=fltarr(nb)
wavelengths=wl


var='wavelengths, cub_simu, param_cub_simu, cub_data, param_cub_data'
save, wavelengths, cub_simu, param_cub_simu, cub_data, param_cub_data, var, filename=output_file
print, output_file

end