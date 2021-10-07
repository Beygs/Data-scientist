require "io/console"

def wait # Méthode similaire à celle présente dans le menu pour gérer la saisie utilisateur, mais seulement avec les touches Entrée (pour continuer) et q (pour quitter)
  print "\nAppuyez sur \e[1mEntrée\e[0m pour continuer"
  loop do
    case $stdin.getch
    when "\r"
      break
    when "q"
      exit
    end
  end
  return reset # Quand l'utilisateur a appuyé sur Entrée, j'appelle la méthode reset
end

def reset # Affichage du menu reset (similaire au menu)
  def display_reset(selected)
    system "clear"
    puts "Tu veux savoir autre chose ?"
    puts
    reset_options = ["Oui", "Non"]
    reset_options[selected] = "\e[7m#{reset_options[selected]}\e[0m"
    puts reset_options
    puts
  end

  selected = 0
  display_reset(selected)

  loop do
    case $stdin.getch
    when "\r"
      break
    when "q"
      exit
    when "\e"
      case $stdin.getch
      when "["
        case $stdin.getch
        when "A" 
          selected = selected == 0 ? 1 : 0
          display_reset(selected)
        when "B" 
          selected = selected == 1 ? 0 : 1
          display_reset(selected)
        end
      end
    end
  end

  return selected == 1
end