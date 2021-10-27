### GENERATION D'UN MODEL CORRESPONDANT A UNE TABLE ###
# cmd $ rails g model User 

# !!! WARNING !!! 
# A FAIRE UNIQUEMENT si le model n'a pas déjà été créé en même que la création de la table (via cmd $ rails generate model migration Users )
# Pense bien à supprimer le fichier de migration (vide) qui est créé en même temps que le model (cette migration est inutile car la table existe déjà, supprime le fichier avant de le passer en up).

### LANCEMENT CONSOLE RAILS POUR TESTER LA CREATION D'INSTANCES VIA UN MODEL ###
# $ rails console : lancement d'une console Rails dans laquelle tu vas pouvoir tester la création d'instances via tes models ($ exit pour la quitter)
# CREATE >>> Créer des entrées en base via le model, par ex : my_user = User.create(first_name: "Félix") permet d'enregister une info en BDD (combine les méthodes new et save).
# READ >>> Lire des entrées en base via le model, par ex : u = User.find(3) trouve l'utilisateur avec id = 3 puis u.first_name affiche le prénom
# UPDATE >>> Modifier les entrées en base via le model, par ex : my_user.update(first_name: "Féfé" permet d'enregistrer une modification en BDD (ou my_user.first_name = "Féfé" puis my_user.save)
#        >>> Modifier toutes les entrées : User.where(first_name: "XXX").update_all(first_name: "YYY")
# DELETE >>> Supprimer les entrées en base via le model, par ex : user_1 = User.find(1) puis user_1.destroy
#        >>> Supprimer toutes les entrées : User.delete_all

# !!! WARNING !!!
# La console est branchée à ta BDD ! Toute instance que tu vas sauver ou détruire le sera aussi sur la BDD de ton application Rails
# Pour tester des models à la volée en effançant automatiquement - à la sortie de la console - toutes les modifications effectuées sur la BDD : lancer la console en mode sandbox grâce à l'option $ rails console --sandbox

class User < ApplicationRecord
end

