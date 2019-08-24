pro comportement_specul_2d

cd, '/home/fandrieu/Simu_IPAG/pro/'
resolve_routine, 'colorbar'
cd, '/home/fandrieu'

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;  i=40°  ;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;rough=0.1 emer entre i-3° et i+3° ouverture source 0.02° ouverture observateur 4.2° (spectro IPAG)
;path_spectres = '/home/fandrieu/Inversion/Simulations/specul_slab_1114_2d_1/specul_slab_1114_2d_1_em0_C.cub'
;        envi_open_file, path_spectres, r_fid=data_fid_gs_1
;        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
;        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
;        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
;         
;npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
; path = '/home/fandrieu/Inversion/Simulations/specul_slab_1114_2d_1/specul_slab_1114_2d_1_em0.param'
;      
;      A = pdsread(path,  /bsq)
;      param_cub = A.core
;      label_gs_1 = A.label
;      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 

;;rough=0.1 emer entre i-3° et i+3° azim entre 177° et 180° ouverture source 0.02° ouverture observateur 4.2° (spectro IPAG) 
;path_spectres = '/home/fandrieu/Inversion/Simulations/specul_slab_1114_2d_2/specul_slab_1114_2d_2_em0_C.cub'
;        envi_open_file, path_spectres, r_fid=data_fid_gs_1
;        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
;        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
;        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
;         
;npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
; path = '/home/fandrieu/Inversion/Simulations/specul_slab_1114_2d_2/specul_slab_1114_2d_2_em0.param'
;      
;      A = pdsread(path,  /bsq)
;      param_cub = A.core
;      label_gs_1 = A.label
;      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 

;;rough=0.5 emer entre i-3° et i+3° azim entre 177° et 180° ouverture source 0.02° ouverture observateur 4.2° (spectro IPAG) 
;path_spectres = '/home/fandrieu/Inversion/Simulations/specul_slab_1114_2d_3/specul_slab_1114_2d_3_em0_C.cub'
;        envi_open_file, path_spectres, r_fid=data_fid_gs_1
;        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
;        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
;        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
;         
;npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
; path = '/home/fandrieu/Inversion/Simulations/specul_slab_1114_2d_3/specul_slab_1114_2d_3_em0.param'
;      
;      A = pdsread(path,  /bsq)
;      param_cub = A.core
;      label_gs_1 = A.label
;      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 

;;rough=0.3 emer entre i-3° et i+3° azim entre 177° et 180° ouverture source 0.02° ouverture observateur 4.2° (spectro IPAG) 
;path_spectres = '/home/fandrieu/Inversion/Simulations/specul_slab_1114_2d_4/specul_slab_1114_2d_4_em0_C.cub'
;        envi_open_file, path_spectres, r_fid=data_fid_gs_1
;        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
;        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
;        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
;         
;npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
; path = '/home/fandrieu/Inversion/Simulations/specul_slab_1114_2d_4/specul_slab_1114_2d_4_em0.param'
;      
;      A = pdsread(path,  /bsq)
;      param_cub = A.core
;      label_gs_1 = A.label
;      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 

;;rough=0.3 emer entre i-3° et i+3° azim entre 177° et 180° ouverture source 0.02° ouverture observateur 4.2° (spectro IPAG) (res azim : 0.05°)
;path_spectres = '/home/fandrieu/Inversion/Simulations/specul_slab_1114_2d_5/specul_slab_1114_2d_5_em0_C.cub'
;        envi_open_file, path_spectres, r_fid=data_fid_gs_1
;        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
;        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
;        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
;         
;npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
; path = '/home/fandrieu/Inversion/Simulations/specul_slab_1114_2d_5/specul_slab_1114_2d_5_em0.param'
;      
;      A = pdsread(path,  /bsq)
;      param_cub = A.core
;      label_gs_1 = A.label
;      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 

;;rough=10 emer entre i-3° et i+3° azim entre 177° et 180° ouverture source 0.02° ouverture observateur 4.2° (spectro IPAG) (res azim : 0.05°)
;path_spectres = '/home/fandrieu/Inversion/Simulations/specul_slab_1114_2d_6/specul_slab_1114_2d_6_em0_C.cub'
;        envi_open_file, path_spectres, r_fid=data_fid_gs_1
;        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
;        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
;        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
;         
;npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
; path = '/home/fandrieu/Inversion/Simulations/specul_slab_1114_2d_6/specul_slab_1114_2d_6_em0.param'
;      
;      A = pdsread(path,  /bsq)
;      param_cub = A.core
;      label_gs_1 = A.label
;      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 

;rough=0.2 emer entre i-3° et i+3° azim entre 177° et 180° ouverture source 0.02° ouverture observateur 4.2° (spectro IPAG) (res azim : 0.05°)
;path_spectres = '/home/fandrieu/Inversion/Simulations/specul_slab_1114_2d_7/specul_slab_1114_2d_7_em0_C.cub'
;        envi_open_file, path_spectres, r_fid=data_fid_gs_1
;        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
;        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
;        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
;         
;npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
; path = '/home/fandrieu/Inversion/Simulations/specul_slab_1114_2d_7/specul_slab_1114_2d_7_em0.param'
;      
;      A = pdsread(path,  /bsq)
;      param_cub = A.core
;      label_gs_1 = A.label
;      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 

;;rough=0.25 emer entre i-3° et i+3° azim entre 177° et 180° ouverture source 0.02° ouverture observateur 4.2° (spectro IPAG) (res azim : 0.05°)
;path_spectres = '/home/fandrieu/Inversion/Simulations/specul_slab_1114_2d_8/specul_slab_1114_2d_8_em0_C.cub'
;        envi_open_file, path_spectres, r_fid=data_fid_gs_1
;        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
;        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
;        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
;         
;npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
; path = '/home/fandrieu/Inversion/Simulations/specul_slab_1114_2d_8/specul_slab_1114_2d_8_em0.param'
;      
;      A = pdsread(path,  /bsq)
;      param_cub = A.core
;      label_gs_1 = A.label
;      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 

;;rough=0.15 emer entre i-3° et i+3° azim entre 177° et 180° ouverture source 0.02° ouverture observateur 4.2° (spectro IPAG) (res azim : 0.05°)
;path_spectres = '/home/fandrieu/Inversion/Simulations/specul_slab_1114_2d_9/specul_slab_1114_2d_9_em0_C.cub'
;        envi_open_file, path_spectres, r_fid=data_fid_gs_1
;        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
;        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
;        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
;         
;npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
; path = '/home/fandrieu/Inversion/Simulations/specul_slab_1114_2d_9/specul_slab_1114_2d_9_em0.param'
;      
;      A = pdsread(path,  /bsq)
;      param_cub = A.core
;      label_gs_1 = A.label
;      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;  i=10°  ;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;rough=0.2 emer entre i-3° et i+3° azim entre 177° et 180° ouverture source 0.02° ouverture observateur 4.2° (spectro IPAG) (res azim : 0.05°)
;path_spectres = '/home/fandrieu/Inversion/Simulations/specul_slab_1114_2d_10/specul_slab_1114_2d_10_em0_C.cub'
;        envi_open_file, path_spectres, r_fid=data_fid_gs_1
;        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
;        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
;        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
;         
;npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
; path = '/home/fandrieu/Inversion/Simulations/specul_slab_1114_2d_10/specul_slab_1114_2d_10_em0.param'
;      
;      A = pdsread(path,  /bsq)
;      param_cub = A.core
;      label_gs_1 = A.label
;      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;  i=50°  ;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;rough=0.2 emer entre i-3° et i+3° azim entre 177° et 180° ouverture source 0.02° ouverture observateur 4.2° (spectro IPAG) (res azim : 0.05°)
;path_spectres = '/home/fandrieu/Inversion/Simulations/specul_slab_1114_2d_12/specul_slab_1114_2d_12_em0_C.cub'
;        envi_open_file, path_spectres, r_fid=data_fid_gs_1
;        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
;        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
;        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
;         
;npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
; path = '/home/fandrieu/Inversion/Simulations/specul_slab_1114_2d_12/specul_slab_1114_2d_12_em0.param'
;      
;      A = pdsread(path,  /bsq)
;      param_cub = A.core
;      label_gs_1 = A.label
;      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;; Integration "simple" ;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;rough=2 emer entre i-5° et i+5° azim entre 175° et 180° ouverture source 0.02° ouverture observateur 4.2° (spectro IPAG) (res azim : 1°)
;path_spectres = '/home/fandrieu/Inversion/Simulations/specul_slab_1214_2d_int_simple/specul_slab_1214_2d_01/specul_slab_1214_2d_01_em0_C.cub'
;        envi_open_file, path_spectres, r_fid=data_fid_gs_1
;        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
;        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
;        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
;         
;npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
; path = '/home/fandrieu/Inversion/Simulations/specul_slab_1214_2d_int_simple/specul_slab_1214_2d_01/specul_slab_1214_2d_01_em0.param'
;      
;      A = pdsread(path,  /bsq)
;      param_cub = A.core
;      label_gs_1 = A.label
;      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 

