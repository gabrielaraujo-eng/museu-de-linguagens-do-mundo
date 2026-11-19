// Snippet AS3: Error é uma classe global do runtime.
try {
  throw new Error("Erro");
} catch (e:Error) {
  trace(e.message);
}
