//Ton Andreea_Ioana 313CA
In functia Iterative am citit nr de noduri urmate de lista de adiacenta
si am construit matricea de adiancenta citind nr. de linkuri pt fiecare nod
si punand in matrice legatura dintre 2 pagini. Am verificat daca exista link
spre acelasi nod si in caz ca A(i,i)==1 l-am suprascris cu 0 si am scazut
numarul de linkuri. Ulterior am impartit fiecare valoare din A la nr de linkuri
al fiecarui nod si am transpus matricea. Am citit val1 si val 2 din fisier. Am 
inmultit R cu 1/norma sa si i-am reactualizat valoarea. Am salvat valoarea
anterioara a lui R si am calculat R1=d.*A*R+((1-d)./N).*one1 cat timp diferenta
dintre norma(R-valoarea anterioara a lui R) este mai mare decat R. La Algebraic
am calculat idem matricea A dupa care am calculat inversa lui  M=In-d*A pentru
a gasi formula pentru R fara iteratii:R=(In-d*A)^(-1)*(1-d)/N*one1. In 
algoritmul PageRank am calculat idem matricea A dupa care am format numele 
fisierului de output si l-am deschis si am creat un vector care sa retina
ordinea nodurilor ca dupa sortare sa putem printa noua ordine. Am calculat 
si printat in fisier vectorul PR mai intai cu algoritmul Iterative si mai apoi
cu algoritmul Algebraic. Am calculat valorile a si b intr-un sistem pentru ca
functia F sa fie continua. Am sortat vectorul PR descrescator si am refacut si 
ordinea nodurilor din vectorul K. Pentru fiecare valoare din PR am calculat
F(PR) in functie de ramurile functiei si am afisat K si F in fisierul de output.
