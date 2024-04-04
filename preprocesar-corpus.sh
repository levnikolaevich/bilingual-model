cat News-Commentary.es-ru.ru | sed -re "s/^\s+//g" | sed -re "s/\s+$//g" > News-Commentary.tmp.ru
cat News-Commentary.es-ru.es | sed -re "s/^\s+//g" | sed -re "s/\s+$//g" > News-Commentary.tmp.es

paste News-Commentary.tmp.es News-Commentary.tmp.ru | sort | uniq | awk -F$'\t' '{if (($1!="")&&($2!="")) print}' | shuf > News-Commentary.tmp.es-ru

awk -F'\t' '{print $1}' News-Commentary.tmp.es-ru | head -n 25000 > News-Commentary.ready.es
awk -F'\t' '{print $2}' News-Commentary.tmp.es-ru | head -n 25000 > News-Commentary.ready.ru