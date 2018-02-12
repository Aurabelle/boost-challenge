require_relative "../atbash.rb"

RSpec.describe Decryptor do
  let (:cipher) { 'oephjizkxdawubnytvfglqsrcm' }
  let (:encrypted_text) { 'kjwwn' }
  let(:decryptor) { Decryptor.new(cipher: cipher, encrypted_text: encrypted_text) }

  describe "#run_decryption" do
    subject { decryptor.original_text }
    before  { decryptor.run_decryption }

    it { is_expected.to eq("hello") }
  end
end
