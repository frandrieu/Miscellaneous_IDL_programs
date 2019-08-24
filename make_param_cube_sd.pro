pro make_param_cube_sd

t=systime(1)
;output_file = '/home/fandrieu/Inversion/Simulations/Cube_sd_v3.sav'
;output_file_param = '/home/fandrieu/Inversion/Simulations/Param_cube_sd.sav'
output_file = '/data/fschmidt/fandrieu/Cube_sd_v8.sav'
output_file_param = '/data/fschmidt/fandrieu/Param_cube_sd_3.sav'

nc=247
path_fichiers_param = '/home/fandrieu/Inversion/Simulations/'


      
path_spectres = path_fichiers_param+'param_slab_dust_0313/param_slab_dust_0313_em0_V.cub'
     envi_open_file, path_spectres, r_fid=data_fid_sd_1
     envi_file_query, data_fid_sd_1, dims=dims_data_sd_1, wl=wl, nb=nb
     cub_sd_1=fltarr((dims_data_sd_1[2]+1)*(dims_data_sd_1[4]+1),nc)
     for ii=3,nc+2 do cub_sd_1[*,ii-3] = ENVI_GET_DATA(fid=data_fid_sd_1, dims=dims_data_sd_1, pos=[ii] )     
     ;for ii=0,245 do cub_sd[*,ii] = ENVI_GET_DATA(fid=data_fid_sd, dims=dims_data_sd, pos=[ii+3] )
path = path_fichiers_param+'param_slab_dust_0313/param_slab_dust_0313_em0.param'
      
      A = pdsread(path,  DIC='/home/fandrieu/Simu_IPAG/pro/LPG_PDS_LABEL.dic', /bsq)
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
      
      A = pdsread(path,  DIC='/home/fandrieu/Simu_IPAG/pro/LPG_PDS_LABEL.dic', /bsq)
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
      
      A = pdsread(path,  DIC='/home/fandrieu/Simu_IPAG/pro/LPG_PDS_LABEL.dic', /bsq)
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
      
      A = pdsread(path,  DIC='/home/fandrieu/Simu_IPAG/pro/LPG_PDS_LABEL.dic', /bsq)
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
      
      A = pdsread(path,  DIC='/home/fandrieu/Simu_IPAG/pro/LPG_PDS_LABEL.dic', /bsq)
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
      
      A = pdsread(path,  DIC='/home/fandrieu/Simu_IPAG/pro/LPG_PDS_LABEL.dic', /bsq)
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
      
      A = pdsread(path,  DIC='/home/fandrieu/Simu_IPAG/pro/LPG_PDS_LABEL.dic', /bsq)
      cub_sd_par_7 = A.core
      label_sd_7 = A.label
      wave_sd_7 = get_keyword(A.label, 'BAND_BIN_CENTER')      


path_spectres = path_fichiers_param+'param_slab_dust_110413/param_slab_dust_110413_em0_V.cub'
     envi_open_file, path_spectres, r_fid=data_fid_sd_8a
     envi_file_query, data_fid_sd_8a, dims=dims_data_sd_8a, wl=wl, nb=nb
     cub_sd_8a=fltarr((dims_data_sd_8a[2]+1)*(dims_data_sd_8a[4]+1),nc)
     for ii=3,nc+2 do cub_sd_8a[*,ii-3] = ENVI_GET_DATA(fid=data_fid_sd_8a, dims=dims_data_sd_8a, pos=[ii] )     
     ;for ii=0,245 do cub_sd[*,ii] = ENVI_GET_DATA(fid=data_fid_sd, dims=dims_data_sd, pos=[ii+3] )
path = path_fichiers_param+'param_slab_dust_110413/param_slab_dust_110413_em0.param'
      
      A = pdsread(path,  DIC='/home/fandrieu/Simu_IPAG/pro/LPG_PDS_LABEL.dic', /bsq)
      cub_sd_par_8atemp = A.core
      label_sd_8a = A.label
      wave_sd_8a = get_keyword(A.label, 'BAND_BIN_CENTER')      


path_spectres = path_fichiers_param+'param_slab_dust_110413_2/param_slab_dust_110413_2_em0_V.cub'
     envi_open_file, path_spectres, r_fid=data_fid_sd_8b
     envi_file_query, data_fid_sd_8b, dims=dims_data_sd_8b, wl=wl, nb=nb
     cub_sd_8b=fltarr((dims_data_sd_8b[2]+1)*(dims_data_sd_8b[4]+1),nc)
     for ii=3,nc+2 do cub_sd_8b[*,ii-3] = ENVI_GET_DATA(fid=data_fid_sd_8b, dims=dims_data_sd_8b, pos=[ii] )     
     ;for ii=0,245 do cub_sd[*,ii] = ENVI_GET_DATA(fid=data_fid_sd, dims=dims_data_sd, pos=[ii+3] )
path = path_fichiers_param+'param_slab_dust_110413_2/param_slab_dust_110413_2_em0.param'
      
      A = pdsread(path,  DIC='/home/fandrieu/Simu_IPAG/pro/LPG_PDS_LABEL.dic', /bsq)
      cub_sd_par_8btemp = A.core
      label_sd_8b = A.label
      wave_sd_8b = get_keyword(A.label, 'BAND_BIN_CENTER')      

cub_sd_8=fltarr((dims_data_sd_8a[2]+(dims_data_sd_8b[2])+2), (dims_data_sd_8b[4]+1),nc)
cub_sd_8[0:dims_data_sd_8a[2],*,*]=cub_sd_8a
cub_sd_8[dims_data_sd_8a[2]+1:dims_data_sd_8a[2]+dims_data_sd_8a[2]+1,*,*]=cub_sd_8b
cub_sd_8=reform(cub_sd_8, (dims_data_sd_8a[2]+(dims_data_sd_8b[2])+2)*(dims_data_sd_8b[4]+1),nc)

s_par_8a=size(cub_sd_par_8atemp)
s_par_8b=size(cub_sd_par_8btemp)
cub_sd_par_8a=fltarr(s_par_8a[1], s_par_8a[2],9)
cub_sd_par_8a[*,*,0]=cub_sd_par_8atemp[*,*,0]
cub_sd_par_8a[*,*,1]=60.
cub_sd_par_8a[*,*,2:3]=cub_sd_par_8atemp[*,*,1:2]
cub_sd_par_8a[*,*,4]=0.993
cub_sd_par_8a[*,*,5:8]=cub_sd_par_8atemp[*,*,3:6]

cub_sd_par_8b=fltarr(s_par_8b[1], s_par_8b[2],9)
cub_sd_par_8b[*,*,0]=cub_sd_par_8btemp[*,*,0]
cub_sd_par_8b[*,*,1]=150.
cub_sd_par_8b[*,*,2:3]=cub_sd_par_8btemp[*,*,1:2]
cub_sd_par_8b[*,*,4]=0.993
cub_sd_par_8b[*,*,5:8]=cub_sd_par_8btemp[*,*,3:6]


s_par_8a=size(cub_sd_par_8a)
s_par_8b=size(cub_sd_par_8b)
cub_sd_par_8=fltarr(s_par_8a[1]+s_par_8b[1], s_par_8a[2],s_par_8a[3])
cub_sd_par_8[0:s_par_8a[1]-1, *,*]=cub_sd_par_8a
cub_sd_par_8[s_par_8a[1]:s_par_8a[1]+s_par_8b[1]-1, *,*]=cub_sd_par_8b



path_spectres = path_fichiers_param+'param_slab_dust_190413/param_slab_dust_190413_em0_V.cub'
     envi_open_file, path_spectres, r_fid=data_fid_sd_9a
     envi_file_query, data_fid_sd_9a, dims=dims_data_sd_9a, wl=wl, nb=nb
     cub_sd_9a=fltarr((dims_data_sd_9a[2]+1)*(dims_data_sd_9a[4]+1),nc)
     for ii=3,nc+2 do cub_sd_9a[*,ii-3] = ENVI_GET_DATA(fid=data_fid_sd_9a, dims=dims_data_sd_9a, pos=[ii] )     
     ;for ii=0,245 do cub_sd[*,ii] = ENVI_GET_DATA(fid=data_fid_sd, dims=dims_data_sd, pos=[ii+3] )
path = path_fichiers_param+'param_slab_dust_190413/param_slab_dust_190413_em0.param'
      
      A = pdsread(path,  DIC='/home/fandrieu/Simu_IPAG/pro/LPG_PDS_LABEL.dic', /bsq)
      cub_sd_par_9atemp = A.core
      label_sd_9a = A.label
      wave_sd_9a = get_keyword(A.label, 'BAND_BIN_CENTER')      


path_spectres = path_fichiers_param+'param_slab_dust_190413_2/param_slab_dust_190413_2_em0_V.cub'
     envi_open_file, path_spectres, r_fid=data_fid_sd_9b
     envi_file_query, data_fid_sd_9b, dims=dims_data_sd_9b, wl=wl, nb=nb
     cub_sd_9b=fltarr((dims_data_sd_9b[2]+1)*(dims_data_sd_9b[4]+1),nc)
     for ii=3,nc+2 do cub_sd_9b[*,ii-3] = ENVI_GET_DATA(fid=data_fid_sd_9b, dims=dims_data_sd_9b, pos=[ii] )     
     ;for ii=0,245 do cub_sd[*,ii] = ENVI_GET_DATA(fid=data_fid_sd, dims=dims_data_sd, pos=[ii+3] )
path = path_fichiers_param+'param_slab_dust_190413_2/param_slab_dust_190413_2_em0.param'
      
      A = pdsread(path,  DIC='/home/fandrieu/Simu_IPAG/pro/LPG_PDS_LABEL.dic', /bsq)
      cub_sd_par_9btemp = A.core
      label_sd_9b = A.label
      wave_sd_9b = get_keyword(A.label, 'BAND_BIN_CENTER')      

cub_sd_9=fltarr((dims_data_sd_9a[2]+(dims_data_sd_9b[2])+2), (dims_data_sd_9b[4]+1),nc)
cub_sd_9[0:dims_data_sd_9a[2],*,*]=cub_sd_9a
cub_sd_9[dims_data_sd_9a[2]+1:dims_data_sd_9a[2]+dims_data_sd_9a[2]+1,*,*]=cub_sd_9b
cub_sd_9=reform(cub_sd_9, (dims_data_sd_9a[2]+(dims_data_sd_9b[2])+2)*(dims_data_sd_9b[4]+1),nc)

s_par_9a=size(cub_sd_par_9atemp)
s_par_9b=size(cub_sd_par_9btemp)
cub_sd_par_9a=fltarr(s_par_9a[1], s_par_9a[2],9)
cub_sd_par_9a[*,*,0]=cub_sd_par_9atemp[*,*,0]
cub_sd_par_9a[*,*,1]=60.
cub_sd_par_9a[*,*,2:3]=cub_sd_par_9atemp[*,*,1:2]
cub_sd_par_9a[*,*,4]=0.997
cub_sd_par_9a[*,*,5:8]=cub_sd_par_9atemp[*,*,3:6]

cub_sd_par_9b=fltarr(s_par_9b[1], s_par_9b[2],9)
cub_sd_par_9b[*,*,0]=cub_sd_par_9btemp[*,*,0]
cub_sd_par_9b[*,*,1]=150.
cub_sd_par_9b[*,*,2:3]=cub_sd_par_9btemp[*,*,1:2]
cub_sd_par_9b[*,*,4]=0.997
cub_sd_par_9b[*,*,5:8]=cub_sd_par_9btemp[*,*,3:6]


s_par_9a=size(cub_sd_par_9a)
s_par_9b=size(cub_sd_par_9b)
cub_sd_par_9=fltarr(s_par_9a[1]+s_par_9b[1], s_par_9a[2],s_par_9a[3])
cub_sd_par_9[0:s_par_9a[1]-1, *,*]=cub_sd_par_9a
cub_sd_par_9[s_par_9a[1]:s_par_9a[1]+s_par_9b[1]-1, *,*]=cub_sd_par_9b


path_spectres = path_fichiers_param+'param_slab_dust_220413/param_slab_dust_220413_em0_V.cub'
     envi_open_file, path_spectres, r_fid=data_fid_sd_10a
     envi_file_query, data_fid_sd_10a, dims=dims_data_sd_10a, wl=wl, nb=nb
     cub_sd_10a=fltarr((dims_data_sd_10a[2]+1)*(dims_data_sd_10a[4]+1),nc)
     for ii=3,nc+2 do cub_sd_10a[*,ii-3] = ENVI_GET_DATA(fid=data_fid_sd_10a, dims=dims_data_sd_10a, pos=[ii] )     
     ;for ii=0,245 do cub_sd[*,ii] = ENVI_GET_DATA(fid=data_fid_sd, dims=dims_data_sd, pos=[ii+3] )
path = path_fichiers_param+'param_slab_dust_220413/param_slab_dust_220413_em0.param'
      
      A = pdsread(path,  DIC='/home/fandrieu/Simu_IPAG/pro/LPG_PDS_LABEL.dic', /bsq)
      cub_sd_par_10atemp = A.core
      label_sd_10a = A.label
      wave_sd_10a = get_keyword(A.label, 'BAND_BIN_CENTER')      


path_spectres = path_fichiers_param+'param_slab_dust_220413_2/param_slab_dust_220413_2_em0_V.cub'
     envi_open_file, path_spectres, r_fid=data_fid_sd_10b
     envi_file_query, data_fid_sd_10b, dims=dims_data_sd_10b, wl=wl, nb=nb
     cub_sd_10b=fltarr((dims_data_sd_10b[2]+1)*(dims_data_sd_10b[4]+1),nc)
     for ii=3,nc+2 do cub_sd_10b[*,ii-3] = ENVI_GET_DATA(fid=data_fid_sd_10b, dims=dims_data_sd_10b, pos=[ii] )     
     ;for ii=0,245 do cub_sd[*,ii] = ENVI_GET_DATA(fid=data_fid_sd, dims=dims_data_sd, pos=[ii+3] )
path = path_fichiers_param+'param_slab_dust_220413_2/param_slab_dust_220413_2_em0.param'
      
      A = pdsread(path,  DIC='/home/fandrieu/Simu_IPAG/pro/LPG_PDS_LABEL.dic', /bsq)
      cub_sd_par_10btemp = A.core
      label_sd_10b = A.label
      wave_sd_10b = get_keyword(A.label, 'BAND_BIN_CENTER')      

cub_sd_10=fltarr((dims_data_sd_10a[2]+(dims_data_sd_10b[2])+2), (dims_data_sd_10b[4]+1),nc)
cub_sd_10[0:dims_data_sd_10a[2],*,*]=cub_sd_10a
cub_sd_10[dims_data_sd_10a[2]+1:dims_data_sd_10a[2]+dims_data_sd_10a[2]+1,*,*]=cub_sd_10b
cub_sd_10=reform(cub_sd_10, (dims_data_sd_10a[2]+(dims_data_sd_10b[2])+2)*(dims_data_sd_10b[4]+1),nc)

s_par_10a=size(cub_sd_par_10atemp)
s_par_10b=size(cub_sd_par_10btemp)
cub_sd_par_10a=fltarr(s_par_10a[1], s_par_10a[2],9)
cub_sd_par_10a[*,*,0]=cub_sd_par_10atemp[*,*,0]
cub_sd_par_10a[*,*,1]=60.
cub_sd_par_10a[*,*,2:3]=cub_sd_par_10atemp[*,*,1:2]
cub_sd_par_10a[*,*,4]=0.995
cub_sd_par_10a[*,*,5:8]=cub_sd_par_10atemp[*,*,3:6]

cub_sd_par_10b=fltarr(s_par_10b[1], s_par_10b[2],9)
cub_sd_par_10b[*,*,0]=cub_sd_par_10btemp[*,*,0]
cub_sd_par_10b[*,*,1]=150.
cub_sd_par_10b[*,*,2:3]=cub_sd_par_10btemp[*,*,1:2]
cub_sd_par_10b[*,*,4]=0.995
cub_sd_par_10b[*,*,5:8]=cub_sd_par_10btemp[*,*,3:6]


s_par_10a=size(cub_sd_par_10a)
s_par_10b=size(cub_sd_par_10b)
cub_sd_par_10=fltarr(s_par_10a[1]+s_par_10b[1], s_par_10a[2],s_par_10a[3])
cub_sd_par_10[0:s_par_10a[1]-1, *,*]=cub_sd_par_10a
cub_sd_par_10[s_par_10a[1]:s_par_10a[1]+s_par_10b[1]-1, *,*]=cub_sd_par_10b



path_spectres = path_fichiers_param+'param_slab_dust_230413/param_slab_dust_230413_em0_V.cub'
     envi_open_file, path_spectres, r_fid=data_fid_sd_11a
     envi_file_query, data_fid_sd_11a, dims=dims_data_sd_11a, wl=wl, nb=nb
     cub_sd_11a=fltarr((dims_data_sd_11a[2]+1)*(dims_data_sd_11a[4]+1),nc)
     for ii=3,nc+2 do cub_sd_11a[*,ii-3] = ENVI_GET_DATA(fid=data_fid_sd_11a, dims=dims_data_sd_11a, pos=[ii] )     
     ;for ii=0,245 do cub_sd[*,ii] = ENVI_GET_DATA(fid=data_fid_sd, dims=dims_data_sd, pos=[ii+3] )
path = path_fichiers_param+'param_slab_dust_230413/param_slab_dust_230413_em0.param'
      
      A = pdsread(path,  DIC='/home/fandrieu/Simu_IPAG/pro/LPG_PDS_LABEL.dic', /bsq)
      cub_sd_par_11atemp = A.core
      label_sd_11a = A.label
      wave_sd_11a = get_keyword(A.label, 'BAND_BIN_CENTER')      


path_spectres = path_fichiers_param+'param_slab_dust_230413_2/param_slab_dust_230413_2_em0_V.cub'
     envi_open_file, path_spectres, r_fid=data_fid_sd_11b
     envi_file_query, data_fid_sd_11b, dims=dims_data_sd_11b, wl=wl, nb=nb
     cub_sd_11b=fltarr((dims_data_sd_11b[2]+1)*(dims_data_sd_11b[4]+1),nc)
     for ii=3,nc+2 do cub_sd_11b[*,ii-3] = ENVI_GET_DATA(fid=data_fid_sd_11b, dims=dims_data_sd_11b, pos=[ii] )     
     ;for ii=0,245 do cub_sd[*,ii] = ENVI_GET_DATA(fid=data_fid_sd, dims=dims_data_sd, pos=[ii+3] )
path = path_fichiers_param+'param_slab_dust_230413_2/param_slab_dust_230413_2_em0.param'
      
      A = pdsread(path,  DIC='/home/fandrieu/Simu_IPAG/pro/LPG_PDS_LABEL.dic', /bsq)
      cub_sd_par_11btemp = A.core
      label_sd_11b = A.label
      wave_sd_11b = get_keyword(A.label, 'BAND_BIN_CENTER')      

