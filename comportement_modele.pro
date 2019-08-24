pro comportement_modele

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;; Choix du paramétre à tester ;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Paramétre à tester : 
;               par=1 --> h : épaisseur
;               par=2 --> c : compacité
;               par=3 --> g : taille de grain des impuretés
;
;plot_option : 
;               plot_option=1 : plot 'X' Visualisation
;               plot_option=2 : plot 'Z' Sauvegarde de la courbe
;
par=1
plot_option=1
plot_name='/home/fandrieu/Inversion/Tests_model/Comportement_model_h_3.png'
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;     Géométries diponibles     ;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;         incidence : 0,20,50
;         emergence : 0,10,40
;         azimut    : 0,90,180
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

num_wave=0
incid=50.
emer=10.
azim=180.
h=100.
c=1.
g=1000.
h_list=[1.,10.,100.]
c_list=[0.999,0.9999,1.]
g_list=[10.,100.,1000.]


cd, '/home/fandrieu/Simu_IPAG/pro/'
resolve_routine, 'legend'
cd, '/home/fandrieu'

types=['n=1 ; k=1e-16', 'n=1.5 ; k=1e-3', 'n=1.5 ; k=1e-9', 'n=1.1 ; k=1e-3','n=1.1 ; k=1e-9']

;;;;;; X ;;;;;;;;;;;;;;
if plot_option eq 1 then begin
window,0, xsize=1300, ysize=900
device,  decomposed=0;,set_color=256
endif
;;;;;; Z ;;;;;;;;;;;;;;
if plot_option eq 2 then begin
set_plot, 'z'
endif
;;;;;;;;;;;;;;;;;;;;;;;
x=1
y=1
sx=[-x,-x,x,x]
sy=[-y,y,y,-y]
USERSYM, sx, sy, THICK=1, /FILL


;;;;;; Z ;;;;;;;;;;;;;;
if plot_option eq 2 then begin
device, set_resolution=[1300,900], SET_FONT='Times',decomposed=0, z_buffering=1, set_pixel_depth=24;,set_color=256
endif
;;;;;;;;;;;;;;;;;;;;;;;

