=begin
input: an array of strings (encrypted names by rot13)
output: another array of decrypted strings
data:
arr1 = [a,b,c,d,e,f,g,h,i,j,k,l.m]
arr2 = [n,o,p.q.r.s.t.u.v.w.x.y.z]
if "h" is in arra1
  "h" is replaced with arr2[arr1.index("h")]
elsif "h" is in arra2
  "h" is replaced with arr1[arr2.index("h")]
else:
  no replacement
=end

def decrypt_word(word)
  alphabets1 = %w(a b c d e f g h i j k l m A B C D E F G H I J K L M)
  alphabets2 = %w(n o p q r s t u v w x y z N O P Q R S T U V W X Y Z)
  word.split("").map do |letter|
    if alphabets1.include?(letter)
      alphabets2[alphabets1.index(letter)]
    elsif alphabets2.include?(letter)
      alphabets1[alphabets2.index(letter)]
    else
      letter
    end
  end.join
end

def decrypt_name_list(arr)
  arr.map do |word|
    decrypt_word(word)
  end
end



# transform given list to array
output = <<-HEREDOC
Nqn Ybirynpr
Tenpr Ubccre
Nqryr Tbyqfgvar
Nyna Ghevat
Puneyrf Onoontr
Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv
Wbua Ngnanfbss
Ybvf Unvog
Pynhqr Funaaba
Fgrir Wbof
Ovyy Tngrf
Gvz Orearef-Yrr
Fgrir Jbmavnx
Xbaenq Mhfr
Fve Nagbal Ubner
Zneiva Zvafxl
Lhxvuveb Zngfhzbgb
Unllvz Fybavzfxv
Tregehqr Oynapu
HEREDOC

name_list = output.split("\n")

puts decrypt_name_list(name_list)