;;rough=1 emer entre i-5° et i+5° azim entre 175° et 180° ouverture source 0.02° ouverture observateur 4.2° (spectro IPAG) (res azim : 1°)
;path_spectres = '/home/fandrieu/Inversion/Simulations/specul_slab_1214_2d_int_simple/specul_slab_1214_2d_02/specul_slab_1214_2d_02_em0_C.cub'
;        envi_open_file, path_spectres, r_fid=data_fid_gs_1
;        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
;        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
;        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
;         
;npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
; path = '/home/fandrieu/Inversion/Simulations/specul_slab_1214_2d_int_simple/specul_slab_1214_2d_02/specul_slab_1214_2d_02_em0.param'
;      
;      A = pdsread(path,  /bsq)
;      param_cub = A.core
;      label_gs_1 = A.label
;      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 

;rough=0.5 emer entre i-5° et i+5° azim entre 175° et 180° ouverture source 0.02° ouverture observateur 4.2° (spectro IPAG) (res azim : 1°)
;path_spectres = '/home/fandrieu/Inversion/Simulations/specul_slab_1214_2d_int_simple/specul_slab_1214_2d_03/specul_slab_1214_2d_03_em0_C.cub'
;        envi_open_file, path_spectres, r_fid=data_fid_gs_1
;        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
;        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
;        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
;         
;npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
; path = '/home/fandrieu/Inversion/Simulations/specul_slab_1214_2d_int_simple/specul_slab_1214_2d_03/specul_slab_1214_2d_03_em0.param'
;      
;      A = pdsread(path,  /bsq)
;      param_cub = A.core
;      label_gs_1 = A.label
;      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 

;;rough=0.2 emer entre i-5° et i+5° azim entre 175° et 180° ouverture source 0.02° ouverture observateur 4.2° (spectro IPAG) (res azim : 1°)
;path_spectres = '/home/fandrieu/Inversion/Simulations/specul_slab_1214_2d_int_simple/specul_slab_1214_2d_04/specul_slab_1214_2d_04_em0_C.cub'
;        envi_open_file, path_spectres, r_fid=data_fid_gs_1
;        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
;        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
;        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
;         
;npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
; path = '/home/fandrieu/Inversion/Simulations/specul_slab_1214_2d_int_simple/specul_slab_1214_2d_04/specul_slab_1214_2d_04_em0.param'
;      
;      A = pdsread(path,  /bsq)
;      param_cub = A.core
;      label_gs_1 = A.label
;      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 

;;rough=0.1 emer entre i-5° et i+5° azim entre 175° et 180° ouverture source 0.02° ouverture observateur 4.2° (spectro IPAG) (res azim : 1°)
;path_spectres = '/home/fandrieu/Inversion/Simulations/specul_slab_1214_2d_int_simple/specul_slab_1214_2d_05/specul_slab_1214_2d_05_em0_C.cub'
;        envi_open_file, path_spectres, r_fid=data_fid_gs_1
;        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
;        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
;        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
;         
;npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
; path = '/home/fandrieu/Inversion/Simulations/specul_slab_1214_2d_int_simple/specul_slab_1214_2d_05/specul_slab_1214_2d_05_em0.param'
;      
;      A = pdsread(path,  /bsq)
;      param_cub = A.core
;      label_gs_1 = A.label
;      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 

;;rough=0.3 emer entre i-5° et i+5° azim entre 175° et 180° ouverture source 0.02° ouverture observateur 4.2° (spectro IPAG) (res azim : 1°)
;path_spectres = '/home/fandrieu/Inversion/Simulations/specul_slab_1214_2d_int_simple/specul_slab_1214_2d_06/specul_slab_1214_2d_06_em0_C.cub'
;        envi_open_file, path_spectres, r_fid=data_fid_gs_1
;        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
;        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
;        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
;         
;npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
; path = '/home/fandrieu/Inversion/Simulations/specul_slab_1214_2d_int_simple/specul_slab_1214_2d_06/specul_slab_1214_2d_06_em0.param'
;      
;      A = pdsread(path,  /bsq)
;      param_cub = A.core
;      label_gs_1 = A.label
;;      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 

;;rough=0.4 emer entre i-5° et i+5° azim entre 175° et 180° ouverture source 0.02° ouverture observateur 4.2° (spectro IPAG) (res azim : 1°)
;path_spectres = '/home/fandrieu/Inversion/Simulations/specul_slab_1214_2d_int_simple/specul_slab_1214_2d_07/specul_slab_1214_2d_07_em0_C.cub'
;        envi_open_file, path_spectres, r_fid=data_fid_gs_1
;        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
;        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
;        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
;         
;npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
; path = '/home/fandrieu/Inversion/Simulations/specul_slab_1214_2d_int_simple/specul_slab_1214_2d_07/specul_slab_1214_2d_07_em0.param'
;      
;      A = pdsread(path,  /bsq)
;      param_cub = A.core
;      label_gs_1 = A.label
;      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 

;;rough=0.6 emer entre i-5° et i+5° azim entre 175° et 180° ouverture source 0.02° ouverture observateur 4.2° (spectro IPAG) (res azim : 1°)
;path_spectres = '/home/fandrieu/Inversion/Simulations/specul_slab_1214_2d_int_simple/specul_slab_1214_2d_08/specul_slab_1214_2d_08_em0_C.cub'
;        envi_open_file, path_spectres, r_fid=data_fid_gs_1
;        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
;        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
;        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
;         
;npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
; path = '/home/fandrieu/Inversion/Simulations/specul_slab_1214_2d_int_simple/specul_slab_1214_2d_08/specul_slab_1214_2d_08_em0.param'
;      
;      A = pdsread(path,  /bsq)
;      param_cub = A.core
;      label_gs_1 = A.label
;      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 

;;rough=0.7 emer entre i-5° et i+5° azim entre 175° et 180° ouverture source 0.02° ouverture observateur 4.2° (spectro IPAG) (res azim : 1°)
;path_spectres = '/home/fandrieu/Inversion/Simulations/specul_slab_1214_2d_int_simple/specul_slab_1214_2d_09/specul_slab_1214_2d_09_em0_C.cub'
;        envi_open_file, path_spectres, r_fid=data_fid_gs_1
;        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
;        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
;        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
;         
;npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
; path = '/home/fandrieu/Inversion/Simulations/specul_slab_1214_2d_int_simple/specul_slab_1214_2d_09/specul_slab_1214_2d_09_em0.param'
;      
;      A = pdsread(path,  /bsq)
;      param_cub = A.core
;      label_gs_1 = A.label
;      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 

;;rough=0.8 emer entre i-5° et i+5° azim entre 175° et 180° ouverture source 0.02° ouverture observateur 4.2° (spectro IPAG) (res azim : 1°)
;path_spectres = '/home/fandrieu/Inversion/Simulations/specul_slab_1214_2d_int_simple/specul_slab_1214_2d_10/specul_slab_1214_2d_10_em0_C.cub'
;        envi_open_file, path_spectres, r_fid=data_fid_gs_1
;        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
;        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
;        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
;         
;npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
; path = '/home/fandrieu/Inversion/Simulations/specul_slab_1214_2d_int_simple/specul_slab_1214_2d_10/specul_slab_1214_2d_10_em0.param'
;      
;      A = pdsread(path,  /bsq)
;      param_cub = A.core
;      label_gs_1 = A.label
;      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 

