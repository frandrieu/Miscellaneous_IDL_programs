function convert_phi_alpha, theta0, theta, phi

  mu=cos(!pi*theta/180.)        ;   cosinus of theta
  muo=cos(!pi*theta0/180.)      ;   cosinus of theta0 
  c_phi=cos(!pi*phi/180.)       ;   cosinus of the azimuth angle

; scattering angle (rad)
  if((muo EQ mu) AND (phi EQ 0.)) then alpha=!pi else $
     alpha=acos(-muo*mu-sqrt(1-muo^2)*sqrt(1-mu^2)*c_phi)

; phase angle (deg)
  return,(!pi-alpha)/!pi*180.
  
end


pro make_cube_glace_IPAG_4

output_file='/home/fandrieu/Inversion/Spectres_eau_IPAG/data_neige_slab_136e.sav'


inc=[40.,50.,60.] ; cas glace 1e
em=[0.,10.,20.]
az=[0.,45.,90.,140.,160.,180.]
dudu=0
geom=fltarr(n_elements(em)*n_elements(inc)*n_elements(az),4)
for i=0,n_elements(az)-1 do begin
  for j=0,n_elements(em)-1 do begin
    for k=0,n_elements(inc)-1 do begin
      geom[i*n_elements(em)*n_elements(inc)+j*n_elements(inc)+k,0]=inc[k]
      geom[i*n_elements(em)*n_elements(inc)+j*n_elements(inc)+k,1]=em[j]
      geom[i*n_elements(em)*n_elements(inc)+j*n_elements(inc)+k,2]=az[i]
    endfor 
  endfor
endfor
nuss=n_elements(em)*n_elements(inc)*n_elements(az)
for i=0,nuss-1 do geom[i,3]=convert_phi_alpha(geom[i,0], geom[i,1], geom[i,2])
geom1=geom
data=read_ascii('/home/fandrieu/Inversion/Spectres_eau_IPAG/Archive_sylvain/arcellelam_glace1e_data.dat')
cub=data.FIELD01
s=size(cub)
waves=cub[s[1]-1,*]
cube=fltarr(s[1]-1, s[2])
cube=cub[0:s[1]-2, *]
cub_data1=cube

;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;

inc=[40.,50.,60.] ; cas glace 3e
em=[0.,10.,20.]
az=[0.,45.,90.,140.,160.,180.]
dudu=0
geom=fltarr(n_elements(em)*n_elements(inc)*n_elements(az),4)
for i=0,n_elements(az)-1 do begin
  for j=0,n_elements(em)-1 do begin
    for k=0,n_elements(inc)-1 do begin
      geom[i*n_elements(em)*n_elements(inc)+j*n_elements(inc)+k,0]=inc[k]
      geom[i*n_elements(em)*n_elements(inc)+j*n_elements(inc)+k,1]=em[j]
      geom[i*n_elements(em)*n_elements(inc)+j*n_elements(inc)+k,2]=az[i]
    endfor 
  endfor
endfor
nuss=n_elements(em)*n_elements(inc)*n_elements(az)
for i=0,nuss-1 do geom[i,3]=convert_phi_alpha(geom[i,0], geom[i,1], geom[i,2])
geom3=geom
data=read_ascii('/home/fandrieu/Inversion/Spectres_eau_IPAG/Archive_sylvain/arcellelam_glace3e_data.dat')
cub=data.FIELD01
s=size(cub)
waves=cub[s[1]-1,*]
cube=fltarr(s[1]-1, s[2])
cube=cub[0:s[1]-2, *]
cub_data3=cube

;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;