cub_sd_11=fltarr((dims_data_sd_11a[2]+(dims_data_sd_11b[2])+2), (dims_data_sd_11b[4]+1),nc)
cub_sd_11[0:dims_data_sd_11a[2],*,*]=cub_sd_11a
cub_sd_11[dims_data_sd_11a[2]+1:dims_data_sd_11a[2]+dims_data_sd_11a[2]+1,*,*]=cub_sd_11b
cub_sd_11=reform(cub_sd_11, (dims_data_sd_11a[2]+(dims_data_sd_11b[2])+2)*(dims_data_sd_11b[4]+1),nc)

s_par_11a=size(cub_sd_par_11atemp)
s_par_11b=size(cub_sd_par_11btemp)
cub_sd_par_11a=fltarr(s_par_11a[1], s_par_11a[2],9)
cub_sd_par_11a[*,*,0]=cub_sd_par_11atemp[*,*,0]
cub_sd_par_11a[*,*,1]=60.
cub_sd_par_11a[*,*,2:3]=cub_sd_par_11atemp[*,*,1:2]
cub_sd_par_11a[*,*,4]=0.998
cub_sd_par_11a[*,*,5:8]=cub_sd_par_11atemp[*,*,3:6]

cub_sd_par_11b=fltarr(s_par_11b[1], s_par_11b[2],9)
cub_sd_par_11b[*,*,0]=cub_sd_par_11btemp[*,*,0]
cub_sd_par_11b[*,*,1]=150.
cub_sd_par_11b[*,*,2:3]=cub_sd_par_11btemp[*,*,1:2]
cub_sd_par_11b[*,*,4]=0.998
cub_sd_par_11b[*,*,5:8]=cub_sd_par_11btemp[*,*,3:6]


s_par_11a=size(cub_sd_par_11a)
s_par_11b=size(cub_sd_par_11b)
cub_sd_par_11=fltarr(s_par_11a[1]+s_par_11b[1], s_par_11a[2],s_par_11a[3])
cub_sd_par_11[0:s_par_11a[1]-1, *,*]=cub_sd_par_11a
cub_sd_par_11[s_par_11a[1]:s_par_11a[1]+s_par_11b[1]-1, *,*]=cub_sd_par_11b



path_spectres = path_fichiers_param+'param_slab_dust_240413/param_slab_dust_240413_em0_V.cub'
     envi_open_file, path_spectres, r_fid=data_fid_sd_12a
     envi_file_query, data_fid_sd_12a, dims=dims_data_sd_12a, wl=wl, nb=nb
     cub_sd_12a=fltarr((dims_data_sd_12a[2]+1)*(dims_data_sd_12a[4]+1),nc)
     for ii=3,nc+2 do cub_sd_12a[*,ii-3] = ENVI_GET_DATA(fid=data_fid_sd_12a, dims=dims_data_sd_12a, pos=[ii] )     
     ;for ii=0,245 do cub_sd[*,ii] = ENVI_GET_DATA(fid=data_fid_sd, dims=dims_data_sd, pos=[ii+3] )
path = path_fichiers_param+'param_slab_dust_240413/param_slab_dust_240413_em0.param'
      
      A = pdsread(path,  DIC='/home/fandrieu/Simu_IPAG/pro/LPG_PDS_LABEL.dic', /bsq)
      cub_sd_par_12atemp = A.core
      label_sd_12a = A.label
      wave_sd_12a = get_keyword(A.label, 'BAND_BIN_CENTER')      


path_spectres = path_fichiers_param+'param_slab_dust_240413_2/param_slab_dust_240413_2_em0_V.cub'
     envi_open_file, path_spectres, r_fid=data_fid_sd_12b
     envi_file_query, data_fid_sd_12b, dims=dims_data_sd_12b, wl=wl, nb=nb
     cub_sd_12b=fltarr((dims_data_sd_12b[2]+1)*(dims_data_sd_12b[4]+1),nc)
     for ii=3,nc+2 do cub_sd_12b[*,ii-3] = ENVI_GET_DATA(fid=data_fid_sd_12b, dims=dims_data_sd_12b, pos=[ii] )     
     ;for ii=0,245 do cub_sd[*,ii] = ENVI_GET_DATA(fid=data_fid_sd, dims=dims_data_sd, pos=[ii+3] )
path = path_fichiers_param+'param_slab_dust_240413_2/param_slab_dust_240413_2_em0.param'
      
      A = pdsread(path,  DIC='/home/fandrieu/Simu_IPAG/pro/LPG_PDS_LABEL.dic', /bsq)
      cub_sd_par_12btemp = A.core
      label_sd_12b = A.label
      wave_sd_12b = get_keyword(A.label, 'BAND_BIN_CENTER')      

cub_sd_12=fltarr((dims_data_sd_12a[2]+(dims_data_sd_12b[2])+2), (dims_data_sd_12b[4]+1),nc)
cub_sd_12[0:dims_data_sd_12a[2],*,*]=cub_sd_12a
cub_sd_12[dims_data_sd_12a[2]+1:dims_data_sd_12a[2]+dims_data_sd_12a[2]+1,*,*]=cub_sd_12b
cub_sd_12=reform(cub_sd_12, (dims_data_sd_12a[2]+(dims_data_sd_12b[2])+2)*(dims_data_sd_12b[4]+1),nc)

s_par_12a=size(cub_sd_par_12atemp)
s_par_12b=size(cub_sd_par_12btemp)
cub_sd_par_12a=fltarr(s_par_12a[1], s_par_12a[2],9)
cub_sd_par_12a[*,*,0]=cub_sd_par_12atemp[*,*,0]
cub_sd_par_12a[*,*,1]=60.
cub_sd_par_12a[*,*,2:3]=cub_sd_par_12atemp[*,*,1:2]
cub_sd_par_12a[*,*,4]=0.996
cub_sd_par_12a[*,*,5:8]=cub_sd_par_12atemp[*,*,3:6]

cub_sd_par_12b=fltarr(s_par_12b[1], s_par_12b[2],9)
cub_sd_par_12b[*,*,0]=cub_sd_par_12btemp[*,*,0]
cub_sd_par_12b[*,*,1]=150.
cub_sd_par_12b[*,*,2:3]=cub_sd_par_12btemp[*,*,1:2]
cub_sd_par_12b[*,*,4]=0.996
cub_sd_par_12b[*,*,5:8]=cub_sd_par_12btemp[*,*,3:6]


s_par_12a=size(cub_sd_par_12a)
s_par_12b=size(cub_sd_par_12b)
cub_sd_par_12=fltarr(s_par_12a[1]+s_par_12b[1], s_par_12a[2],s_par_12a[3])
cub_sd_par_12[0:s_par_12a[1]-1, *,*]=cub_sd_par_12a
cub_sd_par_12[s_par_12a[1]:s_par_12a[1]+s_par_12b[1]-1, *,*]=cub_sd_par_12b




path_spectres = path_fichiers_param+'param_slab_dust_240413_3/param_slab_dust_240413_3_em0_V.cub'
     envi_open_file, path_spectres, r_fid=data_fid_sd_13a
     envi_file_query, data_fid_sd_13a, dims=dims_data_sd_13a, wl=wl, nb=nb
     cub_sd_13a=fltarr((dims_data_sd_13a[2]+1)*(dims_data_sd_13a[4]+1),nc)
     for ii=3,nc+2 do cub_sd_13a[*,ii-3] = ENVI_GET_DATA(fid=data_fid_sd_13a, dims=dims_data_sd_13a, pos=[ii] )     
     ;for ii=0,245 do cub_sd[*,ii] = ENVI_GET_DATA(fid=data_fid_sd, dims=dims_data_sd, pos=[ii+3] )
path = path_fichiers_param+'param_slab_dust_240413_3/param_slab_dust_240413_3_em0.param'
      
      A = pdsread(path,  DIC='/home/fandrieu/Simu_IPAG/pro/LPG_PDS_LABEL.dic', /bsq)
      cub_sd_par_13atemp = A.core
      label_sd_13a = A.label
      wave_sd_13a = get_keyword(A.label, 'BAND_BIN_CENTER')      


path_spectres = path_fichiers_param+'param_slab_dust_240413_4/param_slab_dust_240413_4_em0_V.cub'
     envi_open_file, path_spectres, r_fid=data_fid_sd_13b
     envi_file_query, data_fid_sd_13b, dims=dims_data_sd_13b, wl=wl, nb=nb
     cub_sd_13b=fltarr((dims_data_sd_13b[2]+1)*(dims_data_sd_13b[4]+1),nc)
     for ii=3,nc+2 do cub_sd_13b[*,ii-3] = ENVI_GET_DATA(fid=data_fid_sd_13b, dims=dims_data_sd_13b, pos=[ii] )     
     ;for ii=0,245 do cub_sd[*,ii] = ENVI_GET_DATA(fid=data_fid_sd, dims=dims_data_sd, pos=[ii+3] )
path = path_fichiers_param+'param_slab_dust_240413_4/param_slab_dust_240413_4_em0.param'
      
      A = pdsread(path,  DIC='/home/fandrieu/Simu_IPAG/pro/LPG_PDS_LABEL.dic', /bsq)
      cub_sd_par_13btemp = A.core
      label_sd_13b = A.label
      wave_sd_13b = get_keyword(A.label, 'BAND_BIN_CENTER')      

cub_sd_13=fltarr((dims_data_sd_13a[2]+(dims_data_sd_13b[2])+2), (dims_data_sd_13b[4]+1),nc)
cub_sd_13[0:dims_data_sd_13a[2],*,*]=cub_sd_13a
cub_sd_13[dims_data_sd_13a[2]+1:dims_data_sd_13a[2]+dims_data_sd_13a[2]+1,*,*]=cub_sd_13b
cub_sd_13=reform(cub_sd_13, (dims_data_sd_13a[2]+(dims_data_sd_13b[2])+2)*(dims_data_sd_13b[4]+1),nc)

s_par_13a=size(cub_sd_par_13atemp)
s_par_13b=size(cub_sd_par_13btemp)
cub_sd_par_13a=fltarr(s_par_13a[1], s_par_13a[2],9)
cub_sd_par_13a[*,*,0]=cub_sd_par_13atemp[*,*,0]
cub_sd_par_13a[*,*,1]=60.
cub_sd_par_13a[*,*,2:3]=cub_sd_par_13atemp[*,*,1:2]
cub_sd_par_13a[*,*,4]=0.992
cub_sd_par_13a[*,*,5:8]=cub_sd_par_13atemp[*,*,3:6]

cub_sd_par_13b=fltarr(s_par_13b[1], s_par_13b[2],9)
cub_sd_par_13b[*,*,0]=cub_sd_par_13btemp[*,*,0]
cub_sd_par_13b[*,*,1]=150.
cub_sd_par_13b[*,*,2:3]=cub_sd_par_13btemp[*,*,1:2]
cub_sd_par_13b[*,*,4]=0.992
cub_sd_par_13b[*,*,5:8]=cub_sd_par_13btemp[*,*,3:6]


s_par_13a=size(cub_sd_par_13a)
s_par_13b=size(cub_sd_par_13b)
cub_sd_par_13=fltarr(s_par_13a[1]+s_par_13b[1], s_par_13a[2],s_par_13a[3])
cub_sd_par_13[0:s_par_13a[1]-1, *,*]=cub_sd_par_13a
cub_sd_par_13[s_par_13a[1]:s_par_13a[1]+s_par_13b[1]-1, *,*]=cub_sd_par_13b




path_spectres = path_fichiers_param+'param_slab_dust_250413/param_slab_dust_250413_em0_V.cub'
     envi_open_file, path_spectres, r_fid=data_fid_sd_14a
     envi_file_query, data_fid_sd_14a, dims=dims_data_sd_14a, wl=wl, nb=nb
     cub_sd_14a=fltarr((dims_data_sd_14a[2]+1)*(dims_data_sd_14a[4]+1),nc)
     for ii=3,nc+2 do cub_sd_14a[*,ii-3] = ENVI_GET_DATA(fid=data_fid_sd_14a, dims=dims_data_sd_14a, pos=[ii] )     
     ;for ii=0,245 do cub_sd[*,ii] = ENVI_GET_DATA(fid=data_fid_sd, dims=dims_data_sd, pos=[ii+3] )
path = path_fichiers_param+'param_slab_dust_250413/param_slab_dust_250413_em0.param'
      
      A = pdsread(path,  DIC='/home/fandrieu/Simu_IPAG/pro/LPG_PDS_LABEL.dic', /bsq)
      cub_sd_par_14atemp = A.core
      label_sd_14a = A.label
      wave_sd_14a = get_keyword(A.label, 'BAND_BIN_CENTER')      


path_spectres = path_fichiers_param+'param_slab_dust_250413_2/param_slab_dust_250413_2_em0_V.cub'
     envi_open_file, path_spectres, r_fid=data_fid_sd_14b
     envi_file_query, data_fid_sd_14b, dims=dims_data_sd_14b, wl=wl, nb=nb
     cub_sd_14b=fltarr((dims_data_sd_14b[2]+1)*(dims_data_sd_14b[4]+1),nc)
     for ii=3,nc+2 do cub_sd_14b[*,ii-3] = ENVI_GET_DATA(fid=data_fid_sd_14b, dims=dims_data_sd_14b, pos=[ii] )     
     ;for ii=0,245 do cub_sd[*,ii] = ENVI_GET_DATA(fid=data_fid_sd, dims=dims_data_sd, pos=[ii+3] )
path = path_fichiers_param+'param_slab_dust_250413_2/param_slab_dust_250413_2_em0.param'
      
      A = pdsread(path,  DIC='/home/fandrieu/Simu_IPAG/pro/LPG_PDS_LABEL.dic', /bsq)
      cub_sd_par_14btemp = A.core
      label_sd_14b = A.label
      wave_sd_14b = get_keyword(A.label, 'BAND_BIN_CENTER')      

cub_sd_14=fltarr((dims_data_sd_14a[2]+(dims_data_sd_14b[2])+2), (dims_data_sd_14b[4]+1),nc)
cub_sd_14[0:dims_data_sd_14a[2],*,*]=cub_sd_14a
cub_sd_14[dims_data_sd_14a[2]+1:dims_data_sd_14a[2]+dims_data_sd_14a[2]+1,*,*]=cub_sd_14b
cub_sd_14=reform(cub_sd_14, (dims_data_sd_14a[2]+(dims_data_sd_14b[2])+2)*(dims_data_sd_14b[4]+1),nc)

s_par_14a=size(cub_sd_par_14atemp)
s_par_14b=size(cub_sd_par_14btemp)
cub_sd_par_14a=fltarr(s_par_14a[1], s_par_14a[2],9)
cub_sd_par_14a[*,*,0]=cub_sd_par_14atemp[*,*,0]
cub_sd_par_14a[*,*,1]=60.
cub_sd_par_14a[*,*,2:3]=cub_sd_par_14atemp[*,*,1:2]
cub_sd_par_14a[*,*,4]=0.991
cub_sd_par_14a[*,*,5:8]=cub_sd_par_14atemp[*,*,3:6]

cub_sd_par_14b=fltarr(s_par_14b[1], s_par_14b[2],9)
cub_sd_par_14b[*,*,0]=cub_sd_par_14btemp[*,*,0]
cub_sd_par_14b[*,*,1]=150.
cub_sd_par_14b[*,*,2:3]=cub_sd_par_14btemp[*,*,1:2]
cub_sd_par_14b[*,*,4]=0.991
cub_sd_par_14b[*,*,5:8]=cub_sd_par_14btemp[*,*,3:6]


s_par_14a=size(cub_sd_par_14a)
s_par_14b=size(cub_sd_par_14b)
cub_sd_par_14=fltarr(s_par_14a[1]+s_par_14b[1], s_par_14a[2],s_par_14a[3])
cub_sd_par_14[0:s_par_14a[1]-1, *,*]=cub_sd_par_14a
cub_sd_par_14[s_par_14a[1]:s_par_14a[1]+s_par_14b[1]-1, *,*]=cub_sd_par_14b



path_spectres = path_fichiers_param+'param_slab_dust_250413_3/param_slab_dust_250413_3_em0_V.cub'
     envi_open_file, path_spectres, r_fid=data_fid_sd_15a
     envi_file_query, data_fid_sd_15a, dims=dims_data_sd_15a, wl=wl, nb=nb
     cub_sd_15a=fltarr((dims_data_sd_15a[2]+1)*(dims_data_sd_15a[4]+1),nc)
     for ii=3,nc+2 do cub_sd_15a[*,ii-3] = ENVI_GET_DATA(fid=data_fid_sd_15a, dims=dims_data_sd_15a, pos=[ii] )     
     ;for ii=0,245 do cub_sd[*,ii] = ENVI_GET_DATA(fid=data_fid_sd, dims=dims_data_sd, pos=[ii+3] )
path = path_fichiers_param+'param_slab_dust_250413_3/param_slab_dust_250413_3_em0.param'
      
      A = pdsread(path,  DIC='/home/fandrieu/Simu_IPAG/pro/LPG_PDS_LABEL.dic', /bsq)
      cub_sd_par_15atemp = A.core
      label_sd_15a = A.label
      wave_sd_15a = get_keyword(A.label, 'BAND_BIN_CENTER')      


path_spectres = path_fichiers_param+'param_slab_dust_250413_4/param_slab_dust_250413_4_em0_V.cub'
     envi_open_file, path_spectres, r_fid=data_fid_sd_15b
     envi_file_query, data_fid_sd_15b, dims=dims_data_sd_15b, wl=wl, nb=nb
     cub_sd_15b=fltarr((dims_data_sd_15b[2]+1)*(dims_data_sd_15b[4]+1),nc)
     for ii=3,nc+2 do cub_sd_15b[*,ii-3] = ENVI_GET_DATA(fid=data_fid_sd_15b, dims=dims_data_sd_15b, pos=[ii] )     
     ;for ii=0,245 do cub_sd[*,ii] = ENVI_GET_DATA(fid=data_fid_sd, dims=dims_data_sd, pos=[ii+3] )
path = path_fichiers_param+'param_slab_dust_250413_4/param_slab_dust_250413_4_em0.param'
      
      A = pdsread(path,  DIC='/home/fandrieu/Simu_IPAG/pro/LPG_PDS_LABEL.dic', /bsq)
      cub_sd_par_15btemp = A.core
      label_sd_15b = A.label
      wave_sd_15b = get_keyword(A.label, 'BAND_BIN_CENTER')      

cub_sd_15=fltarr((dims_data_sd_15a[2]+(dims_data_sd_15b[2])+2), (dims_data_sd_15b[4]+1),nc)
cub_sd_15[0:dims_data_sd_15a[2],*,*]=cub_sd_15a
cub_sd_15[dims_data_sd_15a[2]+1:dims_data_sd_15a[2]+dims_data_sd_15a[2]+1,*,*]=cub_sd_15b
cub_sd_15=reform(cub_sd_15, (dims_data_sd_15a[2]+(dims_data_sd_15b[2])+2)*(dims_data_sd_15b[4]+1),nc)

s_par_15a=size(cub_sd_par_15atemp)
s_par_15b=size(cub_sd_par_15btemp)
cub_sd_par_15a=fltarr(s_par_15a[1], s_par_15a[2],9)
cub_sd_par_15a[*,*,0]=cub_sd_par_15atemp[*,*,0]
cub_sd_par_15a[*,*,1]=60.
cub_sd_par_15a[*,*,2:3]=cub_sd_par_15atemp[*,*,1:2]
cub_sd_par_15a[*,*,4]=0.994
cub_sd_par_15a[*,*,5:8]=cub_sd_par_15atemp[*,*,3:6]

