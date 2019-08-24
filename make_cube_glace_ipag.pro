pro make_cube_glace_IPAG

output_file='/home/fandrieu/Inversion/Spectres_eau_IPAG/data_neige_slab_1e_v2.sav'

;;SEULEMENT POUR ARCELLESUB (NEIGE SEULE)
;inc=[0.,20.,30.,40.,50.,60.,65.]
;em=[0.,20.,30.,40.,50.,65.]
;az=[0.,45.,90.,140.,160.,180.]

;;SEULEMENT POUR ARCELLELAM_GLACE.. (SLAB SUR NEIGE)
;inc=[40.,50.,60.,70.] ;cas glace 6e
inc=[40.,50.,60.] ; cas glace 1e, glace 3e
em=[0.,10.,20.]
az=[0.,45.,90.,140.,160.,180.]
;;;;; glace 1e dudu=0 ;;;;;
;;;;; glace 3e dudu=0 ;;;;;
;;;;; glace 6e dudu=1 ;;;;;
dudu=0
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


data=read_ascii('/home/fandrieu/Inversion/Spectres_eau_IPAG/arcelle_waves.txt')
waves=data.FIELD1
;data=read_ascii('/home/fandrieu/Inversion/Spectres_eau_IPAG/Archive_sylvain/arcellesub_data.dat')
data=read_ascii('/home/fandrieu/Inversion/Spectres_eau_IPAG/Archive_sylvain/arcellelam_glace1e_data.dat')
;cub=data.FIELD001
cub=data.FIELD01
s=size(cub)
cube=fltarr(s[1]-1, s[2])
cube=cub[1:s[1]-1, *]
cub_data=cube;[*,26:70]

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;; CAS NEIGE ET SLAB ;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
rough=[0.1,1.,2.,3.,4.,5.,6.,7.,8.,9.]
nrough=n_elements(rough)
;;;;;;;;;;;;;;;;;;;;;;;;;;;
path_spectres = '/home/fandrieu/Inversion/Simulations/neige_slab_1014_res10nm/neige_slab_1014_res10nm_em0_C.cub'
        envi_open_file, path_spectres, r_fid=data_fid_gs_1
        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
         
npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
 path = '/home/fandrieu/Inversion/Simulations/neige_slab_1014_res10nm/neige_slab_1014_res10nm_em0.param'
      
      A = pdsread(path,  /bsq)
      param_cub_simu_1 = A.core
      label_gs_1 = A.label
      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 

path_spectres = '/home/fandrieu/Inversion/Simulations/neige_slab_1014_res19nm/neige_slab_1014_res19nm_em0_C.cub'
        envi_open_file, path_spectres, r_fid=data_fid_gs_1
        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
        cub_19nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
        for ii=0,nb-1 do cub_19nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
lim=where(wl gt 1.4)
limo=lim[0]       
cub_simu=cub_19nm
cub_simu[*,0:limo]=cub_10nm[*,0:limo]
cub_simu=reform(cub_simu, 72,200,nb)
cub_simu_1=cub_simu
;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;
path_spectres = '/home/fandrieu/Inversion/Simulations/neige_slab_1014_res10nm_2/neige_slab_1014_res10nm_2_em0_C.cub'
        envi_open_file, path_spectres, r_fid=data_fid_gs_1
        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
path_spectres = '/home/fandrieu/Inversion/Simulations/neige_slab_1014_res19nm_2/neige_slab_1014_res19nm_2_em0_C.cub'
        envi_open_file, path_spectres, r_fid=data_fid_gs_1
        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
        cub_19nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
        for ii=0,nb-1 do cub_19nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
cub_simu=cub_19nm
cub_simu[*,0:limo]=cub_10nm[*,0:limo]
cub_simu=reform(cub_simu, 72,200,nb)
cub_simu_2=cub_simu
;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;
path_spectres = '/home/fandrieu/Inversion/Simulations/neige_slab_1014_res10nm_3/neige_slab_1014_res10nm_3_em0_C.cub'
        envi_open_file, path_spectres, r_fid=data_fid_gs_1
        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
path_spectres = '/home/fandrieu/Inversion/Simulations/neige_slab_1014_res19nm_3/neige_slab_1014_res19nm_3_em0_C.cub'
        envi_open_file, path_spectres, r_fid=data_fid_gs_1
        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
        cub_19nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
        for ii=0,nb-1 do cub_19nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