inc=[40.,50.,60.,70.] ;cas glace 6e
em=[0.,10.,20.]
az=[0.,45.,90.,140.,160.,180.]
dudu=1
geom=fltarr(n_elements(em)*n_elements(inc)*n_elements(az),4)
for i=0,n_elements(az)-1 do begin
  for j=0,n_elements(em)-1 do begin
    for k=0,n_elements(inc)-1 do begin
      geom[i*n_elements(em)*n_elements(inc)+j*n_elements(inc)+k,0]=inc[k]
      geom[i*n_elements(em)*n_elements(inc)+j*n_elements(inc)+k,1]=em[j]
      geom[i*n_elements(em)*n_elements(inc)+j*n_elements(inc)+k,2]=az[i]
    endfor 
  endfor
endfor
nuss=n_elements(em)*n_elements(inc)*n_elements(az)
for i=0,nuss-1 do geom[i,3]=convert_phi_alpha(geom[i,0], geom[i,1], geom[i,2])
geom6=geom
data=read_ascii('/home/fandrieu/Inversion/Spectres_eau_IPAG/Archive_sylvain/arcellelam_glace6e_data.dat')
cub=data.FIELD01
s=size(cub)
waves=cub[s[1]-1,*]
cube=fltarr(s[1]-1, s[2])
cube=cub[0:s[1]-2, *]
cub_data6=cube

;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;

path_spectres = '/home/fandrieu/Inversion/Simulations/arcelle_slab_0315_4_r0.42/arcelle_slab_0315_4_r0.42_em0_C.cub'
        envi_open_file, path_spectres, r_fid=data_fid_gs_1
        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
         
npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
 path = '/home/fandrieu/Inversion/Simulations/arcelle_slab_0315_4_r0.42/arcelle_slab_0315_4_r0.42_em0.param'
      
      A = pdsread(path,  /bsq)
      param_cub_simu1 = A.core
      label_gs_1 = A.label
      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 
s1=size(param_cub_simu1)
cub_simu=cub_10nm
cub_simu1=reform(cub_simu, dims_data_gs_1[2]+1,dims_data_gs_1[4]+1,nb)

path_spectres = '/home/fandrieu/Inversion/Simulations/arcelle_slab_0315_5_r0.42/arcelle_slab_0315_5_r0.42_em0_C.cub'
        envi_open_file, path_spectres, r_fid=data_fid_gs_1
        envi_file_query, data_fid_gs_1, dims=dims_data_gs_2, wl=wl, nb=nb
        cub_10nm=fltarr((dims_data_gs_2[2]+1)*(dims_data_gs_2[4]+1),nb)
        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_2, pos=[ii] )
         
npix_gs_1=(dims_data_gs_2[2]+1)*(dims_data_gs_2[4]+1)
 path = '/home/fandrieu/Inversion/Simulations/arcelle_slab_0315_5_r0.42/arcelle_slab_0315_5_r0.42_em0.param'
      
      A = pdsread(path,  /bsq)
      param_cub_simu2 = A.core
      label_gs_1 = A.label
      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 
s2=size(param_cub_simu2)
cub_simu=cub_10nm
cub_simu2=reform(cub_simu, dims_data_gs_2[2]+1,dims_data_gs_2[4]+1,nb)
      
path_spectres = '/home/fandrieu/Inversion/Simulations/arcelle_slab_0315_6_r0.42/arcelle_slab_0315_6_r0.42_em0_C.cub'
        envi_open_file, path_spectres, r_fid=data_fid_gs_1
        envi_file_query, data_fid_gs_1, dims=dims_data_gs_3, wl=wl, nb=nb
        cub_10nm=fltarr((dims_data_gs_3[2]+1)*(dims_data_gs_3[4]+1),nb)
        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_3, pos=[ii] )
         
npix_gs_1=(dims_data_gs_3[2]+1)*(dims_data_gs_3[4]+1)
 path = '/home/fandrieu/Inversion/Simulations/arcelle_slab_0315_6_r0.42/arcelle_slab_0315_6_r0.42_em0.param'
      
      A = pdsread(path,  /bsq)
      param_cub_simu3 = A.core
      label_gs_1 = A.label
      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 
