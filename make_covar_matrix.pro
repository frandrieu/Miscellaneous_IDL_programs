pro test_covar_matrix

dim=247
sigma_1=0.02
sigma_2=0.02
sigma_3=0.03

;vardiag=5e-3  ; variance associée à chaque longueur d'onde 
;rapp=500.     ; rapport entre la première valeur propre, correpondant au plus grand axe de variance, et toutes les autres valeurs propres identiques
a=dblarr(dim,dim)

axe1=replicate(double(1),dim)

dimodd= dim mod 2
if dimodd EQ 1 then axe2=double(round(dim/2)-indgen(dim))
if dimodd EQ 0 then axe2=[double(-1*(-1*indgen(dim/2)+replicate(1,dim)+dim/2-1)),double(indgen(dim/2)+1)]

base=diag_matrix(replicate(double(1),dim))

v=axe1
a[*,0]=v/sqrt((total(v*v)))
print, total(a[*,0]*a[*,0])

v=axe2
a[*,1]=v/sqrt((total(v*v)))
print, total(a[*,0]*a[*,1])
print, total(a[*,1]*a[*,1])


; Extension à N dimension 
;command='v=new_v'
command='v=new_v-total(a[*,0]*new_v)*a[*,0]'
command101='v=v'
command201='v=v'

for i=2,dim-1 do begin

  new_v=base[*,i-1]

  if i LE 100 then begin
    command=strcompress([command+' -total(a[*,'+string(i-1)+']*new_v)*a[*,'+string(i-1)+']'], /remove_all)
;    print, command
    out=execute(command[0])
   ; print, out
    if i EQ 100 then begin
    command100=command
;    print, command100
    endif
  
  endif else begin
  if i LE 200 then begin
  
    out=execute(command100[0])
   ; print, out
    
    command101=strcompress([command101+' -total(a[*,'+string(i-1)+']*new_v)*a[*,'+string(i-1)+']'], /remove_all)
    out=execute(command101[0])
;    print, command101
    ;print, out
    
    if i EQ 200 then begin
    command200=command101
;    print, command200
    endif
     
  endif else begin
  if i LE 300 then begin
  
    out=execute(command100[0])
    ;print, out

    out=execute(command200[0])
    ;print, out
        
    command201=strcompress([command201+' -total(a[*,'+string(i-1)+']*new_v)*a[*,'+string(i-1)+']'], /remove_all)
    out=execute(command201[0])
;    print, command201
    ;print, out
     
  endif  
  endelse
  endelse

  a[*,i]=v/sqrt((total(v*v)))

endfor

;;;; Manual
;new_v=base[*,0]
;v=new_v -total(a[*,0]*new_v)*a[*,0]
;a[*,1]=v/sqrt((total(v*v)))
;;print, total(a[*,0]*a[*,1])
;;print, total(a[*,1]*a[*,1])
;
;new_v=base[*,1]
;v=new_v -total(a[*,0]*new_v)*a[*,0] -total(a[*,1]*new_v)*a[*,1]
;a[*,2]=v/sqrt((total(v*v)))
;;print, total(a[*,0]*a[*,2])
;;print, total(a[*,1]*a[*,2])
;;print, total(a[*,1]*a[*,2])
;
;new_v=base[*,2]
;v=new_v -total(a[*,0]*new_v)*a[*,0] -total(a[*,1]*new_v)*a[*,1] -total(a[*,2]*new_v)*a[*,2]
;a[*,3]=v/sqrt((total(v*v)))
;;print, total(a[*,0]*a[*,3])
;;print, total(a[*,1]*a[*,3])
;;print, total(a[*,2]*a[*,3])
;;print, total(a[*,3]*a[*,3])
;;;;



w=where(abs(a) LT 10^(-10.)) ; pour retirer les petites valeurs
if w[0] NE -1 then a[w]=0

;print, 'a'
;print, a
;
;print, v
;print, base

;print, 'diff (transpose(a) ## a) = Identity '
;print, max(abs((transpose(a) ## a) - base))


;x=vardiag
;y=(rapp-1.)/(dim+rapp-1.)*x
;first_eigen=x+(dim-1.)*y
;others_eigen=x-y

;val=sigma_2^2/(total(a)-total(a[0,*]))^2
;eigen=replicate(val, dim)

eigen=replicate( dim/(dim-2.)*sigma_3^2, dim)

eigen[0]=dim*sigma_1^2
eigen[1]=dim*sigma_2^2




d=diag_matrix(eigen)
covar = transpose(a) ## d ## a

;firsteigen=replicate(0.,dim)
;firsteigen[0]=eigen[0]
;covarr= transpose(a) ## diag_matrix(firsteigen) ## a
;print, 'covar first eigen'
;print, covarr
;
;
;print, 'covar'
;print, covar


;;;; TEST DE DIAGONALISATION

;eval = EIGENQL(covar, EIGENVECTORS = evec)

;covarr= transpose(evec) ## diag_matrix(eval) ## evec
;print, max(abs(covarr-covar))

;print, a

;print, 'evec'
;print, evec
;
;print, 'eval'
;print, eval
;
;print, 'diff eval'
;print, max(abs(eval-diag_matrix(d)))

;firsteigen=replicate(0.,dim)
;;firsteigen[*]=eigen[*]
;firsteigen[1]=eigen[1]
;
;;
;covarr= transpose(a) ## diag_matrix(firsteigen) ## a
;print, 'covar first eigen'
;print, diag_matrix(covarr)

for i=0,dim-1 do begin
for j=0, dim-1 do begin
if covar[i,j] ne covar[j,i] then covar[j,i]=covar[i,j]   
endfor
endfor
mat_covar_coef=covar

save, mat_covar_coef, filename='/home/fandrieu/Inversion/results/idl_files/mat_covar_coef_renorm_noise_3percent_level_0dot02.sav'

endprog:

end