cub_sd_par_15b=fltarr(s_par_15b[1], s_par_15b[2],9)
cub_sd_par_15b[*,*,0]=cub_sd_par_15btemp[*,*,0]
cub_sd_par_15b[*,*,1]=150.
cub_sd_par_15b[*,*,2:3]=cub_sd_par_15btemp[*,*,1:2]
cub_sd_par_15b[*,*,4]=0.994
cub_sd_par_15b[*,*,5:8]=cub_sd_par_15btemp[*,*,3:6]


s_par_15a=size(cub_sd_par_15a)
s_par_15b=size(cub_sd_par_15b)
cub_sd_par_15=fltarr(s_par_15a[1]+s_par_15b[1], s_par_15a[2],s_par_15a[3])
cub_sd_par_15[0:s_par_15a[1]-1, *,*]=cub_sd_par_15a
cub_sd_par_15[s_par_15a[1]:s_par_15a[1]+s_par_15b[1]-1, *,*]=cub_sd_par_15b

path_spectres = path_fichiers_param+'param_dust_140513/param_dust_140513_em0_V.cub'
     envi_open_file, path_spectres, r_fid=data_fid_sd_16
     envi_file_query, data_fid_sd_16, dims=dims_data_sd_16, wl=wl, nb=nb
     cub_sd_16=fltarr((dims_data_sd_16[2]+1)*(dims_data_sd_16[4]+1),nc)
     for ii=3,nc+2 do cub_sd_16[*,ii-3] = ENVI_GET_DATA(fid=data_fid_sd_16, dims=dims_data_sd_16, pos=[ii] )     
     ;for ii=0,245 do cub_sd[*,ii] = ENVI_GET_DATA(fid=data_fid_sd, dims=dims_data_sd, pos=[ii+3] )
path = path_fichiers_param+'param_dust_140513/param_dust_140513_em0.param'
      
      A = pdsread(path,  DIC='/home/fandrieu/Simu_IPAG/pro/LPG_PDS_LABEL.dic', /bsq)
      cub_sd_par_16a = A.core
      label_sd_16 = A.label
      wave_sd_16 = get_keyword(A.label, 'BAND_BIN_CENTER')
      
s_par_16a=size(cub_sd_par_16a)
cub_sd_par_16=fltarr(s_par_16a[1],s_par_16a[2],9)
cub_sd_par_16[*,*,0:2]=cub_sd_par_16a[*,*,0:2]
cub_sd_par_16[*,*,3:4]=0.
cub_sd_par_16[*,*,5]=cub_sd_par_16a[*,*,3]
cub_sd_par_16[*,*,6:7]=0.
cub_sd_par_16[*,*,8]=100.



path_spectres = path_fichiers_param+'param_slab_dust_140513_2/param_slab_dust_140513_2_em0_V.cub'
     envi_open_file, path_spectres, r_fid=data_fid_sd_17
     envi_file_query, data_fid_sd_17, dims=dims_data_sd_17, wl=wl, nb=nb
     cub_sd_17=fltarr((dims_data_sd_17[2]+1)*(dims_data_sd_17[4]+1),nc)
     for ii=3,nc+2 do cub_sd_17[*,ii-3] = ENVI_GET_DATA(fid=data_fid_sd_17, dims=dims_data_sd_17, pos=[ii] )     
     ;for ii=0,245 do cub_sd[*,ii] = ENVI_GET_DATA(fid=data_fid_sd, dims=dims_data_sd, pos=[ii+3] )
path = path_fichiers_param+'param_slab_dust_140513_2/param_slab_dust_140513_2_em0.param'
      
      A = pdsread(path,  DIC='/home/fandrieu/Simu_IPAG/pro/LPG_PDS_LABEL.dic', /bsq)
      cub_sd_par_17 = A.core
      label_sd_17 = A.label
      wave_sd_17 = get_keyword(A.label, 'BAND_BIN_CENTER')



path_spectres = path_fichiers_param+'param_slab_dust_140513_3/param_slab_dust_140513_3_em0_V.cub'
     envi_open_file, path_spectres, r_fid=data_fid_sd_18
     envi_file_query, data_fid_sd_18, dims=dims_data_sd_18, wl=wl, nb=nb
     cub_sd_18=fltarr((dims_data_sd_18[2]+1)*(dims_data_sd_18[4]+1),nc)
     for ii=3,nc+2 do cub_sd_18[*,ii-3] = ENVI_GET_DATA(fid=data_fid_sd_18, dims=dims_data_sd_18, pos=[ii] )     
     ;for ii=0,245 do cub_sd[*,ii] = ENVI_GET_DATA(fid=data_fid_sd, dims=dims_data_sd, pos=[ii+3] )
path = path_fichiers_param+'param_slab_dust_140513_3/param_slab_dust_140513_3_em0.param'
      
      A = pdsread(path,  DIC='/home/fandrieu/Simu_IPAG/pro/LPG_PDS_LABEL.dic', /bsq)
      cub_sd_par_18a = A.core
      label_sd_18 = A.label
      wave_sd_18 = get_keyword(A.label, 'BAND_BIN_CENTER')

s_par_18a=size(cub_sd_par_18a)
cub_sd_par_18=fltarr(s_par_18a[1],s_par_18a[2],9)
cub_sd_par_18[*,*,0:2]=cub_sd_par_18a[*,*,0:2]
cub_sd_par_18[*,*,3]=1.
cub_sd_par_18[*,*,4:8]=cub_sd_par_18a[*,*,3:7]


path_spectres = path_fichiers_param+'param_slab_dust_140513_1/param_slab_dust_140513_1_em0_V.cub'
     envi_open_file, path_spectres, r_fid=data_fid_sd_19
     envi_file_query, data_fid_sd_19, dims=dims_data_sd_19, wl=wl, nb=nb
     cub_sd_19=fltarr((dims_data_sd_19[2]+1)*(dims_data_sd_19[4]+1),nc)
     for ii=3,nc+2 do cub_sd_19[*,ii-3] = ENVI_GET_DATA(fid=data_fid_sd_19, dims=dims_data_sd_19, pos=[ii] )     
     ;for ii=0,245 do cub_sd[*,ii] = ENVI_GET_DATA(fid=data_fid_sd, dims=dims_data_sd, pos=[ii+3] )
path = path_fichiers_param+'param_slab_dust_140513_1/param_slab_dust_140513_1_em0.param'
      
      A = pdsread(path,  DIC='/home/fandrieu/Simu_IPAG/pro/LPG_PDS_LABEL.dic', /bsq)
      cub_sd_par_19 = A.core
      label_sd_19 = A.label
      wave_sd_19 = get_keyword(A.label, 'BAND_BIN_CENTER')


path_spectres = path_fichiers_param+'param_slab_dust_150513_1/param_slab_dust_150513_1_em0_V.cub'
     envi_open_file, path_spectres, r_fid=data_fid_sd_20
     envi_file_query, data_fid_sd_20, dims=dims_data_sd_20, wl=wl, nb=nb
     cub_sd_20=fltarr((dims_data_sd_20[2]+1)*(dims_data_sd_20[4]+1),nc)
     for ii=3,nc+2 do cub_sd_20[*,ii-3] = ENVI_GET_DATA(fid=data_fid_sd_20, dims=dims_data_sd_20, pos=[ii] )     
     ;for ii=0,245 do cub_sd[*,ii] = ENVI_GET_DATA(fid=data_fid_sd, dims=dims_data_sd, pos=[ii+3] )
path = path_fichiers_param+'param_slab_dust_150513_1/param_slab_dust_150513_1_em0.param'
      
      A = pdsread(path,  DIC='/home/fandrieu/Simu_IPAG/pro/LPG_PDS_LABEL.dic', /bsq)
      cub_sd_par_20 = A.core
      label_sd_20 = A.label
      wave_sd_20 = get_keyword(A.label, 'BAND_BIN_CENTER')



path_spectres = path_fichiers_param+'param_slab_dust_150513_2/param_slab_dust_150513_2_em0_V.cub'
     envi_open_file, path_spectres, r_fid=data_fid_sd_21
     envi_file_query, data_fid_sd_21, dims=dims_data_sd_21, wl=wl, nb=nb
     cub_sd_21=fltarr((dims_data_sd_21[2]+1)*(dims_data_sd_21[4]+1),nc)
     for ii=3,nc+2 do cub_sd_21[*,ii-3] = ENVI_GET_DATA(fid=data_fid_sd_21, dims=dims_data_sd_21, pos=[ii] )     
     ;for ii=0,245 do cub_sd[*,ii] = ENVI_GET_DATA(fid=data_fid_sd, dims=dims_data_sd, pos=[ii+3] )
path = path_fichiers_param+'param_slab_dust_150513_2/param_slab_dust_150513_2_em0.param'
      
      A = pdsread(path,  DIC='/home/fandrieu/Simu_IPAG/pro/LPG_PDS_LABEL.dic', /bsq)
      cub_sd_par_21 = A.core
      label_sd_21 = A.label
      wave_sd_21 = get_keyword(A.label, 'BAND_BIN_CENTER')


path_spectres = path_fichiers_param+'param_slab_dust_150513_3/param_slab_dust_150513_3_em0_V.cub'
     envi_open_file, path_spectres, r_fid=data_fid_sd_22
     envi_file_query, data_fid_sd_22, dims=dims_data_sd_22, wl=wl, nb=nb
     cub_sd_22=fltarr((dims_data_sd_22[2]+1)*(dims_data_sd_22[4]+1),nc)
     for ii=3,nc+2 do cub_sd_22[*,ii-3] = ENVI_GET_DATA(fid=data_fid_sd_22, dims=dims_data_sd_22, pos=[ii] )     
     ;for ii=0,245 do cub_sd[*,ii] = ENVI_GET_DATA(fid=data_fid_sd, dims=dims_data_sd, pos=[ii+3] )
path = path_fichiers_param+'param_slab_dust_150513_3/param_slab_dust_150513_3_em0.param'
      
      A = pdsread(path,  DIC='/home/fandrieu/Simu_IPAG/pro/LPG_PDS_LABEL.dic', /bsq)
      cub_sd_par_22 = A.core
      label_sd_22 = A.label
      wave_sd_22 = get_keyword(A.label, 'BAND_BIN_CENTER')


path_spectres = path_fichiers_param+'param_slab_dust_150513_4/param_slab_dust_150513_4_em0_V.cub'
     envi_open_file, path_spectres, r_fid=data_fid_sd_23
     envi_file_query, data_fid_sd_23, dims=dims_data_sd_23, wl=wl, nb=nb
     cub_sd_23=fltarr((dims_data_sd_23[2]+1)*(dims_data_sd_23[4]+1),nc)
     for ii=3,nc+2 do cub_sd_23[*,ii-3] = ENVI_GET_DATA(fid=data_fid_sd_23, dims=dims_data_sd_23, pos=[ii] )     
     ;for ii=0,245 do cub_sd[*,ii] = ENVI_GET_DATA(fid=data_fid_sd, dims=dims_data_sd, pos=[ii+3] )
path = path_fichiers_param+'param_slab_dust_150513_4/param_slab_dust_150513_4_em0.param'
      
      A = pdsread(path,  DIC='/home/fandrieu/Simu_IPAG/pro/LPG_PDS_LABEL.dic', /bsq)
      cub_sd_par_23 = A.core
      label_sd_23 = A.label
      wave_sd_23 = get_keyword(A.label, 'BAND_BIN_CENTER')


path_spectres = path_fichiers_param+'param_slab_dust_150513_5/param_slab_dust_150513_5_em0_V.cub'
     envi_open_file, path_spectres, r_fid=data_fid_sd_24
     envi_file_query, data_fid_sd_24, dims=dims_data_sd_24, wl=wl, nb=nb
     cub_sd_24=fltarr((dims_data_sd_24[2]+1)*(dims_data_sd_24[4]+1),nc)
     for ii=3,nc+2 do cub_sd_24[*,ii-3] = ENVI_GET_DATA(fid=data_fid_sd_24, dims=dims_data_sd_24, pos=[ii] )     
     ;for ii=0,245 do cub_sd[*,ii] = ENVI_GET_DATA(fid=data_fid_sd, dims=dims_data_sd, pos=[ii+3] )
path = path_fichiers_param+'param_slab_dust_150513_5/param_slab_dust_150513_5_em0.param'
      
      A = pdsread(path,  DIC='/home/fandrieu/Simu_IPAG/pro/LPG_PDS_LABEL.dic', /bsq)
      cub_sd_par_24a = A.core
      label_sd_24 = A.label
      wave_sd_24 = get_keyword(A.label, 'BAND_BIN_CENTER')

s_par_24a=size(cub_sd_par_24a)
cub_sd_par_24=fltarr(s_par_24a[1],s_par_24a[2],9)
cub_sd_par_24[*,*,0:3]=cub_sd_par_24a[*,*,0:3]
cub_sd_par_24[*,*,4]=0.9985
cub_sd_par_24[*,*,5:8]=cub_sd_par_24a[*,*,4:7]



path_spectres = path_fichiers_param+'param_slab_dust_210513_1/param_slab_dust_210513_1_em0_V.cub'
     envi_open_file, path_spectres, r_fid=data_fid_sd_25
     envi_file_query, data_fid_sd_25, dims=dims_data_sd_25, wl=wl, nb=nb
     cub_sd_25=fltarr((dims_data_sd_25[2]+1)*(dims_data_sd_25[4]+1),nc)
     for ii=3,nc+2 do cub_sd_25[*,ii-3] = ENVI_GET_DATA(fid=data_fid_sd_25, dims=dims_data_sd_25, pos=[ii] )     
     ;for ii=0,245 do cub_sd[*,ii] = ENVI_GET_DATA(fid=data_fid_sd, dims=dims_data_sd, pos=[ii+3] )
path = path_fichiers_param+'param_slab_dust_210513_1/param_slab_dust_210513_1_em0.param'
      
      A = pdsread(path,  DIC='/home/fandrieu/Simu_IPAG/pro/LPG_PDS_LABEL.dic', /bsq)
      cub_sd_par_25 = A.core
      label_sd_25 = A.label
      wave_sd_25 = get_keyword(A.label, 'BAND_BIN_CENTER')


path_spectres = path_fichiers_param+'param_slab_dust_210513/param_slab_dust_210513_em0_V.cub'
     envi_open_file, path_spectres, r_fid=data_fid_sd_26
     envi_file_query, data_fid_sd_26, dims=dims_data_sd_26, wl=wl, nb=nb
     cub_sd_26=fltarr((dims_data_sd_26[2]+1)*(dims_data_sd_26[4]+1),nc)
     for ii=3,nc+2 do cub_sd_26[*,ii-3] = ENVI_GET_DATA(fid=data_fid_sd_26, dims=dims_data_sd_26, pos=[ii] )     
     ;for ii=0,245 do cub_sd[*,ii] = ENVI_GET_DATA(fid=data_fid_sd, dims=dims_data_sd, pos=[ii+3] )
path = path_fichiers_param+'param_slab_dust_210513/param_slab_dust_210513_em0.param'
      
      A = pdsread(path,  DIC='/home/fandrieu/Simu_IPAG/pro/LPG_PDS_LABEL.dic', /bsq)
      cub_sd_par_26 = A.core
      label_sd_26 = A.label
      wave_sd_26 = get_keyword(A.label, 'BAND_BIN_CENTER')


path_spectres = path_fichiers_param+'param_slab_dust_210513_3/param_slab_dust_210513_3_em0_V.cub'
     envi_open_file, path_spectres, r_fid=data_fid_sd_27
     envi_file_query, data_fid_sd_27, dims=dims_data_sd_27, wl=wl, nb=nb
     cub_sd_27=fltarr((dims_data_sd_27[2]+1)*(dims_data_sd_27[4]+1),nc)
     for ii=3,nc+2 do cub_sd_27[*,ii-3] = ENVI_GET_DATA(fid=data_fid_sd_27, dims=dims_data_sd_27, pos=[ii] )     
     ;for ii=0,245 do cub_sd[*,ii] = ENVI_GET_DATA(fid=data_fid_sd, dims=dims_data_sd, pos=[ii+3] )
path = path_fichiers_param+'param_slab_dust_210513_3/param_slab_dust_210513_3_em0.param'
      
      A = pdsread(path,  DIC='/home/fandrieu/Simu_IPAG/pro/LPG_PDS_LABEL.dic', /bsq)
      cub_sd_par_27 = A.core
      label_sd_27 = A.label
      wave_sd_27 = get_keyword(A.label, 'BAND_BIN_CENTER')


path_spectres = path_fichiers_param+'param_slab_dust_210513_4/param_slab_dust_210513_4_em0_V.cub'
     envi_open_file, path_spectres, r_fid=data_fid_sd_28
     envi_file_query, data_fid_sd_28, dims=dims_data_sd_28, wl=wl, nb=nb
     cub_sd_28=fltarr((dims_data_sd_28[2]+1)*(dims_data_sd_28[4]+1),nc)
     for ii=3,nc+2 do cub_sd_28[*,ii-3] = ENVI_GET_DATA(fid=data_fid_sd_28, dims=dims_data_sd_28, pos=[ii] )     
     ;for ii=0,245 do cub_sd[*,ii] = ENVI_GET_DATA(fid=data_fid_sd, dims=dims_data_sd, pos=[ii+3] )
path = path_fichiers_param+'param_slab_dust_210513_4/param_slab_dust_210513_4_em0.param'
      
      A = pdsread(path,  DIC='/home/fandrieu/Simu_IPAG/pro/LPG_PDS_LABEL.dic', /bsq)
      cub_sd_par_28 = A.core
      label_sd_28 = A.label
      wave_sd_28 = get_keyword(A.label, 'BAND_BIN_CENTER')


path_spectres = path_fichiers_param+'param_slab_dust_210513_5/param_slab_dust_210513_5_em0_V.cub'
     envi_open_file, path_spectres, r_fid=data_fid_sd_29
     envi_file_query, data_fid_sd_29, dims=dims_data_sd_29, wl=wl, nb=nb
     cub_sd_29=fltarr((dims_data_sd_29[2]+1)*(dims_data_sd_29[4]+1),nc)
     for ii=3,nc+2 do cub_sd_29[*,ii-3] = ENVI_GET_DATA(fid=data_fid_sd_29, dims=dims_data_sd_29, pos=[ii] )     
     ;for ii=0,245 do cub_sd[*,ii] = ENVI_GET_DATA(fid=data_fid_sd, dims=dims_data_sd, pos=[ii+3] )
path = path_fichiers_param+'param_slab_dust_210513_5/param_slab_dust_210513_5_em0.param'
      
      A = pdsread(path,  DIC='/home/fandrieu/Simu_IPAG/pro/LPG_PDS_LABEL.dic', /bsq)
      cub_sd_par_29 = A.core
      label_sd_29 = A.label
      wave_sd_29 = get_keyword(A.label, 'BAND_BIN_CENTER')


