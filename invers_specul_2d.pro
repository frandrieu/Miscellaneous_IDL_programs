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


pro invers_specul_2d

cd, '/home/fandrieu/Simu_IPAG/pro/'
resolve_routine, 'colorbar'
cd, '/home/fandrieu'
plot_opt=2 ;1=X, 2=Z
plot_dat_opt=1 ; 1=plot ipag data  2=no plot
cub=4
inc_opt=2 ; 1 : inc=50.5 em=50 2 : inc=50 em=45.5
log_opt=1 ; 1=normal 2=log
sigma_opt=1; 1=constant 2=percent
if (sigma_opt eq 1) then sigma=0.6;6.25
if (sigma_opt eq 2) then sigma=0.1 
oplot_opt=1
maxrange_opt=2 ;1=max en blanc 2=max en rouge

plot_file1='/home/fandrieu/Inversion/Spectres_eau_IPAG/Valid_results/Specul/plot_inv_specul_2d_cub_'+$
string(cub, format='(I1)')+'.png'
if (maxrange_opt eq 2) then begin
plot_file1='/home/fandrieu/Inversion/Spectres_eau_IPAG/Valid_results/Specul/plot_inv_specul_2d_cub_'+$
string(cub, format='(I1)')+'mr.png'
endif
plot_file2='/home/fandrieu/Inversion/Spectres_eau_IPAG/Valid_results/Specul/plot_inv_specul_pp_cub_'+$
string(cub, format='(I1)')+'.png'
plot_file3='/home/fandrieu/Inversion/Spectres_eau_IPAG/Valid_results/Specul/plot_inv_specul_pdf_cub_'+$
string(cub, format='(I1)')+'_sigma_'+string(sigma, format='(f3.1)')+'.png'
if (log_opt eq 2) then begin
plot_file2='/home/fandrieu/Inversion/Spectres_eau_IPAG/Valid_results/Specul/plot_inv_specul_pp_log_cub_'+$
string(cub, format='(I1)')+'.png'
endif
if (cub ne 1) then begin
if (inc_opt eq 1) then begin
plot_file1='/home/fandrieu/Inversion/Spectres_eau_IPAG/Valid_results/Specul/plot_inv_specul_2d_cub_'+$
string(cub, format='(I1)')+'.png'
if (maxrange_opt eq 2) then begin
plot_file1='/home/fandrieu/Inversion/Spectres_eau_IPAG/Valid_results/Specul/plot_inv_specul_2d_cub_'+$
string(cub, format='(I1)')+'mr.png'
endif
plot_file2='/home/fandrieu/Inversion/Spectres_eau_IPAG/Valid_results/Specul/plot_inv_specul_pp_cub_'+$
string(cub, format='(I1)')+'.png'
plot_file3='/home/fandrieu/Inversion/Spectres_eau_IPAG/Valid_results/Specul/plot_inv_specul_pdf_cub_'+$
string(cub, format='(I1)')+'_sigma_'+string(sigma, format='(f3.1)')+'.png'
if (log_opt eq 2) then begin
plot_file2='/home/fandrieu/Inversion/Spectres_eau_IPAG/Valid_results/Specul/plot_inv_specul_pp_log_cub_'+$
string(cub, format='(I1)')+'.png'
endif
endif
if (inc_opt eq 2) then begin
plot_file1='/home/fandrieu/Inversion/Spectres_eau_IPAG/Valid_results/Specul/plot_inv_specul_2d_inc2_cub_'+$
string(cub, format='(I1)')+'.png'
if (maxrange_opt eq 2) then begin
plot_file1='/home/fandrieu/Inversion/Spectres_eau_IPAG/Valid_results/Specul/plot_inv_specul_2d_inc2_cub_'+$
string(cub, format='(I1)')+'mr.png'
endif
plot_file2='/home/fandrieu/Inversion/Spectres_eau_IPAG/Valid_results/Specul/plot_inv_specul_pp_inc2_cub_'+$
string(cub, format='(I1)')+'.png'
plot_file3='/home/fandrieu/Inversion/Spectres_eau_IPAG/Valid_results/Specul/plot_inv_specul_pdf_inc2_cub_'+$
string(cub, format='(I1)')+'_sigma_'+string(sigma, format='(f3.1)')+'.png'
if (log_opt eq 2) then begin
plot_file2='/home/fandrieu/Inversion/Spectres_eau_IPAG/Valid_results/Specul/plot_inv_specul_pp_log_inc2_cub_'+$
string(cub, format='(I1)')+'.png'
endif
endif
endif

