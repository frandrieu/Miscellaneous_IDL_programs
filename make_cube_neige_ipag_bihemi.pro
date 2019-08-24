function vraissemblance_ln_mat, d, dd, invertC, npix ; pour 1 spectre observé d, plusieurs spectre de la base de donnee dd
;L=dblarr(npix)
d2=fltarr(npix, n_elements(d))
for i=0,n_elements(d)-1 do d2[*,i]=replicate(d[i], npix)
mat1 = invertC ## (dd-d2) 
dif=dd-d2 
;for i=0,npix-1 do begin
;diff=dif[i,*]
;line=mat1[i,*]
;L[i]=-0.5* transpose(diff)  ## line
;endfor
L=-0.5*total(dif*mat1,2)
return, L

end


pro make_cube_neige_IPAG_bihemi

output_file='/home/fandrieu/Inversion/Spectres_eau_IPAG/data_neige_sub_r10.sav'

n=0
;;SEULEMENT POUR ARCELLESUB (NEIGE SEULE)
inc=[0.,20.,30.,40.,50.,60.,65.]
dinc=[10.,15.,10.,10.,10.,7.5,27.5]
em=[0.,20.,30.,40.,50.,65.]
dem=[10.,15.,10.,10.,12.5,32.5]
az=[0.,45.,90.,140.,160.,180.]
daz=[22.5,45.,47.5,35.,20.,10.]*2. ; *2 pour symetrie plan principal
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
cube=cub[1:s[1]-1, *]
cub_data=cube;[*,26:70]
param_cub_data=geom
rs=fltarr(s[2])
sum=fltarr(s[2])

for wave=0, s[2]-1 do begin
sum[wave]=0.
di=0.
de=0.
dpsi=0;
dphi=0.

  for j=0,n_elements(em)-1 do begin
    emer=em[j]
    for k=0,n_elements(az)-1 do begin
      for i=0,n_elements(inc)-1 do begin
        incid=inc[i]
        azim=az[k]
        ggd=  where(param_cub_data[*,0] eq incid and param_cub_data[*,1] eq emer and param_cub_data[*,2] eq azim)
        r=cub_data[ggd[0],wave]
        if ( finite(r) ) then begin
          di=di+dinc[i]*!pi/180.
          de=de+dem[j]*!pi/180.
          dpsi=dpsi+daz[k]*!pi/180.
          dphi=2.*!pi
          sum[wave]=sum[wave]+cos(incid*!pi/180.)*cos(emer*!pi/180.)*sin(incid*!pi/180.)*sin(emer*!pi/180.)/(!pi^2)*di*de*dphi*dpsi
          rs[wave]=rs[wave]+r*cos(incid*!pi/180.)*cos(emer*!pi/180.)*sin(incid*!pi/180.)*sin(emer*!pi/180.)/(!pi^2)*di*de*dphi*dpsi
          di=0.
          de=0.
          dpsi=0.
        endif else begin
          di=di+dinc[i]*!pi/180.
          de=de+dem[j]*!pi/180.
          dpsi=dpsi+daz[k]*!pi/180.
        endelse
      endfor
    endfor
  endfor
  rs[wave]=rs[wave]/sum[wave]
endfor  
;plot, waves, rs, yrange=[0.,1.5]  
;for i=0,250 do oplot, waves, cub_data[i,*], color=200
;oplot, waves, rs, thick=2
d=rs

path_spectres = '/home/fandrieu/Inversion/Simulations/granul_neige_simu_arcelle_sale_lambert_2_0315_res10nm/granul_neige_simu_arcelle_sale_lambert_2_0315_res10nm_em0_C.cub'
        envi_open_file, path_spectres, r_fid=data_fid_gs_1
        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
         
npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
 path = '/home/fandrieu/Inversion/Simulations/granul_neige_simu_arcelle_sale_lambert_2_0315_res10nm/granul_neige_simu_arcelle_sale_lambert_2_0315_res10nm_em0.param'
      
      A = pdsread(path,  /bsq)
      param_cub_simu = A.core
      label_gs_1 = A.label
      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER') 

n_geom_simu=dims_data_gs_1[2]+1
n_par=dims_data_gs_1[4]+1
cub_simu=cub_10nm
cub_simu=reform(cub_simu, n_geom_simu,n_par,nb)


wavelengths=fltarr(nb)
wavelengths=wl
n_waves=n_elements(wavelengths)

;param_cub_data=geom
;var='wavelengths, cub_simu, param_cub_simu, cub_data, param_cub_data'
;save, wavelengths, cub_simu, param_cub_simu, cub_data, param_cub_data, var, filename=output_file
;print, output_file



dd=cub_simu[0,*,n:n_waves-1]
dd=reform(dd, n_par,n_waves-n)

gbl=where(finite(d)); and (wavelengths lt 0.9 or wavelengths gt 1.1) )
du=d[gbl]
dude=dd[*, gbl]
waves=wavelengths[n:n_waves-1]
wavelengths=waves
invertC = diag_matrix(replicate(1,n_elements(gbl))) ; !!!ONLY FOR LEAST SQUARES METHOD!!!
L=vraissemblance_ln_mat(du, dude, invertC, n_par)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
bf=where(l eq max(l))
print, param_cub_simu[0,bf[0],*]
plot, wavelengths, d
oplot, wavelengths, dd[bf[0],*], color=150


gw=param_cub_simu[0,*,4]
pw=param_cub_simu[0,*,1]
gd=param_cub_simu[0,*,5]
pd=param_cub_simu[0,*,2]

i0=cub_simu[0,*,*]/cos(inc[0]*!pi/180.)
i1=cub_simu[1,*,*]/cos(inc[1]*!pi/180.)
i2=cub_simu[2,*,*]/cos(inc[2]*!pi/180.)
i3=cub_simu[3,*,*]/cos(inc[3]*!pi/180.)
i4=cub_simu[4,*,*]/cos(inc[4]*!pi/180.)
i5=cub_simu[5,*,*]/cos(inc[5]*!pi/180.)
i6=cub_simu[6,*,*]/cos(inc[6]*!pi/180.)
dudu=0.



end