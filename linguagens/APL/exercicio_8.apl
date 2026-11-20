⍝ exercicio_8.apl — Contar vogais em uma frase
⍝ Tarefa: usar pertinência (∊) para marcar as vogais e +/ para contá-las.
⎕IO ← 1

frase ← 'o museu documenta linguagens de programacao'
vogais ← 'aeiou'

marcas ← frase ∊ vogais

⎕← 'frase: ', frase
⎕← 'total de caracteres: ', ⍕⍴frase
⎕← 'total de vogais: ', ⍕+/marcas
⎕← 'total de consoantes e espaços: ', ⍕+/~marcas