cub_simu=cub_19nm
cub_simu[*,0:limo]=cub_10nm[*,0:limo]
cub_simu=reform(cub_simu, 72,200,nb)
cub_simu_3=cub_simu
;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;
path_spectres = '/home/fandrieu/Inversion/Simulations/neige_slab_1014_res10nm_4/neige_slab_1014_res10nm_4_em0_C.cub'
        envi_open_file, path_spectres, r_fid=data_fid_gs_1
        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
path_spectres = '/home/fandrieu/Inversion/Simulations/neige_slab_1014_res19nm_4/neige_slab_1014_res19nm_4_em0_C.cub'
        envi_open_file, path_spectres, r_fid=data_fid_gs_1
        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
        cub_19nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
        for ii=0,nb-1 do cub_19nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
cub_simu=cub_19nm
cub_simu[*,0:limo]=cub_10nm[*,0:limo]
cub_simu=reform(cub_simu, 72,200,nb)
cub_simu_4=cub_simu
;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;
path_spectres = '/home/fandrieu/Inversion/Simulations/neige_slab_1014_res10nm_5/neige_slab_1014_res10nm_5_em0_C.cub'
        envi_open_file, path_spectres, r_fid=data_fid_gs_1
        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
path_spectres = '/home/fandrieu/Inversion/Simulations/neige_slab_1014_res19nm_5/neige_slab_1014_res19nm_5_em0_C.cub'
        envi_open_file, path_spectres, r_fid=data_fid_gs_1
        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
        cub_19nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
        for ii=0,nb-1 do cub_19nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
cub_simu=cub_19nm
cub_simu[*,0:limo]=cub_10nm[*,0:limo]
cub_simu=reform(cub_simu, 72,200,nb)
cub_simu_5=cub_simu
;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;
path_spectres = '/home/fandrieu/Inversion/Simulations/neige_slab_1014_res10nm_6/neige_slab_1014_res10nm_6_em0_C.cub'
        envi_open_file, path_spectres, r_fid=data_fid_gs_1
        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
path_spectres = '/home/fandrieu/Inversion/Simulations/neige_slab_1014_res19nm_6/neige_slab_1014_res19nm_6_em0_C.cub'
        envi_open_file, path_spectres, r_fid=data_fid_gs_1
        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
        cub_19nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
        for ii=0,nb-1 do cub_19nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
cub_simu=cub_19nm
cub_simu[*,0:limo]=cub_10nm[*,0:limo]
cub_simu=reform(cub_simu, 72,200,nb)
cub_simu_6=cub_simu
;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;
path_spectres = '/home/fandrieu/Inversion/Simulations/neige_slab_1014_res10nm_7/neige_slab_1014_res10nm_7_em0_C.cub'
        envi_open_file, path_spectres, r_fid=data_fid_gs_1
        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
path_spectres = '/home/fandrieu/Inversion/Simulations/neige_slab_1014_res19nm_7/neige_slab_1014_res19nm_7_em0_C.cub'
        envi_open_file, path_spectres, r_fid=data_fid_gs_1
        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
        cub_19nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
        for ii=0,nb-1 do cub_19nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
cub_simu=cub_19nm
cub_simu[*,0:limo]=cub_10nm[*,0:limo]
cub_simu=reform(cub_simu, 72,200,nb)
cub_simu_7=cub_simu
;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;
path_spectres = '/home/fandrieu/Inversion/Simulations/neige_slab_1014_res10nm_8/neige_slab_1014_res10nm_8_em0_C.cub'
        envi_open_file, path_spectres, r_fid=data_fid_gs_1
        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
path_spectres = '/home/fandrieu/Inversion/Simulations/neige_slab_1014_res19nm_8/neige_slab_1014_res19nm_8_em0_C.cub'
        envi_open_file, path_spectres, r_fid=data_fid_gs_1
        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
        cub_19nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
        for ii=0,nb-1 do cub_19nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
cub_simu=cub_19nm
cub_simu[*,0:limo]=cub_10nm[*,0:limo]
cub_simu=reform(cub_simu, 72,200,nb)
cub_simu_8=cub_simu
;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;
path_spectres = '/home/fandrieu/Inversion/Simulations/neige_slab_1014_res10nm_9/neige_slab_1014_res10nm_9_em0_C.cub'
        envi_open_file, path_spectres, r_fid=data_fid_gs_1
        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
