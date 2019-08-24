pro make_cube_glace_IPAG_2

output_file='/home/fandrieu/Inversion/Spectres_eau_IPAG/data_neige_slab_1e.sav'

;;SEULEMENT POUR ARCELLESUB (NEIGE SEULE)
;inc=[0.,20.,30.,40.,50.,60.,65.]
;em=[0.,20.,30.,40.,50.,65.]
;az=[0.,45.,90.,140.,160.,180.]

;;SEULEMENT POUR ARCELLELAM_GLACE.. (SLAB SUR NEIGE)
inc=[40.,50.,60.,70.] ;cas glace 6e
inc=[40.,50.,60.] ; cas glace 1e, glace 3e
em=[0.,10.,20.]
az=[0.,45.,90.,140.,160.,180.]
;;;;; glace 1e dudu=0 ;;;;;
;;;;; glace 3e dudu=0 ;;;;;
;;;;; glace 6e dudu=1 ;;;;;
dudu=0
;geom=fltarr(n_elements(em)*n_elements(inc)*n_elements(az),3)
;for i=0,n_elements(inc)-1 do begin
;  for j=0,n_elements(az)-1 do begin
;    for k=0,n_elements(em)-1 do begin
;      geom[i*n_elements(em)*n_elements(az)+j*n_elements(em)+k,0]=inc[i]
;      geom[i*n_elements(em)*n_elements(az)+j*n_elements(em)+k,1]=em[k]
;      geom[i*n_elements(em)*n_elements(az)+j*n_elements(em)+k,2]=az[j]
;    endfor 
;  endfor
;endfor

geom=fltarr(n_elements(em)*n_elements(inc)*n_elements(az),3)
for i=0,n_elements(az)-1 do begin
  for j=0,n_elements(em)-1 do begin
    for k=0,n_elements(inc)-1 do begin
      geom[i*n_elements(em)*n_elements(inc)+j*n_elements(inc)+k,0]=inc[k]
      geom[i*n_elements(em)*n_elements(inc)+j*n_elements(inc)+k,1]=em[j]
      geom[i*n_elements(em)*n_elements(inc)+j*n_elements(inc)+k,2]=az[i]
    endfor 
  endfor
endfor



;data=read_ascii('/home/fandrieu/Inversion/Spectres_eau_IPAG/arcelle_waves.txt')
;waves=data.FIELD1
;data=read_ascii('/home/fandrieu/Inversion/Spectres_eau_IPAG/Archive_sylvain/arcellesub_data.dat')
data=read_ascii('/home/fandrieu/Inversion/Spectres_eau_IPAG/Archive_sylvain/arcellelam_glace1e_data.dat')
;cub=data.FIELD001
cub=data.FIELD01
s=size(cub)
waves=cub[s[1]-1,*]
cube=fltarr(s[1]-1, s[2])
cube=cub[0:s[1]-2, *]
cub_data=cube;[*,26:70]

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;; CAS NEIGE ET SLAB ;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;rough=[0.1,1.,2.5,5.]
;nrough=n_elements(rough)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;path_spectres = '/home/fandrieu/Inversion/Simulations/arcelle_slab_0315_2_r0.1/arcelle_slab_0315_2_r0.1_em0_C.cub'
;        envi_open_file, path_spectres, r_fid=data_fid_gs_1
;        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
;        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
;        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
;         
;npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
; path = '/home/fandrieu/Inversion/Simulations/arcelle_slab_0315_2_r0.1/arcelle_slab_0315_2_r0.1_em0.param'
;      
;      A = pdsread(path,  /bsq)
;      param_cub_simu_1 = A.core
;      label_gs_1 = A.label
;      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 
;
;cub_simu_1=cub_10nm
;
;path_spectres = '/home/fandrieu/Inversion/Simulations/arcelle_slab_0315_2_r0.42/arcelle_slab_0315_2_r0.42_em0_C.cub'
;        envi_open_file, path_spectres, r_fid=data_fid_gs_1
;        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
;        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
;        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
;         
;npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
; path = '/home/fandrieu/Inversion/Simulations/arcelle_slab_0315_2_r0.42/arcelle_slab_0315_2_r0.42_em0.param'
;      
;      A = pdsread(path,  /bsq)
;      param_cub_simu_1 = A.core
;      label_gs_1 = A.label
;      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 
;
;cub_simu_2=cub_10nm
;
;path_spectres = '/home/fandrieu/Inversion/Simulations/arcelle_slab_0315_2_r2.0/arcelle_slab_0315_2_r2.0_em0_C.cub'
;        envi_open_file, path_spectres, r_fid=data_fid_gs_1
;        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
;        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
;        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
;         
;npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
; path = '/home/fandrieu/Inversion/Simulations/arcelle_slab_0315_2_r2.0/arcelle_slab_0315_2_r2.0_em0.param'
;      
;      A = pdsread(path,  /bsq)
;      param_cub_simu_1 = A.core
;      label_gs_1 = A.label
;      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 
;
;cub_simu_3=cub_10nm
;
;path_spectres = '/home/fandrieu/Inversion/Simulations/arcelle_slab_0315_2_r3.0/arcelle_slab_0315_2_r3.0_em0_C.cub'
;        envi_open_file, path_spectres, r_fid=data_fid_gs_1
;        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
;        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
;        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
;         
;npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
; path = '/home/fandrieu/Inversion/Simulations/arcelle_slab_0315_2_r3.0/arcelle_slab_0315_2_r3.0_em0.param'
;      
;      A = pdsread(path,  /bsq)
;      param_cub_simu_1 = A.core
;      label_gs_1 = A.label
;      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 
;
;cub_simu_4=cub_10nm
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;cub_simu=fltarr(dims_data_gs_1[2]+1,nrough*(dims_data_gs_1[4]+1),nb)
;cub_simu[*,0:dims_data_gs_1[4],*]=cub_simu_1
;cub_simu[*,dims_data_gs_1[4]+1:2*(dims_data_gs_1[4]+1)-1,*]=cub_simu_2
;cub_simu[*,2*(dims_data_gs_1[4]+1):3*(dims_data_gs_1[4]+1)-1,*]=cub_simu_3
;cub_simu[*,3*(dims_data_gs_1[4]+1):4*(dims_data_gs_1[4]+1)-1,*]=cub_simu_4
;s=size(param_cub_simu_1)
;param_cub_simu=fltarr(s[1],nrough*s[2],s[3]+1)
;for i=0,nrough-1 do begin
;  param_cub_simu[*,i*(dims_data_gs_1[4]+1):(i+1)*(dims_data_gs_1[4]+1)-1,0:s[3]-1]=param_cub_simu_1
;  param_cub_simu[*,i*(dims_data_gs_1[4]+1):(i+1)*(dims_data_gs_1[4]+1)-1,s[3]]=rough[i]
;endfor

