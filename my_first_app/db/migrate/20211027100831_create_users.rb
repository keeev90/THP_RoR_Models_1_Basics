### CREATION D'UNE TABLE ET DE SON MODEL ###
# cmd $ rails generate model migration Users : 
# 1. création automatique d'une table users (à compléter directement dans le fichier AAAAMMDDHHMMSS_nom_migration.rb créé)
# 2. création d'un model User dans le dossier app/models (à compléter directement dans le fichier user.rb créé)
# Résultat : une table est générée mais non migrée (en statut down)

class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t| #Le nom d'une table (définie dans une migration) sera toujours en pluriel snake_case. 
      t.string :email #ajout d'un attribut email (une colonne de ma table) de type string
      t.string :first_name
      t.string :last_name
      t.boolean :is_admin
      t.timestamps
    end
  end
end

### MIGRATION ###
# cmd $ rails db:migrate : execution exécute TOUTES les migrations du dossier db/migrate qui sont en statut down. 
# >>> création/alimentation automatique d'un fichier schema.rb dans le dossier migrate : liste l'ensemble des tables SQL qui sont créées suite à tes migrations et affichent toutes leurs colonnes
# cmd $ rails db:migrate:status : te sort un joli tableau pour voir où tu en es dans tes migrations entre les up et les down. 
# cmd $ rails db:rollback : revient en arrière sur la dernière migration. Très pratique quand on a fait une coquille qu'on détecte de suite.
# cmd $ rails db:migrate VERSION=20180905201547 : annule toutes les migrations postérieures à celle portant le nom "20180905201547".

# !!! WARNING !!! 
# Attention à ne JAMAIS changer ni supprimer un fichier de migration à partir du moment où il est en statut up (seulement en statut down > utiliser cmd status pour vérifier).
# Si jamais tu as déjà créé la table en amont du model, tu dois supprimer la migration que Rails génère automatiquement mais bien sûr AVANT qu'elle n'ait été passée (quand elle est encore down) 

### NEXT STEP : CREATION D'UN MODEL CORRESPONDANT A CHAQUE TABLE >>> dans dossier app/models ###
# Rôle de chaque model : 
# Les méthodes de classe qu'on veut pouvoir utiliser sur les instances ;
# Les validations qui sont les conditions à remplir pour qu'une entrée soit considérée comme OK et sauvegardée (ex : impossible de créer un utilisateur si le champ e-mail est vide) ;
# Les liens entre les différentes tables / models (1-N, N-N, etc.) 

# Conventions :
# Chaque entrée de la table SQL users est en fait une instance de la classe Ruby User.
# On peut créer une nouvelle entrée en BDD en faisant les lignes de Ruby : julie = User.new("julie", "julie@gmail.com") puis julie.save. La table users est alors complétée en BDD d'une nouvelle entrée avec les bonnes infos.
# Chaque colonne de la table est automatiquement une variable d'instance qui est déjà en attr_accessor. Par exemple si je fais en Ruby julie.email, je récupère bien le contenu de la colonne email de cet objet (par ex : "julie@gmail.com"). Et si je fais en Ruby julie.email = nil, puis julie.save, la colonne est bien modifiée en BDD.

### VISUALISER UNE BDD ###
# sur VSC via l'extension SQLITE EXPLORER
# directement dans le terminal via la gem table_print, en executant la cmd $ tp NomDeLaTable.all