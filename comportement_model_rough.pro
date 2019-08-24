pro comportement_model_rough

plot_option=2 ;1=X ; 2=Z
spectral_option=0 ; 0=une seule longueur d'onde ; 1=spectral
h_mod=20. ; choose between [0.5,5,10,20,50,100,200]
incid=50.
emer=10. ; choose between [10,40]
azim=180.
num_wave=20;30
num_wave_list=[0,10,20,26,31,46,61]
;num_wave :  0 <--> 0.6µm 0
;           10 <--> 0.8µm 1
;           20 <--> 1.0µm 2
;           31 <--> 1.2µm 3
;           46 <--> 1.5µm 4
;           61 <--> 1.8µm 5
;           


path_spectres = '/home/fandrieu/Inversion/Simulations/comportement_model_rough_pure_spectrum_0515/comportement_model_rough_pure_spectrum_0515_em0_C.cub'
envi_open_file, path_spectres, r_fid=data_fid_a
envi_file_query, data_fid_a, dims=dims_data_a, wl=wl, nb=nb
cub_a=fltarr((dims_data_a[2]+1)*(dims_data_a[4]+1),nb)
for ii=0,nb-1 do cub_a[*,ii] = ENVI_GET_DATA(fid=data_fid_a, dims=dims_data_a, pos=[ii] )
npix_a=(dims_data_a[2]+1)*(dims_data_a[4]+1)
path = '/home/fandrieu/Inversion/Simulations/comportement_model_rough_pure_spectrum_0515/comportement_model_rough_pure_spectrum_0515_em0.param'
A = pdsread(path,  /bsq)
param_cube_simu = A.core
label_a = A.label
wave_a = get_keyword(A.label, 'BAND_BIN_CENTER')

plot_file='/home/fandrieu/Inversion/Tests_model/Comportement_model_rough_h'+$
string(h_mod, format='(f5.1)')+'_lambda'+string(wl[num_wave], format='(f5.1)')+'.png'
plot_file=strcompress(plot_file, /remove_all)

cub_simu=cub_a
inc_simu=50.
emer_simu=Param_cube_simu[*,*,0]
rough_simu=Param_cube_simu[*,*,1]
h_simu=Param_cube_simu[*,*,2]
npix_simu=(dims_data_a[2]+1)*(dims_data_a[4]+1)
Param_cube_simu=reform(Param_cube_simu, npix_simu, 3)
 
a=emer_simu
emerg_mod=a[uniq(a,sort(a))]
s_emerg = n_elements(emerg_mod)
em_x=emerg_mod

a=h_simu
h_slab_mod=a[uniq(a,sort(a))]
s_h_slab = n_elements(h_slab_mod)
h_x=h_slab_mod
    
a=rough_simu
rough_slab_mod =  a[uniq(a,sort(a))]
s_rough_slab = n_elements(rough_slab_mod)
rough_x=rough_slab_mod

    
    
    
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;; Sélection des paramétres ;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
w_simu=where( emer_simu eq emer and h_simu eq h_mod)
cub_simu_rough=cub_simu[w_simu,*]
if(spectral_option eq 0) then begin
comport=cub_simu_rough[*,num_wave]
endif
x_axis=rough_x
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;; Sélection du mode de plot ;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;; X ;;;;;;;;;;;;;;
if plot_option eq 1 then begin
window,0, xsize=800, ysize=600
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
device, set_resolution=[800,600], SET_FONT='Times',decomposed=0, z_buffering=1, set_pixel_depth=24;,set_color=256
endif
;;;;;;;;;;;;;;;;;;;;;;;

LOADCT,39
erase,255
!P.BACKGROUND=255
!P.COLOR=0
!P.Font=1      

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
if(spectral_option eq 0) then begin
plot, x_axis,comport, charsize=2, charthick=2, xtitle='Roughness parameter ('+string(176B)+')', thick=4, $
ytitle='Reflectance', xthick=3, ythick=3, xtickformat='(f5.1)', ytickformat='(f8.3)', xstyle=1, $
xrange=[min(x_axis),5.], title='i = '+string(incid, format='(f4.1)')+string(176B)+'   e= '+$
string(emer, format='(f4.1)')+string(176B)+'   !9y'+'!1 = '+string(azim, format='(f4.0)')+string(176B),$
yrange=[min(comport),max(comport)], ystyle=1 
endif
if(spectral_option eq 1) then begin

plot, wl,cub_simu_rough[0,*], charsize=2, charthick=2, xtitle='Wavelength ('+string(181B)+'m)', thick=4, $
ytitle='Reflectance', xthick=3, ythick=3, xtickformat='(f5.1)', ytickformat='(f8.3)', $
title='i = '+string(incid, format='(f4.1)')+string(176B)+'   e= '+$
string(emer, format='(f4.1)')+string(176B)+'   !9y'+'!1 = '+string(azim, format='(f4.0)')+string(176B);+$
;'   pure ice';, yrange=[min(comport),max(comport)], ystyle=1 
for i=1, 49 do begin
oplot, wl,cub_simu_rough[i,*],color=fix(float(i)/50.*254.), thick=3
endfor
endif

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
     
;;;;;; Z ;;;;;;;;;;;;;;
if plot_option eq 2 then begin
t=tvrd(true=1)
write_png, plot_file, t
device, /close
set_plot, 'X'
endif
;;;;;;;;;;;;;;;;;;;;;;;

      
end
      