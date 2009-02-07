class String

# based on http://codesnippets.joyent.com/posts/show/451
# and http://snippets.dzone.com/posts/show/2384
# although should be using http://trac.wordpress.org/browser/trunk/wp-includes/formatting.php#L437


  def remove_accents
    str = String.new(self)
    accents = {
      ['á','à','â','ä','ã'] => 'a',
      ['Ã','Ä','Â','À','Á'] => 'A',
      ['æ'] => 'oe',
      ['Æ'] => 'AE',
      ['é','è','ê','ë'] => 'e',
      ['Ë','É','È','Ê'] => 'E',
      ['í','ì','î','ï'] => 'i',
      ['Ï','Î','Ì','Í'] => 'I',
      ['ó','ò','ô','ö','õ'] => 'o',
      ['Õ','Ö','Ô','Ò','Ó'] => 'O',
      ['ú','ù','û','ü'] => 'u',
      ['Ú','Û','Ù','Ü'] => 'U',
      ['ç'] => 'c',
      ['Ç'] => 'C',
      ['ñ'] => 'n',
      ['Ñ'] => 'N',
      ['ß'] => 'ss'
      }
    accents.each do |ac,rep|
      ac.each do |s|
        str = str.gsub(s, rep)
      end
    end
    str
  end
end
