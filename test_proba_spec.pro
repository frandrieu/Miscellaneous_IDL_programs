pro test_proba_spec

plot_opt=2
plot_file='/home/fandrieu/Inversion/Tests_model/Proba_slope_int.png'
n_max=10000
n_max_dzeta=900
dzeta_list=float(indgen(n_max_dzeta))/float(n_max_dzeta)*45.*!pi/180.+0.1*!pi/180.
proba_spec=fltarr(n_elements(dzeta_list), n_max)
int=fltarr(n_elements(dzeta_list))
v_list=float(indgen(n_max))/float(n_max)*90.*!pi/180.


for i=0,n_elements(dzeta_list)-1 do begin
  for j=0,n_max-1 do begin
    v=v_list[j]
     dzeta=dzeta_list[i]
     proba_spec[i,j]=2./(!pi*tan(dzeta)^2)*exp(-(tan(v))^2/(!pi*(tan(dzeta))^2))*sin(v)/((cos(v))^2)
  endfor
  int[i]=total(proba_spec[i,*]*!pi/2./(n_max))
endfor
;plot, dzeta_list, int


;plot, dzeta_list*180/!pi, int, /xlog, yrange=[0.5,1.05], ystyle=1, xrange=[0.1,50.], xstyle=1


;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;; X ;;;;;;;;;;;;;
if plot_opt eq 1 then begin
;square
window,0, xsize=1300, ysize=900
device,  decomposed=0
LOADCT,39 
erase,255
!P.BACKGROUND=255
!P.COLOR=0
!P.Font=1
plot, dzeta_list*180/!pi, int, /xlog, yrange=[0.5,1.05], xrange=[0.1,50.], xstyle=1, ystyle =1, charsize=3, charthick=3,$
title='Normalization of a versus roughness', ytitle='I', xtitle='!9q'+'('+string(176B)+')', xthick=3, ythick=3, xtickformat='(f5.1)', ytickformat='(f5.1)', thick=4
endif
;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;; Z ;;;;;;;;;;;;;
if plot_opt eq 2 then begin
set_plot, 'z'
device, set_resolution=[1300,900], SET_FONT='Times',decomposed=0, z_buffering=1, set_pixel_depth=24;
LOADCT,39 
erase,255
!P.BACKGROUND=255
!P.COLOR=0
!P.Font=1
plot, dzeta_list*180/!pi, int, /xlog, yrange=[0.5,1.05], xrange=[0.1,50.], xstyle=1, ystyle =1, charsize=3, charthick=3,$
title='Normalization of a versus roughness', ytitle='I', xtitle='!9q'+'('+string(176B)+')', xthick=3, ythick=3, xtickformat='(f5.1)', ytickformat='(f5.1)', thick=4


t=tvrd(true=1)
write_png, plot_file, t
device, /close
set_plot, 'X'
endif
;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;


end