In der Motiv Suche wird ein einheitliches Motiv mit der geringsten Hamming Distanz über alle input DNA Sequenzen gesucht mit gegebener Länge k, welche
vom User als Input bestimmt wird.
Je länger das gesuchte Motiv, desto länger die Berechnungszeit in unserer implementierten Brute-force variante (angelehnt an ein Beispiel aus
An Introduction to Bionformatics Algorithms fron Neil C. Jones und Pavel A. Pevzner).

Als Input dienen unsere selbt generierten DNA Sequenzen von Beispiel 7, die als Liste abgespeichert sind (jedes list item auf einer neuen Zeile).
Die Input Sequenzen werden Zeile für Zeile eingelesen und ebenfalls als Liste eingespeichert.

Der best_pattern ist der Start der brute force Motiv Suche. Die best_score Variable ist eine Liste mit dem schlechtesten möglichen score
(nur Mismatches +1), und einem Platzhalter für das Pattern welches gegen die Input strings gematcht wird.

Die Funktion product() ist ein Generator, welcher alle möglichen patterns (Kombinationen) aus 4 Nukleotiden mit der Länge k (angegebene Motiv Länge)
erstellt. Beispielsweise wird für eine gesuchte Motivlänge k=4 4ˆ4, also 256 Kombinationen (Patterns erstellt).
Für jedes Pattern wird die Summe der Hamming Distanzen zu den Input Strings (DNA Sequenzen berechnet) und als current_score zwischengespeichert.
In jeder Iteration wird der current_score mit dem best_pattern (initialized to worst score) verglichen. Wenn der current_score niedriger ist als
das worst-case Szenario, wird die Liste best_pattern überschrieben mit den neuen Werten.

Wenn alle Kombinationen (Patterns) gegen die Input Strings getestet wurden und die jeweiligen Hamming Distanzen berechnet und mit dem worst-case Score
verglichen wurden, enthält die Liste best_pattern nun endlich den besten score (geringste Hamming Distanz), und das beste Pattern, welches ausgegeben
werden kann.

Die Brute Force Variante hat eine expotentielle Laufzeit, da um jeden Wert um den k steigt, die Anzahl der zu testenden Kombinationen 4ˆk ist.
Um die Berechnung der Motive effektiver zu machen muss eine Heuristik angewandt werden. Der Branch and Bound Algorithmus wäre hier ideal. Dabei sind
wieder mehrere DNA Sequenzen Input und jede Verzweigung im Suchbaum wäre ein Nukleotid. Je länger das gesuchte Motiv sein soll, desto mehr verzeigt sich
der Baum nach unten. Ein effizienter Algorithmus würde nun beginnend am ersten Ast den Suchbaum nach unten abzugehen und das immer länger werdende Pattern
gegen die Input Sequenzen abzugleichen und die Summe der Hamming Distanzen zu berechnen. Wenn der Fortschritt im Suchbaum entlang eines Astes den Score
wieder verschlechtert, dann werden alle folgenden Kombinationen unter diesen Ast schlechter sein. In diesem Fall würde auf den Nächten Ast übergangen werde
um dort ebenfalls abzugleichen ob sich der score verbessert. So kann man effektiv das beste Pattern (Motiv) finden ohne alle möglichen Patterns 4ˆk
abgleichen zu müssen.

Um diesen Algorithmus implementiern zu können würden wir die im Unterricht besprochenen Next_Leaf und Next_Vertex Funktionen mit unserer
brute force Variante kombinieren müssen.

Pseudocode:
k = länge Motiv

#initialize worst score

best_score = k*number of input Sequenzen +1

#initialize search tree

search tree = pattern in product('AGCT', k)

#Abgleich der Hamming Distanzen über alle input Sequenzen

for pattern:
    current_score = Summe(Hamming Distanz(pattern, input_Sequenzen))
    if current_score =< best_score: #wenn current_score besser oder gleich best_score
        best_score = current_score
        next_leaf()     #wenn sich der score verbessert hat, wende next_leaf Funktion an um tiefer im Such Baum zu gehen und verlängere das Pattern damit um den 2. Nukleotid
    else:
        next_vertex() #wenn sich der score verschlechtert hat, wende next_vertex Funtion an um auf den nächten Ast im Such Baum zu springen und dort eine neue Suche zu starten

