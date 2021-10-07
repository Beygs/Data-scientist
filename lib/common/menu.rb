# Je charge la librairie IO::Console qui va me permettre de gérer les entrées utilisateurs (plus puissant que gets.chomp, me permets de gérer l'usage des flèches du clavier et de la touche Entrée)
require "io/console"

def menu(actions_list, welcome)

  def display_menu(actions_list, selected, welcome)
    # Nettoie l'écran du terminal
    system "clear"
    # Condition qui me permet d'afficher le message de bienvenue (lors de la première exécution) ou l'autre message
    if welcome
      puts "SALUUUUUUUT ! Bienvenue dans cet INCROYABLE menu ! \n\e[94mFaîtes votre choix avec les flèches du haut et du bas de votre clavier et appuyez sur Entrée pour valider !\nSi vous voulez quitter ce programme, vous pouvez appuyer sur la touche q.\e[0m"
    else
      puts "Re ! Tu veux savoir quoi maintenant ?\n\e[94mPetit rappel :\nFaîtes votre choix avec les flèches du haut et du bas de votre clavier et appuyez sur Entrée pour valider !\nSi vous voulez quitter ce programme, vous pouvez appuyer sur la touche q.\e[0m"
    end
    puts
    # Je prends mon hash actions_list et formate ses valeurs pour avoir un affichage plus propre
    actions_display = actions_list.values.each_with_index.map{|action, i| action = "  #{i + 1} - #{action}"}
    # J'inverse les couleurs de l'action actuellement sélectionnée par l'utilisateur
    actions_display[selected] = "\e[7m#{actions_display[selected]}\e[0m"
    # Affichage du menu
    puts actions_display
    puts
  end

  selected = 0 # Initialisation de la variable selected, qui est de base sur le premier élément (index 0)
  display_menu(actions_list, selected, welcome) # Appel à la méthode display_menu avec en arguments ma liste d'actions (qui vient elle-même du fichier principal), la variable selected et le boolean welcome

  # Boucle qui tourne le temps que je ne lui dit pas de s'arrêter
  loop do
    case $stdin.getch # Check l'entrée utilisateur
    when "\r" # Si l'utilisateur clique sur Entrée, la boucle s'arrête (break) et le programme continue son exécution
      break
    when "q" # Si l'utilisateur appuie sur le touche q, le programme s'arrête totalement
      exit
    when "\e" # Si j'ai un caractère d'échappement (pour les touches qui ne sont pas des lettres)
      case $stdin.getch # Je check l'entrée utilisateur
      when "[" 
        case $stdin.getch
        when "A" # Correspond à la touche flèche du haut
          selected = selected == 0 ? 0 : selected - 1 # Je change la valeur de selected (-1) si elle n'est pas égale à 0 (sinon elle reste 0)
          display_menu(actions_list, selected, welcome) # Réaffichage du menu avec la valeur de selected actualisée
        when "B" # Correspond à la touche flèche du bas
          selected = selected == actions_list.length - 1 ? actions_list.length - 1 : selected + 1 # Même chose que pour la flèche du haut mais inversé
          display_menu(actions_list, selected, welcome) 
        end
      end
    end
  end

  return actions_list.keys[selected] # Je retourne le nom de la méthode que je dois appliquer
end