plot_file1=strcompress(plot_file1, /remove_all)
plot_file2=strcompress(plot_file2, /remove_all)
plot_file3=strcompress(plot_file3, /remove_all)
sigma=sigma^2
i=50.
num_wave=0;30
num_wave_dat=46
data=read_ascii('/home/fandrieu/Inversion/Spectres_eau_IPAG/arcelle_waves.txt')
waves=data.FIELD1
num_wave_list=[0,10,20,26,31,46,61]
;num_wave :  0 <--> 0.6µm 0
;           10 <--> 0.8µm 1
;           20 <--> 1.0µm 2
;           31 <--> 1.2µm 3
;           46 <--> 1.5µm 4
;           61 <--> 1.8µm 5
;           

data=read_ascii('/home/fandrieu/Inversion/Spectres_eau_IPAG/Archive_sylvain/glace6e_specul_i50_data.dat')
specul=data.FIELD01
s=size(specul)
waves=specul[s[1]-1,*]
data=fltarr(s[1]-1,s[2])
data=specul[0:s[1]-2,*]
specul=data
inc=50.
emd=[45.,47.,48.,49.,50.,51.,52.,53.,55.]
azd=[170.,175.,176.,177.,178.,179.,180.]

geom=fltarr(n_elements(emd)*n_elements(azd),2)
for i=0,n_elements(emd)-1 do begin
  for j=0,n_elements(azd)-1 do begin
      geom[j*n_elements(emd)+i,0]=emd[i]
      geom[j*n_elements(emd)+i,1]=azd[j]
  endfor
endfor
ed=geom[*,0]
ad=geom[*,1]
plot_file_data='/home/fandrieu/Inversion/Spectres_eau_IPAG/Valid_results/Specul/plot_data_lambda_'+$
string(waves[num_wave_dat], format='(f3.1)')+'.png'
if (maxrange_opt eq 2) then begin
plot_file_data='/home/fandrieu/Inversion/Spectres_eau_IPAG/Valid_results/Specul/plot_data_lambda_'+$
string(waves[num_wave_dat], format='(f3.1)')+'mr.png'
endif
plot_file_data=strcompress(plot_file_data, /remove_all)


;ggd=where(ad eq 180.)
;dd=specul[ggd,46]
dd=specul[*,num_wave_dat]


if (cub eq 1) then begin
;rough=variable emer entre i-5° et i+5° azim entre 175° et 180°  (IPAG) (res : 1°)
path_spectres = '/home/fandrieu/Inversion/Simulations/arcelle_specul_0315_1/arcelle_specul_0315_1_em0_C.cub'
        envi_open_file, path_spectres, r_fid=data_fid_gs_1
        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
         
npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
 path = '/home/fandrieu/Inversion/Simulations/arcelle_specul_0315_1/arcelle_specul_0315_1_em0.param'
      
      A = pdsread(path,  /bsq)
      param_cub = A.core
      label_gs_1 = A.label
      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER')  
endif
if (cub eq 2) then begin
if (inc_opt eq 1) then begin
;rough=variable emer entre i-5° et i+5° azim entre 175° et 180°  (IPAG) (res : 1°)
path_spectres = '/home/fandrieu/Inversion/Simulations/arcelle_specul_0315_2/arcelle_specul_0315_2_em0_C.cub'
        envi_open_file, path_spectres, r_fid=data_fid_gs_1
        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
         
npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
 path = '/home/fandrieu/Inversion/Simulations/arcelle_specul_0315_2/arcelle_specul_0315_2_em0.param'
      
      A = pdsread(path,  /bsq)
      param_cub = A.core
      label_gs_1 = A.label
      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER')  
endif
if (inc_opt eq 2) then begin
;rough=variable emer entre i-5° et i+5° azim entre 175° et 180°  (IPAG) (res : 1°)
path_spectres = '/home/fandrieu/Inversion/Simulations/arcelle_specul_1.5_0315_2/arcelle_specul_1.5_0315_2_em0_C.cub'
        envi_open_file, path_spectres, r_fid=data_fid_gs_1
        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
         
npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
 path = '/home/fandrieu/Inversion/Simulations/arcelle_specul_1.5_0315_2/arcelle_specul_1.5_0315_2_em0.param'
      
      A = pdsread(path,  /bsq)
      param_cub = A.core
      label_gs_1 = A.label
      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER')  

