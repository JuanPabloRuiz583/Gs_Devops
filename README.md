# Instalação do projeto e instruções passo a passo para criar banco de dados + acr + appservice, via cli (obs: para o projeto funcionar sem erros os seguintes comandos abaixo precissam ser seguidos)

1. **Clone o repositório:**
   ```bash
   https://github.com/JuanPabloRuiz583/Gs_Devops.git

2. **Criar grupo de recurso :**
   ```bash
   az group create --name skillbridge-rg --location eastus


3. **Criar SQL Server:**
   ```bash
   az sql server create --name skillbridge-sqlsrv-br --resource-group skillbridge-rg --location brazilsouth --admin-user admin_fiap --admin-password Teste123!


4. **Criar banco de dados no SQL Server:**
   ```bash
   az sql db create --resource-group skillbridge-rg --server skillbridge-sqlsrv-br --name skillbridgedb --service-objective S0


5. **Criar regra de firewall para liberar acesso:**
   ```bash
   az sql server firewall-rule create --resource-group skillbridge-rg --server skillbridge-sqlsrv-br --name AllowAllIPs --start-ip-address 0.0.0.0 --end-ip-address 255.255.255.255



6. **copie os scripts de criação de tabelas do meu arquivo script_db.sql, entre depois no query editor do portal azure e cole os scripts la e execute**



7. **Criar acr com a opcao de admin user:**
   ```bash
   az acr create --resource-group skillbridge-rg --name rm557727 --sku Standard --location "East US" --admin-enabled true


   

8. **Criar App Service Plan:**
   ```bash
   az appservice plan create --name skillbridge-plan --resource-group skillbridge-rg --sku S1 --is-linux --location eastus




9. **Criar App Service**
   ```bash
   az webapp create --resource-group skillbridge-rg --plan skillbridge-plan --name skillbridge-app --deployment-container-image-name nginx