;;rough=0.9 emer entre i-5° et i+5° azim entre 175° et 180° ouverture source 0.02° ouverture observateur 4.2° (spectro IPAG) (res azim : 1°)
;path_spectres = '/home/fandrieu/Inversion/Simulations/specul_slab_1214_2d_int_simple/specul_slab_1214_2d_11/specul_slab_1214_2d_11_em0_C.cub'
;        envi_open_file, path_spectres, r_fid=data_fid_gs_1
;        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
;        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
;        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
;         
;npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
; path = '/home/fandrieu/Inversion/Simulations/specul_slab_1214_2d_int_simple/specul_slab_1214_2d_11/specul_slab_1214_2d_11_em0.param'
;      
;      A = pdsread(path,  /bsq)
;      param_cub = A.core
;      label_gs_1 = A.label
;      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 

;;rough=0.05 emer entre i-5° et i+5° azim entre 175° et 180° ouverture source 0.02° ouverture observateur 4.2° (spectro IPAG) (res azim : 1°)
;path_spectres = '/home/fandrieu/Inversion/Simulations/specul_slab_1214_2d_int_simple/specul_slab_1214_2d_12/specul_slab_1214_2d_12_em0_C.cub'
;        envi_open_file, path_spectres, r_fid=data_fid_gs_1
;        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
;        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
;        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
;         
;npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
; path = '/home/fandrieu/Inversion/Simulations/specul_slab_1214_2d_int_simple/specul_slab_1214_2d_12/specul_slab_1214_2d_12_em0.param'
;      
;      A = pdsread(path,  /bsq)
;      param_cub = A.core
;      label_gs_1 = A.label
;      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 

;;rough=0.01 emer entre i-5° et i+5° azim entre 175° et 180° ouverture source 0.02° ouverture observateur 4.2° (spectro IPAG) (res azim : 1°)
;path_spectres = '/home/fandrieu/Inversion/Simulations/specul_slab_1214_2d_int_simple/specul_slab_1214_2d_13/specul_slab_1214_2d_13_em0_C.cub'
;        envi_open_file, path_spectres, r_fid=data_fid_gs_1
;        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
;        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
;        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
;         
;npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
; path = '/home/fandrieu/Inversion/Simulations/specul_slab_1214_2d_int_simple/specul_slab_1214_2d_13/specul_slab_1214_2d_13_em0.param'
;      
;      A = pdsread(path,  /bsq)
;      param_cub = A.core
;      label_gs_1 = A.label
;      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 

;;rough=0.15 emer entre i-5° et i+5° azim entre 175° et 180° ouverture source 0.02° ouverture observateur 4.2° (spectro IPAG) (res azim : 1°)
;path_spectres = '/home/fandrieu/Inversion/Simulations/specul_slab_1214_2d_int_simple/specul_slab_1214_2d_14/specul_slab_1214_2d_14_em0_C.cub'
;        envi_open_file, path_spectres, r_fid=data_fid_gs_1
;        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
;        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
;        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
;         
;npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
; path = '/home/fandrieu/Inversion/Simulations/specul_slab_1214_2d_int_simple/specul_slab_1214_2d_14/specul_slab_1214_2d_14_em0.param'
;      
;      A = pdsread(path,  /bsq)
;      param_cub = A.core
;      label_gs_1 = A.label
;      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 

;;rough=0.25 emer entre i-5° et i+5° azim entre 175° et 180° ouverture source 0.02° ouverture observateur 4.2° (spectro IPAG) (res azim : 1°)
;path_spectres = '/home/fandrieu/Inversion/Simulations/specul_slab_1214_2d_int_simple/specul_slab_1214_2d_15/specul_slab_1214_2d_15_em0_C.cub'
;        envi_open_file, path_spectres, r_fid=data_fid_gs_1
;        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
;        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
;        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
;         
;npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
; path = '/home/fandrieu/Inversion/Simulations/specul_slab_1214_2d_int_simple/specul_slab_1214_2d_15/specul_slab_1214_2d_15_em0.param'
;      
;      A = pdsread(path,  /bsq)
;      param_cub = A.core
;      label_gs_1 = A.label
;      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;; Integration "triple" ;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;rough=2 emer entre i-5° et i+5° azim entre 175° et 180° ouverture source 0.02° ouverture observateur 4.2° (spectro IPAG) (res azim : 1°)
;path_spectres = '/home/fandrieu/Inversion/Simulations/specul_slab_1214_2d_int_triple/specul_slab_1214_2d_01/specul_slab_1214_2d_01_em0_C.cub'
;        envi_open_file, path_spectres, r_fid=data_fid_gs_1
;        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
;        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
;        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
;         
;npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
; path = '/home/fandrieu/Inversion/Simulations/specul_slab_1214_2d_int_triple/specul_slab_1214_2d_01/specul_slab_1214_2d_01_em0.param'
;      
;      A = pdsread(path,  /bsq)
;      param_cub = A.core
;      label_gs_1 = A.label
;      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 

;;;rough=1 emer entre i-5° et i+5° azim entre 175° et 180° ouverture source 0.02° ouverture observateur 4.2° (spectro IPAG) (res azim : 1°)
;path_spectres = '/home/fandrieu/Inversion/Simulations/specul_slab_1214_2d_int_triple/specul_slab_1214_2d_02/specul_slab_1214_2d_02_em0_C.cub'
;        envi_open_file, path_spectres, r_fid=data_fid_gs_1
;        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
;        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
;        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
;         
;npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
; path = '/home/fandrieu/Inversion/Simulations/specul_slab_1214_2d_int_triple/specul_slab_1214_2d_02/specul_slab_1214_2d_02_em0.param'
;      
;      A = pdsread(path,  /bsq)
;      param_cub = A.core
;      label_gs_1 = A.label
;      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 

;;rough=0.5 emer entre i-5° et i+5° azim entre 175° et 180° ouverture source 0.02° ouverture observateur 4.2° (spectro IPAG) (res azim : 1°)
;path_spectres = '/home/fandrieu/Inversion/Simulations/specul_slab_1214_2d_int_triple/specul_slab_1214_2d_03/specul_slab_1214_2d_03_em0_C.cub'
;        envi_open_file, path_spectres, r_fid=data_fid_gs_1
;        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
;        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
;        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
;         
;npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
; path = '/home/fandrieu/Inversion/Simulations/specul_slab_1214_2d_int_triple/specul_slab_1214_2d_03/specul_slab_1214_2d_03_em0.param'
;      
;      A = pdsread(path,  /bsq)
;      param_cub = A.core
;      label_gs_1 = A.label
;      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 

;;rough=0.2 emer entre i-5° et i+5° azim entre 175° et 180° ouverture source 0.02° ouverture observateur 4.2° (spectro IPAG) (res azim : 1°)
;path_spectres = '/home/fandrieu/Inversion/Simulations/specul_slab_1214_2d_int_triple/specul_slab_1214_2d_04/specul_slab_1214_2d_04_em0_C.cub'
;        envi_open_file, path_spectres, r_fid=data_fid_gs_1
;        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
;        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
;        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
;         
;npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
; path = '/home/fandrieu/Inversion/Simulations/specul_slab_1214_2d_int_triple/specul_slab_1214_2d_04/specul_slab_1214_2d_04_em0.param'
;      
;      A = pdsread(path,  /bsq)
;      param_cub = A.core
;      label_gs_1 = A.label
;      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 

;;rough=0.1 emer entre i-5° et i+5° azim entre 175° et 180° ouverture source 0.02° ouverture observateur 4.2° (spectro IPAG) (res azim : 1°)
;path_spectres = '/home/fandrieu/Inversion/Simulations/specul_slab_1214_2d_int_triple/specul_slab_1214_2d_05/specul_slab_1214_2d_05_em0_C.cub'
;        envi_open_file, path_spectres, r_fid=data_fid_gs_1
;        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
;        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
;        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
;         
;npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
; path = '/home/fandrieu/Inversion/Simulations/specul_slab_1214_2d_int_triple/specul_slab_1214_2d_05/specul_slab_1214_2d_05_em0.param'
;      
;      A = pdsread(path,  /bsq)
;      param_cub = A.core
;      label_gs_1 = A.label
;      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 

;;rough=0.3 emer entre i-5° et i+5° azim entre 175° et 180° ouverture source 0.02° ouverture observateur 4.2° (spectro IPAG) (res azim : 1°)
;path_spectres = '/home/fandrieu/Inversion/Simulations/specul_slab_1214_2d_int_triple/specul_slab_1214_2d_06/specul_slab_1214_2d_06_em0_C.cub'
;        envi_open_file, path_spectres, r_fid=data_fid_gs_1
;        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
;        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
;        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
;         
;npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
; path = '/home/fandrieu/Inversion/Simulations/specul_slab_1214_2d_int_triple/specul_slab_1214_2d_06/specul_slab_1214_2d_06_em0.param'
;      
;      A = pdsread(path,  /bsq)
;      param_cub = A.core
;      label_gs_1 = A.label
;;      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 

