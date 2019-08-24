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


pro invers_spectres_valid_num

;;INVERTED VALUES;;
steph=1.
;h=[1.,5.,10.,15.,19.,1.,5.,10.,15.,19.,1.,5.,10.,15.,19.]*10.*steph
;g=[127.,127.,127.,127.,127.,210.,210.,210.,210.,210.,325.,325.,325.,325.,325.]
h=10.
g=1.
;;;;;;TIRAGES;;;;;;
n_tir=1
;;;;;;;NOISE;;;;;;;
sigma=0.02
mean=0.
;;;;;;;;;;;;;



restore, '/home/fandrieu/Inversion/valid_num_cube_brfd.sav'
;n_wavelength=61
;cub_simub=cub_simu[*,*,0:n_wavelength-1]
;cub_simu=cub_simub
;cub_datab=cub_data[*,*,0:n_wavelength-1]
cub_data=cub_simu
param_cub_data=param_cub_simu
;n_waves=n_wavelength

n_waves=n_elements(wavelengths)

s=size(cub_data)
d=fltarr(s[1]*s[2])
n=0
nfit=5
n_p=size(param_cub_simu)
s2=size(cub_simu)

n_par=n_p[2]

lmax=fltarr(nfit)

a=param_cub_simu[0,*,4]
h_slab_mod=a[uniq(a,sort(a))]
s_h = n_elements(h_slab_mod)
h_x=h_slab_mod
l_h=dblarr(n_elements(h_x))

a=param_cub_simu[0,*,3]
h_slab_mod=a[uniq(a,sort(a))]
s_h = n_elements(h_slab_mod)
g_x=h_slab_mod
l_g=dblarr(n_elements(g_x))


simu=cub_simu[0,*,*]
simu=reform(simu,n_par, n_waves)
l_h_stack_tot=dblarr(n_elements(h),n_elements(h_x))
l_g_stack_tot=dblarr(n_elements(g),n_elements(g_x))
bf_tot=intarr(n_elements(h),n_tir)
pos=intarr(n_elements(h))

t=systime(1)

for num_inv=0, n_elements(h)-1 do begin

ggd=  where(abs(param_cub_data[0,*,3]-g[num_inv]) lt 10. and abs(param_cub_data[0,*,4]-h[num_inv]) lt 0.001)
pos[num_inv]=ggd[0]
data=cub_data[0,pos[num_inv],*]
data=reform(data,n_waves)

l_tot=dblarr(n_tir, n_par)
bf=intarr(n_tir)
l_h_tot=dblarr(n_tir,n_elements(h_x))
l_g_tot=dblarr(n_tir,n_elements(g_x))
for i=0,n_tir-1 do begin
array = RANDOMN(seed, n_waves)
noise= array * sigma + mean
invertC = diag_matrix(replicate(1./sigma^2,n_waves)) ; !!!ONLY FOR LEAST SQUARES METHOD!!!
dat=data+noise
dat(where(dat lt 0.))=0.
L=vraissemblance_ln_mat(dat, simu, invertC, n_par)
bf[i]=where(l eq max(l))
l_tot[i, *]=l+abs(max(l))