;if dudu eq 0 then begin ;seul le cas glace6e contien l'incidence 70° on la retire donc des simus pour les autres cas
;  gg= where(abs(param_cub_simu[*,*,2]-70.) ge 1.)
;  cub_simu=reform(cub_simu,(dims_data_gs_1[2]+1)*nrough*(dims_data_gs_1[4]+1),nb)
;  cub_simu_2=cub_simu[gg,*]
;  cub_simu=reform(cub_simu_2,fix(float(n_elements(gg))/float(nrough*(dims_data_gs_1[4]+1))),nrough*(dims_data_gs_1[4]+1),nb)
;  param_cub_simu=reform(param_cub_simu,(dims_data_gs_1[2]+1)*nrough*(dims_data_gs_1[4]+1),s[3]+1)
;  param_cub_simu_2=param_cub_simu[gg,*]
;  param_cub_simu=reform(param_cub_simu_2,fix(float(n_elements(gg))/float(nrough*(dims_data_gs_1[4]+1))),nrough*(dims_data_gs_1[4]+1),s[3]+1)
;endif  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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
s4=size(param_cub_simu3)
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
s5=size(param_cub_simu3)
cub_simu=cub_10nm
cub_simu5=reform(cub_simu, dims_data_gs_5[2]+1,dims_data_gs_5[4]+1,nb)

cub_simu=fltarr( dims_data_gs_3[2]+1,dims_data_gs_1[4]+dims_data_gs_2[4]+dims_data_gs_3[4]+$
dims_data_gs_4[4]+dims_data_gs_5[4]+5,nb)
cub_simu[*,0:dims_data_gs_1[4],*]=cub_simu1
cub_simu[*,dims_data_gs_1[4]+1:dims_data_gs_1[4]+dims_data_gs_2[4]+1,*]=cub_simu2
cub_simu[*,dims_data_gs_1[4]+dims_data_gs_2[4]+2:dims_data_gs_1[4]+dims_data_gs_2[4]+dims_data_gs_3[4]+2,*]=cub_simu3
cub_simu[*,dims_data_gs_1[4]+dims_data_gs_2[4]+dims_data_gs_3[4]+3:dims_data_gs_1[4]+dims_data_gs_2[4]+dims_data_gs_3[4]+$
dims_data_gs_4[4]+3,*]=cub_simu4
cub_simu[*,dims_data_gs_1[4]+dims_data_gs_2[4]+dims_data_gs_3[4]+dims_data_gs_4[4]+4:dims_data_gs_1[4]+dims_data_gs_2[4]+$
dims_data_gs_3[4]+dims_data_gs_4[4]+dims_data_gs_5[4]+4,*]=cub_simu5
param_cub_simu=fltarr( dims_data_gs_3[2]+1,dims_data_gs_1[4]+dims_data_gs_2[4]+dims_data_gs_3[4]+dims_data_gs_4[4]+dims_data_gs_5[4]+5,s1[3])
param_cub_simu[*,0:dims_data_gs_1[4],*]=param_cub_simu1
param_cub_simu[*,dims_data_gs_1[4]+1:dims_data_gs_1[4]+dims_data_gs_2[4]+1,*]=param_cub_simu2
param_cub_simu[*,dims_data_gs_1[4]+dims_data_gs_2[4]+2:dims_data_gs_1[4]+dims_data_gs_2[4]+dims_data_gs_3[4]+2,*]=param_cub_simu3
param_cub_simu[*,dims_data_gs_1[4]+dims_data_gs_2[4]+dims_data_gs_3[4]+3:dims_data_gs_1[4]+dims_data_gs_2[4]+dims_data_gs_3[4]+$
dims_data_gs_4[4]+3,*]=param_cub_simu4
param_cub_simu[*,dims_data_gs_1[4]+dims_data_gs_2[4]+dims_data_gs_3[4]+dims_data_gs_4[4]+4:dims_data_gs_1[4]+dims_data_gs_2[4]+$
dims_data_gs_3[4]+dims_data_gs_4[4]+dims_data_gs_5[4]+4,*]=param_cub_simu5

wavelengths=fltarr(nb)
wavelengths=wl

param_cub_data=geom
var='wavelengths, cub_simu, param_cub_simu, cub_data, param_cub_data'
save, wavelengths, cub_simu, param_cub_simu, cub_data, param_cub_data, var, filename=output_file
print, output_file

end