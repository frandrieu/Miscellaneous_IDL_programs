pro fresnel_coef
cd, '/home/fandrieu/Simu_IPAG/pro/'
resolve_routine, 'colorbar'
resolve_routine, 'tv_polar'
cd, '/home/fandrieu'



n_max=100
n1=1.
k1=0.
n2=1.3
k2=1.e-5
mu=sqrt(2.)/2.
mu=cos(52.5*!pi/180.)
n2_list=float(indgen(n_max)/float(n_max))*1.+1.
k2_list=10^(-(float(indgen(n_max)/float(n_max))*7.+2.))
g1=fltarr(n_max, n_max)
g2=fltarr(n_max, n_max)
rpe=fltarr(n_max, n_max)
rpa=fltarr(n_max, n_max)
nn=fltarr(n_max, n_max)
kk=fltarr(n_max, n_max)
r=fltarr(n_max, n_max)
for i=0,n_max-1 do begin
  for j=0,n_max-1 do begin
    
    n2=n2_list[i]
    k2=k2_list[j]
    n=(n1*n2+k1*k2)/(n1^2+k1^2)
    k=(n1*k2-n2*k1)/(n1^2+k1^2)
    nn[i,j]=n2
    kk[i,j]=k2
    g1[i,j]=sqrt(0.5*(n^2-k^2-(1-mu^2)+$
      sqrt((n^2-k^2-(1-mu^2))^2+4.*n^2*k^2))) 
    g2[i,j]=sqrt(0.5*(-(n^2-k^2-(1-mu^2))+$
      sqrt((n^2-k^2-(1-mu^2))^2+4.*n^2*k^2)))
    rpe[i,j]=((mu-g1[i,j])^2+g2[i,j]^2)/((mu+g1[i,j])^2+g2[i,j]^2)
    rpe[i,j]=sqrt(rpe[i,j])
    rpa[i,j]=(((n^2-k^2)*mu-g1[i,j])^2+(2.*n*k*mu-g2[i,j])^2)/$
      (((n^2-k^2)*mu+g1[i,j])^2+(2.*n*k*mu-g2[i,j])^2)
    rpa[i,j]=sqrt(rpa[i,j])
    r[i,j]=(rpa[i,j])^2+(rpe[i,j])^2
  endfor
endfor

dd=r
range=[min(dd), max(dd)]     
nsym=4
x=1.
y=1.
factx=0.85*200./float(n_max)
facty=0.5*200./float(n_max)
sx=factx*[-x,-x,x,x]
sy=facty*[-y,y,y,-y]
USERSYM, sx, sy, THICK=1, /FILL
window,0, xsize=650, ysize=450
device,  decomposed=0
LOADCT,39 
erase,255
!P.BACKGROUND=255
!P.COLOR=0
!P.Font=1

plot, nn, kk, psym=3,POSITION=[0.17, 0.1, 0.95, 0.75],/ylog, charsize=2;, xrange=[0.,90],xstyle=1, yrange=[0.,180],ystyle=1
for i=0,n_elements(nn)-1 do oplot, [0.,nn[i]], [0.,kk[i]], psym=8, symsize=1, color=fix(dd[i]/max(dd)*256)
COLORBAR, POSITION=[0.17, 0.85, 0.95, 0.90] , TITLE='', maxrange=max(range), minrange=min(range), format='(f9.3)', charsize=2, charthick=1

print, r[0]
plot, k2_list,r[49,*]
end