path_spectres = path_fichiers_param+'param_slab_dust_210513_6/param_slab_dust_210513_6_em0_V.cub'
     envi_open_file, path_spectres, r_fid=data_fid_sd_30
     envi_file_query, data_fid_sd_30, dims=dims_data_sd_30, wl=wl, nb=nb
     cub_sd_30=fltarr((dims_data_sd_30[2]+1)*(dims_data_sd_30[4]+1),nc)
     for ii=3,nc+2 do cub_sd_30[*,ii-3] = ENVI_GET_DATA(fid=data_fid_sd_30, dims=dims_data_sd_30, pos=[ii] )     
     ;for ii=0,245 do cub_sd[*,ii] = ENVI_GET_DATA(fid=data_fid_sd, dims=dims_data_sd, pos=[ii+3] )
path = path_fichiers_param+'param_slab_dust_210513_6/param_slab_dust_210513_6_em0.param'
      
      A = pdsread(path,  DIC='/home/fandrieu/Simu_IPAG/pro/LPG_PDS_LABEL.dic', /bsq)
      cub_sd_par_30 = A.core
      label_sd_30 = A.label
      wave_sd_30 = get_keyword(A.label, 'BAND_BIN_CENTER')


path_spectres = path_fichiers_param+'param_slab_dust_210513_7/param_slab_dust_210513_7_em0_V.cub'
     envi_open_file, path_spectres, r_fid=data_fid_sd_31
     envi_file_query, data_fid_sd_31, dims=dims_data_sd_31, wl=wl, nb=nb
     cub_sd_31=fltarr((dims_data_sd_31[2]+1)*(dims_data_sd_31[4]+1),nc)
     for ii=3,nc+2 do cub_sd_31[*,ii-3] = ENVI_GET_DATA(fid=data_fid_sd_31, dims=dims_data_sd_31, pos=[ii] )     
     ;for ii=0,245 do cub_sd[*,ii] = ENVI_GET_DATA(fid=data_fid_sd, dims=dims_data_sd, pos=[ii+3] )
path = path_fichiers_param+'param_slab_dust_210513_7/param_slab_dust_210513_7_em0.param'
      
      A = pdsread(path,  DIC='/home/fandrieu/Simu_IPAG/pro/LPG_PDS_LABEL.dic', /bsq)
      cub_sd_par_31 = A.core
      label_sd_31 = A.label
      wave_sd_31 = get_keyword(A.label, 'BAND_BIN_CENTER')


path_spectres = path_fichiers_param+'param_slab_dust_210513_8/param_slab_dust_210513_8_em0_V.cub'
     envi_open_file, path_spectres, r_fid=data_fid_sd_32
     envi_file_query, data_fid_sd_32, dims=dims_data_sd_32, wl=wl, nb=nb
     cub_sd_32=fltarr((dims_data_sd_32[2]+1)*(dims_data_sd_32[4]+1),nc)
     for ii=3,nc+2 do cub_sd_32[*,ii-3] = ENVI_GET_DATA(fid=data_fid_sd_32, dims=dims_data_sd_32, pos=[ii] )     
     ;for ii=0,245 do cub_sd[*,ii] = ENVI_GET_DATA(fid=data_fid_sd, dims=dims_data_sd, pos=[ii+3] )
path = path_fichiers_param+'param_slab_dust_210513_8/param_slab_dust_210513_8_em0.param'
      
      A = pdsread(path,  DIC='/home/fandrieu/Simu_IPAG/pro/LPG_PDS_LABEL.dic', /bsq)
      cub_sd_par_32 = A.core
      label_sd_32 = A.label
      wave_sd_32 = get_keyword(A.label, 'BAND_BIN_CENTER')


path_spectres = path_fichiers_param+'param_slab_dust_210513_9/param_slab_dust_210513_9_em0_V.cub'
     envi_open_file, path_spectres, r_fid=data_fid_sd_33
     envi_file_query, data_fid_sd_33, dims=dims_data_sd_33, wl=wl, nb=nb
     cub_sd_33=fltarr((dims_data_sd_33[2]+1)*(dims_data_sd_33[4]+1),nc)
     for ii=3,nc+2 do cub_sd_33[*,ii-3] = ENVI_GET_DATA(fid=data_fid_sd_33, dims=dims_data_sd_33, pos=[ii] )     
     ;for ii=0,245 do cub_sd[*,ii] = ENVI_GET_DATA(fid=data_fid_sd, dims=dims_data_sd, pos=[ii+3] )
path = path_fichiers_param+'param_slab_dust_210513_9/param_slab_dust_210513_9_em0.param'
      
      A = pdsread(path,  DIC='/home/fandrieu/Simu_IPAG/pro/LPG_PDS_LABEL.dic', /bsq)
      cub_sd_par_33 = A.core
      label_sd_33 = A.label
      wave_sd_33 = get_keyword(A.label, 'BAND_BIN_CENTER')


path_spectres = path_fichiers_param+'param_slab_dust_270513_1/param_slab_dust_270513_1_em0_V.cub'
     envi_open_file, path_spectres, r_fid=data_fid_sd_34
     envi_file_query, data_fid_sd_34, dims=dims_data_sd_34, wl=wl, nb=nb
     cub_sd_34=fltarr((dims_data_sd_34[2]+1)*(dims_data_sd_34[4]+1),nc)
     for ii=3,nc+2 do cub_sd_34[*,ii-3] = ENVI_GET_DATA(fid=data_fid_sd_34, dims=dims_data_sd_34, pos=[ii] )     
     ;for ii=0,245 do cub_sd[*,ii] = ENVI_GET_DATA(fid=data_fid_sd, dims=dims_data_sd, pos=[ii+3] )
path = path_fichiers_param+'param_slab_dust_270513_1/param_slab_dust_270513_1_em0.param'
      
      A = pdsread(path,  DIC='/home/fandrieu/Simu_IPAG/pro/LPG_PDS_LABEL.dic', /bsq)
      cub_sd_par_34 = A.core
      label_sd_34 = A.label
      wave_sd_34 = get_keyword(A.label, 'BAND_BIN_CENTER')



path_spectres = path_fichiers_param+'param_slab_dust_270513_2/param_slab_dust_270513_2_em0_V.cub'
     envi_open_file, path_spectres, r_fid=data_fid_sd_35
     envi_file_query, data_fid_sd_35, dims=dims_data_sd_35, wl=wl, nb=nb
     cub_sd_35=fltarr((dims_data_sd_35[2]+1)*(dims_data_sd_35[4]+1),nc)
     for ii=3,nc+2 do cub_sd_35[*,ii-3] = ENVI_GET_DATA(fid=data_fid_sd_35, dims=dims_data_sd_35, pos=[ii] )     
     ;for ii=0,245 do cub_sd[*,ii] = ENVI_GET_DATA(fid=data_fid_sd, dims=dims_data_sd, pos=[ii+3] )
path = path_fichiers_param+'param_slab_dust_270513_2/param_slab_dust_270513_2_em0.param'
      
      A = pdsread(path,  DIC='/home/fandrieu/Simu_IPAG/pro/LPG_PDS_LABEL.dic', /bsq)
      cub_sd_par_35 = A.core
      label_sd_35 = A.label
      wave_sd_35 = get_keyword(A.label, 'BAND_BIN_CENTER')



path_spectres = path_fichiers_param+'param_slab_dust_270513_3/param_slab_dust_270513_3_em0_V.cub'
     envi_open_file, path_spectres, r_fid=data_fid_sd_36
     envi_file_query, data_fid_sd_36, dims=dims_data_sd_36, wl=wl, nb=nb
     cub_sd_36=fltarr((dims_data_sd_36[2]+1)*(dims_data_sd_36[4]+1),nc)
     for ii=3,nc+2 do cub_sd_36[*,ii-3] = ENVI_GET_DATA(fid=data_fid_sd_36, dims=dims_data_sd_36, pos=[ii] )     
     ;for ii=0,245 do cub_sd[*,ii] = ENVI_GET_DATA(fid=data_fid_sd, dims=dims_data_sd, pos=[ii+3] )
path = path_fichiers_param+'param_slab_dust_270513_3/param_slab_dust_270513_3_em0.param'
      
      A = pdsread(path,  DIC='/home/fandrieu/Simu_IPAG/pro/LPG_PDS_LABEL.dic', /bsq)
      cub_sd_par_36 = A.core
      label_sd_36 = A.label
      wave_sd_36 = get_keyword(A.label, 'BAND_BIN_CENTER')



path_spectres = path_fichiers_param+'param_slab_dust_270513_4/param_slab_dust_270513_4_em0_V.cub'
     envi_open_file, path_spectres, r_fid=data_fid_sd_37
     envi_file_query, data_fid_sd_37, dims=dims_data_sd_37, wl=wl, nb=nb
     cub_sd_37=fltarr((dims_data_sd_37[2]+1)*(dims_data_sd_37[4]+1),nc)
     for ii=3,nc+2 do cub_sd_37[*,ii-3] = ENVI_GET_DATA(fid=data_fid_sd_37, dims=dims_data_sd_37, pos=[ii] )     
     ;for ii=0,245 do cub_sd[*,ii] = ENVI_GET_DATA(fid=data_fid_sd, dims=dims_data_sd, pos=[ii+3] )
path = path_fichiers_param+'param_slab_dust_270513_4/param_slab_dust_270513_4_em0.param'
      
      A = pdsread(path,  DIC='/home/fandrieu/Simu_IPAG/pro/LPG_PDS_LABEL.dic', /bsq)
      cub_sd_par_37 = A.core
      label_sd_37 = A.label
      wave_sd_37 = get_keyword(A.label, 'BAND_BIN_CENTER')



path_spectres = path_fichiers_param+'param_slab_dust_270513_5/param_slab_dust_270513_5_em0_V.cub'
     envi_open_file, path_spectres, r_fid=data_fid_sd_38
     envi_file_query, data_fid_sd_38, dims=dims_data_sd_38, wl=wl, nb=nb
     cub_sd_38=fltarr((dims_data_sd_38[2]+1)*(dims_data_sd_38[4]+1),nc)
     for ii=3,nc+2 do cub_sd_38[*,ii-3] = ENVI_GET_DATA(fid=data_fid_sd_38, dims=dims_data_sd_38, pos=[ii] )     
     ;for ii=0,245 do cub_sd[*,ii] = ENVI_GET_DATA(fid=data_fid_sd, dims=dims_data_sd, pos=[ii+3] )
path = path_fichiers_param+'param_slab_dust_270513_5/param_slab_dust_270513_5_em0.param'
      
      A = pdsread(path,  DIC='/home/fandrieu/Simu_IPAG/pro/LPG_PDS_LABEL.dic', /bsq)
      cub_sd_par_38 = A.core
      label_sd_38 = A.label
      wave_sd_38 = get_keyword(A.label, 'BAND_BIN_CENTER')



path_spectres = path_fichiers_param+'param_slab_dust_270513_6/param_slab_dust_270513_6_em0_V.cub'
     envi_open_file, path_spectres, r_fid=data_fid_sd_39
     envi_file_query, data_fid_sd_39, dims=dims_data_sd_39, wl=wl, nb=nb
     cub_sd_39=fltarr((dims_data_sd_39[2]+1)*(dims_data_sd_39[4]+1),nc)
     for ii=3,nc+2 do cub_sd_39[*,ii-3] = ENVI_GET_DATA(fid=data_fid_sd_39, dims=dims_data_sd_39, pos=[ii] )     
     ;for ii=0,245 do cub_sd[*,ii] = ENVI_GET_DATA(fid=data_fid_sd, dims=dims_data_sd, pos=[ii+3] )
path = path_fichiers_param+'param_slab_dust_270513_6/param_slab_dust_270513_6_em0.param'
      
      A = pdsread(path,  DIC='/home/fandrieu/Simu_IPAG/pro/LPG_PDS_LABEL.dic', /bsq)
      cub_sd_par_39 = A.core
      label_sd_39 = A.label
      wave_sd_39 = get_keyword(A.label, 'BAND_BIN_CENTER')



path_spectres = path_fichiers_param+'param_slab_dust_270513_7/param_slab_dust_270513_7_em0_V.cub'
     envi_open_file, path_spectres, r_fid=data_fid_sd_40
     envi_file_query, data_fid_sd_40, dims=dims_data_sd_40, wl=wl, nb=nb
     cub_sd_40=fltarr((dims_data_sd_40[2]+1)*(dims_data_sd_40[4]+1),nc)
     for ii=3,nc+2 do cub_sd_40[*,ii-3] = ENVI_GET_DATA(fid=data_fid_sd_40, dims=dims_data_sd_40, pos=[ii] )     
     ;for ii=0,245 do cub_sd[*,ii] = ENVI_GET_DATA(fid=data_fid_sd, dims=dims_data_sd, pos=[ii+3] )
path = path_fichiers_param+'param_slab_dust_270513_7/param_slab_dust_270513_7_em0.param'
      
      A = pdsread(path,  DIC='/home/fandrieu/Simu_IPAG/pro/LPG_PDS_LABEL.dic', /bsq)
      cub_sd_par_40 = A.core
      label_sd_40 = A.label
      wave_sd_40 = get_keyword(A.label, 'BAND_BIN_CENTER')



path_spectres = path_fichiers_param+'param_slab_dust_270513_8/param_slab_dust_270513_8_em0_V.cub'
     envi_open_file, path_spectres, r_fid=data_fid_sd_41
     envi_file_query, data_fid_sd_41, dims=dims_data_sd_41, wl=wl, nb=nb
     cub_sd_41=fltarr((dims_data_sd_41[2]+1)*(dims_data_sd_41[4]+1),nc)
     for ii=3,nc+2 do cub_sd_41[*,ii-3] = ENVI_GET_DATA(fid=data_fid_sd_41, dims=dims_data_sd_41, pos=[ii] )     
     ;for ii=0,245 do cub_sd[*,ii] = ENVI_GET_DATA(fid=data_fid_sd, dims=dims_data_sd, pos=[ii+3] )
path = path_fichiers_param+'param_slab_dust_270513_8/param_slab_dust_270513_8_em0.param'
      
      A = pdsread(path,  DIC='/home/fandrieu/Simu_IPAG/pro/LPG_PDS_LABEL.dic', /bsq)
      cub_sd_par_41 = A.core
      label_sd_41 = A.label
      wave_sd_41 = get_keyword(A.label, 'BAND_BIN_CENTER')



path_spectres = path_fichiers_param+'param_slab_dust_270513_9/param_slab_dust_270513_9_em0_V.cub'
     envi_open_file, path_spectres, r_fid=data_fid_sd_42
     envi_file_query, data_fid_sd_42, dims=dims_data_sd_42, wl=wl, nb=nb
     cub_sd_42=fltarr((dims_data_sd_42[2]+1)*(dims_data_sd_42[4]+1),nc)
     for ii=3,nc+2 do cub_sd_42[*,ii-3] = ENVI_GET_DATA(fid=data_fid_sd_42, dims=dims_data_sd_42, pos=[ii] )     
     ;for ii=0,245 do cub_sd[*,ii] = ENVI_GET_DATA(fid=data_fid_sd, dims=dims_data_sd, pos=[ii+3] )
path = path_fichiers_param+'param_slab_dust_270513_9/param_slab_dust_270513_9_em0.param'
      
      A = pdsread(path,  DIC='/home/fandrieu/Simu_IPAG/pro/LPG_PDS_LABEL.dic', /bsq)
      cub_sd_par_42 = A.core
      label_sd_42 = A.label
      wave_sd_42 = get_keyword(A.label, 'BAND_BIN_CENTER')



path_spectres = path_fichiers_param+'param_slab_dust_270513_10/param_slab_dust_270513_10_em0_V.cub'
     envi_open_file, path_spectres, r_fid=data_fid_sd_43
     envi_file_query, data_fid_sd_43, dims=dims_data_sd_43, wl=wl, nb=nb
     cub_sd_43=fltarr((dims_data_sd_43[2]+1)*(dims_data_sd_43[4]+1),nc)
     for ii=3,nc+2 do cub_sd_43[*,ii-3] = ENVI_GET_DATA(fid=data_fid_sd_43, dims=dims_data_sd_43, pos=[ii] )     
     ;for ii=0,245 do cub_sd[*,ii] = ENVI_GET_DATA(fid=data_fid_sd, dims=dims_data_sd, pos=[ii+3] )
path = path_fichiers_param+'param_slab_dust_270513_10/param_slab_dust_270513_10_em0.param'
      
      A = pdsread(path,  DIC='/home/fandrieu/Simu_IPAG/pro/LPG_PDS_LABEL.dic', /bsq)
      cub_sd_par_43 = A.core
      label_sd_43 = A.label
      wave_sd_43 = get_keyword(A.label, 'BAND_BIN_CENTER')


path_spectres = path_fichiers_param+'param_dust_300513/param_dust_300513_em0_V.cub'
     envi_open_file, path_spectres, r_fid=data_fid_sd_44
     envi_file_query, data_fid_sd_44, dims=dims_data_sd_44, wl=wl, nb=nb
     cub_sd_44=fltarr((dims_data_sd_44[2]+1)*(dims_data_sd_44[4]+1),nc)
     for ii=3,nc+2 do cub_sd_44[*,ii-3] = ENVI_GET_DATA(fid=data_fid_sd_44, dims=dims_data_sd_44, pos=[ii] )     
     ;for ii=0,245 do cub_sd[*,ii] = ENVI_GET_DATA(fid=data_fid_sd, dims=dims_data_sd, pos=[ii+3] )
path = path_fichiers_param+'param_dust_300513/param_dust_300513_em0.param'
      
      A = pdsread(path,  DIC='/home/fandrieu/Simu_IPAG/pro/LPG_PDS_LABEL.dic', /bsq)
      cub_sd_par_44a = A.core
      label_sd_44 = A.label
      wave_sd_44 = get_keyword(A.label, 'BAND_BIN_CENTER')
      
s_par_44a=size(cub_sd_par_44a)
cub_sd_par_44=fltarr(s_par_44a[1],s_par_44a[2],9)
cub_sd_par_44[*,*,0:2]=cub_sd_par_44a[*,*,0:2]
cub_sd_par_44[*,*,3]=cub_sd_par_44a[*,*,6]*0.001
cub_sd_par_44[*,*,4]=cub_sd_par_44a[*,*,4]
cub_sd_par_44[*,*,5]=cub_sd_par_44a[*,*,3]
cub_sd_par_44[*,*,6:7]=0.
cub_sd_par_44[*,*,8]=100.



path_spectres = path_fichiers_param+'param_slab_dust_300513/param_slab_dust_300513_em0_V.cub'
     envi_open_file, path_spectres, r_fid=data_fid_sd_45
     envi_file_query, data_fid_sd_45, dims=dims_data_sd_45, wl=wl, nb=nb
     cub_sd_45=fltarr((dims_data_sd_45[2]+1)*(dims_data_sd_45[4]+1),nc)
     for ii=3,nc+2 do cub_sd_45[*,ii-3] = ENVI_GET_DATA(fid=data_fid_sd_45, dims=dims_data_sd_45, pos=[ii] )     
     ;for ii=0,245 do cub_sd[*,ii] = ENVI_GET_DATA(fid=data_fid_sd, dims=dims_data_sd, pos=[ii+3] )