s3=size(param_cub_simu3)
cub_simu=cub_10nm
cub_simu3=reform(cub_simu, dims_data_gs_3[2]+1,dims_data_gs_3[4]+1,nb)

path_spectres = '/home/fandrieu/Inversion/Simulations/arcelle_slab_0315_7_r0.42/arcelle_slab_0315_7_r0.42_em0_C.cub'
        envi_open_file, path_spectres, r_fid=data_fid_gs_1
        envi_file_query, data_fid_gs_1, dims=dims_data_gs_4, wl=wl, nb=nb
        cub_10nm=fltarr((dims_data_gs_4[2]+1)*(dims_data_gs_4[4]+1),nb)
        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_4, pos=[ii] )
         
npix_gs_1=(dims_data_gs_4[2]+1)*(dims_data_gs_4[4]+1)
 path = '/home/fandrieu/Inversion/Simulations/arcelle_slab_0315_7_r0.42/arcelle_slab_0315_7_r0.42_em0.param'
      
      A = pdsread(path,  /bsq)
      param_cub_simu4 = A.core
      label_gs_1 = A.label
      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 
s4=size(param_cub_simu4)
cub_simu=cub_10nm
cub_simu4=reform(cub_simu, dims_data_gs_4[2]+1,dims_data_gs_4[4]+1,nb)

path_spectres = '/home/fandrieu/Inversion/Simulations/arcelle_slab_0315_8_r0.42/arcelle_slab_0315_8_r0.42_em0_C.cub'
        envi_open_file, path_spectres, r_fid=data_fid_gs_1
        envi_file_query, data_fid_gs_1, dims=dims_data_gs_5, wl=wl, nb=nb
        cub_10nm=fltarr((dims_data_gs_5[2]+1)*(dims_data_gs_5[4]+1),nb)
        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_5, pos=[ii] )
         
npix_gs_1=(dims_data_gs_5[2]+1)*(dims_data_gs_5[4]+1)
 path = '/home/fandrieu/Inversion/Simulations/arcelle_slab_0315_8_r0.42/arcelle_slab_0315_8_r0.42_em0.param'
      
      A = pdsread(path,  /bsq)
      param_cub_simu5 = A.core
      label_gs_1 = A.label
      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 
s5=size(param_cub_simu5)
cub_simu=cub_10nm
cub_simu5=reform(cub_simu, dims_data_gs_5[2]+1,dims_data_gs_5[4]+1,nb)


path_spectres = '/home/fandrieu/Inversion/Simulations/arcelle_slab_0615_4_r0.42/arcelle_slab_0615_4_r0.42_em0_C.cub'
        envi_open_file, path_spectres, r_fid=data_fid_gs_1
        envi_file_query, data_fid_gs_1, dims=dims_data_gs_6, wl=wl, nb=nb
        cub_10nm=fltarr((dims_data_gs_6[2]+1)*(dims_data_gs_6[4]+1),nb)
        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_6, pos=[ii] )
         
npix_gs_1=(dims_data_gs_6[2]+1)*(dims_data_gs_6[4]+1)
 path = '/home/fandrieu/Inversion/Simulations/arcelle_slab_0615_4_r0.42/arcelle_slab_0615_4_r0.42_em0.param'
      
      A = pdsread(path,  /bsq)
      param_cub_simu6 = A.core
      label_gs_1 = A.label
      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 
s6=size(param_cub_simu6)
cub_simu=cub_10nm
cub_simu6=reform(cub_simu, dims_data_gs_6[2]+1,dims_data_gs_6[4]+1,nb)

path_spectres = '/home/fandrieu/Inversion/Simulations/arcelle_slab_0615_5_r0.42/arcelle_slab_0615_5_r0.42_em0_C.cub'
        envi_open_file, path_spectres, r_fid=data_fid_gs_1
        envi_file_query, data_fid_gs_1, dims=dims_data_gs_7, wl=wl, nb=nb
        cub_10nm=fltarr((dims_data_gs_7[2]+1)*(dims_data_gs_7[4]+1),nb)
        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_7, pos=[ii] )
         
