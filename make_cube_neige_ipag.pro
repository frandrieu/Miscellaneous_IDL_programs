pro make_cube_neige_IPAG

output_file='/home/fandrieu/Inversion/Spectres_eau_IPAG/data_neige_sub.sav'

;;SEULEMENT POUR ARCELLESUB (NEIGE SEULE)
inc=[0.,20.,30.,40.,50.,60.,65.]
em=[0.,20.,30.,40.,50.,65.]
az=[0.,45.,90.,140.,160.,180.]
n_geom=n_elements(em)*n_elements(inc)*n_elements(az)
geom=fltarr(n_geom,3)
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
data=read_ascii('/home/fandrieu/Inversion/Spectres_eau_IPAG/Archive_sylvain/arcellesub_data.dat')

cub=data.FIELD001
s=size(cub)
cube=fltarr(s[1]-1, s[2])
cube=cub[0:s[1]-2, *]
cub_data=cube;[*,26:70]


path_spectres = '/home/fandrieu/Inversion/Simulations/granul_neige_1014_res10nm_7/granul_neige_1014_res10nm_7_em0_C.cub'
        envi_open_file, path_spectres, r_fid=data_fid_gs_1
        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
         
npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
 path = '/home/fandrieu/Inversion/Simulations/granul_neige_1014_res10nm_7/granul_neige_1014_res10nm_7_em0.param'
      
      A = pdsread(path,  /bsq)
      param_cub_simu_1 = A.core
      label_gs_1 = A.label
      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 

cub_simu=cub_10nm
cub_simu_1=reform(cub_simu, dims_data_gs_1[2]+1,dims_data_gs_1[4]+1,nb)
cub_simu=cub_simu_1
param_cub_simu=param_cub_simu_1

;cub_simu=cub_simu_1[0,*,*]
;cub_simu=reform(cub_simu, dims_data_gs_1[4]+1,nb)
;param=param_cub_simu_1[0,*,[1,2,4,5]]
;param_cub_simu=reform(param, dims_data_gs_1[4]+1,4)


;rough=[1.,5.];,10.,15.,25.]
;nrough=n_elements(rough)
;cub_simu=fltarr(dims_data_gs_1[2]+1,nrough*(dims_data_gs_1[4]+1),nb)
;s=size(param_cub_simu_1)
;param_cub_simu=fltarr(s[1],s[2]*n_elements(rough),s[3]+1)
;cub_simu[*,0:dims_data_gs_1[4],*]=cub_simu_1
;cub_simu[*,dims_data_gs_1[4]+1:2*(dims_data_gs_1[4]+1)-1,*]=cub_simu_2
;;cub_simu[*,dims_data_gs_1[4]+1:2*(dims_data_gs_1[4]+1)-1,*]=cub_simu_3
;;cub_simu[*,dims_data_gs_1[4]+1:2*(dims_data_gs_1[4]+1)-1,*]=cub_simu_4
;;cub_simu[*,dims_data_gs_1[4]+1:2*(dims_data_gs_1[4]+1)-1,*]=cub_simu_5
;
;for i=0,nrough-1 do begin
;  param_cub_simu[*,i*(dims_data_gs_1[4]+1):(i+1)*(dims_data_gs_1[4]+1)-1,0:s[3]-1]=param_cub_simu_1
;  param_cub_simu[*,i*(dims_data_gs_1[4]+1):(i+1)*(dims_data_gs_1[4]+1)-1,s[3]]=rough[i]
;endfor




wavelengths=fltarr(nb)
wavelengths=wl


param_cub_data=geom
var='wavelengths, cub_simu, param_cub_simu, cub_data, param_cub_data'
save, wavelengths, cub_simu, param_cub_simu, cub_data, param_cub_data, var, filename=output_file
print, output_file

end