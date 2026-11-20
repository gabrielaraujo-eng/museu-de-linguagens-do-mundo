/**
 * exemplo_10.cls - DML, SOQL e testes unitários
 *
 * Tópico avançado: gravar e consultar registros na org e verificar o
 * comportamento com uma classe de teste anotada com @isTest.
 *
 * Pontos de sintaxe:
 *  - DML: insert, update, delete recebem um sObject ou uma lista deles.
 *  - SOQL: a consulta vai entre colchetes e devolve List<sObject>; COUNT()
 *    devolve Integer.
 *  - Test.startTest() / Test.stopTest() isolam um novo conjunto de limites
 *    de governador para o trecho testado.
 *  - Classes @isTest são privadas ou públicas, de nível superior, e não
 *    podem ser chamadas por código fora de um teste.
 *
 * Como executar: é uma classe de teste, portanto não funciona em Execute
 * Anonymous. Use o executor de testes:
 *   sf apex run test --class-names exemplo_10 --wait 10
 * ou, no Developer Console, Test > New Run.
 *
 * Requer uma org Salesforce: sem org não há banco para o DML nem dados para
 * o SOQL.
 */
@isTest
private class exemplo_10 {

    @isTest
    static void deveInserirEConsultarContas() {
        // Preparação: fora de startTest, para não consumir os limites do trecho.
        List<Account> novas = new List<Account>{
            new Account(Name = 'Museu de Linguagens A', Industry = 'Education'),
            new Account(Name = 'Museu de Linguagens B', Industry = 'Education')
        };
        insert novas;

        System.assertEquals(2, novas.size(), 'Duas contas deveriam ter sido criadas.');
        System.assert(novas[0].Id != null, 'O Id é preenchido pela DML após o insert.');

        Test.startTest();

        // SOQL com filtro e ordenação: devolve List<Account>.
        List<Account> encontradas = [
            SELECT Id, Name, Industry
            FROM Account
            WHERE Name LIKE 'Museu de Linguagens%'
            ORDER BY Name
        ];

        // COUNT() devolve Integer, não lista.
        Integer total = [SELECT COUNT() FROM Account WHERE Industry = 'Education'];

        Test.stopTest();

        System.assertEquals(2, encontradas.size(), 'A consulta deveria achar as duas contas.');
        System.assertEquals('Museu de Linguagens A', encontradas[0].Name, 'A ordem é por Name.');
        System.assertEquals(2, total, 'O COUNT() deveria contar as duas contas.');
    }

    @isTest
    static void deveAtualizarConta() {
        Account conta = new Account(Name = 'Museu de Linguagens C', Industry = 'Education');
        insert conta;

        Test.startTest();
        conta.Industry = 'Government';
        update conta;
        Test.stopTest();

        // Consulta por Id usando variável de ligação (dois-pontos).
        Account relida = [SELECT Id, Industry FROM Account WHERE Id = :conta.Id];
        System.assertEquals('Government', relida.Industry, 'A indústria deveria estar atualizada.');
    }

    @isTest
    static void deveTratarFalhaDeDml() {
        // Database.insert com allOrNone = false devolve os erros por registro.
        List<Account> invalidas = new List<Account>{ new Account() };
        Test.startTest();
        List<Database.SaveResult> resultados = Database.insert(invalidas, false);
        Test.stopTest();

        System.assertEquals(1, resultados.size(), 'Um resultado por registro enviado.');
        System.assert(!resultados[0].isSuccess(), 'Conta sem Name deve falhar na validação.');
    }
}
