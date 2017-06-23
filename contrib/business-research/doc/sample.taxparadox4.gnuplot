set table "sample.taxparadox4.table"; set format "%.5f"
set samples 100; plot [x=0.0:1] -300+(105-x*(105-100))/(1+0.1*(1-x))+(115-x*(115-100))/(1+0.1*(1-x))**2+(145-x*(145-100))/(1+0.1*(1-x))**3
