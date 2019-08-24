pro test_integration_specul

cd, '/home/fandrieu/Simu_IPAG/pro/'
resolve_routine, 'colorbar'
cd, '/home/fandrieu'

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;  i=50°  ;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;; IINTEGRATION TESTS ;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;  rough=0.2°  ;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;rough=0.2 emer entre i-3° et i+3° azim entre 177° et 180° ouverture source 0.2° ouverture observateur 4.2° (spectro IPAG) (res azim : 1°, 1 point integration)
;path_spectres = '/home/fandrieu/Inversion/Simulations/specul_slab_1114_2d_test_1/specul_slab_1114_2d_test_em0_C.cub'
;        envi_open_file, path_spectres, r_fid=data_fid_gs_1
;        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
;        cub_10nm_1    =fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
;        for ii=0,nb-1 do cub_10nm_1[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
;         
;npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
; path = '/home/fandrieu/Inversion/Simulations/specul_slab_1114_2d_test_1/specul_slab_1114_2d_test_em0.param'
;      
;      A = pdsread(path,  /bsq)
;      param_cub = A.core
;      label_gs_1 = A.label
;      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 
;
;
;;rough=0.2 emer entre i-3° et i+3° azim entre 177° et 180° ouverture source 0.2° ouverture observateur 4.2° (spectro IPAG) (res azim : 1°, 3*3 points integration)
;path_spectres = '/home/fandrieu/Inversion/Simulations/specul_slab_1114_2d_test_3/specul_slab_1114_2d_test_em0_C.cub'
;        envi_open_file, path_spectres, r_fid=data_fid_gs_1
;        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
;        cub_10nm_2=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
;        for ii=0,nb-1 do cub_10nm_2[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
;         
;npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
; path = '/home/fandrieu/Inversion/Simulations/specul_slab_1114_2d_test_3/specul_slab_1114_2d_test_em0.param'
;      
;      A = pdsread(path,  /bsq)
;      param_cub = A.core
;      label_gs_1 = A.label
;      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 
;
;
;;rough=0.2 emer entre i-3° et i+3° azim entre 177° et 180° ouverture source 0.2° ouverture observateur 4.2° (spectro IPAG) (res azim : 1°, 5*5 points integration)
;path_spectres = '/home/fandrieu/Inversion/Simulations/specul_slab_1114_2d_test_5/specul_slab_1114_2d_test_em0_C.cub'
;        envi_open_file, path_spectres, r_fid=data_fid_gs_1
;        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
;        cub_10nm_3=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
;        for ii=0,nb-1 do cub_10nm_3[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
;         
;npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
; path = '/home/fandrieu/Inversion/Simulations/specul_slab_1114_2d_test_5/specul_slab_1114_2d_test_em0.param'
;      
;      A = pdsread(path,  /bsq)
;      param_cub = A.core
;      label_gs_1 = A.label
;      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 
;
;
;;rough=0.2 emer entre i-3° et i+3° azim entre 177° et 180° ouverture source 0.2° ouverture observateur 4.2° (spectro IPAG) (res azim : 1°, 7*7 points integration)
;path_spectres = '/home/fandrieu/Inversion/Simulations/specul_slab_1114_2d_test_7/specul_slab_1114_2d_test_em0_C.cub'
;        envi_open_file, path_spectres, r_fid=data_fid_gs_1
;        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
;        cub_10nm_4=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
;        for ii=0,nb-1 do cub_10nm_4[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
;         
;npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
; path = '/home/fandrieu/Inversion/Simulations/specul_slab_1114_2d_test_7/specul_slab_1114_2d_test_em0.param'
;      
;      A = pdsread(path,  /bsq)
;      param_cub = A.core
;      label_gs_1 = A.label
;      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 
;
;
;
;;rough=0.2 emer entre i-3° et i+3° azim entre 177° et 180° ouverture source 0.2° ouverture observateur 4.2° (spectro IPAG) (res azim : 1°, 11*11 points integration)
;path_spectres = '/home/fandrieu/Inversion/Simulations/specul_slab_1114_2d_test_11/specul_slab_1114_2d_test_em0_C.cub'
;        envi_open_file, path_spectres, r_fid=data_fid_gs_1
;        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
;        cub_10nm_5=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
;        for ii=0,nb-1 do cub_10nm_5[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
;         
;npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
; path = '/home/fandrieu/Inversion/Simulations/specul_slab_1114_2d_test_11/specul_slab_1114_2d_test_em0.param'
;      
;      A = pdsread(path,  /bsq)
;      param_cub = A.core
;      label_gs_1 = A.label
;      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 
;
;
;;rough=0.2 emer entre i-3° et i+3° azim entre 177° et 180° ouverture source 0.2° ouverture observateur 4.2° (spectro IPAG) (res azim : 1°, 15*15 points integration)
;path_spectres = '/home/fandrieu/Inversion/Simulations/specul_slab_1114_2d_test_15/specul_slab_1114_2d_test_em0_C.cub'
;        envi_open_file, path_spectres, r_fid=data_fid_gs_1
;        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
;        cub_10nm_6=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
;        for ii=0,nb-1 do cub_10nm_6[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
;         
;npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
; path = '/home/fandrieu/Inversion/Simulations/specul_slab_1114_2d_test_15/specul_slab_1114_2d_test_em0.param'
;      
;      A = pdsread(path,  /bsq)
;      param_cub = A.core
;      label_gs_1 = A.label
;      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 
;
;
;;rough=0.2 emer entre i-3° et i+3° azim entre 177° et 180° ouverture source 0.2° ouverture observateur 4.2° (spectro IPAG) (res azim : 1°, 21*21 points integration)
;path_spectres = '/home/fandrieu/Inversion/Simulations/specul_slab_1114_2d_test_21/specul_slab_1114_2d_test_em0_C.cub'
;        envi_open_file, path_spectres, r_fid=data_fid_gs_1
;        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
;        cub_10nm_7=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
;        for ii=0,nb-1 do cub_10nm_7[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
;         
;npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
; path = '/home/fandrieu/Inversion/Simulations/specul_slab_1114_2d_test_21/specul_slab_1114_2d_test_em0.param'
;      
;      A = pdsread(path,  /bsq)
;      param_cub = A.core
;      label_gs_1 = A.label
;      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 
;
;
;
;;rough=0.2 emer entre i-3° et i+3° azim entre 177° et 180° ouverture source 0.2° ouverture observateur 4.2° (spectro IPAG) (res azim : 1°, 51*51 poits integration)
;path_spectres = '/home/fandrieu/Inversion/Simulations/specul_slab_1114_2d_test_51/specul_slab_1114_2d_test_em0_C.cub'
;        envi_open_file, path_spectres, r_fid=data_fid_gs_1
;        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
;        cub_10nm_8=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
;        for ii=0,nb-1 do cub_10nm_8[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
;         
;npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
; path = '/home/fandrieu/Inversion/Simulations/specul_slab_1114_2d_test_51/specul_slab_1114_2d_test_em0.param'
;      
;      A = pdsread(path,  /bsq)
;      param_cub = A.core
;      label_gs_1 = A.label
;      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;  rough=0.1°  ;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;rough=0.2 emer entre i-3° et i+3° azim entre 177° et 180° ouverture source 0.2° ouverture observateur 4.2° (spectro IPAG) (res azim : 1°, 1 point integration)
path_spectres = '/home/fandrieu/Inversion/Simulations/specul_slab_1114_2d_test_0.1_1/specul_slab_1114_2d_test_0.1_em0_C.cub'
        envi_open_file, path_spectres, r_fid=data_fid_gs_1
        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
        cub_10nm_1    =fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
        for ii=0,nb-1 do cub_10nm_1[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
         
npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
 path = '/home/fandrieu/Inversion/Simulations/specul_slab_1114_2d_test_0.1_1/specul_slab_1114_2d_test_0.1_em0.param'
      
      A = pdsread(path,  /bsq)
      param_cub = A.core
      label_gs_1 = A.label
      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 


;rough=0.2 emer entre i-3° et i+3° azim entre 177° et 180° ouverture source 0.2° ouverture observateur 4.2° (spectro IPAG) (res azim : 1°, 3*3 points integration)
path_spectres = '/home/fandrieu/Inversion/Simulations/specul_slab_1114_2d_test_0.1_3/specul_slab_1114_2d_test_0.1_em0_C.cub'
        envi_open_file, path_spectres, r_fid=data_fid_gs_1
        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
        cub_10nm_2=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
        for ii=0,nb-1 do cub_10nm_2[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
         
npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
 path = '/home/fandrieu/Inversion/Simulations/specul_slab_1114_2d_test_0.1_3/specul_slab_1114_2d_test_0.1_em0.param'
      
      A = pdsread(path,  /bsq)
      param_cub = A.core
      label_gs_1 = A.label
      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 


;rough=0.2 emer entre i-3° et i+3° azim entre 177° et 180° ouverture source 0.2° ouverture observateur 4.2° (spectro IPAG) (res azim : 1°, 5*5 points integration)
path_spectres = '/home/fandrieu/Inversion/Simulations/specul_slab_1114_2d_test_0.1_5/specul_slab_1114_2d_test_0.1_em0_C.cub'
        envi_open_file, path_spectres, r_fid=data_fid_gs_1
        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
        cub_10nm_3=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
        for ii=0,nb-1 do cub_10nm_3[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
         
npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
 path = '/home/fandrieu/Inversion/Simulations/specul_slab_1114_2d_test_0.1_5/specul_slab_1114_2d_test_0.1_em0.param'
      
      A = pdsread(path,  /bsq)
      param_cub = A.core
      label_gs_1 = A.label
      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 


;rough=0.2 emer entre i-3° et i+3° azim entre 177° et 180° ouverture source 0.2° ouverture observateur 4.2° (spectro IPAG) (res azim : 1°, 7*7 points integration)
path_spectres = '/home/fandrieu/Inversion/Simulations/specul_slab_1114_2d_test_0.1_7/specul_slab_1114_2d_test_0.1_em0_C.cub'
        envi_open_file, path_spectres, r_fid=data_fid_gs_1
        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
        cub_10nm_4=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
        for ii=0,nb-1 do cub_10nm_4[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
         
npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
 path = '/home/fandrieu/Inversion/Simulations/specul_slab_1114_2d_test_0.1_7/specul_slab_1114_2d_test_0.1_em0.param'
      
      A = pdsread(path,  /bsq)
      param_cub = A.core
      label_gs_1 = A.label
      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 



;rough=0.2 emer entre i-3° et i+3° azim entre 177° et 180° ouverture source 0.2° ouverture observateur 4.2° (spectro IPAG) (res azim : 1°, 11*11 points integration)
path_spectres = '/home/fandrieu/Inversion/Simulations/specul_slab_1114_2d_test_0.1_11/specul_slab_1114_2d_test_0.1_em0_C.cub'
        envi_open_file, path_spectres, r_fid=data_fid_gs_1
        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
        cub_10nm_5=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
        for ii=0,nb-1 do cub_10nm_5[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
         
npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
 path = '/home/fandrieu/Inversion/Simulations/specul_slab_1114_2d_test_0.1_11/specul_slab_1114_2d_test_0.1_em0.param'
      
      A = pdsread(path,  /bsq)
      param_cub = A.core
      label_gs_1 = A.label
      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 


;rough=0.2 emer entre i-3° et i+3° azim entre 177° et 180° ouverture source 0.2° ouverture observateur 4.2° (spectro IPAG) (res azim : 1°, 15*15 points integration)
path_spectres = '/home/fandrieu/Inversion/Simulations/specul_slab_1114_2d_test_0.1_15/specul_slab_1114_2d_test_0.1_em0_C.cub'
        envi_open_file, path_spectres, r_fid=data_fid_gs_1
        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
        cub_10nm_6=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
        for ii=0,nb-1 do cub_10nm_6[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
         
npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
 path = '/home/fandrieu/Inversion/Simulations/specul_slab_1114_2d_test_0.1_15/specul_slab_1114_2d_test_0.1_em0.param'
      
      A = pdsread(path,  /bsq)
      param_cub = A.core
      label_gs_1 = A.label
      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 


;rough=0.2 emer entre i-3° et i+3° azim entre 177° et 180° ouverture source 0.2° ouverture observateur 4.2° (spectro IPAG) (res azim : 1°, 21*21 points integration)
path_spectres = '/home/fandrieu/Inversion/Simulations/specul_slab_1114_2d_test_0.1_21/specul_slab_1114_2d_test_0.1_em0_C.cub'
        envi_open_file, path_spectres, r_fid=data_fid_gs_1
        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
        cub_10nm_7=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
        for ii=0,nb-1 do cub_10nm_7[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
         
npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
 path = '/home/fandrieu/Inversion/Simulations/specul_slab_1114_2d_test_0.1_21/specul_slab_1114_2d_test_0.1_em0.param'
      
      A = pdsread(path,  /bsq)
      param_cub = A.core
      label_gs_1 = A.label
      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 



;rough=0.2 emer entre i-3° et i+3° azim entre 177° et 180° ouverture source 0.2° ouverture observateur 4.2° (spectro IPAG) (res azim : 1°, 51*51 poits integration)
path_spectres = '/home/fandrieu/Inversion/Simulations/specul_slab_1114_2d_test_0.1_51/specul_slab_1114_2d_test_0.1_em0_C.cub'
        envi_open_file, path_spectres, r_fid=data_fid_gs_1
        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
        cub_10nm_8=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
        for ii=0,nb-1 do cub_10nm_8[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
         
npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
 path = '/home/fandrieu/Inversion/Simulations/specul_slab_1114_2d_test_0.1_51/specul_slab_1114_2d_test_0.1_em0.param'
      
      A = pdsread(path,  /bsq)
      param_cub = A.core
      label_gs_1 = A.label
      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

tit=['1 integration point per pixel', '3x3 integration points per pixel', '5x5 integration points per pixel', $
'7x7 integration points per pixel', '11x11 integration points per pixel', '15x15 integration points per pixel', $
'21x21 integration points per pixel', '51x51 integration points per pixel']

cub=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb,8)
cub[*,*,0]=cub_10nm_1
cub[*,*,1]=0.cub_10nm_2
cub[*,*,2]=0.cub_10nm_3
cub[*,*,3]=cub_10nm_4
cub[*,*,4]=cub_10nm_5
cub[*,*,5]=cub_10nm_6
cub[*,*,6]=cub_10nm_7
cub[*,*,7]=cub_10nm_8

inc=50.
num_wave=30
n_geom=dims_data_gs_1[2]+1
n_par=dims_data_gs_1[4]+1
param_cub_simu=param_cub
param_cub=reform(param_cub, n_geom*n_par,3)

range=[min(cub[*,num_wave,*]), max(cub[*,num_wave,*])]
range[1]=range[1]+0.001*(range[1]-range[0])

!p.multi=[0,3,3]
window,0, xsize=1300, ysize=900
;square
nsym=4
x=3.85
y=2.65
sx=[-x,-x,x,x]
sy=[-y,y,y,-y]
device,  decomposed=0
LOADCT,39 
erase,255
!P.BACKGROUND=255
!P.COLOR=0
!P.Font=1
USERSYM, sx, sy, THICK=1, /FILL

x0=[0., 0.3, 0.65, 0., 0.3, 0.65, 0.1, 0.55 ]
x0=x0+0.1
x1=x0+0.22
y1=[0.9, 0.9, 0.9, 0.6, 0.6, 0.6, 0.3, 0.3]
y1=y1-0.02
y0=y1-0.22
;stretch, 0,255,0.8
for dudu=0,7 do begin


cub_simu=fltarr(n_geom,n_par,nb)
dada=cub[*,*,dudu]
cub_simu=reform(dada, n_geom,n_par,nb)
;param_cub_simu[*,*,0]=emergence
;param_cub_simu[*,*,1]=azimut
;param_cub_simu[*,*,2]=epaisseur (5mm ou 10mmm)
gg=  where(param_cub_simu[*,*,2] eq 5.); and param_cub_simu[*,*,1] eq 5.)
d=fltarr(n_elements(gg))
d[0:n_elements(gg)-1]=dada[gg,num_wave]
e=fltarr(n_elements(gg))
e[0:n_elements(gg)-1]=param_cub[gg,0]
az=fltarr(n_elements(gg))
az[0:n_elements(gg)-1]=param_cub[gg,1]
;plot, e,d, psym=1, symsize=0.4;, xrange=[39.,41.]
;oplot, e,d, psym=1, symsize=0.4, color=250





;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;; X ;;;;;;;;;;;;;

plot, e[gg], az[gg], psym=3, POSITION=[x0[dudu], y0[dudu], x1[dudu], y1[dudu]] , xrange=[inc-3.2, inc+3.], xstyle =1, yrange=[176.8, 183.0], ystyle =1, charsize=2, charthick=2,$ POSITION=[0.17, 0.1, 0.95, 0.75],
xtitle='Incidence angle  ('+string(176B)+ ')', ytitle='Azimuth angle ('+string(176B)+ ')', xthick=4, ythick=4, xtickformat='(f5.1)', ytickformat='(f5.1)',$
title=tit[dudu]
for i=0,n_elements(gg)-1 do oplot, [0,e[gg[i]]], [0,az[gg[i]]], color=(d[gg[i]]-min(range))/(max(range)-min(range))*255., psym=8, symsize=1
for i=0,n_elements(gg)-1 do oplot, [0,e[gg[i]]], [0,360.-az[gg[i]]], color=(d[gg[i]]-min(range))/(max(range)-min(range))*255., psym=8, symsize=1
;;COLORBAR, POSITION=[0.17, 0.85, 0.95, 0.90] , TITLE='Reflectance', maxrange=max(range), minrange=min(range), format='(f11.2)', charsize=1, charthick=1
;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;; Z ;;;;;;;;;;;;;
;set_plot, 'z'
;device, set_resolution=[1325,1600], SET_FONT='Times',decomposed=0, z_buffering=1, set_pixel_depth=24;,set_color=256
;;device,  decomposed=0
;LOADCT,39 
;erase,255
;!P.BACKGROUND=255
;!P.COLOR=0
;!P.Font=1
;;;circle
;;nsym=25
;;;sx=fltarr(nsym)
;;;sy=fltarr(nsym)
;;;gru = FINDGEN(nsym) * (!PI*2/(nsym-1))
;;;for i =0,nsym-1 do begin
;;;  sx[i]=cos(gru[i])
;;;  sy[i]=sin(gru[i])
;;;endfor
;;square
;nsym=4
;sx=[-0.5,-0.5,0.5,0.5]
;sy=[-0.5,0.5,0.5,-0.5]
;USERSYM, sx, sy, THICK=1, /FILL
;plot, e[gg], az[gg], psym=3, xrange=[i-3.2, i+3.], xstyle =1, yrange=[176.8, 183.0], ystyle =1, POSITION=[0.17, 0.1, 0.95, 0.75], charsize=4, charthick=4,$
;xtitle='Incidence angle  ('+string(176B)+ ')', ytitle='Azimuth angle ('+string(176B)+ ')', xthick=4, ythick=4, xtickformat='(f5.1)', ytickformat='(f5.1)'
;for i=0,n_elements(gg)-1 do oplot, [0,e[gg[i]]], [0,az[gg[i]]], color=(d[gg[i]]-min(d[gg]))/max(d[gg]-min(d[gg]))*255., psym=8, symsize=4.5
;for i=0,n_elements(gg)-1 do oplot, [0,e[gg[i]]], [0,360.-az[gg[i]]], color=(d[gg[i]]-min(d[gg]))/max(d[gg]-min(d[gg]))*255., psym=8, symsize=4.5
;range=[min(d[gg]), max(d[gg])]
;COLORBAR, POSITION=[0.17, 0.85, 0.95, 0.90] , TITLE='Reflectance', maxrange=max(range), minrange=min(range), format='(f6.2)', charsize=4, charthick=4
;
;
;plot_file='/home/fandrieu/Inversion/Spectres_eau_IPAG/plot_specul_rough0.2_i50_spec_ipag_2.png'
;t=tvrd(true=1)
;write_png, plot_file, t
;device, /close
;set_plot, 'X'
;cub_simu=reform(cub_10nm, n_geom,n_par,nb)

;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;


endfor
COLORBAR, POSITION=[0.1, 0.94, 0.95, 0.97] , TITLE='!1 Reflectance around specular geometry for '+'!9q'+'!1 =0.1'+string(176B), $
maxrange=max(range), minrange=min(range), format='(f5.1)', charsize=2, charthick=2
;
;theta0=50.*!pi/180.
;;theta=51.*!pi/180.
;;phi=!pi
;beta=acos( ( sin(theta0)*sin(theta)*cos(phi)-cos(theta0)*cos(theta) )/( (sin(theta0))^2-(cos(theta0))^2 ) )*180./!pi
;di=0.00349/2.
;de=0.0733/2.
;i=50*!pi/180.
;e=47*!pi/180.
;psi=177*!pi/180.
;n1=1
;n2=0
;betaa=fltarr(9)
;phi=fltarr(9)
;prod=fltarr(9)
;for n1=-1,1 do for n2= -1,1 do betaa[(n1+1)*3+n2+1]=acos( cos(e+n1*de)*cos(i) - sin(i)*sin(e+n1*de)*cos(psi+n2*de) )
;for n1=-1,1 do for n2= -1,1 do phi[(n1+1)*3+n2+1]=atan(sin(e+n1*de)*sin(psi+n2*de)/(cos(i)*cos(e+n1*de)*cos(psi+n2*de)))
;prod=1./(tan(i)*tan(betaa))
;print, prod
;a=acos( - ( muo*sin(u1(i))*cos(u2(i))+sqrt(1-muo^2)*cos(u1(i)) )/sin(beta(i)) )
!P.MULTI = 0

end


