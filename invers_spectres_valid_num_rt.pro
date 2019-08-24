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


pro invers_spectres_valid_num_rt,sigma

;;INVERTED VALUES;;
steph=1.
h=[1.,5.,10.,15.,19.,1.,5.,10.,15.,19.,1.,5.,10.,15.,19.]*10.*steph
g=[127.,127.,127.,127.,127.,210.,210.,210.,210.,210.,325.,325.,325.,325.,325.]

;;;;;;TIRAGES;;;;;;
n_tir=1000
;;;;;;;NOISE;;;;;;;
;sigma=0.001
mean=0.
;;;;;;;;;;;;;



restore, '/home/fandrieu/Inversion/valid_num_ter_cube.sav'


n_waves=n_elements(wavelengths)
s=size(cub_data)
d=fltarr(s[1]*s[2])
n=0
nfit=5
n_p=size(param_cub_simu)
s2=size(cub_simu)

n_par=n_p[2]

lmax=fltarr(nfit)

a=param_cub_simu[0,*,2]
h_slab_mod=a[uniq(a,sort(a))]
s_h = n_elements(h_slab_mod)
h_x=h_slab_mod
l_h=dblarr(n_elements(h_x))

a=param_cub_simu[0,*,1]
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

ggd=  where(abs(param_cub_data[0,*,1]-g[num_inv]) lt 0.001 and abs(param_cub_data[0,*,2]-h[num_inv]) lt 0.001)
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
  w=where(abs(param_cub_simu[0,*,2]-h_x[ii]) lt 0.01)
  l_h[ii]=total(double(exp(l[w]+abs(max(l)))))
 ; l_h[where(~finite(l_h))]=0.
endfor
;l_h=l_h/total(l_h)*10.
l_h_tot[i,*]=l_h


for ii=0,n_elements(g_x)-1 do begin
  l_g[ii]=0.
  w=where(param_cub_simu[0,*,1] eq g_x[ii])
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
bf_tot[num_inv,*]=bf
endfor

time=systime(1)-t
print, "inversion time : ", time 
name=strcompress('/home/fandrieu/Inversion/valid_num_results_stack_CO2-over-water_sigma'+$
string(100.*sigma, format="(F4.1)")+'percent_1000tirages.sav', /remove_all)
save, time, l_h_stack_tot, l_g_stack_tot,bf_tot, filename=name
print, name

end