param_cub[*,*,0]=param_cub[*,*,0]+0.5
endif
endif
if (cub eq 3) then begin
if (inc_opt eq 1) then begin
;rough=variable emer entre i-5° et i+5° azim entre 175° et 180°  (IPAG) (res : 1°)
path_spectres = '/home/fandrieu/Inversion/Simulations/arcelle_specul_0315_3/arcelle_specul_0315_3_em0_C.cub'
        envi_open_file, path_spectres, r_fid=data_fid_gs_1
        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
         
npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
 path = '/home/fandrieu/Inversion/Simulations/arcelle_specul_0315_3/arcelle_specul_0315_3_em0.param'
      
      A = pdsread(path,  /bsq)
      param_cub = A.core
      label_gs_1 = A.label
      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER')  
param_cub[*,*,1]=param_cub[*,*,1]+0.4
endif
if (inc_opt eq 2) then begin
;rough=variable emer entre i-5° et i+5° azim entre 175° et 180°  (IPAG) (res : 1°)
path_spectres = '/home/fandrieu/Inversion/Simulations/arcelle_specul_1.5_0315_3/arcelle_specul_1.5_0315_3_em0_C.cub'
        envi_open_file, path_spectres, r_fid=data_fid_gs_1
        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
         
npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
 path = '/home/fandrieu/Inversion/Simulations/arcelle_specul_1.5_0315_3/arcelle_specul_1.5_0315_3_em0.param'
      
      A = pdsread(path,  /bsq)
      param_cub = A.core
      label_gs_1 = A.label
      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER')  
param_cub[*,*,1]=param_cub[*,*,1]+0.4
param_cub[*,*,0]=param_cub[*,*,0]+0.5
endif
endif
if (cub eq 4) then begin
if (inc_opt eq 1) then begin
;rough=variable emer entre i-5° et i+5° azim entre 175° et 180°  (IPAG) (res : 1°)
path_spectres = '/home/fandrieu/Inversion/Simulations/arcelle_specul_0315_4/arcelle_specul_0315_4_em0_C.cub'
        envi_open_file, path_spectres, r_fid=data_fid_gs_1
        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
         
npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
 path = '/home/fandrieu/Inversion/Simulations/arcelle_specul_0315_4/arcelle_specul_0315_4_em0.param'
      
      A = pdsread(path,  /bsq)
      param_cub = A.core
      label_gs_1 = A.label
      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER')  
param_cub[*,*,1]=param_cub[*,*,1]+0.2
endif
if (inc_opt eq 2) then begin
;rough=variable emer entre i-5° et i+5° azim entre 175° et 180°  (IPAG) (res : 1°)
path_spectres = '/home/fandrieu/Inversion/Simulations/arcelle_specul_1.5_0315_4/arcelle_specul_1.5_0315_4_em0_C.cub'
        envi_open_file, path_spectres, r_fid=data_fid_gs_1
        envi_file_query, data_fid_gs_1, dims=dims_data_gs_1, wl=wl, nb=nb
        cub_10nm=fltarr((dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1),nb)
        for ii=0,nb-1 do cub_10nm[*,ii] = ENVI_GET_DATA(fid=data_fid_gs_1, dims=dims_data_gs_1, pos=[ii] )
         
npix_gs_1=(dims_data_gs_1[2]+1)*(dims_data_gs_1[4]+1)
 path = '/home/fandrieu/Inversion/Simulations/arcelle_specul_1.5_0315_4/arcelle_specul_1.5_0315_4_em0.param'
      
      A = pdsread(path,  /bsq)
      param_cub = A.core
      label_gs_1 = A.label
      wave_gs_1 = get_keyword(A.label, 'BAND_BIN_CENTER')  
param_cub[*,*,1]=param_cub[*,*,1]+0.2
param_cub[*,*,0]=param_cub[*,*,0]+0.5
endif
endif
n_geom=dims_data_gs_1[2]+1
n_par=dims_data_gs_1[4]+1
param_cub_simu=param_cub
s=size(param_cub_simu)
param_cub=reform(param_cub, n_geom*n_par,3)
cub_simu=fltarr(n_geom,n_par,nb)
cub_simu=reform(cub_10nm, n_geom,n_par,nb)
;param_cub_simu[*,*,0]=emergence
;param_cub_simu[*,*,1]=azimut
;param_cub_simu[*,*,2]=epaisseur (5mm ou 10mmm)
a=param_cub_simu[*,*,2]
rough_mod=a[uniq(a,sort(a))]
n_rough = n_elements(rough_mod)
rough_x=rough_mod
d=fltarr( n_rough,n_geom)
for g=0, n_geom-1 do d[*,g]=cub_simu[g,*,num_wave]
dude=d
du=dd

