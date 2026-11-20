⍝ exercicio_10.apl — Estatísticas de seis notas
⍝ Tarefa: obter maior, menor, média e amplitude de um vetor de notas.
⎕IO ← 1

notas ← 7.5 9 6 10 8.5 5

maior ← ⌈/notas
menor ← ⌊/notas
media ← (+/notas) ÷ ⍴notas

⎕← 'notas: ', ∊⍕notas
⎕← 'maior: ', ⍕maior
⎕← 'menor: ', ⍕menor
⎕← 'média: ', ⍕media
⎕← 'amplitude: ', ⍕maior - menor
⎕← 'aprovados (nota ≥ 7): ', ⍕+/notas ≥ 7
