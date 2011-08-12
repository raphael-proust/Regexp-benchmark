for i in $(ls data/) ; do
sed "s/%%FILE%%/data\/$i/" plot.plt | gnuplot -persist
done

