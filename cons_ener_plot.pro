pro cons_ener_plot

;use cons_ener_tot_2 to generate the .sav files
filename='/home/fandrieu/Inversion/Tests_model/Energy_conservation_tot_multi.png' 
plot_option=2 ; 1 for X, anything else to save plot into 'filename'
restore, '/home/fandrieu/Inversion/Tests_model/Energy_conservation_tot_0.5_kn_2.0-1.5.sav'
int2=fltarr(n_elements(int), 4)
int2[*,0]=int
restore, '/home/fandrieu/Inversion/Tests_model/Energy_conservation_tot_1_kn_2.0-1.5.sav'
int2[*,1]=int
restore, '/home/fandrieu/Inversion/Tests_model/Energy_conservation_tot_1_kn_1.1-1.5.sav'
int2[*,2]=int
restore, '/home/fandrieu/Inversion/Tests_model/Energy_conservation_tot_1_pure_kn_2.0-1.5.sav'
int2[*,3]=int


if (plot_option eq 1 ) then begin 
;;;;;; X ;;;;;;;;;;;;;;
window,0, xsize=1300, ysize=900
device,  decomposed=0;,set_color=256
endif else begin
;;;;;; Z ;;;;;;;;;;;;;;
set_plot, 'z'
device, set_resolution=[1300,900], SET_FONT='Times',decomposed=0, z_buffering=1, set_pixel_depth=24;,set_color=256
;;;;;;;;;;;;;;;;;;;;;;;
endelse

x=1
y=1
sx=[-x,-x,x,x]
sy=[-y,y,y,-y]
USERSYM, sx, sy, THICK=1, /FILL


LOADCT,39
erase,255
!P.BACKGROUND=255
!P.COLOR=0
!P.Font=1


leg=['!9q'+'!1 =0.5'+string(176B)+' ns=2.0 ni=1.5', '!9q'+'!1 =1.0'+string(176B)+' ns=2.0 ni=1.5', '!9q'+'!1 =1.0'+string(176B)+' ns=1.1 ni=1.5', $
'!9q'+'!1 =1.0'+string(176B)+' ns=2.0 no inclusion']

plot, incid, int2[*,0], charsize=3, charthick=3, xtitle='Incidence angle  ('+string(176B)+ ')', thick=4, $
ytitle='Q', xthick=3, ythick=3, xtickformat='(f5.1)', ytickformat='(f5.1)', xstyle=1, $
title='Energy conservation versus incidence', xrange=[0.,95.], yrange=[0.,1.1], ystyle=1 
legend, leg[0], psym=[0], thick=3, pos=[250, 550],CHARTHICK=3,CHARSIZE=3,COLORS=0,TEXTCOLORS=0,OUTLINE_COLOR=255,/device
for i=1,3 do begin
oplot, incid, int2[*,i], thick=4, color=fix(float(i)/4.*255.) 
legend, leg[i], psym=[0], thick=3, pos=[250, 550-i*50],CHARTHICK=3,CHARSIZE=3, $
COLORS=fix(float(i)/4.*255.) , TEXTCOLORS=0, OUTLINE_COLOR=255, /device

endfor

if (plot_option ne 1 ) then begin
;;;;;; Z ;;;;;;;;;;;;;;
plot_file=filename
t=tvrd(true=1)
write_png, plot_file, t
device, /close
set_plot, 'X'
;;;;;;;;;;;;;;;;;;;;;;;
endif

end
