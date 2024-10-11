# Criando uma arquitetura medalhao com DBT-Core
- [ ] Criar as camadas **Bronze**, **Silver** e **Gold**
- [ ] Anonimizar os dados
- [ ] Fazer o **CAST** das colunas

## Configuracao do DBT
1. `$ pip install dbt-postgres`
2. `dbt init`
   1. `dbt debug` para testar as configuracoes
3. Alterar o arquivo `models/schema.yml`
4. Criar as pastas **Bronze**, **Silver** e **Gold** na pasta `models`