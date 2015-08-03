#/bin/ash

rozhrani=1
adresa=0x77

function GetPreasure()
{
	i2cset -y $rozhrani $adresa 0xF4 0x2E # spustíme měření teploty
	sleep 1
	T=`i2cget -y $rozhrani $adresa 0xF6 w` # vyšteme aktuální teplotu
	i2cset -y $rozhrani $adresa 0xF4 0xF4 # spustíme měření tlaku (nejdelší ale nejvyšší přesnost)
	sleep 1
	P0=`i2cget -y $rozhrani $adresa 0xF6`
	P1=`i2cget -y $rozhrani $adresa 0xF7`
	P2=`i2cget -y $rozhrani $adresa 0xF8`
	echo -e "$T;$P0;$P1;$P2"
}


