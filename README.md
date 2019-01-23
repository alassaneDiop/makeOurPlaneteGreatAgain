# Execution Docker


## Dockerfile

Executer le dockerfile et installer toutes les dépendances
```bash
sudo docker-compose run
```

## Démarrer le container db

```bash
sudo docker-compose up db
```

## Recréer les données de la base de données
Se placer éventuellement sur un autre terminal

```bash
sudo docker exec -it mysql-container /bin/bash
mysql -u root -p makeOurPlanetGreatAgain < docker-entrypoint-initdb.d/dump.sql
```
Sortir du terminal
```bash
exit
```

## Démarrer le container web
```bash
sudo docker-compose up web
```

## Se rendre sur le site
127.0.0.1:8000

[MakeOurPlanetGreatAgain](http://localhost:8000)


# Informations de connexions

### Administrateur

	
* login :  admin
* mp : djangoadmin


### Utilisateur authentifié sur le site
* login : Alou
* mp : tototata

---
* login : Sekou
* mp : djangouser
---
* login : Salomon
* mp : cisse2019
---
* login : uti
* mp : ituituitu


### Règles de gestion

* Tout utilisateur du site est auteur, c'est à dire qu'il peut publier des projets, commenter des projets et financer des projets
* Pour tout financement d'un projet par un utilisateur (quelques soit le montant), les données de ce utilisateur sont mises à jour. Dorenavant il aura le status financeur
* Quand un utilisateur commente un projet, si son status (is_evaluateur_profil) est activé, il pourra évaluer le projet en attribuant une note qui sera visible à coté de son commentaire; sinon cette note ne sera pas affiché et vaut 0 en base de données.
* Quand un utilisateur commente un projet, seules les autres utilisateurs peuvent aimer ce commentaire.
* Si le nombre de commentaire mise par un utilisateur est supérieur à 1, et que la somme des likes données à ces commentaires dépassent 1, son status is_evaluateur_profil est mise à Vrai, c'est à dire que dorenavant il pourra donner une note qui sera visible par les autres utilisateurs. Cette règle de gestion peut être modifié, au moins 10 likes pour 2 projets différents par exemple.
