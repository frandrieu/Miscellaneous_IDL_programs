pro invers_specul_ipag


cd, '/home/fandrieu/Simu_IPAG/pro/'
resolve_routine, 'colorbar'
cd, '/home/fandrieu'
data=read_ascii('/home/fandrieu/Inversion/Spectres_eau_IPAG/arcelle_waves.txt')
waves=data.FIELD1
num_wave_list=[0,10,20,26,31,46,61]
;num_wave :  0 <--> 0.6µm 
;           10 <--> 0.8µm 
;           20 <--> 1.0µm 
;           31 <--> 1.2µm 
;           46 <--> 1.5µm 
;           61 <--> 1.8µm 
;           

data=read_ascii('/home/fandrieu/Inversion/Spectres_eau_IPAG/Archive_sylvain/glace6e_specul_i50_data.dat')
specul=data.FIELD01


inc=50.
em=[45.,47.,48.,49.,50.,51.,52.,53.,55.]
az=[170.,175.,176.,177.,178.,179.,180.]

geom=fltarr(n_elements(em)*n_elements(az),2)
for i=0,n_elements(em)-1 do begin
  for j=0,n_elements(az)-1 do begin
      geom[j*n_elements(em)+i,0]=em[i]
      geom[j*n_elements(em)+i,1]=az[j]
  endfor
endfor
e=geom[*,0]
a=geom[*,1]


for wawa=0,n_elements(num_wave_list)-1 do begin

num_wave=num_wave_list[wawa]
d=specul[*,num_wave]


;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;; X ;;;;;;;;;;;;;
;square
;nsym=4
;sx=[-1.3,-1.3,1.3,1.3]
;sy=[-0.5,0.5,0.5,-0.5]
;device,  decomposed=0
;LOADCT,39 
;erase,255
;!P.BACKGROUND=255
;!P.COLOR=0
;;stretch, 5,254
;!P.Font=1
;USERSYM, sx, sy, THICK=1, /FILL
;plot, e, a, psym=3, xrange=[44., 56.], xstyle =1, yrange=[170, 190.0], ystyle =1, POSITION=[0.17, 0.1, 0.95, 0.75], charsize=1, charthick=1,$ 
;xtitle='Incidence angle  ('+string(176B)+ ')', ytitle='Azimuth angle ('+string(176B)+ ')', xthick=2, ythick=2, xtickformat='(f5.1)', ytickformat='(f5.1)'
;for i=0,n_elements(e)-1 do oplot, [0,e[i]], [0,a[i]], color=(d[i]-min(d))/max(d-min(d))*255., psym=8, symsize=4.5
;for i=0,n_elements(e)-1 do oplot, [0,e[i]], [0,360.-a[i]], color=(d[i]-min(d))/max(d-min(d))*255., psym=8, symsize=4.5
;range=[min(d), max(d)]
;COLORBAR, POSITION=[0.17, 0.85, 0.95, 0.90] , TITLE='Reflectance', maxrange=max(range), minrange=min(range), format='(f5.2)', charsize=1, charthick=1
;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;
;d=d-min(d)
;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;; Z ;;;;;;;;;;;;;
;square
nsym=4
sx=[-1.3,-1.3,1.3,1.3]
sy=[-1,1,1,-1]
sy=sy*0.78
set_plot, 'z'
device, set_resolution=[1325,1600], SET_FONT='Times',decomposed=0, z_buffering=1, set_pixel_depth=24;,set_color=256
LOADCT,39 
erase,255
!P.BACKGROUND=255
!P.COLOR=0
;stretch, 5,254
!P.Font=1
USERSYM, sx, sy, THICK=1, /FILL
plot, e, a, psym=3, xrange=[44., 56.], xstyle =1, yrange=[170, 190.0], ystyle =1, POSITION=[0.17, 0.1, 0.95, 0.75], charsize=4, charthick=4,$ 
xtitle='Incidence angle  ('+string(176B)+ ')', ytitle='Azimuth angle ('+string(176B)+ ')', xthick=2, ythick=2, xtickformat='(f5.1)', ytickformat='(f5.1)'
for i=0,n_elements(e)-1 do oplot, [0,e[i]], [0,a[i]], color=(d[i]-min(d))/max(d-min(d))*255., psym=8, symsize=8.5
for i=0,n_elements(e)-1 do oplot, [0,e[i]], [0,360.-a[i]], color=(d[i]-min(d))/max(d-min(d))*255., psym=8, symsize=8.5
range=[min(d), max(d)]
COLORBAR, POSITION=[0.17, 0.85, 0.95, 0.90] , TITLE='Reflectance at  '+'!9l'+'!1 ='+string(waves[num_wave], format='(f3.1)')+' '+string(181B)+'m', $
maxrange=max(range), minrange=min(range), format='(f5.1)', charsize=4, charthick=4
plot_file='/home/fandrieu/Inversion/Spectres_eau_IPAG/plot_specul_measure_spec_ipag_'+string(waves[num_wave], format='(f3.1)')+'.png'
t=tvrd(true=1)
write_png, plot_file, t
device, /close
set_plot, 'X'
;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;
endfor
;plot, specul[0,*]
;for i=1,63 do oplot, specul[i,*]

end