npix_gs_1=(dims_data_gs_7[2]+1)*(dims_data_gs_7[4]+1)
 path = '/home/fandrieu/Inversion/Simulations/arcelle_slab_0615_5_r0.42/arcelle_slab_0615_5_r0.42_em0.param'
      
      A = pdsread(path,  /bsq)
      param_cub_simu7 = A.core
      label_gs_1 = A.label
      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 
s7=size(param_cub_simu7)
cub_simu=cub_10nm
cub_simu7=reform(cub_simu, dims_data_gs_7[2]+1,dims_data_gs_7[4]+1,nb)
      
path_spectres = '/home/fandrieu/Inversion/Simulations/arcelle_slab_0615_6_r0.42/arcelle_slab_0615_6_r0.42_em0_C.cub'
        envi_open_file, path_spectres, r_fid=data_fid_gs_1
        envi_file_query, data_fid_gs_1, dims=dims_data_gs_8, wl=wl, nb=nb
        cub_10nm=fltarr((dims_data_gs_8[2]+1)*(dims_data_gs_8[4]+1),nb)
        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_8, pos=[ii] )
         
npix_gs_1=(dims_data_gs_8[2]+1)*(dims_data_gs_8[4]+1)
 path = '/home/fandrieu/Inversion/Simulations/arcelle_slab_0615_6_r0.42/arcelle_slab_0615_6_r0.42_em0.param'
      
      A = pdsread(path,  /bsq)
      param_cub_simu8 = A.core
      label_gs_1 = A.label
      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 
s8=size(param_cub_simu8)
cub_simu=cub_10nm
cub_simu8=reform(cub_simu, dims_data_gs_8[2]+1,dims_data_gs_8[4]+1,nb)

path_spectres = '/home/fandrieu/Inversion/Simulations/arcelle_slab_0615_7_r0.42/arcelle_slab_0615_7_r0.42_em0_C.cub'
        envi_open_file, path_spectres, r_fid=data_fid_gs_1
        envi_file_query, data_fid_gs_1, dims=dims_data_gs_9, wl=wl, nb=nb
        cub_10nm=fltarr((dims_data_gs_9[2]+1)*(dims_data_gs_9[4]+1),nb)
        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_9, pos=[ii] )
         
npix_gs_1=(dims_data_gs_9[2]+1)*(dims_data_gs_9[4]+1)
 path = '/home/fandrieu/Inversion/Simulations/arcelle_slab_0615_7_r0.42/arcelle_slab_0615_7_r0.42_em0.param'
      
      A = pdsread(path,  /bsq)
      param_cub_simu9 = A.core
      label_gs_1 = A.label
      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 
s9=size(param_cub_simu9)
cub_simu=cub_10nm
cub_simu9=reform(cub_simu, dims_data_gs_9[2]+1,dims_data_gs_9[4]+1,nb)

path_spectres = '/home/fandrieu/Inversion/Simulations/arcelle_slab_0615_8_r0.42/arcelle_slab_0615_8_r0.42_em0_C.cub'
        envi_open_file, path_spectres, r_fid=data_fid_gs_1
        envi_file_query, data_fid_gs_1, dims=dims_data_gs_10, wl=wl, nb=nb
        cub_10nm=fltarr((dims_data_gs_10[2]+1)*(dims_data_gs_10[4]+1),nb)
        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_10, pos=[ii] )
         
npix_gs_1=(dims_data_gs_10[2]+1)*(dims_data_gs_10[4]+1)
 path = '/home/fandrieu/Inversion/Simulations/arcelle_slab_0615_8_r0.42/arcelle_slab_0615_8_r0.42_em0.param'
      
      A = pdsread(path,  /bsq)
      param_cub_simu10 = A.core
      label_gs_1 = A.label
      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 