;;rough=0.4 emer entre i-5° et i+5° azim entre 175° et 180° ouverture source 0.02° ouverture observateur 4.2° (spectro IPAG) (res azim : 1°)
;path_spectres = '/home/fandrieu/Inversion/Simulations/specul_slab_1214_2d_int_triple/specul_slab_1214_2d_07/specul_slab_1214_2d_07_em0_C.cub'
;        envi_open_file, path_spectres, r_fid=data_fid_gs_1
;        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
;        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
;        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
;         
;npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
; path = '/home/fandrieu/Inversion/Simulations/specul_slab_1214_2d_int_triple/specul_slab_1214_2d_07/specul_slab_1214_2d_07_em0.param'
;      
;      A = pdsread(path,  /bsq)
;      param_cub = A.core
;      label_gs_1 = A.label
;      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 

;;rough=0.6 emer entre i-5° et i+5° azim entre 175° et 180° ouverture source 0.02° ouverture observateur 4.2° (spectro IPAG) (res azim : 1°)
;path_spectres = '/home/fandrieu/Inversion/Simulations/specul_slab_1214_2d_int_triple/specul_slab_1214_2d_08/specul_slab_1214_2d_08_em0_C.cub'
;        envi_open_file, path_spectres, r_fid=data_fid_gs_1
;        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
;        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
;        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
;         
;npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
; path = '/home/fandrieu/Inversion/Simulations/specul_slab_1214_2d_int_triple/specul_slab_1214_2d_08/specul_slab_1214_2d_08_em0.param'
;      
;      A = pdsread(path,  /bsq)
;      param_cub = A.core
;      label_gs_1 = A.label
;      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 

;;rough=0.7 emer entre i-5° et i+5° azim entre 175° et 180° ouverture source 0.02° ouverture observateur 4.2° (spectro IPAG) (res azim : 1°)
;path_spectres = '/home/fandrieu/Inversion/Simulations/specul_slab_1214_2d_int_triple/specul_slab_1214_2d_09/specul_slab_1214_2d_09_em0_C.cub'
;        envi_open_file, path_spectres, r_fid=data_fid_gs_1
;        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
;        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
;        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
;         
;npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
; path = '/home/fandrieu/Inversion/Simulations/specul_slab_1214_2d_int_triple/specul_slab_1214_2d_09/specul_slab_1214_2d_09_em0.param'
;      
;      A = pdsread(path,  /bsq)
;      param_cub = A.core
;      label_gs_1 = A.label
;      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 

;;rough=0.8 emer entre i-5° et i+5° azim entre 175° et 180° ouverture source 0.02° ouverture observateur 4.2° (spectro IPAG) (res azim : 1°)
;path_spectres = '/home/fandrieu/Inversion/Simulations/specul_slab_1214_2d_int_triple/specul_slab_1214_2d_10/specul_slab_1214_2d_10_em0_C.cub'
;        envi_open_file, path_spectres, r_fid=data_fid_gs_1
;        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
;        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
;        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
;         
;npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
; path = '/home/fandrieu/Inversion/Simulations/specul_slab_1214_2d_int_triple/specul_slab_1214_2d_10/specul_slab_1214_2d_10_em0.param'
;      
;      A = pdsread(path,  /bsq)
;      param_cub = A.core
;      label_gs_1 = A.label
;      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 

;;rough=0.9 emer entre i-5° et i+5° azim entre 175° et 180° ouverture source 0.02° ouverture observateur 4.2° (spectro IPAG) (res azim : 1°)
;path_spectres = '/home/fandrieu/Inversion/Simulations/specul_slab_1214_2d_int_triple/specul_slab_1214_2d_11/specul_slab_1214_2d_11_em0_C.cub'
;        envi_open_file, path_spectres, r_fid=data_fid_gs_1
;        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
;        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
;        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
;         
;npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
; path = '/home/fandrieu/Inversion/Simulations/specul_slab_1214_2d_int_triple/specul_slab_1214_2d_11/specul_slab_1214_2d_11_em0.param'
;      
;      A = pdsread(path,  /bsq)
;      param_cub = A.core
;      label_gs_1 = A.label
;      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 

;;rough=0.05 emer entre i-5° et i+5° azim entre 175° et 180° ouverture source 0.02° ouverture observateur 4.2° (spectro IPAG) (res azim : 1°)
;path_spectres = '/home/fandrieu/Inversion/Simulations/specul_slab_1214_2d_int_triple/specul_slab_1214_2d_12/specul_slab_1214_2d_12_em0_C.cub'
;        envi_open_file, path_spectres, r_fid=data_fid_gs_1
;        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
;        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
;        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
;         
;npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
; path = '/home/fandrieu/Inversion/Simulations/specul_slab_1214_2d_int_triple/specul_slab_1214_2d_12/specul_slab_1214_2d_12_em0.param'
;      
;      A = pdsread(path,  /bsq)
;      param_cub = A.core
;      label_gs_1 = A.label
;      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 

;;rough=0.15 emer entre i-5° et i+5° azim entre 175° et 180° ouverture source 0.02° ouverture observateur 4.2° (spectro IPAG) (res azim : 1°)
;path_spectres = '/home/fandrieu/Inversion/Simulations/specul_slab_1214_2d_int_triple/specul_slab_1214_2d_14/specul_slab_1214_2d_14_em0_C.cub'
;        envi_open_file, path_spectres, r_fid=data_fid_gs_1
;        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
;        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
;        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
;         
;npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
; path = '/home/fandrieu/Inversion/Simulations/specul_slab_1214_2d_int_triple/specul_slab_1214_2d_14/specul_slab_1214_2d_14_em0.param'
;      
;      A = pdsread(path,  /bsq)
;      param_cub = A.core
;      label_gs_1 = A.label
;      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 

;;rough=0.25 emer entre i-5° et i+5° azim entre 175° et 180° ouverture source 0.02° ouverture observateur 4.2° (spectro IPAG) (res azim : 1°)
;path_spectres = '/home/fandrieu/Inversion/Simulations/specul_slab_1214_2d_int_triple/specul_slab_1214_2d_15/specul_slab_1214_2d_15_em0_C.cub'
;        envi_open_file, path_spectres, r_fid=data_fid_gs_1
;        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
;        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
;        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
;         
;npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
; path = '/home/fandrieu/Inversion/Simulations/specul_slab_1214_2d_int_triple/specul_slab_1214_2d_15/specul_slab_1214_2d_15_em0.param'
;      
;      A = pdsread(path,  /bsq)
;      param_cub = A.core
;      label_gs_1 = A.label
;      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;IINTEGRATION TESTS ;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;; Integration finale ;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;rough=2 emer entre i-5° et i+5° azim entre 175° et 180° ouverture source 0.02° ouverture observateur 4.2° (spectro IPAG) (res azim : 1°)
;path_spectres = '/home/fandrieu/Inversion/Simulations/specul_slab_1214_2d_01/specul_slab_1214_2d_01_em0_C.cub'
;        envi_open_file, path_spectres, r_fid=data_fid_gs_1
;        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
;        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
;        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
;         
;npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
; path = '/home/fandrieu/Inversion/Simulations/specul_slab_1214_2d_01/specul_slab_1214_2d_01_em0.param'
;      
;      A = pdsread(path,  /bsq)
;      param_cub = A.core
;      label_gs_1 = A.label
;      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 

;;;rough=1 emer entre i-5° et i+5° azim entre 175° et 180° ouverture source 0.02° ouverture observateur 4.2° (spectro IPAG) (res azim : 1°)
;path_spectres = '/home/fandrieu/Inversion/Simulations/specul_slab_1214_2d_02/specul_slab_1214_2d_02_em0_C.cub'
;        envi_open_file, path_spectres, r_fid=data_fid_gs_1
;        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
;        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
;        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
;         
;npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
; path = '/home/fandrieu/Inversion/Simulations/specul_slab_1214_2d_02/specul_slab_1214_2d_02_em0.param'
;      
;      A = pdsread(path,  /bsq)
;      param_cub = A.core
;      label_gs_1 = A.label
;      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 