if (sigma_opt eq 1) then invertC = diag_matrix(replicate(1./sigma,n_geom)) ; !!!ONLY FOR LEAST SQUARES METHOD!!!
if (sigma_opt eq 2) then begin
sigma_line=(sigma*du+1.)^2
invertC = diag_matrix(1./sigma_line)
endif
L1=vraissemblance_ln_mat(du, dude, invertC, n_par)
L=double(exp(L1))
fact=total(L)*0.01
L=L/fact

;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;; Z ;;;;;;;;;;;;;
if plot_opt eq 2 then begin
set_plot, 'z'
device, set_resolution=[800,600], SET_FONT='Times',decomposed=0, z_buffering=1, set_pixel_depth=24;,set_color=256
;device,  decomposed=0
LOADCT,39 
erase,255
!P.BACKGROUND=255
!P.COLOR=0
!P.Font=1
plot, rough_x, L , charsize=2.5, xtitle='Roughness  ('+string(176B)+ ')', ytitle='Probability Density Function',$
title='PDF for the roughness '+'!9q'+'!1 ', thick=4, xthick=3, ythick=3
t=tvrd(true=1)
write_png, plot_file3, t
device, /close
set_plot, 'X'
endif
;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;

g_rough=where(L1 eq max(L1))
rough=rough_x[g_rough[0]]
print, 'best roughness : ', rough
rough_inv=total(rough_x*l*0.01)
sigma_rough=sqrt(total(l*0.1*(rough_x-rough_inv)^2))
print, 'inverted roughness : ', rough_inv
print, 'associated, standard devieation : ', sigma_rough 
gg=  where(abs(param_cub_simu[*,*,2]-rough) lt 0.001); and param_cub_simu[*,*,1] eq 180.)
;gg=  where(abs(param_cub_simu[*,*,2]-0.7) lt 0.001 and param_cub_simu[*,*,1] eq 179.4)
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
;w=where(d eq max(d))
;d[w]=d[w[0]+1]
if (maxrange_opt eq 2) then begin
range[1]=range[1]+range[1]/10000.
endif
;range[1]=max(d)/3.25
;d[where(d gt range[1])]=range[1]
;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;; X ;;;;;;;;;;;;;
if oplot_opt eq 1 then begin
if plot_opt eq 1 then begin
;square
window,cub, xsize=800, ysize=600
nsym=4
x=1.
y=1.
factx=4.5
facty=1.6
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
plot, e, az, psym=3, xrange=[inc-6., inc+6.], xstyle =1, yrange=[170., 190.], ystyle =1, POSITION=[0.17, 0.1, 0.95, 0.75], charsize=1, charthick=1,$
xtitle='Emergence angle  ('+string(176B)+ ')', ytitle='Azimuth angle ('+string(176B)+ ')', xthick=4, ythick=4, xtickformat='(f5.1)', ytickformat='(f5.1)'
for i=0,n_elements(gg)-1 do oplot, [0,e[i]], [0,az[i]], color=(d[i]-min(d))/(max(range)-min(d))*255., psym=8, symsize=1
for i=0,n_elements(gg)-1 do oplot, [0,e[i]], [0,360.-az[i]], color=(d[i]-min(d))/(max(range)-min(d))*255., psym=8, symsize=1
COLORBAR, POSITION=[0.17, 0.85, 0.95, 0.90] , TITLE='Simulated reflectance at  '+'!9l'+'!1 ='+string(waves[num_wave_dat], format='(f3.1)')+' '+string(181B)+'m',$
maxrange=max(range), minrange=min(range), format='(f9.1)', charsize=2, charthick=1
endif
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
factx=6.4
facty=3.65
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
plot, e, az, psym=3, xrange=[inc-6., inc+6.], xstyle =1, yrange=[170., 190.], ystyle =1, POSITION=[0.17, 0.1, 0.95, 0.75], charsize=2.5, charthick=1,$
xtitle='Emergence angle  ('+string(176B)+ ')', ytitle='Azimuth angle ('+string(176B)+ ')', xthick=3, ythick=3, xtickformat='(f5.1)', ytickformat='(f5.1)'
for i=0,n_elements(gg)-1 do oplot, [0,e[i]], [0,az[i]], color=(d[i]-min(d))/(max(range)-min(d))*255., psym=8, symsize=1
for i=0,n_elements(gg)-1 do oplot, [0,e[i]], [0,360.-az[i]], color=(d[i]-min(d))/(max(range)-min(d))*255., psym=8, symsize=1
COLORBAR, POSITION=[0.17, 0.85, 0.95, 0.90] , TITLE='Simulated reflectance at  '+'!9l'+'!1 ='+string(waves[num_wave_dat], format='(f3.1)')+' '+string(181B)+'m',$
maxrange=max(range), minrange=min(range), format='(f9.1)', charsize=2.5 , charthick=1
t=tvrd(true=1)
write_png, plot_file1, t
device, /close
set_plot, 'X'
cub_simu=reform(cub_10nm, n_geom,n_par,nb)
endif
;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;


