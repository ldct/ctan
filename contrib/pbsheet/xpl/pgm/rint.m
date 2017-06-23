function X = rint(num,k);
% X = RINT(num,k)
%        Input   num     positive integer or a vector [lig,col] of integers
%                k       positive integer
%        Output  X       num-vector or a num-matrix of random numbers
%                        chosen from uniform distribution on {1,...,k}
%
% Renvoie num réalisations ou une matrice [lig,col] de réalisations 
% pseudo-indépendantes de la loi uniforme discrète sur les k premiers 
% entiers non nuls {1,...,k}.
%
% La méthode consiste à considérer la partie entière de 1+kU où U suit une loi
% uniforme sur [0,1]. Cette dernière s'obtient via la fonction rand, et les
% valeurs renvoyées par des appels successifs sont donc pseudo-indépendantes. 
%
% ### Copyright (C) D. Chafaï, 2003-12-06.
% ### http://www.lsp.ups-tlse.fr/Chafai/agregation.html
% ### Licence GNU General Public License http://www.gnu.org/copyleft/gpl.html
%

if length(num) == 1
   num = [num 1];
end
X = ceil(k * rand(num));
return;