s10=size(param_cub_simu10)
cub_simu=cub_10nm
cub_simu10b=reform(cub_simu, dims_data_gs_10[2]+1,dims_data_gs_10[4]+1,nb)
ww=where(abs(param_cub_simu10[*,*,1]-60.) gt 0.01)
cub_simu10=fltarr(dims_data_gs_6[2]+1,dims_data_gs_10[4]+1,nb)
cub_simu10=cub_simu[ww,*]
cub_simu10=reform(cub_simu10, dims_data_gs_6[2]+1,dims_data_gs_10[4]+1,nb)
param_cub_simu10b=fltarr(dims_data_gs_6[2]+1,dims_data_gs_10[4]+1,nb)
param_cub_simu10=reform(param_cub_simu10, 45*1800l,5)
param_cub_simu10b=param_cub_simu10[ww,*]
param_cub_simu10=reform(param_cub_simu10b, dims_data_gs_6[2]+1,dims_data_gs_10[4]+1,5)



cub_simu=fltarr( dims_data_gs_3[2]+dims_data_gs_6[2]+2,dims_data_gs_1[4]+dims_data_gs_2[4]+dims_data_gs_3[4]+$
dims_data_gs_4[4]+dims_data_gs_5[4]+5,nb)
cub_simu[0:dims_data_gs_3[2],0:dims_data_gs_1[4],*]=cub_simu1
cub_simu[0:dims_data_gs_3[2],dims_data_gs_1[4]+1:dims_data_gs_1[4]+dims_data_gs_2[4]+1,*]=cub_simu2
cub_simu[0:dims_data_gs_3[2],dims_data_gs_1[4]+dims_data_gs_2[4]+2:dims_data_gs_1[4]+dims_data_gs_2[4]+dims_data_gs_3[4]+2,*]=cub_simu3
cub_simu[0:dims_data_gs_3[2],dims_data_gs_1[4]+dims_data_gs_2[4]+dims_data_gs_3[4]+3:dims_data_gs_1[4]+dims_data_gs_2[4]+dims_data_gs_3[4]+$
dims_data_gs_4[4]+3,*]=cub_simu4
cub_simu[0:dims_data_gs_3[2],dims_data_gs_1[4]+dims_data_gs_2[4]+dims_data_gs_3[4]+dims_data_gs_4[4]+4:dims_data_gs_1[4]+dims_data_gs_2[4]+$
dims_data_gs_3[4]+dims_data_gs_4[4]+dims_data_gs_5[4]+4,*]=cub_simu5

cub_simu[dims_data_gs_3[2]+1:dims_data_gs_3[2]+dims_data_gs_6[2]+1,0:dims_data_gs_1[4],*]=cub_simu6
cub_simu[dims_data_gs_3[2]+1:dims_data_gs_3[2]+dims_data_gs_6[2]+1,dims_data_gs_1[4]+1:dims_data_gs_1[4]+dims_data_gs_2[4]+1,*]=cub_simu7
cub_simu[dims_data_gs_3[2]+1:dims_data_gs_3[2]+dims_data_gs_6[2]+1,dims_data_gs_1[4]+dims_data_gs_2[4]+2:dims_data_gs_1[4]+dims_data_gs_2[4]+dims_data_gs_3[4]+2,*]=cub_simu8
cub_simu[dims_data_gs_3[2]+1:dims_data_gs_3[2]+dims_data_gs_6[2]+1,dims_data_gs_1[4]+dims_data_gs_2[4]+dims_data_gs_3[4]+3:dims_data_gs_1[4]+dims_data_gs_2[4]+dims_data_gs_3[4]+$
dims_data_gs_4[4]+3,*]=cub_simu9
cub_simu[dims_data_gs_3[2]+1:dims_data_gs_3[2]+dims_data_gs_6[2]+1,dims_data_gs_1[4]+dims_data_gs_2[4]+dims_data_gs_3[4]+dims_data_gs_4[4]+4:dims_data_gs_1[4]+dims_data_gs_2[4]+$
dims_data_gs_3[4]+dims_data_gs_4[4]+dims_data_gs_5[4]+4,*]=cub_simu10


