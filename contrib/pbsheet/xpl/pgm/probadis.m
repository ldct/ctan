function res = probadis(x,p)
%res = PROBADIS(x,p)
%        Input   x     vector of real numbers (support points in IR)
%                p     vector of probability weights associated to x
%                      i.e. non-negative real numbers such that sum(p) == 1
%        Output  res   random number chosen from the finite discrete 
%                      distribution on x(1),...,x(n) with probability weights
%                      p(1),...,p(n) where n == length(x) == length(p)
%
% Renvoie UNE réalisation de la loi discrète à support fini sur IR dont les 
% points de support sont les composantes du vecteur x, et les poids sont les 
% composantes du vecteur p. Donc x(i) a une probabilité p(i) d'être renvoyé.
%
% La méthode consiste à écrire l'intervalle [0,1] comme une réunion disjointe
% d'intervalles de longueurs p(1),..., p(n) puis à regarder au quel appartient
% la réalisation d'une loi uniforme obtenue par un appel à rand. Les valeurs 
% renvoyées par des appels successifs sont donc pseudo-indépendantes. 
% Pour des raisons d'efficacité, les conditions nécessaires suivantes ne sont 
% pas contrôlées par cette fonction :
%  - le nombre de paramètres passés est exactement 2
%  - les deux paramètres x et p sont bien des vecteurs et sont de même longueur
%  - les composantes de p sont positives ou nulles et leur somme vaut 1.
%
% See also RDISCR.
%
% ### Copyright (C) D. Chafaï, 2003-12-06.
% ### http://www.lsp.ups-tlse.fr/Chafai/agregation.html
% ### Licence GNU General Public License http://www.gnu.org/copyleft/gpl.html
%

% On pourrait implémenter cette fonction de la façon suivante :
%
%  INDICES = find(cumsum(p) >= rand);
%  res = x(INDICES(1));
%  return;
%
% Cette méthode est correcte mais inefficace car elle ne tient pas compte de 
% la monotonie de cumsum(p), ce qui entraine des tests inutiles une fois que
% la valeur critique a été franchie. En jargon, c'est un 'firstmatch' qu'il 
% nous faut, pas un 'matchall'. Le nombre de if impliqués dans find est 
% toujours égal à la taille de ce qu'on lui passe en paramètre.
%
% Morale de l'histoire : la brièveté d'un code n'assure pas sa performance !
% Et l'abscence de if dans un code ne signifie pas qu'il ne fait pas appel
% indirectement à des if, et encore moins que cela est fait de manière 
% optimale ! La fonction find n'est qu'une boucle for contenant un if.
%
% Ci-dessous, nous utilisons une version plus rapide dans le plus pur style
% for-if avec un nombre de if optimal. On pourrait adapter l'ordre des 
% intervalles testés (et donc l'arbre associéé) aux poids p(i) de façon à
% tester d'abord les intervalles les plus probables. Est-ce vraiment mieux ?
% Exercice !

n = length(x);    % le nombre d'atomes.
r = rand;         % une réalisation de loi uniforme sur [0,1].
a = 0; b = p(1);  % [a,b] = sous-intervalle de proba p(i) pour l'uniforme.
for i = 1:n-1     % parcours de tous les sous-intervalles juxtaposés.
   if ((r >= a) & (r < b))
      res = x(i);
      return;     % on a trouvé le bon intervalle, on sort.
   end
   a = b; b = b + p(i+1); % on passe à l'intervalle suivant.
end
res = x(n); % le bon intervalle est le dernier.
return;
