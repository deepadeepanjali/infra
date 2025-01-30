keyvault = "kv-my-3210"
resourcegroup = "rg-my"   


config = {
   "bot1" = {
     botname = "botA"
     foldername ="cust1"
     kv_secret_rbac = {
         bot_owner = {
          object_id = ""
          role_name = "Key Vault Secret Officer"
         }
         devops = {
          object_id = ""
          role_name = "Key Vault Secret User"
         }
     }
   }
  }  