;print, param_cub_simu[gg[0],bf[0],*
for ii=0,n_elements(h_x)-1 do begin
  l_h[ii]=0.
  w=where(abs(param_cub_simu[0,*,4]-h_x[ii]) lt 0.01)
  l_h[ii]=total(double(exp(l[w]+abs(max(l)))))
 ; l_h[where(~finite(l_h))]=0.
endfor
;l_h=l_h/total(l_h)*10.
l_h_tot[i,*]=l_h



for ii=0,n_elements(g_x)-1 do begin
  l_g[ii]=0.
  w=where(param_cub_simu[0,*,3] eq g_x[ii])
  l_g[ii]=total(double(exp(l[w]+abs(max(l)))))
  ;l_g[where(~finite(l_g))]=0.
endfor
;l_g=l_g/total(l_g)/10.
l_g_tot[i,*]=l_g

endfor




; set_plot, 'z'
;!P.FONT=1
;!P.BACKGROUND=255
;!P.COLOR=0
;device, set_resolution=[2000,1600], SET_FONT='Times',decomposed=0, z_buffering=1, set_pixel_depth=24;,set_color=256
;image_colortable=color
;erase,255

l_h_stack=dblarr(n_elements(h_x))
for ii=0,n_elements(h_x)-1 do l_h_stack[ii]=total(l_h_tot(*,ii))/n_tir
l_g_stack=dblarr(n_elements(g_x))
for ii=0,n_elements(g_x)-1 do l_g_stack[ii]=total(l_g_tot(*,ii))/n_tir
l_h_stack_tot[num_inv,*]=l_h_stack/total(l_h_stack)/steph
l_g_stack_tot[num_inv,*]=l_g_stack/total(l_g_stack)/10.
;l_g_stack_tot[num_inv,0:9]=l_g_stack_tot[num_inv,0:9]*10.
bf_tot[num_inv,*]=bf
endfor

time=systime(1)-t
print, "inversion time : ", time 
;save, time, l_h_stack_tot, l_g_stack_tot,bf_tot, filename='/home/fandrieu/Inversion/valid_num_results_stack_sigma004.sav'
l_g=dblarr(n_elements(g_x))
m_h=fltarr(n_elements(h))
m_g=fltarr(n_elements(g))
for i=0,n_elements(h)-1 do m_h[i]=total(l_h_stack_tot[i,*]*h_x*steph)
sig=fltarr(n_elements(h))
for i=0,n_elements(h)-1 do sig[i]=sqrt(total(l_h_stack_tot[i,*]*steph*(h_x-m_h[i])^2))
fwhm_h=sig*(2*SQRT(2*ALOG(2)))
err_h=2.*sig
for i=0,n_elements(g)-1 do m_g[i]=total(l_g_stack_tot[i,*]*g_x*10.)
sig=fltarr(n_elements(g))
for i=0,n_elements(g)-1 do sig[i]=sqrt(total(l_g_stack_tot[i,*]*10.*(g_x-m_g[i])^2))
fwhm_g=sig*(2*SQRT(2*ALOG(2)))
err_g=2.*sig
window, 0
device,  decomposed=0
LOADCT,39 
erase,255
!P.BACKGROUND=255
!P.COLOR=0
!P.Font=1
plot, h_x,l_h_stack_tot[0,*]

window, 1
device,  decomposed=0
LOADCT,39 
erase,255
!P.BACKGROUND=255
!P.COLOR=0
!P.Font=1
plot, g_x,l_g_stack_tot[0,*]

set_plot, 'z'
plot_file='valid_num_g1mic_h10_pdfg_run6'
main_dir='/home/fandrieu/Inversion/valid_num_plots/'
plot_file=strcompress(main_dir+plot_file+'.png', /remove_all)
!P.FONT=1
!P.BACKGROUND=255
!P.COLOR=0
device, set_resolution=[2000,1600], SET_FONT='Times',decomposed=0, z_buffering=1, set_pixel_depth=24;,set_color=256
erase,255
LOADCT,39
plot, g_x,l_g_stack_tot[0,*], charsize=4, charthick=4, thick=4, xthick=4, ythick=4,$
xtitle='snow grain-size ('+string(181b)+'m)', ytitle='PDF'
t=tvrd(true=1)
write_png, plot_file, t
device, /close
print, 'output  :', plot_file
set_plot, 'X'

set_plot, 'z'
plot_file='valid_num_g1mic_h10_pdfh_run6'
main_dir='/home/fandrieu/Inversion/valid_num_plots/'
plot_file=strcompress(main_dir+plot_file+'.png', /remove_all)
!P.FONT=1
!P.BACKGROUND=255
!P.COLOR=0
device, set_resolution=[2000,1600], SET_FONT='Times',decomposed=0, z_buffering=1, set_pixel_depth=24;,set_color=256
erase,255
LOADCT,39
plot, h_x,l_h_stack_tot[0,*], charsize=4, charthick=4, thick=4, xthick=4, ythick=4,$
xtitle='slab thickness (mm)', ytitle='PDF'
t=tvrd(true=1)
write_png, plot_file, t
device, /close
print, 'output  :', plot_file
set_plot, 'X'


oplot, h_x,l_h_stack_tot[1,*]
oplot, h_x,l_h_stack_tot[2,*]
oplot, h_x,l_h_stack_tot[3,*]
oplot, h_x,l_h_stack_tot[4,*]
oplot, h_x,l_h_stack_tot[5,*], color=150
oplot, h_x,l_h_stack_tot[6,*], color=150
oplot, h_x,l_h_stack_tot[7,*], color=150
oplot, h_x,l_h_stack_tot[8,*], color=150
oplot, h_x,l_h_stack_tot[9,*], color=150
oplot, h_x,l_h_stack_tot[10,*], color=250
oplot, h_x,l_h_stack_tot[11,*], color=250
oplot, h_x,l_h_stack_tot[12,*], color=250
oplot, h_x,l_h_stack_tot[13,*], color=250
oplot, h_x,l_h_stack_tot[14,*], color=250


window, 2
device,  decomposed=0
LOADCT,39 
erase,255
!P.BACKGROUND=255
!P.COLOR=0
!P.Font=1
plot, g_x,l_g_stack_tot[0,*]
oplot, g_x,l_g_stack_tot[1,*], color=50
oplot, g_x,l_g_stack_tot[2,*], color=150
oplot, g_x,l_g_stack_tot[3,*], color=205
oplot, g_x,l_g_stack_tot[4,*], color=250
oplot, g_x,l_g_stack_tot[5,*]
oplot, g_x,l_g_stack_tot[6,*], color=50
oplot, g_x,l_g_stack_tot[7,*], color=150
oplot, g_x,l_g_stack_tot[8,*], color=205
oplot, g_x,l_g_stack_tot[9,*], color=250
oplot, g_x,l_g_stack_tot[10,*]
oplot, g_x,l_g_stack_tot[11,*], color=50
oplot, g_x,l_g_stack_tot[12,*], color=150
oplot, g_x,l_g_stack_tot[13,*], color=205
oplot, g_x,l_g_stack_tot[14,*], color=250


window, 3
device,  decomposed=0
LOADCT,39 
erase,255
!P.BACKGROUND=255
!P.COLOR=0
!P.Font=1
plot, h,param_cub_simu[0,bf_tot[*,0],2], psym=1
for i=0,n_tir-1 do oplot, h,param_cub_simu[0,bf_tot[*,i],2], psym=1



window, 4
device,  decomposed=0
LOADCT,39 
erase,255
!P.BACKGROUND=255
!P.COLOR=0
!P.Font=1
plot, g,param_cub_simu[0,bf_tot[*,0],1], psym=1, xrange=[0.,500.], yrange=[0.,500.], xstyle=1, ystyle=1
for i=0,n_tir-1 do oplot, g,param_cub_simu[0,bf_tot[*,i],1], psym=1

window, 5
device,  decomposed=0
LOADCT,39 
erase,255
!P.BACKGROUND=255
!P.COLOR=0
!P.Font=1
plot, [0.,max(h_x)], [0.,max(h_x)]
errplot,h, m_h-err_h, m_h+err_h, thick=2,color=250
oplot, h,m_h, psym=1

window, 6
device,  decomposed=0
LOADCT,39 
erase,255
!P.BACKGROUND=255
!P.COLOR=0
!P.Font=1
plot, [0.,max(g_x)], [0.,max(g_x)]
errplot,g, m_g-err_g, m_g+err_g, thick=2,color=250
oplot, g,m_g, psym=1

druche=drach
end
