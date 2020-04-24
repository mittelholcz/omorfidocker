# OmorfiDocker

Dockerfile az Omorfi projekthez.


## Használat

- `make build`: image builelése, kell a továbbiakhoz, sokáig tart
- `make run`: elindítja az OmorfiDocker-t, ad egy promptot, ahol látjuk az
  OmorfiDocker gyökérkönyvtárát és a konténeren belül adhatjuk ki a
  parancsokat. Példa (a `data/out` fájl a `root` felhasználóé lesz!):
    ```txt
    myuser@~/omorfidocker$ mkdir -p data/
    myuser@~/omorfidocker$ cp ~/mydata/inp data/
    myuser@~/omorfidocker$ make run
    root@853d5aa1048c# omorfi-conllu.bash -X data/inp >data/out
    root@853d5aa1048c# exit
    myuser@~/omorfidocker$ ls data/
    inp  out
    ```
- `make CMD="omorfi-parancs <input"`: elindítja az OmirfiDocker-t és átadja
  neki a futtatandó parancsot az inputtal együtt, de nem fájlként, hanem
  STDIN-en! Azaz ez a megoldás nem fog működni azoknál a paracsoknál, amik
  mindenképp fájlt várnak és nem olvasnak a STDIN-ről. A legtöbb omorfi parancs
  szerencsére nem ilyen. Példa:
    ```txt
    myuser@~/omorfidocker$ make CMD="omorfi-conllu.bash -X <data/inp >data/out2"
    myuser@~/omorfidocker$ ls data/
    inp  out  out2
    ```