path = path_fichiers_param+'param_slab_dust_300513/param_slab_dust_300513_em0.param'
      
      A = pdsread(path,  DIC='/home/fandrieu/Simu_IPAG/pro/LPG_PDS_LABEL.dic', /bsq)
      cub_sd_par_45 = A.core
      label_sd_45 = A.label
      wave_sd_45 = get_keyword(A.label, 'BAND_BIN_CENTER')

path_spectres = path_fichiers_param+'param_slab_dust_040613_1/param_slab_dust_040613_1_em0_V.cub'
     envi_open_file, path_spectres, r_fid=data_fid_sd_46
     envi_file_query, data_fid_sd_46, dims=dims_data_sd_46, wl=wl, nb=nb
     cub_sd_46=fltarr((dims_data_sd_46[2]+1)*(dims_data_sd_46[4]+1),nc)
     for ii=3,nc+2 do cub_sd_46[*,ii-3] = ENVI_GET_DATA(fid=data_fid_sd_46, dims=dims_data_sd_46, pos=[ii] )     
     ;for ii=0,246 do cub_sd[*,ii] = ENVI_GET_DATA(fid=data_fid_sd, dims=dims_data_sd, pos=[ii+3] )
path = path_fichiers_param+'param_slab_dust_040613_1/param_slab_dust_040613_1_em0.param'
      
      A = pdsread(path,  DIC='/home/fandrieu/Simu_IPAG/pro/LPG_PDS_LABEL.dic', /bsq)
      cub_sd_par_46 = A.core
      label_sd_46 = A.label
      wave_sd_46 = get_keyword(A.label, 'BAND_BIN_CENTER')


path_spectres = path_fichiers_param+'param_slab_dust_040613_2/param_slab_dust_040613_2_em0_V.cub'
     envi_open_file, path_spectres, r_fid=data_fid_sd_47
     envi_file_query, data_fid_sd_47, dims=dims_data_sd_47, wl=wl, nb=nb
     cub_sd_47=fltarr((dims_data_sd_47[2]+1)*(dims_data_sd_47[4]+1),nc)
     for ii=3,nc+2 do cub_sd_47[*,ii-3] = ENVI_GET_DATA(fid=data_fid_sd_47, dims=dims_data_sd_47, pos=[ii] )     
     ;for ii=0,247 do cub_sd[*,ii] = ENVI_GET_DATA(fid=data_fid_sd, dims=dims_data_sd, pos=[ii+3] )
path = path_fichiers_param+'param_slab_dust_040613_2/param_slab_dust_040613_2_em0.param'
      
      A = pdsread(path,  DIC='/home/fandrieu/Simu_IPAG/pro/LPG_PDS_LABEL.dic', /bsq)
      cub_sd_par_47 = A.core
      label_sd_47 = A.label
      wave_sd_47 = get_keyword(A.label, 'BAND_BIN_CENTER')


path_spectres = path_fichiers_param+'param_slab_dust_040613_3/param_slab_dust_040613_3_em0_V.cub'
     envi_open_file, path_spectres, r_fid=data_fid_sd_48
     envi_file_query, data_fid_sd_48, dims=dims_data_sd_48, wl=wl, nb=nb
     cub_sd_48=fltarr((dims_data_sd_48[2]+1)*(dims_data_sd_48[4]+1),nc)
     for ii=3,nc+2 do cub_sd_48[*,ii-3] = ENVI_GET_DATA(fid=data_fid_sd_48, dims=dims_data_sd_48, pos=[ii] )     
     ;for ii=0,248 do cub_sd[*,ii] = ENVI_GET_DATA(fid=data_fid_sd, dims=dims_data_sd, pos=[ii+3] )
path = path_fichiers_param+'param_slab_dust_040613_3/param_slab_dust_040613_3_em0.param'
      
      A = pdsread(path,  DIC='/home/fandrieu/Simu_IPAG/pro/LPG_PDS_LABEL.dic', /bsq)
      cub_sd_par_48 = A.core
      label_sd_48 = A.label
      wave_sd_48 = get_keyword(A.label, 'BAND_BIN_CENTER')


path_spectres = path_fichiers_param+'param_slab_dust_040613_4/param_slab_dust_040613_4_em0_V.cub'
     envi_open_file, path_spectres, r_fid=data_fid_sd_49
     envi_file_query, data_fid_sd_49, dims=dims_data_sd_49, wl=wl, nb=nb
     cub_sd_49=fltarr((dims_data_sd_49[2]+1)*(dims_data_sd_49[4]+1),nc)
     for ii=3,nc+2 do cub_sd_49[*,ii-3] = ENVI_GET_DATA(fid=data_fid_sd_49, dims=dims_data_sd_49, pos=[ii] )     
     ;for ii=0,249 do cub_sd[*,ii] = ENVI_GET_DATA(fid=data_fid_sd, dims=dims_data_sd, pos=[ii+3] )
path = path_fichiers_param+'param_slab_dust_040613_4/param_slab_dust_040613_4_em0.param'
      
      A = pdsread(path,  DIC='/home/fandrieu/Simu_IPAG/pro/LPG_PDS_LABEL.dic', /bsq)
      cub_sd_par_49 = A.core
      label_sd_49 = A.label
      wave_sd_49 = get_keyword(A.label, 'BAND_BIN_CENTER')


path_spectres = path_fichiers_param+'param_slab_dust_040613_5/param_slab_dust_040613_5_em0_V.cub'
     envi_open_file, path_spectres, r_fid=data_fid_sd_50
     envi_file_query, data_fid_sd_50, dims=dims_data_sd_50, wl=wl, nb=nb
     cub_sd_50=fltarr((dims_data_sd_50[2]+1)*(dims_data_sd_50[4]+1),nc)
     for ii=3,nc+2 do cub_sd_50[*,ii-3] = ENVI_GET_DATA(fid=data_fid_sd_50, dims=dims_data_sd_50, pos=[ii] )     
     ;for ii=0,250 do cub_sd[*,ii] = ENVI_GET_DATA(fid=data_fid_sd, dims=dims_data_sd, pos=[ii+3] )
path = path_fichiers_param+'param_slab_dust_040613_5/param_slab_dust_040613_5_em0.param'
      
      A = pdsread(path,  DIC='/home/fandrieu/Simu_IPAG/pro/LPG_PDS_LABEL.dic', /bsq)
      cub_sd_par_50 = A.core
      label_sd_50 = A.label
      wave_sd_50 = get_keyword(A.label, 'BAND_BIN_CENTER')


path_spectres = path_fichiers_param+'param_slab_dust_040613_6/param_slab_dust_040613_6_em0_V.cub'
     envi_open_file, path_spectres, r_fid=data_fid_sd_51
     envi_file_query, data_fid_sd_51, dims=dims_data_sd_51, wl=wl, nb=nb
     cub_sd_51=fltarr((dims_data_sd_51[2]+1)*(dims_data_sd_51[4]+1),nc)
     for ii=3,nc+2 do cub_sd_51[*,ii-3] = ENVI_GET_DATA(fid=data_fid_sd_51, dims=dims_data_sd_51, pos=[ii] )     
     ;for ii=0,251 do cub_sd[*,ii] = ENVI_GET_DATA(fid=data_fid_sd, dims=dims_data_sd, pos=[ii+3] )
path = path_fichiers_param+'param_slab_dust_040613_6/param_slab_dust_040613_6_em0.param'
      
      A = pdsread(path,  DIC='/home/fandrieu/Simu_IPAG/pro/LPG_PDS_LABEL.dic', /bsq)
      cub_sd_par_51 = A.core
      label_sd_51 = A.label
      wave_sd_51 = get_keyword(A.label, 'BAND_BIN_CENTER')


path_spectres = path_fichiers_param+'param_slab_dust_040613_7/param_slab_dust_040613_7_em0_V.cub'
     envi_open_file, path_spectres, r_fid=data_fid_sd_52
     envi_file_query, data_fid_sd_52, dims=dims_data_sd_52, wl=wl, nb=nb
     cub_sd_52=fltarr((dims_data_sd_52[2]+1)*(dims_data_sd_52[4]+1),nc)
     for ii=3,nc+2 do cub_sd_52[*,ii-3] = ENVI_GET_DATA(fid=data_fid_sd_52, dims=dims_data_sd_52, pos=[ii] )     
     ;for ii=0,252 do cub_sd[*,ii] = ENVI_GET_DATA(fid=data_fid_sd, dims=dims_data_sd, pos=[ii+3] )
path = path_fichiers_param+'param_slab_dust_040613_7/param_slab_dust_040613_7_em0.param'
      
      A = pdsread(path,  DIC='/home/fandrieu/Simu_IPAG/pro/LPG_PDS_LABEL.dic', /bsq)
      cub_sd_par_52 = A.core
      label_sd_52 = A.label
      wave_sd_52 = get_keyword(A.label, 'BAND_BIN_CENTER')


path_spectres = path_fichiers_param+'param_slab_dust_040613_8/param_slab_dust_040613_8_em0_V.cub'
     envi_open_file, path_spectres, r_fid=data_fid_sd_53
     envi_file_query, data_fid_sd_53, dims=dims_data_sd_53, wl=wl, nb=nb
     cub_sd_53=fltarr((dims_data_sd_53[2]+1)*(dims_data_sd_53[4]+1),nc)
     for ii=3,nc+2 do cub_sd_53[*,ii-3] = ENVI_GET_DATA(fid=data_fid_sd_53, dims=dims_data_sd_53, pos=[ii] )     
     ;for ii=0,253 do cub_sd[*,ii] = ENVI_GET_DATA(fid=data_fid_sd, dims=dims_data_sd, pos=[ii+3] )
path = path_fichiers_param+'param_slab_dust_040613_8/param_slab_dust_040613_8_em0.param'
      
      A = pdsread(path,  DIC='/home/fandrieu/Simu_IPAG/pro/LPG_PDS_LABEL.dic', /bsq)
      cub_sd_par_53 = A.core
      label_sd_53 = A.label
      wave_sd_53 = get_keyword(A.label, 'BAND_BIN_CENTER')

path_spectres = path_fichiers_param+'param_slab_dust_240414_1/param_slab_dust_240414_1_em0_V.cub'
     envi_open_file, path_spectres, r_fid=data_fid_sd_54
     envi_file_query, data_fid_sd_54, dims=dims_data_sd_54, wl=wl, nb=nb
     cub_sd_54=fltarr((dims_data_sd_54[2]+1)*(dims_data_sd_54[4]+1),nc)
     for ii=3,nc+2 do cub_sd_54[*,ii-3] = ENVI_GET_DATA(fid=data_fid_sd_54, dims=dims_data_sd_54, pos=[ii] )     
     ;for ii=0,253 do cub_sd[*,ii] = ENVI_GET_DATA(fid=data_fid_sd, dims=dims_data_sd, pos=[ii+3] )
path = path_fichiers_param+'param_slab_dust_240414_1/param_slab_dust_240414_1_em0.param'
      
      A = pdsread(path,  DIC='/home/fandrieu/Simu_IPAG/pro/LPG_PDS_LABEL.dic', /bsq)
      cub_sd_par_54 = A.core
      label_sd_54 = A.label
      wave_sd_54 = get_keyword(A.label, 'BAND_BIN_CENTER')


path_spectres = path_fichiers_param+'param_slab_dust_240414_2/param_slab_dust_240414_2_em0_V.cub'
     envi_open_file, path_spectres, r_fid=data_fid_sd_55
     envi_file_query, data_fid_sd_55, dims=dims_data_sd_55, wl=wl, nb=nb
     cub_sd_55=fltarr((dims_data_sd_55[2]+1)*(dims_data_sd_55[4]+1),nc)
     for ii=3,nc+2 do cub_sd_55[*,ii-3] = ENVI_GET_DATA(fid=data_fid_sd_55, dims=dims_data_sd_55, pos=[ii] )     
     ;for ii=0,253 do cub_sd[*,ii] = ENVI_GET_DATA(fid=data_fid_sd, dims=dims_data_sd, pos=[ii+3] )
path = path_fichiers_param+'param_slab_dust_240414_2/param_slab_dust_240414_2_em0.param'
      
      A = pdsread(path,  DIC='/home/fandrieu/Simu_IPAG/pro/LPG_PDS_LABEL.dic', /bsq)
      cub_sd_par_55 = A.core
      label_sd_55 = A.label
      wave_sd_55 = get_keyword(A.label, 'BAND_BIN_CENTER')


path_spectres = path_fichiers_param+'param_slab_dust_240414_3/param_slab_dust_240414_3_em0_V.cub'
     envi_open_file, path_spectres, r_fid=data_fid_sd_56
     envi_file_query, data_fid_sd_56, dims=dims_data_sd_56, wl=wl, nb=nb
     cub_sd_56=fltarr((dims_data_sd_56[2]+1)*(dims_data_sd_56[4]+1),nc)
     for ii=3,nc+2 do cub_sd_56[*,ii-3] = ENVI_GET_DATA(fid=data_fid_sd_56, dims=dims_data_sd_56, pos=[ii] )     
     ;for ii=0,253 do cub_sd[*,ii] = ENVI_GET_DATA(fid=data_fid_sd, dims=dims_data_sd, pos=[ii+3] )
path = path_fichiers_param+'param_slab_dust_240414_3/param_slab_dust_240414_3_em0.param'
      
      A = pdsread(path,  DIC='/home/fandrieu/Simu_IPAG/pro/LPG_PDS_LABEL.dic', /bsq)
      cub_sd_par_56 = A.core
      label_sd_56 = A.label
      wave_sd_56 = get_keyword(A.label, 'BAND_BIN_CENTER')

path_spectres = path_fichiers_param+'param_slab_dust_250414_1/param_slab_dust_250414_1_em0_V.cub'
     envi_open_file, path_spectres, r_fid=data_fid_sd_57
     envi_file_query, data_fid_sd_57, dims=dims_data_sd_57, wl=wl, nb=nb
     cub_sd_57=fltarr((dims_data_sd_57[2]+1)*(dims_data_sd_57[4]+1),nc)
     for ii=3,nc+2 do cub_sd_57[*,ii-3] = ENVI_GET_DATA(fid=data_fid_sd_57, dims=dims_data_sd_57, pos=[ii] )     
     ;for ii=0,253 do cub_sd[*,ii] = ENVI_GET_DATA(fid=data_fid_sd, dims=dims_data_sd, pos=[ii+3] )
path = path_fichiers_param+'param_slab_dust_250414_1/param_slab_dust_250414_1_em0.param'
      
      A = pdsread(path,  DIC='/home/fandrieu/Simu_IPAG/pro/LPG_PDS_LABEL.dic', /bsq)
      cub_sd_par_57 = A.core
      label_sd_57 = A.label
      wave_sd_57 = get_keyword(A.label, 'BAND_BIN_CENTER')


path_spectres = path_fichiers_param+'param_slab_dust_250414_2/param_slab_dust_250414_2_em0_V.cub'
     envi_open_file, path_spectres, r_fid=data_fid_sd_58
     envi_file_query, data_fid_sd_58, dims=dims_data_sd_58, wl=wl, nb=nb
     cub_sd_58=fltarr((dims_data_sd_58[2]+1)*(dims_data_sd_58[4]+1),nc)
     for ii=3,nc+2 do cub_sd_58[*,ii-3] = ENVI_GET_DATA(fid=data_fid_sd_58, dims=dims_data_sd_58, pos=[ii] )     
     ;for ii=0,253 do cub_sd[*,ii] = ENVI_GET_DATA(fid=data_fid_sd, dims=dims_data_sd, pos=[ii+3] )
path = path_fichiers_param+'param_slab_dust_250414_2/param_slab_dust_250414_2_em0.param'
      
      A = pdsread(path,  DIC='/home/fandrieu/Simu_IPAG/pro/LPG_PDS_LABEL.dic', /bsq)
      cub_sd_par_58 = A.core
      label_sd_58 = A.label
      wave_sd_58 = get_keyword(A.label, 'BAND_BIN_CENTER')


path_spectres = path_fichiers_param+'param_slab_dust_250414_3/param_slab_dust_250414_3_em0_V.cub'
     envi_open_file, path_spectres, r_fid=data_fid_sd_59
     envi_file_query, data_fid_sd_59, dims=dims_data_sd_59, wl=wl, nb=nb
     cub_sd_59=fltarr((dims_data_sd_59[2]+1)*(dims_data_sd_59[4]+1),nc)
     for ii=3,nc+2 do cub_sd_59[*,ii-3] = ENVI_GET_DATA(fid=data_fid_sd_59, dims=dims_data_sd_59, pos=[ii] )     
     ;for ii=0,253 do cub_sd[*,ii] = ENVI_GET_DATA(fid=data_fid_sd, dims=dims_data_sd, pos=[ii+3] )
path = path_fichiers_param+'param_slab_dust_250414_3/param_slab_dust_250414_3_em0.param'
      
      A = pdsread(path,  DIC='/home/fandrieu/Simu_IPAG/pro/LPG_PDS_LABEL.dic', /bsq)
      cub_sd_par_59 = A.core
      label_sd_59 = A.label
      wave_sd_59 = get_keyword(A.label, 'BAND_BIN_CENTER')


path_spectres = path_fichiers_param+'param_slab_dust_250414_4/param_slab_dust_250414_4_em0_V.cub'
     envi_open_file, path_spectres, r_fid=data_fid_sd_60
     envi_file_query, data_fid_sd_60, dims=dims_data_sd_60, wl=wl, nb=nb
     cub_sd_60=fltarr((dims_data_sd_60[2]+1)*(dims_data_sd_60[4]+1),nc)
     for ii=3,nc+2 do cub_sd_60[*,ii-3] = ENVI_GET_DATA(fid=data_fid_sd_60, dims=dims_data_sd_60, pos=[ii] )     
     ;for ii=0,253 do cub_sd[*,ii] = ENVI_GET_DATA(fid=data_fid_sd, dims=dims_data_sd, pos=[ii+3] )
path = path_fichiers_param+'param_slab_dust_250414_4/param_slab_dust_250414_4_em0.param'
      
      A = pdsread(path,  DIC='/home/fandrieu/Simu_IPAG/pro/LPG_PDS_LABEL.dic', /bsq)
      cub_sd_par_60 = A.core
      label_sd_60 = A.label
      wave_sd_60 = get_keyword(A.label, 'BAND_BIN_CENTER')


path_spectres = path_fichiers_param+'param_slab_dust_250414_5/param_slab_dust_250414_5_em0_V.cub'
     envi_open_file, path_spectres, r_fid=data_fid_sd_61
     envi_file_query, data_fid_sd_61, dims=dims_data_sd_61, wl=wl, nb=nb
     cub_sd_61=fltarr((dims_data_sd_61[2]+1)*(dims_data_sd_61[4]+1),nc)
     for ii=3,nc+2 do cub_sd_61[*,ii-3] = ENVI_GET_DATA(fid=data_fid_sd_61, dims=dims_data_sd_61, pos=[ii] )     
     ;for ii=0,253 do cub_sd[*,ii] = ENVI_GET_DATA(fid=data_fid_sd, dims=dims_data_sd, pos=[ii+3] )
path = path_fichiers_param+'param_slab_dust_250414_5/param_slab_dust_250414_5_em0.param'
      
      A = pdsread(path,  DIC='/home/fandrieu/Simu_IPAG/pro/LPG_PDS_LABEL.dic', /bsq)
      cub_sd_par_61 = A.core
      label_sd_61 = A.label
      wave_sd_61 = get_keyword(A.label, 'BAND_BIN_CENTER')

