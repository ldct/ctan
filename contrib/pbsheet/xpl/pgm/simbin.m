%
% ### Copyright (C) D. Chafaï, 2003-12-06.
% ### http://www.lsp.ups-tlse.fr/Chafai/agregation.html
% ### Licence GNU General Public License http://www.gnu.org/copyleft/gpl.html
%
% Ce bout de code permet de simuler une loi binomiale B(n,p) et de comparer 
% graphiquement les moyennes empiriques avec la moyenne théorique.
% Tous les vecteurs sont des vecteurs ligne.
%
% Nota bene : la bibliothèque Stixbox fournit la fonction rbinom qui permet 
% de s'affranchir des calculs détaillés ici, cf. fin du présent fichier.
%
clear r n p q P Q C B X
clf
%
r = input('Nombre maximal de réalisations ? = ');
n = input('Taille n de la loi binomiale B(n,p), qui a n+1 atomes ? = ');
p = input('Valeur du paramètre p de la loi binomiale B(n,p) ? = ');
% p = proba de gagner à pile ou face = proba de 1 dans la Bernoulli sur {0,1}
% q = proba de perdre à pile ou face = proba de 0 dans la Bernoulli sur {0,1}
% B(n,p) est la loi de la somme de n v.a. i.i.d. de Bernoulli de ce type,
% i.e. la nième puissance de convolution de cette loi de Bernoulli. Elle 
% représente la loi du nombre de succés à pile ou face en n lancés.
%
disp(sprintf('Calcul de la loi binomiale B(%d,%f)',n,p))
q = 1 - p;
P = [1 , cumprod(p * ones(1,n))];              % puissances croissantes de p
Q = [fliplr(cumprod(q * ones(1,n))), 1];       % puissances décroissantes de q
C = [1 , cumprod([n:-1:1]) ./ cumprod([1:n])]; % coef. du binôme de i = 1 à n
B = C .* P .* Q;                               % vecteur des poids de B(n,p)
%
disp(sprintf('Génération aléatoire de %d réalisations de B(%d,%f)',r,n,p))
X = rdiscr([1,r],[0:n],B);                     % échantillonnage
% alternative :
%X=[]
%for i=1:r
%	X = [X probadis([0:n],B)];
%end
%
disp(sprintf('Tracé des graphique.'))
plot(cumsum(X) ./ [1:length(X)],'b')           % tracé des moyennes empiriques
title('Loi des Grands Nombres')
xlabel('Nombre de realisations')
ylabel('Moyennes empiriques')
hold on
plot(n * p * ones(1,r),'r--')                  % tracé de la moyenne théorique
legend('Empirique','Theorique')
hold off
%
% Avec Stixbox, inutile de calculer B et d'appeler rdiscr([1,r],[0:n],B) 
% puisque qu'un simple rbinom([1,r],n,p) suffit.  
% Même si l'on décide d'utiliser quand même prodadis, les coefficients 
% binomiaux nécessaires au calcul de B peuvent se calculer beaucoup plus vite 
% en utilisant la fonction Stixbox bincoef qui fait appel à la fonction gamma.
%
