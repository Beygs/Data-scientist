# Je rajoute le dossier au load path (les endroits dans lesquels ruby va regarder s'il cherche un fichier) pour pouvoir utiliser du code d'autres fichiers dans mon programme
$LOAD_PATH.unshift(File.dirname(__FILE__))

# Je charge les fichiers extérieurs dans lesquels j'ai le reste de mon code
require "common/menu"
require "common/reset"
require "journalists/handles"
require "journalists/actions"

# La focntion perform permets de lancer mon programme
def perform (welcome = true)
  # Je fais appel à la méthode menu (située dans le fichier ./common/menu.rb) qui va afficher mon menu et retourner l'action qui doit être effectuée sur le tableau d'handles
  # Le résultat est stocké dans action
  action = menu(HANDLES_ACTIONS, welcome)
  # Je fais à la méthode do, située dans la classe de mon tableau, qui va effectuer l'action sélectionnée par l'utilisateur
  puts HANDLES_ARRAY.do(action)
end

# Initialisation du programme, je lance la méthode perform
perform

# Boucle qui tourne tout le long du programme, et qui s'arrête seulement si l'utilisateur sélectionne "Non" dans le menu reset
loop do
  break if wait
  # L'argument passé à perform me permets de spécifier si le menu affiche le message de bienvenue ou non
  perform(false)
end