;;rough=0.5 emer entre i-5° et i+5° azim entre 175° et 180° ouverture source 0.02° ouverture observateur 4.2° (spectro IPAG) (res azim : 1°)
;path_spectres = '/home/fandrieu/Inversion/Simulations/specul_slab_1214_2d_03/specul_slab_1214_2d_03_em0_C.cub'
;        envi_open_file, path_spectres, r_fid=data_fid_gs_1
;        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
;        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
;        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
;         
;npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
; path = '/home/fandrieu/Inversion/Simulations/specul_slab_1214_2d_03/specul_slab_1214_2d_03_em0.param'
;      
;      A = pdsread(path,  /bsq)
;      param_cub = A.core
;      label_gs_1 = A.label
;      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 

;;rough=0.45 emer entre i-5° et i+5° azim entre 175° et 180° ouverture source 0.02° ouverture observateur 4.2° (spectro IPAG) (res azim : 1°)
;path_spectres = '/home/fandrieu/Inversion/Simulations/specul_slab_1214_2d_16/specul_slab_1214_2d_16_em0_C.cub'
;        envi_open_file, path_spectres, r_fid=data_fid_gs_1
;        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
;        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
;        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
;         
;npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
; path = '/home/fandrieu/Inversion/Simulations/specul_slab_1214_2d_16/specul_slab_1214_2d_16_em0.param'
;      
;      A = pdsread(path,  /bsq)
;      param_cub = A.core
;      label_gs_1 = A.label
;      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 

;;rough=0.41 emer entre i-5° et i+5° azim entre 175° et 180° ouverture source 0.02° ouverture observateur 4.2° (spectro IPAG) (res azim : 1°)
;path_spectres = '/home/fandrieu/Inversion/Simulations/specul_slab_1214_2d_17/specul_slab_1214_2d_17_em0_C.cub'
;        envi_open_file, path_spectres, r_fid=data_fid_gs_1
;        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
;        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
;        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
;         
;npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
; path = '/home/fandrieu/Inversion/Simulations/specul_slab_1214_2d_17/specul_slab_1214_2d_17_em0.param'
;      
;      A = pdsread(path,  /bsq)
;      param_cub = A.core
;      label_gs_1 = A.label
;      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER')

;;rough=0.42 emer entre i-5° et i+5° azim entre 175° et 180° ouverture source 0.02° ouverture observateur 4.2° (spectro IPAG) (res azim : 1°)
;path_spectres = '/home/fandrieu/Inversion/Simulations/specul_slab_1214_2d_18/specul_slab_1214_2d_18_em0_C.cub'
;        envi_open_file, path_spectres, r_fid=data_fid_gs_1
;        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
;        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
;        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
;         
;npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
; path = '/home/fandrieu/Inversion/Simulations/specul_slab_1214_2d_18/specul_slab_1214_2d_18_em0.param'
;      
;      A = pdsread(path,  /bsq)
;      param_cub = A.core
;      label_gs_1 = A.label
;      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER')

;;rough=0.43 emer entre i-5° et i+5° azim entre 175° et 180° ouverture source 0.02° ouverture observateur 4.2° (spectro IPAG) (res azim : 1°)
;path_spectres = '/home/fandrieu/Inversion/Simulations/specul_slab_1214_2d_19/specul_slab_1214_2d_19_em0_C.cub'
;        envi_open_file, path_spectres, r_fid=data_fid_gs_1
;        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
;        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
;        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
;         
;npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
; path = '/home/fandrieu/Inversion/Simulations/specul_slab_1214_2d_19/specul_slab_1214_2d_19_em0.param'
;      
;      A = pdsread(path,  /bsq)
;      param_cub = A.core
;      label_gs_1 = A.label
;      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER')

;;rough=0.43 emer entre i-5° et i+5° azim entre 175° et 180° ouverture source 0.02° ouverture observateur 4.2° (spectro IPAG) (res azim : 1°)
;path_spectres = '/home/fandrieu/Inversion/Simulations/test_optim/test_optim_em0_C.cub'
;        envi_open_file, path_spectres, r_fid=data_fid_gs_1
;        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
;        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
;        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
;         
;npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
; path = '/home/fandrieu/Inversion/Simulations/test_optim/test_optim_em0.param'
;      
;      A = pdsread(path,  /bsq)
;      param_cub = A.core
;      label_gs_1 = A.label
;      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER')
   
;;rough=0.44 emer entre i-5° et i+5° azim entre 175° et 180° ouverture source 0.02° ouverture observateur 4.2° (spectro IPAG) (res azim : 1°)
;path_spectres = '/home/fandrieu/Inversion/Simulations/specul_slab_1214_2d_20/specul_slab_1214_2d_20_em0_C.cub'
;        envi_open_file, path_spectres, r_fid=data_fid_gs_1
;        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
;        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
;        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
;         
;npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
; path = '/home/fandrieu/Inversion/Simulations/specul_slab_1214_2d_20/specul_slab_1214_2d_20_em0.param'
;      
;      A = pdsread(path,  /bsq)
;      param_cub = A.core
;      label_gs_1 = A.label
;      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER')
     
;;rough=0.2 emer entre i-5° et i+5° azim entre 175° et 180° ouverture source 0.02° ouverture observateur 4.2° (spectro IPAG) (res azim : 1°)
;path_spectres = '/home/fandrieu/Inversion/Simulations/specul_slab_1214_2d_04/specul_slab_1214_2d_04_em0_C.cub'
;        envi_open_file, path_spectres, r_fid=data_fid_gs_1
;        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
;        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
;        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
;         
;npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
; path = '/home/fandrieu/Inversion/Simulations/specul_slab_1214_2d_04/specul_slab_1214_2d_04_em0.param'
;      
;      A = pdsread(path,  /bsq)
;      param_cub = A.core
;      label_gs_1 = A.label
;      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 

;;rough=0.1 emer entre i-5° et i+5° azim entre 175° et 180° ouverture source 0.02° ouverture observateur 4.2° (spectro IPAG) (res azim : 1°)
;path_spectres = '/home/fandrieu/Inversion/Simulations/specul_slab_1214_2d_05/specul_slab_1214_2d_05_em0_C.cub'
;        envi_open_file, path_spectres, r_fid=data_fid_gs_1
;        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
;        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
;        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
;         
;npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
; path = '/home/fandrieu/Inversion/Simulations/specul_slab_1214_2d_05/specul_slab_1214_2d_05_em0.param'
;      
;      A = pdsread(path,  /bsq)
;      param_cub = A.core
;      label_gs_1 = A.label
;      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 

;;rough=0.3 emer entre i-5° et i+5° azim entre 175° et 180° ouverture source 0.02° ouverture observateur 4.2° (spectro IPAG) (res azim : 1°)
;path_spectres = '/home/fandrieu/Inversion/Simulations/specul_slab_1214_2d_06/specul_slab_1214_2d_06_em0_C.cub'
;        envi_open_file, path_spectres, r_fid=data_fid_gs_1
;        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
;        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
;        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
;         
;npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
; path = '/home/fandrieu/Inversion/Simulations/specul_slab_1214_2d_06/specul_slab_1214_2d_06_em0.param'
;      
;      A = pdsread(path,  /bsq)
;      param_cub = A.core
;      label_gs_1 = A.label
;;      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 

;;rough=0.4 emer entre i-5° et i+5° azim entre 175° et 180° ouverture source 0.02° ouverture observateur 4.2° (spectro IPAG) (res azim : 1°)
;path_spectres = '/home/fandrieu/Inversion/Simulations/specul_slab_1214_2d_07/specul_slab_1214_2d_07_em0_C.cub'
;        envi_open_file, path_spectres, r_fid=data_fid_gs_1
;        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
;        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
;        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
;         
;npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
; path = '/home/fandrieu/Inversion/Simulations/specul_slab_1214_2d_07/specul_slab_1214_2d_07_em0.param'
;      
;      A = pdsread(path,  /bsq)
;      param_cub = A.core
;      label_gs_1 = A.label
;      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 

