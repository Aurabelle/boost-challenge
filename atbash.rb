class Atbash
  CIPHER = 'oephjizkxdawubnytvfglqsrcm'
  ENCRYPTED_TEXT = 'knlfgnb, sj koqj o yvnewju'

  def initialize
    Decryptor.new(cipher: CIPHER, encrypted_text: ENCRYPTED_TEXT ).run_decryption
  end
end

class Decryptor
  ALPHABET_CONSTANT = 'abcdefghijklmnopqrstuvwxyz'

  attr_reader :original_text

  def initialize(cipher:, encrypted_text:)
    @cipher = cipher
    @encrypted_text = encrypted_text
    @original_text = ''
  end

  def run_decryption
    decoder = Hash[@cipher.chars.zip(ALPHABET_CONSTANT.chars)]
    remove_punctuation

    @original_text = decrypt(decoder).join

    print_solution
  end

  def decrypt(decoder)
    @encrypted_text.chars.map{ |char| decoder[char] }
  end

  def remove_punctuation
    @encrypted_text.downcase.gsub(/[^\w\s\d]/, '')
  end

  def print_solution
    puts "Solution: #{@original_text}"
  end
end

Atbash.new