if (plot_dat_opt eq 1) then begin
;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;; X ;;;;;;;;;;;;;
if oplot_opt eq 1 then begin
if plot_opt eq 1 then begin
;square
window,7, xsize=800, ysize=600
nsym=4
x=1.
y=1.
factx=4.5
facty=1.6
sx=factx*[-x,-x,x,x]
sy=facty*[-y,y,y,-y]
ranged=[min(dd),max(dd)]
if (maxrange_opt eq 2) then begin
ranged[1]=ranged[1]+ranged[1]/10000.
endif
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
plot, ed, ad, psym=3, xrange=[inc-6., inc+6.], xstyle =1, yrange=[170., 190.], ystyle =1, POSITION=[0.17, 0.1, 0.95, 0.75], charsize=1, charthick=1,$
xtitle='Emergence angle  ('+string(176B)+ ')', ytitle='Azimuth angle ('+string(176B)+ ')', xthick=4, ythick=4, xtickformat='(f5.1)', ytickformat='(f5.1)'
for i=0,n_elements(dd)-1 do oplot, [0,ed[i]], [0,ad[i]], color=(dd[i]-min(dd))/(max(ranged)-min(dd))*255., psym=8, symsize=1
for i=0,n_elements(dd)-1 do oplot, [0,ed[i]], [0,360.-ad[i]], color=(dd[i]-min(dd))/(max(ranged)-min(dd))*255., psym=8, symsize=1
COLORBAR, POSITION=[0.17, 0.85, 0.95, 0.90] , TITLE='Measured reflectance at  '+'!9l'+'!1 ='+string(waves[num_wave_dat], format='(f3.1)')+' '+string(181B)+'m',$
maxrange=max(ranged), minrange=min(ranged), format='(f9.1)', charsize=2, charthick=1
endif
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
factx=6.4
facty=3.65
sx=factx*[-x,-x,x,x]
sy=facty*[-y,y,y,-y]
;sx=sx/2.
;sy=sy/2.
ranged=[min(dd),max(dd)]
if (maxrange_opt eq 2) then begin
ranged[1]=ranged[1]+ranged[1]/10000.
endif
device,  decomposed=0
LOADCT,39 
erase,255
!P.BACKGROUND=255
!P.COLOR=0
!P.Font=1
;stretch, 0, 252
USERSYM, sx, sy, THICK=1, /FILL
plot, ed, ad, psym=3, xrange=[inc-6., inc+6.], xstyle =1, yrange=[170., 190.], ystyle =1, POSITION=[0.17, 0.1, 0.95, 0.75], charsize=2.5, charthick=1,$
xtitle='Emergence angle  ('+string(176B)+ ')', ytitle='Azimuth angle ('+string(176B)+ ')', xthick=3, ythick=3, xtickformat='(f5.1)', ytickformat='(f5.1)'
for i=0,n_elements(dd)-1 do oplot, [0,ed[i]], [0,ad[i]], color=(dd[i]-min(dd))/(max(ranged)-min(dd))*255., psym=8, symsize=1
for i=0,n_elements(dd)-1 do oplot, [0,ed[i]], [0,360.-ad[i]], color=(dd[i]-min(dd))/(max(ranged)-min(dd))*255., psym=8, symsize=1
COLORBAR, POSITION=[0.17, 0.85, 0.95, 0.90] , TITLE='Measured reflectance at  '+'!9l'+'!1 ='+string(waves[num_wave_dat], format='(f3.1)')+' '+string(181B)+'m',$
maxrange=max(ranged), minrange=min(ranged), format='(f9.1)', charsize=2.5, charthick=1
t=tvrd(true=1)
write_png, plot_file_data, t
device, /close
set_plot, 'X'
cub_simu=reform(cub_10nm, n_geom,n_par,nb)
endif
;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;
endif