;;rough=0.6 emer entre i-5° et i+5° azim entre 175° et 180° ouverture source 0.02° ouverture observateur 4.2° (spectro IPAG) (res azim : 1°)
;path_spectres = '/home/fandrieu/Inversion/Simulations/specul_slab_1214_2d_08/specul_slab_1214_2d_08_em0_C.cub'
;        envi_open_file, path_spectres, r_fid=data_fid_gs_1
;        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
;        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
;        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
;         
;npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
; path = '/home/fandrieu/Inversion/Simulations/specul_slab_1214_2d_08/specul_slab_1214_2d_08_em0.param'
;      
;      A = pdsread(path,  /bsq)
;      param_cub = A.core
;      label_gs_1 = A.label
;      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 

;;rough=0.7 emer entre i-5° et i+5° azim entre 175° et 180° ouverture source 0.02° ouverture observateur 4.2° (spectro IPAG) (res azim : 1°)
;path_spectres = '/home/fandrieu/Inversion/Simulations/specul_slab_1214_2d_09/specul_slab_1214_2d_09_em0_C.cub'
;        envi_open_file, path_spectres, r_fid=data_fid_gs_1
;        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
;        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
;        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
;         
;npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
; path = '/home/fandrieu/Inversion/Simulations/specul_slab_1214_2d_09/specul_slab_1214_2d_09_em0.param'
;      
;      A = pdsread(path,  /bsq)
;      param_cub = A.core
;      label_gs_1 = A.label
;      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 

;;rough=0.8 emer entre i-5° et i+5° azim entre 175° et 180° ouverture source 0.02° ouverture observateur 4.2° (spectro IPAG) (res azim : 1°)
;path_spectres = '/home/fandrieu/Inversion/Simulations/specul_slab_1214_2d_10/specul_slab_1214_2d_10_em0_C.cub'
;        envi_open_file, path_spectres, r_fid=data_fid_gs_1
;        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
;        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
;        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
;         
;npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
; path = '/home/fandrieu/Inversion/Simulations/specul_slab_1214_2d_10/specul_slab_1214_2d_10_em0.param'
;      
;      A = pdsread(path,  /bsq)
;      param_cub = A.core
;      label_gs_1 = A.label
;      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 

;;rough=0.9 emer entre i-5° et i+5° azim entre 175° et 180° ouverture source 0.02° ouverture observateur 4.2° (spectro IPAG) (res azim : 1°)
;path_spectres = '/home/fandrieu/Inversion/Simulations/specul_slab_1214_2d_11/specul_slab_1214_2d_11_em0_C.cub'
;        envi_open_file, path_spectres, r_fid=data_fid_gs_1
;        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
;        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
;        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
;         
;npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
; path = '/home/fandrieu/Inversion/Simulations/specul_slab_1214_2d_11/specul_slab_1214_2d_11_em0.param'
;      
;      A = pdsread(path,  /bsq)
;      param_cub = A.core
;      label_gs_1 = A.label
;      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 

;;rough=0.05 emer entre i-5° et i+5° azim entre 175° et 180° ouverture source 0.02° ouverture observateur 4.2° (spectro IPAG) (res azim : 1°)
;path_spectres = '/home/fandrieu/Inversion/Simulations/specul_slab_1214_2d_12/specul_slab_1214_2d_12_em0_C.cub'
;        envi_open_file, path_spectres, r_fid=data_fid_gs_1
;        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
;        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
;        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
;         
;npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
; path = '/home/fandrieu/Inversion/Simulations/specul_slab_1214_2d_12/specul_slab_1214_2d_12_em0.param'
;      
;      A = pdsread(path,  /bsq)
;      param_cub = A.core
;      label_gs_1 = A.label
;      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 

;;rough=0.15 emer entre i-5° et i+5° azim entre 175° et 180° ouverture source 0.02° ouverture observateur 4.2° (spectro IPAG) (res azim : 1°)
;path_spectres = '/home/fandrieu/Inversion/Simulations/specul_slab_1214_2d_14/specul_slab_1214_2d_14_em0_C.cub'
;        envi_open_file, path_spectres, r_fid=data_fid_gs_1
;        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
;        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
;        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
;         
;npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
; path = '/home/fandrieu/Inversion/Simulations/specul_slab_1214_2d_14/specul_slab_1214_2d_14_em0.param'
;      
;      A = pdsread(path,  /bsq)
;      param_cub = A.core
;      label_gs_1 = A.label
;      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 

;;rough=0.25 emer entre i-5° et i+5° azim entre 175° et 180° ouverture source 0.02° ouverture observateur 4.2° (spectro IPAG) (res azim : 1°)
;path_spectres = '/home/fandrieu/Inversion/Simulations/specul_slab_1214_2d_15/specul_slab_1214_2d_15_em0_C.cub'
;        envi_open_file, path_spectres, r_fid=data_fid_gs_1
;        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
;        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
;        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
;         
;npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
; path = '/home/fandrieu/Inversion/Simulations/specul_slab_1214_2d_15/specul_slab_1214_2d_15_em0.param'
;      
;      A = pdsread(path,  /bsq)
;      param_cub = A.core
;      label_gs_1 = A.label
;      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;IINTEGRATION TESTS ;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;rough=0.2 emer entre i-3° et i+3° azim entre 177° et 180° ouverture source 0.02° ouverture observateur 4.2° (spectro IPAG) (res azim : 1°, 1 point integration)
;path_spectres = '/home/fandrieu/Inversion/Simulations/specul_slab_1114_2d_test_1/specul_slab_1114_2d_test_em0_C.cub'
;        envi_open_file, path_spectres, r_fid=data_fid_gs_1
;        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
;        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
;        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
;         
;npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
; path = '/home/fandrieu/Inversion/Simulations/specul_slab_1114_2d_test_1/specul_slab_1114_2d_test_em0.param'
;      
;      A = pdsread(path,  /bsq)
;      param_cub = A.core
;      label_gs_1 = A.label
;      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 

;;rough=0.2 emer entre i-3° et i+3° azim entre 177° et 180° ouverture source 0.02° ouverture observateur 4.2° (spectro IPAG) (res azim : 1°, 3*3 points integration)
;path_spectres = '/home/fandrieu/Inversion/Simulations/specul_slab_1114_2d_test_3/specul_slab_1114_2d_test_em0_C.cub'
;        envi_open_file, path_spectres, r_fid=data_fid_gs_1
;        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
;        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
;        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
;         
;npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
; path = '/home/fandrieu/Inversion/Simulations/specul_slab_1114_2d_test_3/specul_slab_1114_2d_test_em0.param'
;      
;      A = pdsread(path,  /bsq)
;      param_cub = A.core
;      label_gs_1 = A.label
;      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 

;;rough=0.2 emer entre i-3° et i+3° azim entre 177° et 180° ouverture source 0.02° ouverture observateur 4.2° (spectro IPAG) (res azim : 1°, 5*5 points integration)
;path_spectres = '/home/fandrieu/Inversion/Simulations/specul_slab_1114_2d_test_5/specul_slab_1114_2d_test_em0_C.cub'
;        envi_open_file, path_spectres, r_fid=data_fid_gs_1
;        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
;        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
;        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
;         
;npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
; path = '/home/fandrieu/Inversion/Simulations/specul_slab_1114_2d_test_5/specul_slab_1114_2d_test_em0.param'
;      
;      A = pdsread(path,  /bsq)
;      param_cub = A.core
;      label_gs_1 = A.label
;      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 

;;rough=0.2 emer entre i-3° et i+3° azim entre 177° et 180° ouverture source 0.02° ouverture observateur 4.2° (spectro IPAG) (res azim : 1°, 7*7 points integration)
;path_spectres = '/home/fandrieu/Inversion/Simulations/specul_slab_1114_2d_test_7/specul_slab_1114_2d_test_em0_C.cub'
;        envi_open_file, path_spectres, r_fid=data_fid_gs_1
;        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
;        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
;        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
;         
;npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
; path = '/home/fandrieu/Inversion/Simulations/specul_slab_1114_2d_test_7/specul_slab_1114_2d_test_em0.param'
;      
;      A = pdsread(path,  /bsq)
;      param_cub = A.core
;      label_gs_1 = A.label
;      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 

;;rough=0.2 emer entre i-3° et i+3° azim entre 177° et 180° ouverture source 0.02° ouverture observateur 4.2° (spectro IPAG) (res azim : 1°, 11*11 points integration)
;path_spectres = '/home/fandrieu/Inversion/Simulations/specul_slab_1114_2d_test_11/specul_slab_1114_2d_test_em0_C.cub'
;        envi_open_file, path_spectres, r_fid=data_fid_gs_1
;        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
;        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
;        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
;         
;npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
; path = '/home/fandrieu/Inversion/Simulations/specul_slab_1114_2d_test_11/specul_slab_1114_2d_test_em0.param'
;      
;      A = pdsread(path,  /bsq)
;      param_cub = A.core
;      label_gs_1 = A.label
;      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 