param_cub_simu=fltarr( dims_data_gs_3[2]+dims_data_gs_6[2]+2,dims_data_gs_1[4]+dims_data_gs_2[4]+dims_data_gs_3[4]+$
dims_data_gs_4[4]+dims_data_gs_5[4]+5,s1[3])
param_cub_simu[0:dims_data_gs_3[2],0:dims_data_gs_1[4],*]=param_cub_simu1
param_cub_simu[0:dims_data_gs_3[2],dims_data_gs_1[4]+1:dims_data_gs_1[4]+dims_data_gs_2[4]+1,*]=param_cub_simu2
param_cub_simu[0:dims_data_gs_3[2],dims_data_gs_1[4]+dims_data_gs_2[4]+2:dims_data_gs_1[4]+dims_data_gs_2[4]+dims_data_gs_3[4]+2,*]=param_cub_simu3
param_cub_simu[0:dims_data_gs_3[2],dims_data_gs_1[4]+dims_data_gs_2[4]+dims_data_gs_3[4]+3:dims_data_gs_1[4]+dims_data_gs_2[4]+dims_data_gs_3[4]+$
dims_data_gs_4[4]+3,*]=param_cub_simu4
param_cub_simu[0:dims_data_gs_3[2],dims_data_gs_1[4]+dims_data_gs_2[4]+dims_data_gs_3[4]+dims_data_gs_4[4]+4:dims_data_gs_1[4]+dims_data_gs_2[4]+$
dims_data_gs_3[4]+dims_data_gs_4[4]+dims_data_gs_5[4]+4,*]=param_cub_simu5

param_cub_simu[dims_data_gs_3[2]+1:dims_data_gs_3[2]+dims_data_gs_6[2]+1,0:dims_data_gs_1[4],*]=param_cub_simu6
param_cub_simu[dims_data_gs_3[2]+1:dims_data_gs_3[2]+dims_data_gs_6[2]+1,dims_data_gs_1[4]+1:dims_data_gs_1[4]+dims_data_gs_2[4]+1,*]=param_cub_simu7
param_cub_simu[dims_data_gs_3[2]+1:dims_data_gs_3[2]+dims_data_gs_6[2]+1,dims_data_gs_1[4]+dims_data_gs_2[4]+2:dims_data_gs_1[4]+dims_data_gs_2[4]+dims_data_gs_3[4]+2,*]=param_cub_simu8
param_cub_simu[dims_data_gs_3[2]+1:dims_data_gs_3[2]+dims_data_gs_6[2]+1,dims_data_gs_1[4]+dims_data_gs_2[4]+dims_data_gs_3[4]+3:dims_data_gs_1[4]+dims_data_gs_2[4]+dims_data_gs_3[4]+$
dims_data_gs_4[4]+3,*]=param_cub_simu9
param_cub_simu[dims_data_gs_3[2]+1:dims_data_gs_3[2]+dims_data_gs_6[2]+1,dims_data_gs_1[4]+dims_data_gs_2[4]+dims_data_gs_3[4]+dims_data_gs_4[4]+4:dims_data_gs_1[4]+dims_data_gs_2[4]+$
dims_data_gs_3[4]+dims_data_gs_4[4]+dims_data_gs_5[4]+4,*]=param_cub_simu10

wavelengths=fltarr(nb)
wavelengths=wl

param_cub_data1=geom1
param_cub_data3=geom3
param_cub_data6=geom6
var='wavelengths, cub_simu, param_cub_simu, cub_data1, cub_data3, cub_data6, param_cub_data1, param_cub_data3, param_cub_data6, var,'
save, wavelengths, cub_simu, param_cub_simu, cub_data1, cub_data3, cub_data6, param_cub_data1, param_cub_data3, param_cub_data6, var, filename=output_file
print, output_file

end