;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;; X ;;;;;;;;;;;;;
if plot_opt eq 1 then begin
window,5, xsize=800, ysize=600
device,  decomposed=0
LOADCT,39 
erase,255
!P.BACKGROUND=255
!P.COLOR=0
!P.Font=1
gg=  where(abs(param_cub_simu[*,*,2]-rough) lt 0.001 and param_cub_simu[*,*,1] eq 180.)
d=fltarr(n_elements(gg))
d[0:n_elements(gg)-1]=cub_10nm[gg,num_wave]
e=fltarr(n_elements(gg))
e[0:n_elements(gg)-1]=param_cub[gg,0]
ggd=where(ad eq 180.)
dd=specul[ggd,46]
bluve=max(d)
bulle=max(dd)
gluse=max([bluve, bulle])+1.
if (log_opt eq 2) then begin
plot, e,dd, title= 'Specular lobe in the principal plane', xtitle= 'emergence angle ('+string(176B)+')', xthick=3, ythick=3,$
yTITLE='Reflectance at  '+'!9l'+'!1 ='+string(waves[num_wave_dat], format='(f3.1)')+' '+string(181B)+'m', thick=2, /ylog, $
yrange=[0., gluse], ystyle=1
endif else begin 
plot, e,dd, title= 'Specular lobe in the principal plane', xtitle= 'emergence angle ('+string(176B)+')', xthick=3, ythick=3,$
yTITLE='Reflectance at  '+'!9l'+'!1 ='+string(waves[num_wave_dat], format='(f3.1)')+' '+string(181B)+'m', thick=2, $
yrange=[0., gluse], ystyle=1
endelse
oplot, e,d, thick=2, color=250
if oplot_opt eq 1 then begin
;square
window,0, xsize=800, ysize=600
device,  decomposed=0
LOADCT,39 
erase,255
!P.BACKGROUND=255
!P.COLOR=0
!P.Font=1
plot, rough_x, L , charsize=1, charthick=1, xtitle='Roughness  ('+string(176B)+ ')', ytitle='PDF', thick=2,$
title='Probability Density Function for the roughness '+'!9q'+'!1 ', xthick=3, ythick=3;the roughness parameter';, /ylog
endif else begin
oplot, rough_x, L , color=(cub+1)*50
endelse
endif
;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;; Z ;;;;;;;;;;;;;
if plot_opt eq 2 then begin
set_plot, 'z'
device, set_resolution=[800,600], SET_FONT='Times',decomposed=0, z_buffering=1, set_pixel_depth=24;,set_color=256
;device,  decomposed=0
LOADCT,39 
erase,255
!P.BACKGROUND=255
!P.COLOR=0
!P.Font=1
gg=  where(abs(param_cub_simu[*,*,2]-rough) lt 0.001 and param_cub_simu[*,*,1] eq 180.)
d=fltarr(n_elements(gg))
d[0:n_elements(gg)-1]=cub_10nm[gg,num_wave]
e=fltarr(n_elements(gg))
e[0:n_elements(gg)-1]=param_cub[gg,0]
ggd=where(ad eq 180.)
dd=specul[ggd,46]
bluve=max(d)
bulle=max(dd)
gluse=max([bluve, bulle])+1.
if (log_opt eq 2) then begin
plot, e,dd, title= 'Specular lobe in the principal plane', xtitle= 'emergence angle ('+string(176B)+')', charsize=2.5,$
yTITLE='Reflectance at  '+'!9l'+'!1 ='+string(waves[num_wave_dat], format='(f3.1)')+' '+string(181B)+'m', thick=4, xthick=3, ythick=3, /ylog, $
yrange=[0., gluse], ystyle=1
endif else begin 
plot, e,dd, title= 'Specular lobe in the principal plane', xtitle= 'emergence angle ('+string(176B)+')', charsize=2.5,$
yTITLE='Reflectance at  '+'!9l'+'!1 ='+string(waves[num_wave_dat], format='(f3.1)')+' '+string(181B)+'m', thick=4, xthick=3, ythick=3, $
yrange=[0., gluse], ystyle=1
endelse
oplot, e,d, thick=4, color=250
t=tvrd(true=1)
write_png, plot_file2, t
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

