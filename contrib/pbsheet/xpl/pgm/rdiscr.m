function X = rdiscr(num,x,p)
%X = RDISCR(num,x,p)
%        Input   num   positive integer or a vector [lig,col] of integers
%                x     vector of real numbers (support points in IR)
%                p     vector of probability weights associated to x
%                      i.e. non-negative real numbers such that sum(p) == 1
%        Output  X     num-vector or a num-matrix of random numbers
%                      chosen from the finite discrete distribution on 
%                      x(1),...,x(n) with probability weights p(1),...,p(n) 
%                      where n == length(x) == length(p)
%
% Renvoie num réalisations ou une matrice [lig,col] de réalisations 
% pseudo-i.i.d de la loi discrète à support fini sur IR dont les 
% points de support sont les composantes du vecteur x, et les poids sont les 
% composantes du vecteur p. Donc x(i) a une probabilité p(i) d'être renvoyé.
%
% La méthode consiste à écrire l'intervalle [0,1] comme une réunion disjointe
% d'intervalles de longueurs p(1),..., p(n) puis à regarder au quel appartient
% la réalisation d'une loi uniforme obtenue par un appel à rand. Les valeurs 
% renvoyées par des appels successifs sont donc pseudo-indépendantes. 
% Pour des raisons d'efficacité, les conditions nécessaires suivantes ne sont 
% pas contrôlées par cette fonction :
%  - le nombre de paramètres passés est exactement 3
%  - les deux paramètres x et p sont bien des vecteurs et sont de même longueur
%  - les composantes de p sont positives ou nulles et leur somme vaut 1
%  - le paramètre num est un entier positif non nul une un couple de ce type
%
% See also PROBADIS.
%
% ### Copyright (C) D. Chafaï, 2003-12-06.
% ### http://www.lsp.ups-tlse.fr/Chafai/agregation.html
% ### Licence GNU General Public License http://www.gnu.org/copyleft/gpl.html
%

% Voir les commentaires dans le code de la fonction probadis.
% Faire 'type probadis' pour cela.
% Le code qui suit pourrait beaucoup gagner en rapidité sur une machine //
% Il est possible de l'améliorer en stockant un arbre construit avec les 
% tests utilisés par les valeurs déjà générées. Il est surtout aussi possible
% d'imiter le code matriciel de la fonction de répartition inverse binomiale 
% de la fonction qbinom de Stixbox, appelée par rbinom. Exercice !
%
% D'autres algorithmes sont possibles. Par exemple, on pourrait procéder
% avec des réalisations de Bernoulli i.i.d. (obtenues facilement avec rand)
% pour choisir l'intervalle : 
% La probabilité d'être <= x(1) est p(1)
% Sinon, la probabilité d'être <= x(2) est p(2)/sum(p(2:n))
% etc. Nul besoin de commencer par x(1), et l'on peut adapter l'arbre utilisé
% aux poids p(i) de façon à faire un nombre de tests optimal. Exercice !

if length(num) == 1
   num = [num 1];
else 
   num = reshape(num,1,2);
end

n = length(x);    % le nombre d'atomes.
U = rand(num);    % réalisations de loi uniforme sur [0,1].
X = repmat(x(n),num(1),num(2)); % par défaut, la valeur est la plus grande
for l = 1:num(1) % lignes
for c = 1:num(2) % colonnes
	a = 0; b = p(1);  % [a,b] = sous-inter. de proba p(i) pour l'uniforme.
	for i = 1:n-1 % parcours de tous les sous-intervalles juxtaposés.
   		if ((U(l,c) >= a) & (U(l,c) < b))
      			X(l,c) = x(i);
      			break; % on a trouvé le bon intervalle, on sort.
   		end
   		a = b; b = b + p(i+1); % on passe à l'intervalle suivant.
	end
end
end
return;