;;rough=0.2 emer entre i-3° et i+3° azim entre 177° et 180° ouverture source 0.02° ouverture observateur 4.2° (spectro IPAG) (res azim : 1°, 15*15 points integration)
;path_spectres = '/home/fandrieu/Inversion/Simulations/specul_slab_1114_2d_test_15/specul_slab_1114_2d_test_em0_C.cub'
;        envi_open_file, path_spectres, r_fid=data_fid_gs_1
;        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
;        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
;        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
;         
;npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
; path = '/home/fandrieu/Inversion/Simulations/specul_slab_1114_2d_test_15/specul_slab_1114_2d_test_em0.param'
;      
;      A = pdsread(path,  /bsq)
;      param_cub = A.core
;      label_gs_1 = A.label
;      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 

;;rough=0.2 emer entre i-3° et i+3° azim entre 177° et 180° ouverture source 0.02° ouverture observateur 4.2° (spectro IPAG) (res azim : 1°, 21*21 points integration)
;path_spectres = '/home/fandrieu/Inversion/Simulations/specul_slab_1114_2d_test_21/specul_slab_1114_2d_test_em0_C.cub'
;        envi_open_file, path_spectres, r_fid=data_fid_gs_1
;        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
;        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
;        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
;         
;npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
; path = '/home/fandrieu/Inversion/Simulations/specul_slab_1114_2d_test_21/specul_slab_1114_2d_test_em0.param'
;      
;      A = pdsread(path,  /bsq)
;      param_cub = A.core
;      label_gs_1 = A.label
;      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 

;rough=0.2 emer entre i-3° et i+3° azim entre 177° et 180° ouverture source 0.02° ouverture observateur 4.2° (spectro IPAG) (res azim : 1°, 51*51 poits integration)
;path_spectres = '/home/fandrieu/Inversion/Simulations/specul_slab_1114_2d_test_51/specul_slab_1114_2d_test_em0_C.cub'
;        envi_open_file, path_spectres, r_fid=data_fid_gs_1
;        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
;        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
;        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
;         
;npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
; path = '/home/fandrieu/Inversion/Simulations/specul_slab_1114_2d_test_51/specul_slab_1114_2d_test_em0.param'
;      
;      A = pdsread(path,  /bsq)
;      param_cub = A.core
;      label_gs_1 = A.label
;      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;rough=2 emer entre i-3° et i+3° azim entre 177° et 180° ouverture source 0.02° ouverture observateur 4.2° (spectro IPAG) (res azim : 0.05°)
;path_spectres = '/home/fandrieu/Inversion/Simulations/specul_slab_1114_2d_13/specul_slab_1114_2d_13_em0_C.cub'
;        envi_open_file, path_spectres, r_fid=data_fid_gs_1
;        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
;        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
;        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
;         
;npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
; path = '/home/fandrieu/Inversion/Simulations/specul_slab_1114_2d_13/specul_slab_1114_2d_13_em0.param'
;      
;      A = pdsread(path,  /bsq)
;      param_cub = A.core
;      label_gs_1 = A.label
;      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 


;;rough=0.5 emer entre i-5° et i+5° azim entre 175° et 180° ouverture source 0.021° ouverture observateur 0.0° (OMEGA) (res incid : 0.2° azim : 0.1°)
;path_spectres = '/home/fandrieu/Inversion/Simulations/specul_slab_1214_2d_03_b/specul_slab_1214_2d_03_b_em0_C.cub'
;        envi_open_file, path_spectres, r_fid=data_fid_gs_1
;        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
;        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
;        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
;         
;npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
; path = '/home/fandrieu/Inversion/Simulations/specul_slab_1214_2d_03_b/specul_slab_1214_2d_03_b_em0.param'
;      
;      A = pdsread(path,  /bsq)
;      param_cub = A.core
;      label_gs_1 = A.label
;      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 
      
;;rough=0.5 emer entre i-5° et i+5° azim entre 175° et 180° ouverture source 0.02° ouverture observateur 4.2° (spectro IPAG) (res incid : 0.2° azim : 0.1°)
;path_spectres = '/home/fandrieu/Inversion/Simulations/specul_slab_1214_2d_03_c/specul_slab_1214_2d_03_c_em0_C.cub'
;        envi_open_file, path_spectres, r_fid=data_fid_gs_1
;        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
;        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
;        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
;         
;npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
; path = '/home/fandrieu/Inversion/Simulations/specul_slab_1214_2d_03_c/specul_slab_1214_2d_03_c_em0.param'
;      
;      A = pdsread(path,  /bsq)
;      param_cub = A.core
;      label_gs_1 = A.label
;      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 

;;rough=0.5 emer entre i-5° et i+5° azim entre 175° et 180° ouverture source 0.021° ouverture observateur 0.00174° (CRISM) (res incid : 0.2° azim : 0.1°)
;path_spectres = '/home/fandrieu/Inversion/Simulations/specul_slab_1214_2d_03_d/specul_slab_1214_2d_03_d_em0_C.cub'
;        envi_open_file, path_spectres, r_fid=data_fid_gs_1
;        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
;        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
;        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
;         
;npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
; path = '/home/fandrieu/Inversion/Simulations/specul_slab_1214_2d_03_d/specul_slab_1214_2d_03_d_em0.param'
;      
;      A = pdsread(path,  /bsq)
;      param_cub = A.core
;      label_gs_1 = A.label
;      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 
;      

;;rough=1.0 emer entre i-5° et i+5° azim entre 175° et 180°  (OMEGA) (res : 0.2°)
;path_spectres = '/home/fandrieu/Inversion/Simulations/specul_slab_0215_r1_omega/specul_slab_0215_r1_omega_em0_C.cub'
;        envi_open_file, path_spectres, r_fid=data_fid_gs_1
;        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
;        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
;        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
;         
;npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
; path = '/home/fandrieu/Inversion/Simulations/specul_slab_0215_r1_omega/specul_slab_0215_r1_omega_em0.param'
;      
;      A = pdsread(path,  /bsq)
;      param_cub = A.core
;      label_gs_1 = A.label
;      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER')
;
;
;
    
;;;      
;;;
;;rough=0.1 emer entre i-5° et i+5° azim entre 175° et 180°  (OMEGA) (res : 0.2°)
;path_spectres = '/home/fandrieu/Inversion/Simulations/specul_slab_0215_r0.1_omega/specul_slab_0215_r0.1_omega_em0_C.cub'
;        envi_open_file, path_spectres, r_fid=data_fid_gs_1
;        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
;        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
;        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
;         
;npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
; path = '/home/fandrieu/Inversion/Simulations/specul_slab_0215_r0.1_omega/specul_slab_0215_r0.1_omega_em0.param'
;      
;      A = pdsread(path,  /bsq)
;      param_cub = A.core
;      label_gs_1 = A.label
;      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER')     
      

;;rough=1.0 emer entre i-5° et i+5° azim entre 175° et 180° ouverture source 0.02° ouverture observateur 4.2° (spectro IPAG) (res : 0.2°)
;path_spectres = '/home/fandrieu/Inversion/Simulations/specul_slab_0215_r1_ipag/specul_slab_0215_r1_ipag_em0_C.cub'
;        envi_open_file, path_spectres, r_fid=data_fid_gs_1
;        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
;        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
;        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
;         
;npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
; path = '/home/fandrieu/Inversion/Simulations/specul_slab_0215_r1_ipag/specul_slab_0215_r1_ipag_em0.param'
;      
;      A = pdsread(path,  /bsq)
;      param_cub = A.core
;      label_gs_1 = A.label
;      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER')

;rough=0.5 emer entre i-5° et i+5° azim entre 175° et 180° ouverture source 0.02° ouverture observateur 4.2° (spectro IPAG) (res : 0.2°)
path_spectres = '/home/fandrieu/Inversion/Simulations/specul_slab_0215_r0.5_ipag/specul_slab_0215_r0.5_ipag_em0_C.cub'
        envi_open_file, path_spectres, r_fid=data_fid_gs_1
        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
         
npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
 path = '/home/fandrieu/Inversion/Simulations/specul_slab_0215_r0.5_ipag/specul_slab_0215_r0.5_ipag_em0.param'
      
      A = pdsread(path,  /bsq)
      param_cub = A.core
      label_gs_1 = A.label
      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER')      
      
;;rough=0.5 emer entre i-5° et i+5° azim entre 175° et 180°  (OMEGA) (res : 0.2°)
;path_spectres = '/home/fandrieu/Inversion/Simulations/specul_slab_0215_r0.5_omega/specul_slab_0215_r0.5_omega_em0_C.cub'
;        envi_open_file, path_spectres, r_fid=data_fid_gs_1
;        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
;        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
;        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
;         
;npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
; path = '/home/fandrieu/Inversion/Simulations/specul_slab_0215_r0.5_omega/specul_slab_0215_r0.5_omega_em0.param'
;      
;      A = pdsread(path,  /bsq)
;      param_cub = A.core
;      label_gs_1 = A.label
;      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER')       
;;      
 
     
;;;      
;;;
;;rough=0.1 emer entre i-5° et i+5° azim entre 175° et 180° ouverture source 0.02° ouverture observateur 4.2° (spectro IPAG) (res : 0.2°)
;path_spectres = '/home/fandrieu/Inversion/Simulations/specul_slab_0215_r0.1_ipag/specul_slab_0215_r0.1_ipag_em0_C.cub'
;        envi_open_file, path_spectres, r_fid=data_fid_gs_1
;        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
;        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
;        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
;         
;npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
; path = '/home/fandrieu/Inversion/Simulations/specul_slab_0215_r0.1_ipag/specul_slab_0215_r0.1_ipag_em0.param'
;      
;      A = pdsread(path,  /bsq)
;      param_cub = A.core
;      label_gs_1 = A.label
;      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;  i=65°  ;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;rough=0.2 emer entre i-3° et i+3° azim entre 177° et 180° ouverture source 0.02° ouverture observateur 4.2° (spectro IPAG) (res azim : 0.05°)
;path_spectres = '/home/fandrieu/Inversion/Simulations/specul_slab_1114_2d_11/specul_slab_1114_2d_11_em0_C.cub'
;        envi_open_file, path_spectres, r_fid=data_fid_gs_1
;        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
;        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
;        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
;         
;npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
; path = '/home/fandrieu/Inversion/Simulations/specul_slab_1114_2d_11/specul_slab_1114_2d_11_em0.param'
;      
;      A = pdsread(path,  /bsq)
;      param_cub = A.core
;      label_gs_1 = A.label
;      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 

;;rough=variable emer entre i-5° et i+5° azim entre 175° et 180°  (IPAG) (res : 1°)
;path_spectres = '/home/fandrieu/Inversion/Simulations/arcelle_specul_0315_1/arcelle_specul_0315_1_em0_C.cub'
;        envi_open_file, path_spectres, r_fid=data_fid_gs_1
;        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
;        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
;        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
;         
;npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
; path = '/home/fandrieu/Inversion/Simulations/arcelle_specul_0315_1/arcelle_specul_0315_1_em0.param'
;      
;      A = pdsread(path,  /bsq)
;      param_cub = A.core
;      label_gs_1 = A.label
;      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER')  

plot_opt=2
plot_file='/home/fandrieu/Inversion/Tests_model/plot_specul_rough0.5_i50_ipag.png'
i=50.
num_wave=0;30
n_geom=dims_data_gs_1[2]+1
n_par=dims_data_gs_1[4]+1
param_cub_simu=param_cub
param_cub=reform(param_cub, n_geom*n_par,3)
cub_simu=fltarr(n_geom,n_par,nb)
cub_simu=reform(cub_10nm, n_geom,n_par,nb)
;param_cub_simu[*,*,0]=emergence
;param_cub_simu[*,*,1]=azimut
;param_cub_simu[*,*,2]=epaisseur (5mm ou 10mmm)
gg=  where(param_cub_simu[*,*,2] eq 10.); and param_cub_simu[*,*,1] eq 5.)
d=fltarr(n_elements(gg))
d[0:n_elements(gg)-1]=cub_10nm[gg,num_wave]
e=fltarr(n_elements(gg))
e[0:n_elements(gg)-1]=param_cub[gg,0]
az=fltarr(n_elements(gg))
az[0:n_elements(gg)-1]=param_cub[gg,1]
;plot, e,d, psym=1, symsize=0.4;, xrange=[39.,41.]
;oplot, e,d, psym=1, symsize=0.4, color=250

;d=d-min(d)
;d=alog(d+1.)
range=[min(d), max(d)]
range[1]=range[1]+range[1]/10000.
;range[1]=78.
;d[where(d gt range[1])]=range[1]
;range=[min(d), max(d)]
;range[1]=range[1]+range[1]/10000.
;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;; X ;;;;;;;;;;;;;
if plot_opt eq 1 then begin
;square
window,1, xsize=800, ysize=900
nsym=4
x=1.6
y=0.48
factx=2.7
facty=5.1
factx=0.6
facty=1.85
sx=factx*[-x,-x,x,x]
sy=facty*[-y,y,y,-y]
;sx=sx/2.
;sy=sy/2.
device,  decomposed=0
LOADCT,39 
erase,255
!P.BACKGROUND=255
!P.COLOR=0
!P.Font=1
;stretch, 0, 252
USERSYM, sx, sy, THICK=1, /FILL
plot, e, az, psym=3, xrange=[i-5.5, i+5.5], xstyle =1, yrange=[174.5, 185.5], ystyle =1, POSITION=[0.17, 0.1, 0.95, 0.75], charsize=1, charthick=1,$
xtitle='Emergence angle  ('+string(176B)+ ')', ytitle='Azimuth angle ('+string(176B)+ ')', xthick=4, ythick=4, xtickformat='(f5.1)', ytickformat='(f5.1)'
for i=0,n_elements(gg)-1 do oplot, [0,e[i]], [0,az[i]], color=(d[i]-min(d))/(max(range)-min(d))*255., psym=8, symsize=1
for i=0,n_elements(gg)-1 do oplot, [0,e[i]], [0,360.-az[i]], color=(d[i]-min(d))/(max(range)-min(d))*255., psym=8, symsize=1

;range=[min(d), max(d)]
COLORBAR, POSITION=[0.17, 0.85, 0.95, 0.90] , TITLE='Reflectance', maxrange=max(range), minrange=min(range), format='(f9.0)', charsize=2, charthick=1
endif
;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;; Z ;;;;;;;;;;;;;
if plot_opt eq 2 then begin
set_plot, 'z'
device, set_resolution=[800,900], SET_FONT='Times',decomposed=0, z_buffering=1, set_pixel_depth=24;,set_color=256
;device,  decomposed=0
LOADCT,39 
erase,255
!P.BACKGROUND=255
!P.COLOR=0
!P.Font=1
nsym=4
x=1.
y=1.

factx=1.3
facty=1.35
sx=factx*[-x,-x,x,x]
sy=facty*[-y,y,y,-y]
USERSYM, sx, sy, THICK=1, /FILL
plot, e, az, psym=3, xrange=[i-5.5, i+5.5], xstyle =1, yrange=[174.5, 185.5], ystyle =1, POSITION=[0.2, 0.13, 0.98, 0.78], charsize=3, charthick=1,$
xtitle='Emergence angle  ('+string(176B)+ ')', ytitle='Azimuth angle ('+string(176B)+ ')', xthick=4, ythick=4, xtickformat='(f5.1)', ytickformat='(f5.1)'
for i=0,n_elements(gg)-1 do oplot, [0,e[i]], [0,az[i]], color=(d[i]-min(d))/(max(range)-min(d))*255., psym=8, symsize=1
for i=0,n_elements(gg)-1 do oplot, [0,e[i]], [0,360.-az[i]], color=(d[i]-min(d))/(max(range)-min(d))*255., psym=8, symsize=1

;range=[min(d), max(d)]
COLORBAR, POSITION=[0.21, 0.88, 0.95 , 0.93] , TITLE='Reflectance', maxrange=max(range), minrange=min(range), format='(f9.0)', charsize=3, charthick=1

t=tvrd(true=1)
write_png, plot_file, t
device, /close
set_plot, 'X'
cub_simu=reform(cub_10nm, n_geom,n_par,nb)
endif
;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;



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

end