path_spectres = '/home/fandrieu/Inversion/Simulations/neige_slab_1014_res19nm_9/neige_slab_1014_res19nm_9_em0_C.cub'
        envi_open_file, path_spectres, r_fid=data_fid_gs_1
        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
        cub_19nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
        for ii=0,nb-1 do cub_19nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
cub_simu=cub_19nm
cub_simu[*,0:limo]=cub_10nm[*,0:limo]
cub_simu=reform(cub_simu, 72,200,nb)
cub_simu_9=cub_simu
;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;
path_spectres = '/home/fandrieu/Inversion/Simulations/neige_slab_1014_res10nm_dix/neige_slab_1014_res10nm_dix_em0_C.cub'
        envi_open_file, path_spectres, r_fid=data_fid_gs_1
        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
path_spectres = '/home/fandrieu/Inversion/Simulations/neige_slab_1014_res19nm_dix/neige_slab_1014_res19nm_dix_em0_C.cub'
        envi_open_file, path_spectres, r_fid=data_fid_gs_1
        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
        cub_19nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
        for ii=0,nb-1 do cub_19nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
cub_simu=cub_19nm
cub_simu[*,0:limo]=cub_10nm[*,0:limo]
cub_simu=reform(cub_simu, 72,200,nb)
cub_simu_10=cub_simu
;;;;;;;;;;;;;;;;;;;;;;;;;;;

cub_simu=fltarr(dims_data_gs_1[2]+1,nrough*(dims_data_gs_1[4]+1),nb)
cub_simu[*,0:dims_data_gs_1[4],*]=cub_simu_1
cub_simu[*,dims_data_gs_1[4]+1:2*(dims_data_gs_1[4]+1)-1,*]=cub_simu_2
cub_simu[*,2*(dims_data_gs_1[4]+1):3*(dims_data_gs_1[4]+1)-1,*]=cub_simu_3
cub_simu[*,3*(dims_data_gs_1[4]+1):4*(dims_data_gs_1[4]+1)-1,*]=cub_simu_4
cub_simu[*,4*(dims_data_gs_1[4]+1):5*(dims_data_gs_1[4]+1)-1,*]=cub_simu_5
cub_simu[*,5*(dims_data_gs_1[4]+1):6*(dims_data_gs_1[4]+1)-1,*]=cub_simu_6
cub_simu[*,6*(dims_data_gs_1[4]+1):7*(dims_data_gs_1[4]+1)-1,*]=cub_simu_7
cub_simu[*,7*(dims_data_gs_1[4]+1):8*(dims_data_gs_1[4]+1)-1,*]=cub_simu_8
cub_simu[*,8*(dims_data_gs_1[4]+1):9*(dims_data_gs_1[4]+1)-1,*]=cub_simu_9
cub_simu[*,9*(dims_data_gs_1[4]+1):10*(dims_data_gs_1[4]+1)-1,*]=cub_simu_10
s=size(param_cub_simu_1)
param_cub_simu=fltarr(s[1],nrough*s[2],s[3]+1)
for i=0,nrough-1 do begin
  param_cub_simu[*,i*(dims_data_gs_1[4]+1):(i+1)*(dims_data_gs_1[4]+1)-1,0:s[3]-1]=param_cub_simu_1
  param_cub_simu[*,i*(dims_data_gs_1[4]+1):(i+1)*(dims_data_gs_1[4]+1)-1,s[3]]=rough[i]
endfor

if dudu eq 0 then begin ;seul le cas glace6e contien l'incidence 70° on la retire donc des simus pour les autres cas
  gg= where(abs(param_cub_simu[*,*,2]-70.) ge 1.)
  cub_simu=reform(cub_simu,(dims_data_gs_1[2]+1)*nrough*(dims_data_gs_1[4]+1),nb)
  cub_simu_2=cub_simu[gg,*]
  cub_simu=reform(cub_simu_2,fix(float(n_elements(gg))/float(nrough*(dims_data_gs_1[4]+1))),nrough*(dims_data_gs_1[4]+1),nb)
  param_cub_simu=reform(param_cub_simu,(dims_data_gs_1[2]+1)*nrough*(dims_data_gs_1[4]+1),s[3]+1)
  param_cub_simu_2=param_cub_simu[gg,*]
  param_cub_simu=reform(param_cub_simu_2,fix(float(n_elements(gg))/float(nrough*(dims_data_gs_1[4]+1))),nrough*(dims_data_gs_1[4]+1),s[3]+1)
