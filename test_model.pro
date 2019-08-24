pro test_model

cd, '/home/fandrieu/Simu_IPAG/pro/'
resolve_routine, 'colorbar'
resolve_routine, 'legend'
resolve_routine, 'tv_plot'
cd, '/home/fandrieu'


;;;;;;;;;;;;;;;;;;;;;
restore, '/data/fschmidt/fandrieu/Param_cube_sd_2.sav'
restore, '/data/fschmidt/fandrieu/Cube_sd_v5.sav'
print, 'cubes restored'
inc_sd=Param_cube_sd[*,*,0]
emer_sd=Param_cube_sd[*,*,1]
azim_sd=Param_cube_sd[*,*,2]
hslab_sd=Param_cube_sd[*,*,3]
cslab_sd=Param_cube_sd[*,*,4]
fracH2Oslab_sd=Param_cube_sd[*,*,5]
grainsizeH2Oslab_sd=Param_cube_sd[*,*,6]
Param_cube_sd=reform(Param_cube_sd, npix_sd, 7)
;;;;;;;;;;;;;;;;;;;;


restore, '/home/fandrieu/Inversion/Libraries/wavelengths.sav'
w = where(inc_sd eq 70. and emer_sd eq 0. and azim_sd eq 60. and hslab_sd eq 800. and frach2oslab_sd eq 100. and grainsizeh2oslab_sd eq 30.); and cslab_sd le 0.999 and cslab_sd ge 0.99)
waterevo=cub_sd[w,*]

a=cslab_sd
c_slab_mod =  a[uniq(a,sort(a))]
s_c_slab = n_elements(c_slab_mod)
cslab_x=c_slab_mod

window, xsize=1400, ysize=800
; set_plot, 'z'
!P.FONT=1
!P.BACKGROUND=255
!P.COLOR=0
;device, set_resolution=[2000,1600], SET_FONT='Times',decomposed=0, z_buffering=1, set_pixel_depth=24;,set_color=256
device, decomposed=0
erase,255
loadct, 39
wi=w
cslab=cslab_sd[w]
cslab_x=cslab[sort(cslab)]
wi=sort(cslab)
;for i=1,n_elements(w)-1 do wi[i]=where(cslab-cslab_x[i] lt 1e-5)
plot, wavelengths, waterevo[wi[0],*]

for i=1,n_elements(w)-1 do oplot, wavelengths, waterevo[wi[i],*], color=float(i)/float(n_elements(w)-1)*255.

sym=intarr(n_elements(w))
ppm=fltarr(n_elements(w)) 
for i=0, n_elements(w)-1 do ppm[i]=round((1.-cslab_sd[w[wi[i]]])*1000000.)
lab=strarr(n_elements(w)) 
for i=0, n_elements(w)-1 do lab[i]=strcompress(ppm[i], /remove_all)+' ppm'
col=strarr(n_elements(w)) 
for i=0, n_elements(w)-1 do col[i]=float(i)/float(n_elements(w)-1)*250.
legend, lab, psym=sym, color=col, /right, charsize=2

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Plots comparant la différences dues à la ;
; différence dans l'échantillonnage de sep ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
restore, '/home/fandrieu/Inversion/results/idl_files/test_water_HR.sav'
restore, '/home/fandrieu/Inversion/results/idl_files/test_water_LR4.sav'
restore, '/home/fandrieu/Inversion/results/idl_files/test_water_LR5.sav'
test_water_cube=reform(test_water_cub, 126, 437)
test_water_cube_lr=reform(test_water_cub_lr, 126, 437)
test_water_cube_lr2=reform(test_water_cub_lr2, 126, 437)
test_water_cube_lr3=reform(test_water_cub_lr3, 126, 437)
i= test_water_param[*,*,1]
c= test_water_param[*,*,2]
e= test_water_param[*,*,0]
ww=where(i eq 70. and e eq 0.)
restore, '/home/fandrieu/Inversion/Libraries/wavelengths.sav'
window, xsize=1400, ysize=800
!P.FONT=1
!P.BACKGROUND=255
!P.COLOR=0
device, decomposed=0
erase,255
loadct, 39
plot, wavelengths, test_water_cube[ww[10], *]
plot, wavelengths, test_water_cube[ww[10], *]
oplot, wavelengths, test_water_cube_lr4[ww[10], *], color=250
oplot, wavelengths, test_water_cube_lr5[ww[10], *], color=200
oplot, wavelengths, test_water_cube_lr[ww[10], *], color=150
oplot, wavelengths, abs(test_water_cube[ww[10], *]-test_water_cube_lr4[ww[10], *]), color=150
oplot, wavelengths, abs(test_water_cube[ww[10], *]-test_water_cube_lr5[ww[10], *]), color=250
oplot, wavelengths, abs(test_water_cube[ww[10], *]-test_water_cube_lr3[ww[10], *]), color=200
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


end