;inc_sd = cub_sd_par[*,*,2]
;emer_sd = cub_sd_par[*,*,0]
;azim_sd = cub_sd_par[*,*,1]
;hslab_sd = cub_sd_par[*,*,3]
;cslab_sd = cub_sd_par[*,*,4]
;fracH2Oslab_sd = cub_sd_par[*,*,5]*100
;fracH2Oslab_sd[ where((fracH2Oslab_sd -10.) lt 0.0001) ] =10.      
;grainsizeH2Oslab_sd = cub_sd_par[*,*,8]

np1=(dims_data_sd_1[2]+1)*(dims_data_sd_1[4]+1)
np2=(dims_data_sd_2[2]+1)*(dims_data_sd_2[4]+1)
np3=(dims_data_sd_3[2]+1)*(dims_data_sd_3[4]+1)
np4=(dims_data_sd_4[2]+1)*(dims_data_sd_4[4]+1)
np5=(dims_data_sd_5[2]+1)*(dims_data_sd_5[4]+1)
np6=(dims_data_sd_6[2]+1)*(dims_data_sd_6[4]+1)
np7=(dims_data_sd_7[2]+1)*(dims_data_sd_7[4]+1)
np8a=(dims_data_sd_8a[2]+1)*(dims_data_sd_8a[4]+1)
np8b=(dims_data_sd_8b[2]+1)*(dims_data_sd_8b[4]+1)
np8=np8a+np8b
np9a=(dims_data_sd_9a[2]+1)*(dims_data_sd_9a[4]+1)
np9b=(dims_data_sd_9b[2]+1)*(dims_data_sd_9b[4]+1)
np9=np9a+np9b
np10a=(dims_data_sd_10a[2]+1)*(dims_data_sd_10a[4]+1)
np10b=(dims_data_sd_10b[2]+1)*(dims_data_sd_10b[4]+1)
np10=np10a+np10b
np11a=(dims_data_sd_11a[2]+1)*(dims_data_sd_11a[4]+1)
np11b=(dims_data_sd_11b[2]+1)*(dims_data_sd_11b[4]+1)
np11=np11a+np11b
np12a=(dims_data_sd_12a[2]+1)*(dims_data_sd_12a[4]+1)
np12b=(dims_data_sd_12b[2]+1)*(dims_data_sd_12b[4]+1)
np12=np12a+np12b
np13a=(dims_data_sd_13a[2]+1)*(dims_data_sd_13a[4]+1)
np13b=(dims_data_sd_13b[2]+1)*(dims_data_sd_13b[4]+1)
np13=np13a+np13b
np14a=(dims_data_sd_14a[2]+1)*(dims_data_sd_14a[4]+1)
np14b=(dims_data_sd_14b[2]+1)*(dims_data_sd_14b[4]+1)
np14=np14a+np14b
np15a=(dims_data_sd_15a[2]+1)*(dims_data_sd_15a[4]+1)
np15b=(dims_data_sd_15b[2]+1)*(dims_data_sd_15b[4]+1)
np15=np15a+np15b
np16=(dims_data_sd_16[2]+1)*(dims_data_sd_16[4]+1)
np17=(dims_data_sd_17[2]+1)*(dims_data_sd_17[4]+1)
np18=(dims_data_sd_18[2]+1)*(dims_data_sd_18[4]+1)
np19=(dims_data_sd_19[2]+1)*(dims_data_sd_19[4]+1)
np20=(dims_data_sd_20[2]+1)*(dims_data_sd_20[4]+1)
np21=(dims_data_sd_21[2]+1)*(dims_data_sd_21[4]+1)
np22=(dims_data_sd_22[2]+1)*(dims_data_sd_22[4]+1)
np23=(dims_data_sd_23[2]+1)*(dims_data_sd_23[4]+1)
np24=(dims_data_sd_24[2]+1)*(dims_data_sd_24[4]+1)
np25=(dims_data_sd_25[2]+1)*(dims_data_sd_25[4]+1)
np26=(dims_data_sd_26[2]+1)*(dims_data_sd_26[4]+1)
np27=(dims_data_sd_27[2]+1)*(dims_data_sd_27[4]+1)
np28=(dims_data_sd_28[2]+1)*(dims_data_sd_28[4]+1)
np29=(dims_data_sd_29[2]+1)*(dims_data_sd_29[4]+1)
np30=(dims_data_sd_30[2]+1)*(dims_data_sd_30[4]+1)
np31=(dims_data_sd_31[2]+1)*(dims_data_sd_31[4]+1)
np32=(dims_data_sd_32[2]+1)*(dims_data_sd_32[4]+1)
np33=(dims_data_sd_33[2]+1)*(dims_data_sd_33[4]+1)
np34=(dims_data_sd_34[2]+1)*(dims_data_sd_34[4]+1)
np35=(dims_data_sd_35[2]+1)*(dims_data_sd_35[4]+1)
np36=(dims_data_sd_36[2]+1)*(dims_data_sd_36[4]+1)
np37=(dims_data_sd_37[2]+1)*(dims_data_sd_37[4]+1)
np38=(dims_data_sd_38[2]+1)*(dims_data_sd_38[4]+1)
np39=(dims_data_sd_39[2]+1)*(dims_data_sd_39[4]+1)
np40=(dims_data_sd_40[2]+1)*(dims_data_sd_40[4]+1)
np41=(dims_data_sd_41[2]+1)*(dims_data_sd_41[4]+1)
np42=(dims_data_sd_42[2]+1)*(dims_data_sd_42[4]+1)
np43=(dims_data_sd_43[2]+1)*(dims_data_sd_43[4]+1)
np44=(dims_data_sd_44[2]+1)*(dims_data_sd_44[4]+1)
np45=(dims_data_sd_45[2]+1)*(dims_data_sd_45[4]+1)
np46=(dims_data_sd_46[2]+1)*(dims_data_sd_46[4]+1)
np47=(dims_data_sd_47[2]+1)*(dims_data_sd_47[4]+1)
np48=(dims_data_sd_48[2]+1)*(dims_data_sd_48[4]+1)
np49=(dims_data_sd_49[2]+1)*(dims_data_sd_49[4]+1)
np50=(dims_data_sd_50[2]+1)*(dims_data_sd_50[4]+1)
np51=(dims_data_sd_51[2]+1)*(dims_data_sd_51[4]+1)
np52=(dims_data_sd_52[2]+1)*(dims_data_sd_52[4]+1)
np53=(dims_data_sd_53[2]+1)*(dims_data_sd_53[4]+1)
np54=(dims_data_sd_54[2]+1)*(dims_data_sd_54[4]+1)
np55=(dims_data_sd_55[2]+1)*(dims_data_sd_55[4]+1)
np56=(dims_data_sd_56[2]+1)*(dims_data_sd_56[4]+1)
np57=(dims_data_sd_57[2]+1)*(dims_data_sd_57[4]+1)
np58=(dims_data_sd_58[2]+1)*(dims_data_sd_58[4]+1)
np59=(dims_data_sd_59[2]+1)*(dims_data_sd_59[4]+1)
np60=(dims_data_sd_60[2]+1)*(dims_data_sd_60[4]+1)
np61=(dims_data_sd_61[2]+1)*(dims_data_sd_61[4]+1)
npix_sd = np1+np2+np3+np4+np5+np6+np7+np8+np9+np10+np11+np12+np13+np14+np15+np16+np17+np18+np19+np20+np21+np22+np23+np24+np25+np26+np27+np28+np29+$
np30+np31+np32+np33+np34+np35+np36+np37+np38+np39+np40+np41+np42+np43+np44+np45+np46+np47+np48+np49+np50+np51+np52+np53+np54+np55+np56+np57+np58+$
np59+np60+np61

nconf_sd=dims_data_sd_1[4]+dims_data_sd_2[4]+dims_data_sd_3[4]+dims_data_sd_4[4]+dims_data_sd_5[4]+dims_data_sd_6[4]+dims_data_sd_7[4]+$
dims_data_sd_8a[4]+dims_data_sd_9a[4]+dims_data_sd_10a[4]+dims_data_sd_11a[4]+dims_data_sd_12a[4]+dims_data_sd_13a[4]+dims_data_sd_14a[4]+$
dims_data_sd_15a[4]+dims_data_sd_16[4]+dims_data_sd_17[4]+dims_data_sd_18[4]+dims_data_sd_19[4]+dims_data_sd_20[4]+dims_data_sd_21[4]+$
dims_data_sd_22[4]+dims_data_sd_23[4]+dims_data_sd_24[4]+dims_data_sd_25[4]+dims_data_sd_26[4]+dims_data_sd_27[4]+dims_data_sd_28[4]+$
dims_data_sd_29[4]+dims_data_sd_30[4]+dims_data_sd_31[4]+dims_data_sd_32[4]+dims_data_sd_33[4]+dims_data_sd_34[4]+dims_data_sd_35[4]+$
dims_data_sd_36[4]+dims_data_sd_37[4]+dims_data_sd_38[4]+dims_data_sd_39[4]+dims_data_sd_40[4]+dims_data_sd_41[4]+dims_data_sd_42[4]+$
dims_data_sd_43[4]+dims_data_sd_44[4]+dims_data_sd_45[4]+dims_data_sd_46[4]+dims_data_sd_47[4]+dims_data_sd_48[4]+dims_data_sd_49[4]+$
dims_data_sd_50[4]+dims_data_sd_51[4]+dims_data_sd_52[4]+dims_data_sd_53[4]+dims_data_sd_54[4]+dims_data_sd_55[4]+dims_data_sd_56[4]+$
dims_data_sd_57[4]+dims_data_sd_58[4]+dims_data_sd_59[4]+dims_data_sd_60[4]+dims_data_sd_61[4]+61

