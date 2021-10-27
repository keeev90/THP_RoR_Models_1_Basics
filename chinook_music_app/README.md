# README

Exercices sur la BDD :

* NIVEAU FACILE

Quel est le nombre total d'objets Album contenus dans la base (sans regarder les id bien sûr) ?
  - Album.count 
  -> 347

Qui est l'auteur de la chanson "White Room" ?
  - Track.find_by(title: "White Room").artist
  -> Eric Clapton
  
Quelle chanson dure exactement 188133 milliseconds ?
  - Track.find_by(duration: 188133)
  -> Perfect - Alanis Morissette
  
Quel groupe a sorti l'album "Use Your Illusion II" ?
  - Album.find_by(title: "Use Your Illusion II").artist
  -> Guns N Roses

* NIVEAU MOYEN

Combien y a t'il d'albums dont le titre contient "Great" ? (indice)
  - Album.where("title like ?", "%Great%").count
  -> 13
  
Supprime tous les albums dont le nom contient "music".
  - Album.where("title like ?", "%music%").delete_all
  
Combien y a t'il d'albums écrits par AC/DC ?
  - Album.where(artist: "AC/DC").count
  -> 2
  
Combien de chanson durent exactement 158589 millisecondes ?
  - Track.where(duration: 158589).count
  -> 0

* NIVEAU DIFFICILE

puts en console tous les titres de AC/DC.
  - all_ACDC_tracks = Track.where(artist: "AC/DC")
    all_ACDC_tracks.each do |track|
      puts track.title
    end
  ->For Those About To Rock (We Salute You)
    Put The Finger On You
    Lets Get It Up
    Inject The Venom
    Snowballed
    Evil Walks
    C.O.D.
    Breaking The Rules
    Night Of The Long Knives
    Spellbound
    Go Down
    Dog Eat Dog
    Let There Be Rock
    Bad Boy Boogie
    Problem Child
    Overdose
    Hell Aint A Bad Place To Be
    Whole Lotta Rosie
        
puts en console tous les titres de l'album "Let There Be Rock".
  - tracks = Track.where(album: "Let There Be Rock")
    tracks.each do |track|
      puts track.title
    end
  ->Go Down
    Dog Eat Dog
    Let There Be Rock
    Bad Boy Boogie
    Problem Child
    Overdose
    Hell Aint A Bad Place To Be
    Whole Lotta Rosie
    
Calcule le prix total de cet album ainsi que sa durée totale (en minutes).
  - Track.where(album: "Let There Be Rock").sum(:price).round(2)
  -> 7.92$
  - tracks.sum(:duration)/60000
  -> 40
        
Calcule le coût de l'intégralité de la discographie de "Deep Purple".
  - Track.where(artist: "Deep Purple").sum(:price).round(2)
  -> 90.09$
        
Modifie (via une boucle) tous les titres de "Eric Clapton" afin qu'ils soient affichés avec "Britney Spears" en artist.
  - clapton_tracks = Track.where(artist: "Eric Clapton")
    clapton_tracks.each do |track|
      track.artist = "Britney Spears"
      track.save
    end    