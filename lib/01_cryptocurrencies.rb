# Même code que dans le fichier 00_journalists.rb adapté pour travailler avec le hash cryptocurrencies
$LOAD_PATH.unshift(File.dirname(__FILE__))

require "common/menu"
require "common/reset"
require "cryptocurrencies/crypto"
require "cryptocurrencies/actions"

def perform (welcome = true)
  action = menu(CRYPTO_ACTIONS, welcome)
  puts CRYPTO.do(action)
end

perform

loop do
  break if wait
  perform(false)
end