cub_sd=fltarr(npix_sd,nc)
cub_sd[0:np1-1,*]=cub_sd_1
cub_sd[np1:np1+np2-1,*]=cub_sd_2
cub_sd[np1+np2:np1+np2+np3-1,*]=cub_sd_3
cub_sd[np1+np2+np3:np1+np2+np3+np4-1,*]=cub_sd_4
cub_sd[np1+np2+np3+np4:np1+np2+np3+np4+np5-1,*]=cub_sd_5
cub_sd[np1+np2+np3+np4+np5:np1+np2+np3+np4+np5+np6-1,*]=cub_sd_6
cub_sd[np1+np2+np3+np4+np5+np6:np1+np2+np3+np4+np5+np6+np7-1,*]=cub_sd_7
cub_sd[np1+np2+np3+np4+np5+np6+np7:np1+np2+np3+np4+np5+np6+np7+np8-1,*]=cub_sd_8
cub_sd[np1+np2+np3+np4+np5+np6+np7+np8:np1+np2+np3+np4+np5+np6+np7+np8+np9-1,*]=cub_sd_9
cub_sd[np1+np2+np3+np4+np5+np6+np7+np8+np9:np1+np2+np3+np4+np5+np6+np7+np8+np9+np10-1,*]=cub_sd_10
cub_sd[np1+np2+np3+np4+np5+np6+np7+np8+np9+np10:np1+np2+np3+np4+np5+np6+np7+np8+np9+np10+np11-1,*]=cub_sd_11
cub_sd[np1+np2+np3+np4+np5+np6+np7+np8+np9+np10+np11:np1+np2+np3+np4+np5+np6+np7+np8+np9+np10+np11+np12-1,*]=cub_sd_12
cub_sd[np1+np2+np3+np4+np5+np6+np7+np8+np9+np10+np11+np12:np1+np2+np3+np4+np5+np6+np7+np8+np9+np10+np11+np12+np13-1,*]=cub_sd_13
cub_sd[np1+np2+np3+np4+np5+np6+np7+np8+np9+np10+np11+np12+np13:np1+np2+np3+np4+np5+np6+np7+np8+np9+np10+np11+np12+np13+np14-1,*]=cub_sd_14
cub_sd[np1+np2+np3+np4+np5+np6+np7+np8+np9+np10+np11+np12+np13+np14:np1+np2+np3+np4+np5+np6+np7+np8+np9+np10+np11+np12+np13+np14+np15-1,*]=cub_sd_15
cub_sd[np1+np2+np3+np4+np5+np6+np7+np8+np9+np10+np11+np12+np13+np14+np15:np1+np2+np3+np4+np5+np6+np7+np8+np9+np10+np11+np12+np13+np14+np15+np16-1,*]=cub_sd_16
cub_sd[np1+np2+np3+np4+np5+np6+np7+np8+np9+np10+np11+np12+np13+np14+np15+np16:np1+np2+np3+np4+np5+np6+np7+np8+np9+np10+np11+np12+np13+np14+np15+np16+$
np17-1,*]=cub_sd_17
cub_sd[np1+np2+np3+np4+np5+np6+np7+np8+np9+np10+np11+np12+np13+np14+np15+np16+np17:np1+np2+np3+np4+np5+np6+np7+np8+np9+np10+np11+np12+np13+np14+np15+$
np16+np17+np18-1,*]=cub_sd_18
cub_sd[np1+np2+np3+np4+np5+np6+np7+np8+np9+np10+np11+np12+np13+np14+np15+np16+np17+np18:np1+np2+np3+np4+np5+np6+np7+np8+np9+np10+np11+np12+np13+np14+$
np15+np16+np17+np18+np19-1,*]=cub_sd_19
cub_sd[np1+np2+np3+np4+np5+np6+np7+np8+np9+np10+np11+np12+np13+np14+np15+np16+np17+np18+np19:np1+np2+np3+np4+np5+np6+np7+np8+np9+np10+np11+np12+np13+$
np14+np15+np16+np17+np18+np19+np20-1,*]=cub_sd_20
cub_sd[np1+np2+np3+np4+np5+np6+np7+np8+np9+np10+np11+np12+np13+np14+np15+np16+np17+np18+np19+np20:np1+np2+np3+np4+np5+np6+np7+np8+np9+np10+np11+np12+$
np13+np14+np15+np16+np17+np18+np19+np20+np21-1,*]=cub_sd_21
cub_sd[np1+np2+np3+np4+np5+np6+np7+np8+np9+np10+np11+np12+np13+np14+np15+np16+np17+np18+np19+np20+np21:np1+np2+np3+np4+np5+np6+np7+np8+np9+np10+np11+$
np12+np13+np14+np15+np16+np17+np18+np19+np20+np21+np22-1,*]=cub_sd_22
cub_sd[np1+np2+np3+np4+np5+np6+np7+np8+np9+np10+np11+np12+np13+np14+np15+np16+np17+np18+np19+np20+np21+np22:np1+np2+np3+np4+np5+np6+np7+np8+np9+np10+$
np11+np12+np13+np14+np15+np16+np17+np18+np19+np20+np21+np22+np23-1,*]=cub_sd_23
cub_sd[np1+np2+np3+np4+np5+np6+np7+np8+np9+np10+np11+np12+np13+np14+np15+np16+np17+np18+np19+np20+np21+np22+np23:np1+np2+np3+np4+np5+np6+np7+np8+np9+$
np10+np11+np12+np13+np14+np15+np16+np17+np18+np19+np20+np21+np22+np23+np24-1,*]=cub_sd_24
cub_sd[np1+np2+np3+np4+np5+np6+np7+np8+np9+np10+np11+np12+np13+np14+np15+np16+np17+np18+np19+np20+np21+np22+np23+np24:np1+np2+np3+np4+np5+np6+np7+np8+$
np9+np10+np11+np12+np13+np14+np15+np16+np17+np18+np19+np20+np21+np22+np23+np24+np25-1,*]=cub_sd_25
cub_sd[np1+np2+np3+np4+np5+np6+np7+np8+np9+np10+np11+np12+np13+np14+np15+np16+np17+np18+np19+np20+np21+np22+np23+np24+np25:np1+np2+np3+np4+np5+np6+np7+$
np8+np9+np10+np11+np12+np13+np14+np15+np16+np17+np18+np19+np20+np21+np22+np23+np24+np25+np26-1,*]=cub_sd_26
cub_sd[np1+np2+np3+np4+np5+np6+np7+np8+np9+np10+np11+np12+np13+np14+np15+np16+np17+np18+np19+np20+np21+np22+np23+np24+np25+np26:np1+np2+np3+np4+np5+np6+$
np7+np8+np9+np10+np11+np12+np13+np14+np15+np16+np17+np18+np19+np20+np21+np22+np23+np24+np25+np26+np27-1,*]=cub_sd_27
cub_sd[np1+np2+np3+np4+np5+np6+np7+np8+np9+np10+np11+np12+np13+np14+np15+np16+np17+np18+np19+np20+np21+np22+np23+np24+np25+np26+np27:np1+np2+np3+np4+np5+$
np6+np7+np8+np9+np10+np11+np12+np13+np14+np15+np16+np17+np18+np19+np20+np21+np22+np23+np24+np25+np26+np27+np28-1,*]=cub_sd_28
cub_sd[np1+np2+np3+np4+np5+np6+np7+np8+np9+np10+np11+np12+np13+np14+np15+np16+np17+np18+np19+np20+np21+np22+np23+np24+np25+np26+np27+np28:np1+np2+np3+$
np4+np5+np6+np7+np8+np9+np10+np11+np12+np13+np14+np15+np16+np17+np18+np19+np20+np21+np22+np23+np24+np25+np26+np27+np28+np29-1,*]=cub_sd_29
cub_sd[np1+np2+np3+np4+np5+np6+np7+np8+np9+np10+np11+np12+np13+np14+np15+np16+np17+np18+np19+np20+np21+np22+np23+np24+np25+np26+np27+np28+np29:np1+np2+$
np3+np4+np5+np6+np7+np8+np9+np10+np11+np12+np13+np14+np15+np16+np17+np18+np19+np20+np21+np22+np23+np24+np25+np26+np27+np28+np29+np30-1,*]=cub_sd_30
cub_sd[np1+np2+np3+np4+np5+np6+np7+np8+np9+np10+np11+np12+np13+np14+np15+np16+np17+np18+np19+np20+np21+np22+np23+np24+np25+np26+np27+np28+np29+np30:np1+$
np2+np3+np4+np5+np6+np7+np8+np9+np10+np11+np12+np13+np14+np15+np16+np17+np18+np19+np20+np21+np22+np23+np24+np25+np26+np27+np28+np29+np30+np31-1,*]=cub_sd_31
cub_sd[np1+np2+np3+np4+np5+np6+np7+np8+np9+np10+np11+np12+np13+np14+np15+np16+np17+np18+np19+np20+np21+np22+np23+np24+np25+np26+np27+np28+np29+np30+np31:np1+$
np2+np3+np4+np5+np6+np7+np8+np9+np10+np11+np12+np13+np14+np15+np16+np17+np18+np19+np20+np21+np22+np23+np24+np25+np26+np27+np28+np29+np30+np31+np32-1,*]=cub_sd_32
cub_sd[np1+np2+np3+np4+np5+np6+np7+np8+np9+np10+np11+np12+np13+np14+np15+np16+np17+np18+np19+np20+np21+np22+np23+np24+np25+np26+np27+np28+np29+np30+np31+np32:np1+$
np2+np3+np4+np5+np6+np7+np8+np9+np10+np11+np12+np13+np14+np15+np16+np17+np18+np19+np20+np21+np22+np23+np24+np25+np26+np27+np28+np29+np30+np31+np32+np33-1,*]=cub_sd_33
cub_sd[np1+np2+np3+np4+np5+np6+np7+np8+np9+np10+np11+np12+np13+np14+np15+np16+np17+np18+np19+np20+np21+np22+np23+np24+np25+np26+np27+np28+np29+np30+np31+np32+np33:np1+$
np2+np3+np4+np5+np6+np7+np8+np9+np10+np11+np12+np13+np14+np15+np16+np17+np18+np19+np20+np21+np22+np23+np24+np25+np26+np27+np28+np29+np30+np31+np32+np33+np34-1,*]=cub_sd_34
cub_sd[np1+np2+np3+np4+np5+np6+np7+np8+np9+np10+np11+np12+np13+np14+np15+np16+np17+np18+np19+np20+np21+np22+np23+np24+np25+np26+np27+np28+np29+np30+np31+np32+np33+np34:np1+$
np2+np3+np4+np5+np6+np7+np8+np9+np10+np11+np12+np13+np14+np15+np16+np17+np18+np19+np20+np21+np22+np23+np24+np25+np26+np27+np28+np29+np30+np31+np32+np33+np34+np35-1,*]=cub_sd_35
cub_sd[np1+np2+np3+np4+np5+np6+np7+np8+np9+np10+np11+np12+np13+np14+np15+np16+np17+np18+np19+np20+np21+np22+np23+np24+np25+np26+np27+np28+np29+np30+np31+np32+np33+np34+np35:np1+$
np2+np3+np4+np5+np6+np7+np8+np9+np10+np11+np12+np13+np14+np15+np16+np17+np18+np19+np20+np21+np22+np23+np24+np25+np26+np27+np28+np29+np30+np31+np32+np33+np34+np35+np36-1,*]=cub_sd_36
cub_sd[np1+np2+np3+np4+np5+np6+np7+np8+np9+np10+np11+np12+np13+np14+np15+np16+np17+np18+np19+np20+np21+np22+np23+np24+np25+np26+np27+np28+np29+np30+np31+np32+np33+np34+np35+np36:np1+$
np2+np3+np4+np5+np6+np7+np8+np9+np10+np11+np12+np13+np14+np15+np16+np17+np18+np19+np20+np21+np22+np23+np24+np25+np26+np27+np28+np29+np30+np31+np32+np33+np34+np35+np36+np37-1,*]=cub_sd_37
cub_sd[np1+np2+np3+np4+np5+np6+np7+np8+np9+np10+np11+np12+np13+np14+np15+np16+np17+np18+np19+np20+np21+np22+np23+np24+np25+np26+np27+np28+np29+np30+np31+np32+np33+np34+np35+np36+np37:np1+$
np2+np3+np4+np5+np6+np7+np8+np9+np10+np11+np12+np13+np14+np15+np16+np17+np18+np19+np20+np21+np22+np23+np24+np25+np26+np27+np28+np29+np30+np31+np32+np33+np34+np35+np36+np37+np38-1,*]=cub_sd_38
cub_sd[np1+np2+np3+np4+np5+np6+np7+np8+np9+np10+np11+np12+np13+np14+np15+np16+np17+np18+np19+np20+np21+np22+np23+np24+np25+np26+np27+np28+np29+np30+np31+np32+np33+np34+np35+np36+np37+np38:np1+$
np2+np3+np4+np5+np6+np7+np8+np9+np10+np11+np12+np13+np14+np15+np16+np17+np18+np19+np20+np21+np22+np23+np24+np25+np26+np27+np28+np29+np30+np31+np32+np33+np34+np35+np36+np37+np38+np39-1,*]=cub_sd_39
cub_sd[np1+np2+np3+np4+np5+np6+np7+np8+np9+np10+np11+np12+np13+np14+np15+np16+np17+np18+np19+np20+np21+np22+np23+np24+np25+np26+np27+np28+np29+np30+np31+np32+np33+np34+np35+np36+np37+np38+np39:np1+$
np2+np3+np4+np5+np6+np7+np8+np9+np10+np11+np12+np13+np14+np15+np16+np17+np18+np19+np20+np21+np22+np23+np24+np25+np26+np27+np28+np29+np30+np31+np32+np33+np34+np35+np36+np37+np38+np39+np40-1,*]=cub_sd_40
cub_sd[np1+np2+np3+np4+np5+np6+np7+np8+np9+np10+np11+np12+np13+np14+np15+np16+np17+np18+np19+np20+np21+np22+np23+np24+np25+np26+np27+np28+np29+np30+np31+np32+np33+np34+np35+np36+np37+np38+np39+np40:np1+$
np2+np3+np4+np5+np6+np7+np8+np9+np10+np11+np12+np13+np14+np15+np16+np17+np18+np19+np20+np21+np22+np23+np24+np25+np26+np27+np28+np29+np30+np31+np32+np33+np34+np35+np36+np37+np38+np39+np40+np41-1,*]=cub_sd_41
cub_sd[np1+np2+np3+np4+np5+np6+np7+np8+np9+np10+np11+np12+np13+np14+np15+np16+np17+np18+np19+np20+np21+np22+np23+np24+np25+np26+np27+np28+np29+np30+np31+np32+np33+np34+np35+np36+np37+np38+np39+np40+np41:np1+$
np2+np3+np4+np5+np6+np7+np8+np9+np10+np11+np12+np13+np14+np15+np16+np17+np18+np19+np20+np21+np22+np23+np24+np25+np26+np27+np28+np29+np30+np31+np32+np33+np34+np35+np36+np37+np38+np39+np40+np41+np42-1,*]=cub_sd_42
cub_sd[np1+np2+np3+np4+np5+np6+np7+np8+np9+np10+np11+np12+np13+np14+np15+np16+np17+np18+np19+np20+np21+np22+np23+np24+np25+np26+np27+np28+np29+np30+np31+np32+np33+np34+np35+np36+np37+np38+np39+np40+np41+np42:np1+$
np2+np3+np4+np5+np6+np7+np8+np9+np10+np11+np12+np13+np14+np15+np16+np17+np18+np19+np20+np21+np22+np23+np24+np25+np26+np27+np28+np29+np30+np31+np32+np33+np34+np35+np36+np37+np38+np39+np40+np41+np42+np43-1,*]=cub_sd_43
cub_sd[np1+np2+np3+np4+np5+np6+np7+np8+np9+np10+np11+np12+np13+np14+np15+np16+np17+np18+np19+np20+np21+np22+np23+np24+np25+np26+np27+np28+np29+np30+np31+np32+np33+np34+np35+np36+np37+np38+np39+np40+np41+np42+np43:np1+$
np2+np3+np4+np5+np6+np7+np8+np9+np10+np11+np12+np13+np14+np15+np16+np17+np18+np19+np20+np21+np22+np23+np24+np25+np26+np27+np28+np29+np30+np31+np32+np33+np34+np35+np36+np37+np38+np39+np40+np41+np42+np43+np44-1,*]=cub_sd_44
npstart=np1+np2+np3+np4+np5+np6+np7+np8+np9+np10+np11+np12+np13+np14+np15+np16+np17+np18+np19+np20+np21+np22+np23+np24+np25+np26+np27+np28+np29+np30+np31+np32+np33+np34+np35+np36+np37+np38+np39+np40+np41+np42+np43+np44
npstop=np1+np2+np3+np4+np5+np6+np7+np8+np9+np10+np11+np12+np13+np14+np15+np16+np17+np18+np19+np20+np21+np22+np23+np24+np25+np26+np27+np28+np29+np30+np31+np32+np33+np34+np35+np36+np37+np38+np39+np40+np41+np42+np43+np44+np45
cub_sd[npstart:npstop-1,*]=cub_sd_45
npstart=npstart+np45
npstop=npstop+np46
cub_sd[npstart:npstop-1,*]=cub_sd_46
npstart=npstart+np46
npstop=npstop+np47
cub_sd[npstart:npstop-1,*]=cub_sd_47
npstart=npstart+np47
npstop=npstop+np48
cub_sd[npstart:npstop-1,*]=cub_sd_48
npstart=npstart+np48
npstop=npstop+np49
cub_sd[npstart:npstop-1,*]=cub_sd_49
npstart=npstart+np49
npstop=npstop+np50
cub_sd[npstart:npstop-1,*]=cub_sd_50
npstart=npstart+np50
npstop=npstop+np51
cub_sd[npstart:npstop-1,*]=cub_sd_51
npstart=npstart+np51
npstop=npstop+np52
cub_sd[npstart:npstop-1,*]=cub_sd_52
npstart=npstart+np52
npstop=npstop+np53
cub_sd[npstart:npstop-1,*]=cub_sd_53
npstart=npstart+np53
npstop=npstop+np54
cub_sd[npstart:npstop-1,*]=cub_sd_54
npstart=npstart+np54
npstop=npstop+np55
cub_sd[npstart:npstop-1,*]=cub_sd_55
npstart=npstart+np55
npstop=npstop+np56
cub_sd[npstart:npstop-1,*]=cub_sd_56
npstart=npstart+np56
npstop=npstop+np57
cub_sd[npstart:npstop-1,*]=cub_sd_57
npstart=npstart+np57
npstop=npstop+np58
cub_sd[npstart:npstop-1,*]=cub_sd_58
npstart=npstart+np58
npstop=npstop+np59
cub_sd[npstart:npstop-1,*]=cub_sd_59
npstart=npstart+np59
npstop=npstop+np60
cub_sd[npstart:npstop-1,*]=cub_sd_60
npstart=npstart+np60
npstop=npstop+np61
cub_sd[npstart:npix_sd-1,*]=cub_sd_61

s_par_1=size(cub_sd_par_1)
s_par_2=size(cub_sd_par_2)
s_par_3=size(cub_sd_par_3)
s_par_4=size(cub_sd_par_4)
s_par_5=size(cub_sd_par_5)
s_par_6=size(cub_sd_par_6)
s_par_7=size(cub_sd_par_7)
s_par_8=size(cub_sd_par_8)
s_par_9=size(cub_sd_par_9)
s_par_10=size(cub_sd_par_10)
s_par_11=size(cub_sd_par_11)
s_par_12=size(cub_sd_par_12)
s_par_13=size(cub_sd_par_13)
s_par_14=size(cub_sd_par_14)
s_par_15=size(cub_sd_par_15)
s_par_16=size(cub_sd_par_16)
s_par_17=size(cub_sd_par_17)
s_par_18=size(cub_sd_par_18)
s_par_19=size(cub_sd_par_19)
s_par_20=size(cub_sd_par_20)
s_par_21=size(cub_sd_par_21)
s_par_22=size(cub_sd_par_22)
s_par_23=size(cub_sd_par_23)
s_par_24=size(cub_sd_par_24)
s_par_25=size(cub_sd_par_25)
s_par_26=size(cub_sd_par_26)
s_par_27=size(cub_sd_par_27)
s_par_28=size(cub_sd_par_28)
s_par_29=size(cub_sd_par_29)
s_par_30=size(cub_sd_par_30)
s_par_31=size(cub_sd_par_31)
s_par_32=size(cub_sd_par_32)
s_par_33=size(cub_sd_par_33)
s_par_34=size(cub_sd_par_34)
s_par_35=size(cub_sd_par_35)
s_par_36=size(cub_sd_par_36)
s_par_37=size(cub_sd_par_37)
s_par_38=size(cub_sd_par_38)
s_par_39=size(cub_sd_par_39)
s_par_40=size(cub_sd_par_40)
s_par_41=size(cub_sd_par_41)
s_par_42=size(cub_sd_par_42)
s_par_43=size(cub_sd_par_43)
s_par_44=size(cub_sd_par_44)
s_par_45=size(cub_sd_par_45)
s_par_46=size(cub_sd_par_46)
s_par_47=size(cub_sd_par_47)
s_par_48=size(cub_sd_par_48)
s_par_49=size(cub_sd_par_49)
s_par_50=size(cub_sd_par_50)
s_par_51=size(cub_sd_par_51)
s_par_52=size(cub_sd_par_52)
s_par_53=size(cub_sd_par_53)
s_par_54=size(cub_sd_par_54)
s_par_55=size(cub_sd_par_55)
s_par_56=size(cub_sd_par_56)
s_par_57=size(cub_sd_par_57)
s_par_58=size(cub_sd_par_58)
s_par_59=size(cub_sd_par_59)
s_par_60=size(cub_sd_par_60)
s_par_61=size(cub_sd_par_61)

s1=s_par_1[2]
s2=s_par_2[2]
s3=s_par_3[2]
s4=s_par_4[2]
s5=s_par_5[2]
s6=s_par_6[2]
s7=s_par_7[2]
s8=s_par_8[2]
s9=s_par_9[2]
s10=s_par_10[2]
s11=s_par_11[2]
s12=s_par_12[2]
s13=s_par_13[2]
s14=s_par_14[2]
s15=s_par_15[2]
s16=s_par_16[2]
s17=s_par_17[2]
s18=s_par_18[2]
s19=s_par_19[2]
s20=s_par_20[2]
s21=s_par_21[2]
s22=s_par_22[2]
s23=s_par_23[2]
s24=s_par_24[2]
s25=s_par_25[2]
s26=s_par_26[2]
s27=s_par_27[2]
s28=s_par_28[2]
s29=s_par_29[2]
s30=s_par_30[2]
s31=s_par_31[2]
s32=s_par_32[2]
s33=s_par_33[2]
s34=s_par_34[2]
s35=s_par_35[2]
s36=s_par_36[2]
s37=s_par_37[2]
s38=s_par_38[2]
s39=s_par_39[2]
s40=s_par_40[2]
s41=s_par_41[2]
s42=s_par_42[2]
s43=s_par_43[2]
s44=s_par_44[2]
s45=s_par_45[2]
s46=s_par_46[2]
s47=s_par_47[2]
s48=s_par_48[2]
s49=s_par_49[2]
s50=s_par_50[2]
s51=s_par_51[2]
s52=s_par_52[2]
s53=s_par_53[2]
s54=s_par_54[2]
s55=s_par_55[2]
s56=s_par_56[2]
s57=s_par_57[2]
s58=s_par_58[2]
s59=s_par_59[2]
s60=s_par_60[2]
s61=s_par_61[2]
spar1=s_par_1[1]
spar2=s1+s2+s3+s4+s5+s6+s7+s8+s9+s10+s11+s12+s13+s14+s15+s16+s17+s18+s19+s20+s21+s22+s23+s24+s25+s26+s27+s28+s29+s30+s31+s32+s33+s34+s35+s36+$
s37+s38+s39+s40+s41+s42+s43+s44+s45+s46+s47+s48+s49+s50+s51+s52+s53+s54+s55+s56+s57+s58+s59+s60+s61
spar3=s_par_1[3]