endif  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;; CAS NEIGE SEULE ;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;path_spectres = '/home/fandrieu/Inversion/Simulations/granul_neige_0914_res10nm_2/granul_neige_0914_res10nm_2_em0_C.cub'
;        envi_open_file, path_spectres, r_fid=data_fid_gs_1
;        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
;        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
;        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
;         
;npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
; path = '/home/fandrieu/Inversion/Simulations/granul_neige_0914_res10nm_2/granul_neige_0914_res10nm_2_em0.param'
;      
;      A = pdsread(path,  /bsq)
;      param_cub_simu = A.core
;      label_gs_1 = A.label
;      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 
;
;path_spectres = '/home/fandrieu/Inversion/Simulations/granul_neige_0914_res19nm_2/granul_neige_0914_res19nm_2_em0_C.cub'
;        envi_open_file, path_spectres, r_fid=data_fid_gs_1
;        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
;        cub_19nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
;        for ii=0,nb-1 do cub_19nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
        
;path_spectres = '/home/fandrieu/Inversion/Simulations/granul_neige_1014_res10nm_2/granul_neige_1014_res10nm_2_em0_C.cub'
;        envi_open_file, path_spectres, r_fid=data_fid_gs_1
;        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
;        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
;        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
;         
;npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
; path = '/home/fandrieu/Inversion/Simulations/granul_neige_1014_res10nm_2/granul_neige_1014_res10nm_2_em0.param'
;      
;      A = pdsread(path,  /bsq)
;      param_cub_simu = A.core
;      label_gs_1 = A.label
;      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 
;
;path_spectres = '/home/fandrieu/Inversion/Simulations/granul_neige_1014_res19nm_2/granul_neige_1014_res19nm_2_em0_C.cub'
;        envi_open_file, path_spectres, r_fid=data_fid_gs_1
;        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
;        cub_19nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
;        for ii=0,nb-1 do cub_19nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
;         

;path_spectres = '/home/fandrieu/Inversion/Simulations/granul_neige_1014_res10nm_3/granul_neige_1014_res10nm_3_em0_C.cub'
;        envi_open_file, path_spectres, r_fid=data_fid_gs_1
;        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
;        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
;        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
;         
;npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
; path = '/home/fandrieu/Inversion/Simulations/granul_neige_1014_res10nm_3/granul_neige_1014_res10nm_3_em0.param'
;      
;      A = pdsread(path,  /bsq)
;      param_cub_simu = A.core
;      label_gs_1 = A.label
;      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 
;
;path_spectres = '/home/fandrieu/Inversion/Simulations/granul_neige_1014_res19nm_3/granul_neige_1014_res19nm_3_em0_C.cub'
;        envi_open_file, path_spectres, r_fid=data_fid_gs_1
;        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
;        cub_19nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
;        for ii=0,nb-1 do cub_19nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
;         
;
;path_spectres = '/home/fandrieu/Inversion/Simulations/granul_neige_1014_res10nm_6/granul_neige_1014_res10nm_6_em0_C.cub'
;        envi_open_file, path_spectres, r_fid=data_fid_gs_1
;        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
;        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
;        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
;         
;npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
; path = '/home/fandrieu/Inversion/Simulations/granul_neige_1014_res10nm_6/granul_neige_1014_res10nm_6_em0.param'
;      
;      A = pdsread(path,  /bsq)
;      param_cub_simu = A.core
;      label_gs_1 = A.label
;      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 
;
;path_spectres = '/home/fandrieu/Inversion/Simulations/granul_neige_1014_res19nm_6/granul_neige_1014_res19nm_6_em0_C.cub'
;        envi_open_file, path_spectres, r_fid=data_fid_gs_1
;        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
;        cub_19nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
;        for ii=0,nb-1 do cub_19nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;        

;cub_simu=cub_19nm
;cub_simu[*,0:limo]=cub_10nm[*,0:limo]
;cub_simu=reform(cub_simu, 72,200,nb)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


wavelengths=fltarr(nb)
wavelengths=wl


param_cub_data=geom
var='wavelengths, cub_simu, param_cub_simu, cub_data, param_cub_data'
save, wavelengths, cub_simu, param_cub_simu, cub_data, param_cub_data, var, filename=output_file
print, output_file

end