LOADCT,39
erase,255
!P.BACKGROUND=255
!P.COLOR=0
!P.Font=1
ma=0.
mi=1.
coun=0
repeat begin
  for i=0,4 do begin
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;;;;;;;;;;;;;;;; Créer le cube de simulations ;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  
  
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;;;;;;;;;;;;; Inclusions bulles (vide n=1 k=1.e-16) ;;;;;;;;;;;;;;;;;;;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    if i eq 0 then begin
      ;rough=0.5 ouverture source 0.02° ouverture observateur 4.2° (spectro IPAG)
      path_spectres = '/home/fandrieu/Inversion/Simulations/comportement_model_0.5_h_1/comportement_model_0.5_h_1_em0_C.cub'
      envi_open_file, path_spectres, r_fid=data_fid_h
      envi_file_query, data_fid_h, dims=dims_data_h, wl=wl, nb=nb
      cub_h=fltarr((dims_data_h[2]+1)*(dims_data_h[4]+1),nb)
      for ii=0,nb-1 do cub_h[*,ii] = ENVI_GET_DATA(fid=data_fid_h, dims=dims_data_h, pos=[ii] )
      
      npix_h=(dims_data_h[2]+1)*(dims_data_h[4]+1)
      path = '/home/fandrieu/Inversion/Simulations/comportement_model_0.5_h_1/comportement_model_0.5_h_1_em0.param'
      
      A = pdsread(path,  /bsq)
      param_cub_h = A.core
      label_h = A.label
      wave_h = get_keyword(A.label, 'BAND_BIN_CENTER')
      
      ;rough=0.5 ouverture source 0.02° ouverture observateur 4.2° (spectro IPAG)
      path_spectres = '/home/fandrieu/Inversion/Simulations/comportement_model_0.5_c_1/comportement_model_0.5_c_1_em0_C.cub'
      envi_open_file, path_spectres, r_fid=data_fid_c
      envi_file_query, data_fid_c, dims=dims_data_c, wl=wl, nb=nb
      cub_c=fltarr((dims_data_c[2]+1)*(dims_data_c[4]+1),nb)
      for ii=0,nb-1 do cub_c[*,ii] = ENVI_GET_DATA(fid=data_fid_c, dims=dims_data_c, pos=[ii] )
      
      npix_c=(dims_data_c[2]+1)*(dims_data_c[4]+1)
      path = '/home/fandrieu/Inversion/Simulations/comportement_model_0.5_c_1/comportement_model_0.5_c_1_em0.param'
      
      A = pdsread(path,  /bsq)
      param_cub_c = A.core
      label_c = A.label
      wave_c = get_keyword(A.label, 'BAND_BIN_CENTER')
      
      ;rough=0.5 ouverture source 0.02° ouverture observateur 4.2° (spectro IPAG)
      path_spectres = '/home/fandrieu/Inversion/Simulations/comportement_model_0.5_g_1/comportement_model_0.5_g_1_em0_C.cub'
      envi_open_file, path_spectres, r_fid=data_fid_g
      envi_file_query, data_fid_g, dims=dims_data_g, wl=wl, nb=nb
      cub_g=fltarr((dims_data_g[2]+1)*(dims_data_g[4]+1),nb)
      for ii=0,nb-1 do cub_g[*,ii] = ENVI_GET_DATA(fid=data_fid_g, dims=dims_data_g, pos=[ii] )
      
      npix_g=(dims_data_g[2]+1)*(dims_data_g[4]+1)
      path = '/home/fandrieu/Inversion/Simulations/comportement_model_0.5_g_1/comportement_model_0.5_g_1_em0.param'
      
      A = pdsread(path,  /bsq)
      param_cub_g = A.core
      label_g = A.label
      wave_g = get_keyword(A.label, 'BAND_BIN_CENTER')
    endif
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;;;;;;;;;;;;; Inclusions nbig kbig (n=1.5 k=1.e-3) ;;;;;;;;;;;;;;;;;;;;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    if i eq 1 then begin
      ;rough=0.5 ouverture source 0.02° ouverture observateur 4.2° (spectro IPAG)
      path_spectres = '/home/fandrieu/Inversion/Simulations/comportement_model_0.5_h_1_nbig_kbig/comportement_model_0.5_h_1_nbig_kbig_em0_C.cub'
      envi_open_file, path_spectres, r_fid=data_fid_h
      envi_file_query, data_fid_h, dims=dims_data_h, wl=wl, nb=nb
      cub_h=fltarr((dims_data_h[2]+1)*(dims_data_h[4]+1),nb)
      for ii=0,nb-1 do cub_h[*,ii] = ENVI_GET_DATA(fid=data_fid_h, dims=dims_data_h, pos=[ii] )
      
      npix_h=(dims_data_h[2]+1)*(dims_data_h[4]+1)
      path = '/home/fandrieu/Inversion/Simulations/comportement_model_0.5_h_1_nbig_kbig/comportement_model_0.5_h_1_nbig_kbig_em0.param'
      
      A = pdsread(path,  /bsq)
      param_cub_h = A.core
      label_h = A.label
      wave_h = get_keyword(A.label, 'BAND_BIN_CENTER')
      
      ;rough=0.5 ouverture source 0.02° ouverture observateur 4.2° (spectro IPAG)
      path_spectres = '/home/fandrieu/Inversion/Simulations/comportement_model_0.5_c_1_nbig_kbig/comportement_model_0.5_c_1_nbig_kbig_em0_C.cub'
      envi_open_file, path_spectres, r_fid=data_fid_c
      envi_file_query, data_fid_c, dims=dims_data_c, wl=wl, nb=nb
      cub_c=fltarr((dims_data_c[2]+1)*(dims_data_c[4]+1),nb)
      for ii=0,nb-1 do cub_c[*,ii] = ENVI_GET_DATA(fid=data_fid_c, dims=dims_data_c, pos=[ii] )
      
      npix_c=(dims_data_c[2]+1)*(dims_data_c[4]+1)
      path = '/home/fandrieu/Inversion/Simulations/comportement_model_0.5_c_1_nbig_kbig/comportement_model_0.5_c_1_nbig_kbig_em0.param'
      
      A = pdsread(path,  /bsq)
      param_cub_c = A.core
      label_c = A.label
      wave_c = get_keyword(A.label, 'BAND_BIN_CENTER')
      
      ;rough=0.5 ouverture source 0.02° ouverture observateur 4.2° (spectro IPAG)
      path_spectres = '/home/fandrieu/Inversion/Simulations/comportement_model_0.5_g_1_nbig_kbig/comportement_model_0.5_g_1_nbig_kbig_em0_C.cub'
      envi_open_file, path_spectres, r_fid=data_fid_g
      envi_file_query, data_fid_g, dims=dims_data_g, wl=wl, nb=nb
      cub_g=fltarr((dims_data_g[2]+1)*(dims_data_g[4]+1),nb)
      for ii=0,nb-1 do cub_g[*,ii] = ENVI_GET_DATA(fid=data_fid_g, dims=dims_data_g, pos=[ii] )
      
      npix_g=(dims_data_g[2]+1)*(dims_data_g[4]+1)
      path = '/home/fandrieu/Inversion/Simulations/comportement_model_0.5_g_1_nbig_kbig/comportement_model_0.5_g_1_nbig_kbig_em0.param'
      
      A = pdsread(path,  /bsq)
      param_cub_g = A.core
      label_g = A.label
      wave_g = get_keyword(A.label, 'BAND_BIN_CENTER')
    endif
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;;;;;;;;;;;;; Inclusions nbig ksmall (n=1.5 k=1.e-9) ;;;;;;;;;;;;;;;;;;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    if i eq 2 then begin
      ;rough=0.5 ouverture source 0.02° ouverture observateur 4.2° (spectro IPAG)
      path_spectres = '/home/fandrieu/Inversion/Simulations/comportement_model_0.5_h_1_nbig_ksmall/comportement_model_0.5_h_1_nbig_ksmall_em0_C.cub'
      envi_open_file, path_spectres, r_fid=data_fid_h
      envi_file_query, data_fid_h, dims=dims_data_h, wl=wl, nb=nb
      cub_h=fltarr((dims_data_h[2]+1)*(dims_data_h[4]+1),nb)
      for ii=0,nb-1 do cub_h[*,ii] = ENVI_GET_DATA(fid=data_fid_h, dims=dims_data_h, pos=[ii] )
      
      npix_h=(dims_data_h[2]+1)*(dims_data_h[4]+1)
      path = '/home/fandrieu/Inversion/Simulations/comportement_model_0.5_h_1_nbig_ksmall/comportement_model_0.5_h_1_nbig_ksmall_em0.param'
      
      A = pdsread(path,  /bsq)
      param_cub_h = A.core
      label_h = A.label
      wave_h = get_keyword(A.label, 'BAND_BIN_CENTER')
      
      ;rough=0.5 ouverture source 0.02° ouverture observateur 4.2° (spectro IPAG)
      path_spectres = '/home/fandrieu/Inversion/Simulations/comportement_model_0.5_c_1_nbig_ksmall/comportement_model_0.5_c_1_nbig_ksmall_em0_C.cub'
      envi_open_file, path_spectres, r_fid=data_fid_c
      envi_file_query, data_fid_c, dims=dims_data_c, wl=wl, nb=nb
      cub_c=fltarr((dims_data_c[2]+1)*(dims_data_c[4]+1),nb)
      for ii=0,nb-1 do cub_c[*,ii] = ENVI_GET_DATA(fid=data_fid_c, dims=dims_data_c, pos=[ii] )
      
      npix_c=(dims_data_c[2]+1)*(dims_data_c[4]+1)
      path = '/home/fandrieu/Inversion/Simulations/comportement_model_0.5_c_1_nbig_ksmall/comportement_model_0.5_c_1_nbig_ksmall_em0.param'
      
      A = pdsread(path,  /bsq)
      param_cub_c = A.core
      label_c = A.label
      wave_c = get_keyword(A.label, 'BAND_BIN_CENTER')
      
      ;rough=0.5 ouverture source 0.02° ouverture observateur 4.2° (spectro IPAG)
      path_spectres = '/home/fandrieu/Inversion/Simulations/comportement_model_0.5_g_1_nbig_ksmall/comportement_model_0.5_g_1_nbig_ksmall_em0_C.cub'
      envi_open_file, path_spectres, r_fid=data_fid_g
      envi_file_query, data_fid_g, dims=dims_data_g, wl=wl, nb=nb
      cub_g=fltarr((dims_data_g[2]+1)*(dims_data_g[4]+1),nb)
      for ii=0,nb-1 do cub_g[*,ii] = ENVI_GET_DATA(fid=data_fid_g, dims=dims_data_g, pos=[ii] )
      
      npix_g=(dims_data_g[2]+1)*(dims_data_g[4]+1)
      path = '/home/fandrieu/Inversion/Simulations/comportement_model_0.5_g_1_nbig_ksmall/comportement_model_0.5_g_1_nbig_ksmall_em0.param'
      
      A = pdsread(path,  /bsq)
      param_cub_g = A.core
      label_g = A.label
      wave_g = get_keyword(A.label, 'BAND_BIN_CENTER')
    endif
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;;;;;;;;;;;;; Inclusions nsmall kbig (n=1.1 k=1.e-3) ;;;;;;;;;;;;;;;;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    if i eq 3 then begin
      ;rough=0.5 ouverture source 0.02° ouverture observateur 4.2° (spectro IPAG)
      path_spectres = '/home/fandrieu/Inversion/Simulations/comportement_model_0.5_h_1_nsmall_kbig/comportement_model_0.5_h_1_nsmall_kbig_em0_C.cub'
      envi_open_file, path_spectres, r_fid=data_fid_h
      envi_file_query, data_fid_h, dims=dims_data_h, wl=wl, nb=nb
      cub_h=fltarr((dims_data_h[2]+1)*(dims_data_h[4]+1),nb)
      for ii=0,nb-1 do cub_h[*,ii] = ENVI_GET_DATA(fid=data_fid_h, dims=dims_data_h, pos=[ii] )
      
      npix_h=(dims_data_h[2]+1)*(dims_data_h[4]+1)
      path = '/home/fandrieu/Inversion/Simulations/comportement_model_0.5_h_1_nsmall_kbig/comportement_model_0.5_h_1_nsmall_kbig_em0.param'
      
      A = pdsread(path,  /bsq)
      param_cub_h = A.core
      label_h = A.label
      wave_h = get_keyword(A.label, 'BAND_BIN_CENTER')
      
      ;rough=0.5 ouverture source 0.02° ouverture observateur 4.2° (spectro IPAG)
      path_spectres = '/home/fandrieu/Inversion/Simulations/comportement_model_0.5_c_1_nsmall_kbig/comportement_model_0.5_c_1_nsmall_kbig_em0_C.cub'
      envi_open_file, path_spectres, r_fid=data_fid_c
      envi_file_query, data_fid_c, dims=dims_data_c, wl=wl, nb=nb
      cub_c=fltarr((dims_data_c[2]+1)*(dims_data_c[4]+1),nb)
      for ii=0,nb-1 do cub_c[*,ii] = ENVI_GET_DATA(fid=data_fid_c, dims=dims_data_c, pos=[ii] )
      
      npix_c=(dims_data_c[2]+1)*(dims_data_c[4]+1)
      path = '/home/fandrieu/Inversion/Simulations/comportement_model_0.5_c_1_nsmall_kbig/comportement_model_0.5_c_1_nsmall_kbig_em0.param'
      
      A = pdsread(path,  /bsq)
      param_cub_c = A.core
      label_c = A.label
      wave_c = get_keyword(A.label, 'BAND_BIN_CENTER')
      
      ;rough=0.5 ouverture source 0.02° ouverture observateur 4.2° (spectro IPAG)
      path_spectres = '/home/fandrieu/Inversion/Simulations/comportement_model_0.5_g_1_nsmall_kbig/comportement_model_0.5_g_1_nsmall_kbig_em0_C.cub'
      envi_open_file, path_spectres, r_fid=data_fid_g
      envi_file_query, data_fid_g, dims=dims_data_g, wl=wl, nb=nb
      cub_g=fltarr((dims_data_g[2]+1)*(dims_data_g[4]+1),nb)
      for ii=0,nb-1 do cub_g[*,ii] = ENVI_GET_DATA(fid=data_fid_g, dims=dims_data_g, pos=[ii] )
      
      npix_g=(dims_data_g[2]+1)*(dims_data_g[4]+1)
      path = '/home/fandrieu/Inversion/Simulations/comportement_model_0.5_g_1_nsmall_kbig/comportement_model_0.5_g_1_nsmall_kbig_em0.param'
      
      A = pdsread(path,  /bsq)
      param_cub_g = A.core
      label_g = A.label
      wave_g = get_keyword(A.label, 'BAND_BIN_CENTER')
    endif
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;;;;;;;;;;;;; Inclusions nsmall ksmall (n=1.1 k=1.e-9) ;;;;;;;;;;;;;;;;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    if i eq 4 then begin
      ;rough=0.5 ouverture source 0.02° ouverture observateur 4.2° (spectro IPAG)
      path_spectres = '/home/fandrieu/Inversion/Simulations/comportement_model_0.5_h_1_nsmall_ksmall/comportement_model_0.5_h_1_nsmall_ksmall_em0_C.cub'
      envi_open_file, path_spectres, r_fid=data_fid_h
      envi_file_query, data_fid_h, dims=dims_data_h, wl=wl, nb=nb
      cub_h=fltarr((dims_data_h[2]+1)*(dims_data_h[4]+1),nb)
      for ii=0,nb-1 do cub_h[*,ii] = ENVI_GET_DATA(fid=data_fid_h, dims=dims_data_h, pos=[ii] )
      
      npix_h=(dims_data_h[2]+1)*(dims_data_h[4]+1)
      path = '/home/fandrieu/Inversion/Simulations/comportement_model_0.5_h_1_nsmall_ksmall/comportement_model_0.5_h_1_nsmall_ksmall_em0.param'
      
      A = pdsread(path,  /bsq)
      param_cub_h = A.core
      label_h = A.label
      wave_h = get_keyword(A.label, 'BAND_BIN_CENTER')
      
      ;rough=0.5 ouverture source 0.02° ouverture observateur 4.2° (spectro IPAG)
      path_spectres = '/home/fandrieu/Inversion/Simulations/comportement_model_0.5_c_1_nsmall_ksmall/comportement_model_0.5_c_1_nsmall_ksmall_em0_C.cub'
      envi_open_file, path_spectres, r_fid=data_fid_c
      envi_file_query, data_fid_c, dims=dims_data_c, wl=wl, nb=nb
      cub_c=fltarr((dims_data_c[2]+1)*(dims_data_c[4]+1),nb)
      for ii=0,nb-1 do cub_c[*,ii] = ENVI_GET_DATA(fid=data_fid_c, dims=dims_data_c, pos=[ii] )
      
      npix_c=(dims_data_c[2]+1)*(dims_data_c[4]+1)
      path = '/home/fandrieu/Inversion/Simulations/comportement_model_0.5_c_1_nsmall_ksmall/comportement_model_0.5_c_1_nsmall_ksmall_em0.param'
      
      A = pdsread(path,  /bsq)
      param_cub_c = A.core
      label_c = A.label
      wave_c = get_keyword(A.label, 'BAND_BIN_CENTER')
      
      ;rough=0.5 ouverture source 0.02° ouverture observateur 4.2° (spectro IPAG)
      path_spectres = '/home/fandrieu/Inversion/Simulations/comportement_model_0.5_g_1_nsmall_ksmall/comportement_model_0.5_g_1_nsmall_ksmall_em0_C.cub'
      envi_open_file, path_spectres, r_fid=data_fid_g
      envi_file_query, data_fid_g, dims=dims_data_g, wl=wl, nb=nb
      cub_g=fltarr((dims_data_g[2]+1)*(dims_data_g[4]+1),nb)
      for ii=0,nb-1 do cub_g[*,ii] = ENVI_GET_DATA(fid=data_fid_g, dims=dims_data_g, pos=[ii] )
      
      npix_g=(dims_data_g[2]+1)*(dims_data_g[4]+1)
      path = '/home/fandrieu/Inversion/Simulations/comportement_model_0.5_g_1_nsmall_ksmall/comportement_model_0.5_g_1_nsmall_ksmall_em0.param'
      
      A = pdsread(path,  /bsq)
      param_cub_g = A.core
      label_g = A.label
      wave_g = get_keyword(A.label, 'BAND_BIN_CENTER')
    endif
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    
    if par eq 1 then begin
      Param_cube_simu=param_cub_h
      cub_simu=cub_h
      npix_simu=npix_h
    endif
    if par eq 2 then begin
      Param_cube_simu=param_cub_c
      cub_simu=cub_c
      npix_simu=npix_c
    endif
    if par eq 3 then begin
      Param_cube_simu=param_cub_g
      cub_simu=cub_g
      npix_simu=npix_g
    endif
    
    inc_simu=Param_cube_simu[*,*,2]
    emer_simu=Param_cube_simu[*,*,0]
    azim_simu=Param_cube_simu[*,*,1]
    h_simu=Param_cube_simu[*,*,3]
    c_simu=Param_cube_simu[*,*,4]
    g_simu=Param_cube_simu[*,*,5]
    Param_cube_simu=reform(Param_cube_simu, npix_simu, 6)
    
    a=inc_simu
    incid_mod=a[uniq(a,sort(a))]
    s_incid = n_elements(incid_mod)
    inc_x=incid_mod
    
    a=emer_simu
    emerg_mod=a[uniq(a,sort(a))]
    s_emerg = n_elements(emerg_mod)
    em_x=emerg_mod
    
    a=azim_simu
    azim_mod=a[uniq(a,sort(a))]
    s_azim = n_elements(azim_mod)
    azim_x=azim_mod
    
    a=h_simu
    h_slab_mod=a[uniq(a,sort(a))]
    s_h_slab = n_elements(h_slab_mod)
    h_x=h_slab_mod
    
    a=c_simu
    c_slab_mod =  a[uniq(a,sort(a))]
    s_c_slab = n_elements(c_slab_mod)
    c_x=c_slab_mod
    
    a=g_simu
    grainsize_H2O_slab_mod =  a[uniq(a,sort(a))]
    s_grainsize_H2O_slab = n_elements(grainsize_H2O_slab_mod)
    g_x=grainsize_H2O_slab_mod
    
    
    
    
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;;;;;;;;;;;;;;;;;;; Sélection des paramétres ;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    if par eq 1 then begin
      w_simu=where(inc_simu eq incid and emer_simu eq emer and azim_simu eq azim and $
        c_simu eq c and g_simu eq g)
      cub_simu_geom=cub_simu[w_simu,*]
      comport=cub_simu_geom[*,num_wave]
      x_axis=h_x
    endif
    if par eq 2 then begin
      w_simu=where(inc_simu eq incid and emer_simu eq emer and azim_simu eq azim and $
        h_simu eq h and g_simu eq g)
      cub_simu_geom=cub_simu[w_simu,*]
      comport=cub_simu_geom[*,num_wave]
      x_axis=1.-c_x
      x_axis[n_elements(x_axis)-1]=1.e-7
    endif
    if par eq 3 then begin
      w_simu=where(inc_simu eq incid and emer_simu eq emer and azim_simu eq azim and $
        h_simu eq h and c_simu eq c)
      cub_simu_geom=cub_simu[w_simu,*]
      comport=cub_simu_geom[*,num_wave]
      x_axis=g_x
    endif
    
    if ma ge max(comport) and mi le min(comport) then coun=coun+1
    if max(comport) gt ma then ma=max(comport)
    if min(comport) lt mi then mi=min(comport)
    