cub_sd_par=fltarr(spar1, spar2 , spar3)
cub_sd_par[*,0:s1-1,*]=cub_sd_par_1
cub_sd_par[*,s1:s1+s2-1,*]=cub_sd_par_2
cub_sd_par[*,s1+s2:s1+s2+s3-1,*]=cub_sd_par_3
cub_sd_par[*,s1+s2+s3:s1+s2+s3+s4-1,*]=cub_sd_par_4
cub_sd_par[*,s1+s2+s3+s4:s1+s2+s3+s4+s5-1,*]=cub_sd_par_5
cub_sd_par[*,s1+s2+s3+s4+s5:s1+s2+s3+s4+s5+s6-1,*]=cub_sd_par_6
cub_sd_par[*,s1+s2+s3+s4+s5+s6:s1+s2+s3+s4+s5+s6+s7-1,*]=cub_sd_par_7
cub_sd_par[*,s1+s2+s3+s4+s5+s6+s7:s1+s2+s3+s4+s5+s6+s7+s8-1,*]=cub_sd_par_8
cub_sd_par[*,s1+s2+s3+s4+s5+s6+s7+s8:s1+s2+s3+s4+s5+s6+s7+s8+s9-1,*]=cub_sd_par_9
cub_sd_par[*,s1+s2+s3+s4+s5+s6+s7+s8+s9:s1+s2+s3+s4+s5+s6+s7+s8+s9+s10-1,*]=cub_sd_par_10
cub_sd_par[*,s1+s2+s3+s4+s5+s6+s7+s8+s9+s10:s1+s2+s3+s4+s5+s6+s7+s8+s9+s10+s11-1,*]=cub_sd_par_11
cub_sd_par[*,s1+s2+s3+s4+s5+s6+s7+s8+s9+s10+s11:s1+s2+s3+s4+s5+s6+s7+s8+s9+s10+s11+s12-1,*]=cub_sd_par_12
cub_sd_par[*,s1+s2+s3+s4+s5+s6+s7+s8+s9+s10+s11+s12:s1+s2+s3+s4+s5+s6+s7+s8+s9+s10+s11+s12+s13-1,*]=cub_sd_par_13
cub_sd_par[*,s1+s2+s3+s4+s5+s6+s7+s8+s9+s10+s11+s12+s13:s1+s2+s3+s4+s5+s6+s7+s8+s9+s10+s11+s12+s13+s14-1,*]=cub_sd_par_14
cub_sd_par[*,s1+s2+s3+s4+s5+s6+s7+s8+s9+s10+s11+s12+s13+s14:s1+s2+s3+s4+s5+s6+s7+s8+s9+s10+s11+s12+s13+s14+s15-1,*]=cub_sd_par_15
cub_sd_par[*,s1+s2+s3+s4+s5+s6+s7+s8+s9+s10+s11+s12+s13+s14+s15:s1+s2+s3+s4+s5+s6+s7+s8+s9+s10+s11+s12+s13+s14+s15+s16-1,*]=cub_sd_par_16
cub_sd_par[*,s1+s2+s3+s4+s5+s6+s7+s8+s9+s10+s11+s12+s13+s14+s15+s16:s1+s2+s3+s4+s5+s6+s7+s8+s9+s10+s11+s12+s13+s14+s15+s16+s17-1,*]=cub_sd_par_17
cub_sd_par[*,s1+s2+s3+s4+s5+s6+s7+s8+s9+s10+s11+s12+s13+s14+s15+s16+s17:s1+s2+s3+s4+s5+s6+s7+s8+s9+s10+s11+s12+s13+s14+s15+s16+s17+s18-1,*]=cub_sd_par_18
cub_sd_par[*,s1+s2+s3+s4+s5+s6+s7+s8+s9+s10+s11+s12+s13+s14+s15+s16+s17+s18:s1+s2+s3+s4+s5+s6+s7+s8+s9+s10+s11+s12+s13+s14+s15+s16+s17+s18+s19-1,*]=cub_sd_par_19
cub_sd_par[*,s1+s2+s3+s4+s5+s6+s7+s8+s9+s10+s11+s12+s13+s14+s15+s16+s17+s18+s19:s1+s2+s3+s4+s5+s6+s7+s8+s9+s10+s11+s12+s13+s14+s15+s16+s17+s18+s19+s20-1,*]=cub_sd_par_20
cub_sd_par[*,s1+s2+s3+s4+s5+s6+s7+s8+s9+s10+s11+s12+s13+s14+s15+s16+s17+s18+s19+s20:s1+s2+s3+s4+s5+s6+s7+s8+s9+s10+s11+s12+s13+s14+s15+s16+s17+s18+s19+s20+s21-1,*]=cub_sd_par_21
cub_sd_par[*,s1+s2+s3+s4+s5+s6+s7+s8+s9+s10+s11+s12+s13+s14+s15+s16+s17+s18+s19+s20+s21:s1+s2+s3+s4+s5+s6+s7+s8+s9+s10+s11+s12+s13+s14+s15+s16+s17+s18+s19+s20+s21+$
s22-1,*]=cub_sd_par_22
cub_sd_par[*,s1+s2+s3+s4+s5+s6+s7+s8+s9+s10+s11+s12+s13+s14+s15+s16+s17+s18+s19+s20+s21+s22:s1+s2+s3+s4+s5+s6+s7+s8+s9+s10+s11+s12+s13+s14+s15+s16+s17+s18+s19+s20+$
s21+s22+s23-1,*]=cub_sd_par_23
cub_sd_par[*,s1+s2+s3+s4+s5+s6+s7+s8+s9+s10+s11+s12+s13+s14+s15+s16+s17+s18+s19+s20+s21+s22+s23:s1+s2+s3+s4+s5+s6+s7+s8+s9+s10+s11+s12+s13+s14+s15+s16+s17+s18+s19+$
s20+s21+s22+s23+s24-1,*]=cub_sd_par_24
cub_sd_par[*,s1+s2+s3+s4+s5+s6+s7+s8+s9+s10+s11+s12+s13+s14+s15+s16+s17+s18+s19+s20+s21+s22+s23+s24:s1+s2+s3+s4+s5+s6+s7+s8+s9+s10+s11+s12+s13+s14+s15+s16+s17+s18+$
s19+s20+s21+s22+s23+s24+s25-1,*]=cub_sd_par_25
cub_sd_par[*,s1+s2+s3+s4+s5+s6+s7+s8+s9+s10+s11+s12+s13+s14+s15+s16+s17+s18+s19+s20+s21+s22+s23+s24+s25:s1+s2+s3+s4+s5+s6+s7+s8+s9+s10+s11+s12+s13+s14+s15+s16+s17+$
s18+s19+s20+s21+s22+s23+s24+s25+s26-1,*]=cub_sd_par_26
cub_sd_par[*,s1+s2+s3+s4+s5+s6+s7+s8+s9+s10+s11+s12+s13+s14+s15+s16+s17+s18+s19+s20+s21+s22+s23+s24+s25+s26:s1+s2+s3+s4+s5+s6+s7+s8+s9+s10+s11+s12+s13+s14+s15+s16+$
s17+s18+s19+s20+s21+s22+s23+s24+s25+s26+s27-1,*]=cub_sd_par_27
cub_sd_par[*,s1+s2+s3+s4+s5+s6+s7+s8+s9+s10+s11+s12+s13+s14+s15+s16+s17+s18+s19+s20+s21+s22+s23+s24+s25+s26+s27:s1+s2+s3+s4+s5+s6+s7+s8+s9+s10+s11+s12+s13+s14+s15+$
s16+s17+s18+s19+s20+s21+s22+s23+s24+s25+s26+s27+s28-1,*]=cub_sd_par_28
cub_sd_par[*,s1+s2+s3+s4+s5+s6+s7+s8+s9+s10+s11+s12+s13+s14+s15+s16+s17+s18+s19+s20+s21+s22+s23+s24+s25+s26+s27+s28:s1+s2+s3+s4+s5+s6+s7+s8+s9+s10+s11+s12+s13+s14+$
s15+s16+s17+s18+s19+s20+s21+s22+s23+s24+s25+s26+s27+s28+s29-1,*]=cub_sd_par_29
cub_sd_par[*,s1+s2+s3+s4+s5+s6+s7+s8+s9+s10+s11+s12+s13+s14+s15+s16+s17+s18+s19+s20+s21+s22+s23+s24+s25+s26+s27+s28+s29:s1+s2+s3+s4+s5+s6+s7+s8+s9+s10+s11+s12+s13+$
s14+s15+s16+s17+s18+s19+s20+s21+s22+s23+s24+s25+s26+s27+s28+s29+s30-1,*]=cub_sd_par_30
cub_sd_par[*,s1+s2+s3+s4+s5+s6+s7+s8+s9+s10+s11+s12+s13+s14+s15+s16+s17+s18+s19+s20+s21+s22+s23+s24+s25+s26+s27+s28+s29+s30:s1+s2+s3+s4+s5+s6+s7+s8+s9+s10+s11+s12+$
s13+s14+s15+s16+s17+s18+s19+s20+s21+s22+s23+s24+s25+s26+s27+s28+s29+s30+s31-1,*]=cub_sd_par_31
cub_sd_par[*,s1+s2+s3+s4+s5+s6+s7+s8+s9+s10+s11+s12+s13+s14+s15+s16+s17+s18+s19+s20+s21+s22+s23+s24+s25+s26+s27+s28+s29+s30+s31:s1+s2+s3+s4+s5+s6+s7+s8+s9+s10+s11+$
s12+s13+s14+s15+s16+s17+s18+s19+s20+s21+s22+s23+s24+s25+s26+s27+s28+s29+s30+s31+s32-1,*]=cub_sd_par_32
cub_sd_par[*,s1+s2+s3+s4+s5+s6+s7+s8+s9+s10+s11+s12+s13+s14+s15+s16+s17+s18+s19+s20+s21+s22+s23+s24+s25+s26+s27+s28+s29+s30+s31+s32:s1+s2+s3+s4+s5+s6+s7+s8+s9+s10+$
s11+s12+s13+s14+s15+s16+s17+s18+s19+s20+s21+s22+s23+s24+s25+s26+s27+s28+s29+s30+s31+s32+s33-1,*]=cub_sd_par_33
cub_sd_par[*,s1+s2+s3+s4+s5+s6+s7+s8+s9+s10+s11+s12+s13+s14+s15+s16+s17+s18+s19+s20+s21+s22+s23+s24+s25+s26+s27+s28+s29+s30+s31+s32+s33:s1+s2+s3+s4+s5+s6+s7+s8+s9+$
s10+s11+s12+s13+s14+s15+s16+s17+s18+s19+s20+s21+s22+s23+s24+s25+s26+s27+s28+s29+s30+s31+s32+s33+s34-1,*]=cub_sd_par_34
cub_sd_par[*,s1+s2+s3+s4+s5+s6+s7+s8+s9+s10+s11+s12+s13+s14+s15+s16+s17+s18+s19+s20+s21+s22+s23+s24+s25+s26+s27+s28+s29+s30+s31+s32+s33+s34:s1+s2+s3+s4+s5+s6+s7+s8+$
s9+s10+s11+s12+s13+s14+s15+s16+s17+s18+s19+s20+s21+s22+s23+s24+s25+s26+s27+s28+s29+s30+s31+s32+s33+s34+s35-1,*]=cub_sd_par_35
cub_sd_par[*,s1+s2+s3+s4+s5+s6+s7+s8+s9+s10+s11+s12+s13+s14+s15+s16+s17+s18+s19+s20+s21+s22+s23+s24+s25+s26+s27+s28+s29+s30+s31+s32+s33+s34+s35:s1+s2+s3+s4+s5+s6+s7+$
s8+s9+s10+s11+s12+s13+s14+s15+s16+s17+s18+s19+s20+s21+s22+s23+s24+s25+s26+s27+s28+s29+s30+s31+s32+s33+s34+s35+s36-1,*]=cub_sd_par_36
cub_sd_par[*,s1+s2+s3+s4+s5+s6+s7+s8+s9+s10+s11+s12+s13+s14+s15+s16+s17+s18+s19+s20+s21+s22+s23+s24+s25+s26+s27+s28+s29+s30+s31+s32+s33+s34+s35+s36:s1+s2+s3+s4+s5+s6+$
s7+s8+s9+s10+s11+s12+s13+s14+s15+s16+s17+s18+s19+s20+s21+s22+s23+s24+s25+s26+s27+s28+s29+s30+s31+s32+s33+s34+s35+s36+s37-1,*]=cub_sd_par_37
cub_sd_par[*,s1+s2+s3+s4+s5+s6+s7+s8+s9+s10+s11+s12+s13+s14+s15+s16+s17+s18+s19+s20+s21+s22+s23+s24+s25+s26+s27+s28+s29+s30+s31+s32+s33+s34+s35+s36+s37:s1+s2+s3+s4+s5+$
s6+s7+s8+s9+s10+s11+s12+s13+s14+s15+s16+s17+s18+s19+s20+s21+s22+s23+s24+s25+s26+s27+s28+s29+s30+s31+s32+s33+s34+s35+s36+s37+s38-1,*]=cub_sd_par_38
cub_sd_par[*,s1+s2+s3+s4+s5+s6+s7+s8+s9+s10+s11+s12+s13+s14+s15+s16+s17+s18+s19+s20+s21+s22+s23+s24+s25+s26+s27+s28+s29+s30+s31+s32+s33+s34+s35+s36+s37+s38:s1+s2+s3+s4+$
s5+s6+s7+s8+s9+s10+s11+s12+s13+s14+s15+s16+s17+s18+s19+s20+s21+s22+s23+s24+s25+s26+s27+s28+s29+s30+s31+s32+s33+s34+s35+s36+s37+s38+s39-1,*]=cub_sd_par_39
cub_sd_par[*,s1+s2+s3+s4+s5+s6+s7+s8+s9+s10+s11+s12+s13+s14+s15+s16+s17+s18+s19+s20+s21+s22+s23+s24+s25+s26+s27+s28+s29+s30+s31+s32+s33+s34+s35+s36+s37+s38+s39:s1+s2+s3+$
s4+s5+s6+s7+s8+s9+s10+s11+s12+s13+s14+s15+s16+s17+s18+s19+s20+s21+s22+s23+s24+s25+s26+s27+s28+s29+s30+s31+s32+s33+s34+s35+s36+s37+s38+s39+s40-1,*]=cub_sd_par_40
cub_sd_par[*,s1+s2+s3+s4+s5+s6+s7+s8+s9+s10+s11+s12+s13+s14+s15+s16+s17+s18+s19+s20+s21+s22+s23+s24+s25+s26+s27+s28+s29+s30+s31+s32+s33+s34+s35+s36+s37+s38+s39+s40:s1+s2+$
s3+s4+s5+s6+s7+s8+s9+s10+s11+s12+s13+s14+s15+s16+s17+s18+s19+s20+s21+s22+s23+s24+s25+s26+s27+s28+s29+s30+s31+s32+s33+s34+s35+s36+s37+s38+s39+s40+s41-1,*]=cub_sd_par_41
cub_sd_par[*,s1+s2+s3+s4+s5+s6+s7+s8+s9+s10+s11+s12+s13+s14+s15+s16+s17+s18+s19+s20+s21+s22+s23+s24+s25+s26+s27+s28+s29+s30+s31+s32+s33+s34+s35+s36+s37+s38+s39+s40+s41:s1+$
s2+s3+s4+s5+s6+s7+s8+s9+s10+s11+s12+s13+s14+s15+s16+s17+s18+s19+s20+s21+s22+s23+s24+s25+s26+s27+s28+s29+s30+s31+s32+s33+s34+s35+s36+s37+s38+s39+s40+s41+s42-1,*]=cub_sd_par_42
cub_sd_par[*,s1+s2+s3+s4+s5+s6+s7+s8+s9+s10+s11+s12+s13+s14+s15+s16+s17+s18+s19+s20+s21+s22+s23+s24+s25+s26+s27+s28+s29+s30+s31+s32+s33+s34+s35+s36+s37+s38+s39+s40+s41+s42:s1+$
s2+s3+s4+s5+s6+s7+s8+s9+s10+s11+s12+s13+s14+s15+s16+s17+s18+s19+s20+s21+s22+s23+s24+s25+s26+s27+s28+s29+s30+s31+s32+s33+s34+s35+s36+s37+s38+s39+s40+s41+s42+s43-1,*]=cub_sd_par_43
cub_sd_par[*,s1+s2+s3+s4+s5+s6+s7+s8+s9+s10+s11+s12+s13+s14+s15+s16+s17+s18+s19+s20+s21+s22+s23+s24+s25+s26+s27+s28+s29+s30+s31+s32+s33+s34+s35+s36+s37+s38+s39+s40+s41+s42+s43:s1+$
s2+s3+s4+s5+s6+s7+s8+s9+s10+s11+s12+s13+s14+s15+s16+s17+s18+s19+s20+s21+s22+s23+s24+s25+s26+s27+s28+s29+s30+s31+s32+s33+s34+s35+s36+s37+s38+s39+s40+s41+s42+s43+s44-1,*]=cub_sd_par_44
start=s1+s2+s3+s4+s5+s6+s7+s8+s9+s10+s11+s12+s13+s14+s15+s16+s17+s18+s19+s20+s21+s22+s23+s24+s25+s26+s27+s28+s29+s30+s31+s32+s33+s34+s35+s36+s37+s38+s39+s40+s41+s42+s43+s44
stop=s1+s2+s3+s4+s5+s6+s7+s8+s9+s10+s11+s12+s13+s14+s15+s16+s17+s18+s19+s20+s21+s22+s23+s24+s25+s26+s27+s28+s29+s30+s31+s32+s33+s34+s35+s36+s37+s38+s39+s40+s41+s42+s43+s44+s45
cub_sd_par[*,start:stop-1,*]=cub_sd_par_45
start=start+s45
stop=stop+s46
cub_sd_par[*,start:stop-1,*]=cub_sd_par_46
start=start+s46
stop=stop+s47
cub_sd_par[*,start:stop-1,*]=cub_sd_par_47
start=start+s47
stop=stop+s48
cub_sd_par[*,start:stop-1,*]=cub_sd_par_48
start=start+s48
stop=stop+s49
cub_sd_par[*,start:stop-1,*]=cub_sd_par_49
start=start+s49
stop=stop+s50
cub_sd_par[*,start:stop-1,*]=cub_sd_par_50
start=start+s50
stop=stop+s51
cub_sd_par[*,start:stop-1,*]=cub_sd_par_51
start=start+s51
stop=stop+s52
cub_sd_par[*,start:stop-1,*]=cub_sd_par_52
start=start+s52
stop=stop+s53
cub_sd_par[*,start:stop-1,*]=cub_sd_par_53
start=start+s53
stop=stop+s54
cub_sd_par[*,start:stop-1,*]=cub_sd_par_54
start=start+s54
stop=stop+s55
cub_sd_par[*,start:stop-1,*]=cub_sd_par_55
start=start+s55
stop=stop+s56
cub_sd_par[*,start:stop-1,*]=cub_sd_par_56
start=start+s56
stop=stop+s57
cub_sd_par[*,start:stop-1,*]=cub_sd_par_57
start=start+s57
stop=stop+s58
cub_sd_par[*,start:stop-1,*]=cub_sd_par_58
start=start+s58
stop=stop+s59
cub_sd_par[*,start:stop-1,*]=cub_sd_par_59
start=start+s59
stop=stop+s60
cub_sd_par[*,start:stop-1,*]=cub_sd_par_60
start=start+s60
stop=stop+s61
cub_sd_par[*,start:spar2-1,*]=cub_sd_par_61
 
inc_sd = cub_sd_par[*,*,2]
emer_sd = cub_sd_par[*,*,0]
azim_sd = cub_sd_par[*,*,1]
hslab_sd = cub_sd_par[*,*,3]
cslab_sd = cub_sd_par[*,*,4]
fracH2Oslab_sd = cub_sd_par[*,*,5]*100.
;fracH2Oslab_sd[ where((fracH2Oslab_sd -10.) lt 0.0001) ] =10.      
grainsizeH2Oslab_sd = cub_sd_par[*,*,8]

Param_cube_sd=dblarr(dims_data_sd_1[2]+1,nconf_sd,7)

Param_cube_sd[*,*,0]=inc_sd
Param_cube_sd[*,*,1]=emer_sd
Param_cube_sd[*,*,2]=azim_sd
Param_cube_sd[*,*,3]=hslab_sd
Param_cube_sd[*,*,4]=cslab_sd
Param_cube_sd[*,*,5]=fracH2Oslab_sd
Param_cube_sd[*,*,6]=grainsizeH2Oslab_sd

 
save, cub_sd, filename=output_file
save, Param_cube_sd, npix_sd, nconf_sd, filename=output_file_param
print, "output parameter file : ", output_file_param
print, "output spectral file : ", output_file
print, 'execution time : ', systime(1)-t
Print, "npix : ",npix_sd, "n_conf : ", nconf_sd
print, "LUT dimensions : ", size(cub_sd)
print, "Param dimensions : ", size(param_cube_sd)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;; Fabrication et savegarde du cube "first step" pour l'inversion en deux étapes ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;wh=where(hslab_sd eq 5. or hslab_sd eq 50. or hslab_sd eq 100. or hslab_sd eq 150. or hslab_sd eq 200. or hslab_sd eq 250. or hslab_sd eq 300. $
;or hslab_sd eq 350. or hslab_sd eq 400. or hslab_sd eq 450. or hslab_sd eq 500. or hslab_sd eq 550. or hslab_sd eq 600. or hslab_sd eq 650. or $
;hslab_sd eq 700. or hslab_sd eq 750. or hslab_sd eq 800. or hslab_sd eq 850. or hslab_sd eq 900. or hslab_sd eq 950.)   
;
;wc=where(cslab_sd eq 0.9 or cslab_sd eq 0.99 or cslab_sd eq 0.999 or cslab_sd eq 0.9999 or cslab_sd eq 0.99999) 
;
;w_hct=[wh,wc]
;w_hct=w_hct(sort(w_hct))
;indices = where(w_hct eq shift(w_hct, -1), count)
;w_hc=w_hct[indices]
;
;
;npix_sd_first_step=n_elements(w_hc)
;nconf_sd_first_step=long(npix_sd_first_step/48.)
;Param_cube_sd_first_step=fltarr(48,nconf_sd_first_step,7)
;Param_cube_sd_first_step[*,*,0]=inc_sd[w_hc]
;Param_cube_sd_first_step[*,*,1]=emer_sd[w_hc]
;Param_cube_sd_first_step[*,*,2]=azim_sd[w_hc]
;Param_cube_sd_first_step[*,*,3]=hslab_sd[w_hc]
;Param_cube_sd_first_step[*,*,4]=cslab_sd[w_hc]
;Param_cube_sd_first_step[*,*,5]=fracH2Oslab_sd[w_hc]
;Param_cube_sd_first_step[*,*,6]=grainsizeH2Oslab_sd[w_hc]
;
;cub_sd_first_step=fltarr(npix_sd_first_step, nc)
;cub_sd_first_step=cub_sd[w_hc,*]
;
;output_file = '/home/fandrieu/Inversion/Simulations/Cube_sd_first_step.sav'
;output_file_param = '/home/fandrieu/Inversion/Simulations/Param_cube_sd_first_step.sav'
;save, cub_sd_first_step, filename=output_file
;save, Param_cube_sd_first_step, npix_sd_first_step, nconf_sd_first_step, filename=output_file_param
;print, "output parameter file : ", output_file_param
;print, "output spectral file : ", output_file
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



end