pro make_kn_water


restore, '/Users/fandrieu/Documents/Save_Macbook_pro/Documents/Inversion_Achille-dir/Const_optiques/index_ice_rf_warren_2008.txt-ascii_template'
data=read_ascii('/Users/fandrieu/Documents/Save_Macbook_pro/Documents/Inversion_Achille-dir/Const_optiques/index_ice_rf_warren_2008.txt', template=temp)
lambda=data.FIELD1
nn=data.FIELD2
kk=data.FIELD3
n=nn
k=kk
nu=lambda
for i=0,485 do begin 
  n[i]=nn[485-i]
  k[i]=kk[485-i]
  nu[i]=10000./lambda[485-i]
endfor
data2=read_ascii('/Users/fandrieu/Documents/Save_Macbook_pro/Documents/Inversion_Achille-dir/Const_optiques/kn-H2Ocr-N.270K_Schmitt')
n2=data2.FIELD1[1,*]
k2=data2.FIELD1[2,*]
nu2=data2.FIELD1[0,*]
;Warren 1 micron
;w=where(nu gt 8566.)
;w2=where(nu2 le 8566.)
;Schmitt 1 micron
w=where(10000./nu lt 1.)
w2=where(10000./nu2 ge 1.)
;nuref=fltarr(43557l)
nint=n_elements(w2)
ntot=43557l
nint2=n_elements(w)+1
nuref=fltarr(ntot-nint)
step=0.482131 ; pas entre 0 et 10000 cm-1. on continue jusqu'à 21000
nuref[0]=nu2[nint-1]
for i=1,ntot-nint-1 do nuref[i]=nuref[i-1]+step
kdada=fltarr(nint2)
ndada=fltarr(nint2)
nudada=fltarr(nint2)
kdada[1:nint2-1]=k[w]
ndada[0]=n2[nint-1]
ndada[1:nint2-1]=n[w]
kdada[0]=k2[nint-1]
nudada[1:nint2-1]=nu[w]
nudada[0]=nu2[nint-1]
k_interp=interpol(kdada, nudada, nuref)
n_interp=interpol(ndada, nudada, nuref)


nu3=fltarr(nint+ntot-nint)
n3=fltarr(nint+ntot-nint)
k3=fltarr(nint+ntot-nint)
nu3[0:nint-1]=nu2[w2]
nu3[nint:nint+ntot-nint-1]=nuref;[1:ntot-nint]
n3[0:nint-1]=n2[w2]
n3[nint:nint+ntot-nint-1]=n_interp;[1:ntot-nint]
k3[0:nint-1]=k2[w2]
k3[nint:nint+ntot-nint-1]=k_interp;[1:ntot-nint]
;
;nu3=fltarr(nint+nint2-1)
;n3=fltarr(nint+nint2-1)
;k3=fltarr(nint+nint2-1)
;nu3[0:nint-1]=nu2[w2]
;nu3[nint:nint+157]=nu[w]
;n3[0:nint-1]=n2[w2]
;n3[nint:nint+157]=n[w]
;k3[0:nint-1]=k2[w2]
;k3[nint:nint+157]=k[w]
plot, nu3,k3, xrange=[9800, 10200], /ylog
openw, lun, '/Users/fandrieu/Documents/Save_Macbook_pro/Documents/Inversion_Achille-dir/Const_optiques/kn-H2Ocr-N.270K_compil_interp_schmitt1', /get_lun
;openw, lun, '/home/fandrieu/Inversion/Programmes/Const_optiques/kn-white', /get_lun
;for i=0,nint+157 do begin
for i=0,nint+ntot-nint-1 do begin
  ;water
  buse=[nu3[i],n3[i],k3[i]]
  printf, lun, buse, format='(f9.3,2x,f6.4,2x,e11.5)'
  
  ;white, n=1.5
  ;buse=[nu3[i],1.5,0.]
  ;printf, lun, buse, format='(f9.3,2x,f6.4,2x,e11.5)'  
endfor

close, lun

end