if i eq 0 then begin
if par eq 1 then begin
plot, x_axis,comport, charsize=2, charthick=2, xtitle='Slab thickness (mm)', thick=3, $
ytitle='Reflectance', xthick=3, ythick=3, xtickformat='(f5.1)', ytickformat='(f8.1)', xstyle=1, $
xrange=[min(x_axis),max(x_axis)], title='i = '+string(incid, format='(f4.1)')+string(176B)+'   e= '+$
string(emer, format='(f4.1)')+string(176B)+'   !9y'+'!1 = '+string(azim, format='(f4.0)')+string(176B)+$
'   p='+string((1.-c)*1.e6, format='(f7.0)')+'ppm'+'   g='+string(g, format='(f5.0)')+string(181B)+'m', yrange=[0.,ma], ystyle=1 
endif
if par eq 2 then begin
plot, 1.e6*x_axis,comport, charsize=2, charthick=2, xtitle='Volumetric proportion of inclusions (ppm)', thick=3, $
ytitle='Reflectance', xthick=3, ythick=3, xtickformat='(f8.1)', ytickformat='(f8.3)', xstyle=1, $
xrange=[min(1.e6*x_axis),max(1.e6*x_axis)], /xlog, ystyle=1, title='i = '+string(incid, format='(f4.1)')+string(176B)+$
'   e= '+string(emer, format='(f4.1)')+string(176B)+'   !9y'+'!1 = '+string(azim, format='(f4.0)')+string(176B)+$
'   h='+string(h, format='(f4.0)')+'mm'+'   g='+string(g, format='(f5.0)')+string(181B)+'m', yrange=[mi,ma];,yrange=[min(comport), max(comport)]
endif
if par eq 3 then begin
plot, x_axis,comport, charsize=2, charthick=2, xtitle='Radius of the inclusions ('+string(181B)+'m)', thick=5, $
ytitle='Reflectance', xthick=3, ythick=3, xtickformat='(f8.1)', ytickformat='(f8.2)', xstyle=1, $
xrange=[min(x_axis),max(x_axis)], /xlog, ystyle=1, title='i = '+string(incid, format='(f4.1)')+string(176B)+$
'   e= '+string(emer, format='(f4.1)')+string(176B)+'   !9y'+'!1 = '+string(azim, format='(f4.0)')+string(176B)+$
'   h='+string(h, format='(f4.0)')+'mm'+'   p='+string((1.-c)*1.e6, format='(f7.0)')+'ppm', yrange=[mi,ma];, yrange=[min(comport)-0.05, max(comport)]
endif
if par eq 2 then begin
legend, ['Inclusions type :'], thick=3, pos=[280, 560],CHARTHICK=2,CHARSIZE=2,COLORS=0,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
legend, ['n=1 ; k=1e-16 (bubbles)'], psym=0, thick=3, pos=[280, 520],CHARTHICK=2,CHARSIZE=2,COLORS=0,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
endif else begin
legend, ['Inclusions type :'], thick=3, pos=[780, 820],CHARTHICK=2,CHARSIZE=2,COLORS=0,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
legend, ['n=1 ; k=1e-16 (bubbles)'], psym=0, thick=3, pos=[780, 780],CHARTHICK=2,CHARSIZE=2,COLORS=0,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
endelse
endif else begin
if par eq 1 then begin
oplot, x_axis,comport, thick=3, color=fix(float(i)/4.01*255.)
legend, types[i], psym=0, thick=3, pos=[780, 780-i*40],CHARTHICK=2,CHARSIZE=2,COLORS=fix(float(i)/4.01*255.),TEXTCOLORS=0,OUTLINE_COLOR=255,/device
endif
if par eq 2 then begin
oplot, 1.e6*x_axis,comport, thick=3, color=fix(float(i)/4.01*255.)
legend, types[i], psym=0, thick=3, pos=[280, 520-i*40],CHARTHICK=2,CHARSIZE=2,COLORS=fix(float(i)/4.01*255.),TEXTCOLORS=0,OUTLINE_COLOR=255,/device
endif
if par eq 3 then begin
oplot, x_axis,comport, thick=3, color=fix(float(i)/4.01*255.) 
legend, types[i], psym=0, thick=3, pos=[780, 780-i*40],CHARTHICK=2,CHARSIZE=2,COLORS=fix(float(i)/4.01*255.),TEXTCOLORS=0,OUTLINE_COLOR=255,/device
endif
endelse
endfor

  endrep until (coun ge 5)
;;;;;; Z ;;;;;;;;;;;;;;
if plot_option eq 2 then begin
plot_file=plot_name
t=tvrd(true=1)
write_png, plot_file, t
device, /close
set_plot, 'X'
endif
;;;;;;;;;;;;;;;;;;;;;;;





end