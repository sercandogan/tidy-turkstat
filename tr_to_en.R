# TURKISH CHARACTERS TO ENGLISH CHARACTERS 

tr_to_en <- function(datafile){
  turkish_letters <- c("Ç","Ş","Ğ","İ","Ü","Ö","ç","ş","ğ","ı","ü","ö")
  english_letters <- c("C","S","G","I","U","O","c","s","g","i","u","o")
  datafile <- mgsub(turkish_letters,english_letters,datafile)
  return(datafile)
}



# Multiple gsub function

mgsub <- function(pattern, replacement, x, ...) {
  n = length(pattern)
  if (n != length(replacement)) {
    stop("pattern and replacement do not have the same length.")
  }
  result = x
  for (i in 1:n) {
    result <- gsub(pattern[i],replacement[i],result)
  }
  return(result)
}