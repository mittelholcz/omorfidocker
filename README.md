# OmorfiDocker

Dockerfile az [Omorfi](https://github.com/flammie/omorfi) projekthez.

## Telepítés

```sh
git clone --recurse-submodules https://github.com/mittelholcz/omorfidocker.git
cd omorfidocker/
make build
```

## Használat

- `make run`: elindítja az OmorfiDocker-t, ad egy promptot, ahol látjuk az
  *omorfidocker/data/* könyvtár tartalmát és a konténeren belül adhatjuk ki a
  parancsokat. Példa:
    ```txt
    myuser@~/omorfidocker$ cp ~/mydata/inp data/
    myuser@~/omorfidocker$ make run
    root@853d5aa1048c# omorfi-conllu.bash -X inp >out1
    root@853d5aa1048c# exit
    myuser@~/omorfidocker$ ls data/
    inp  out1
    ```
- `make CMD="omorfi-parancs <input"`: elindítja az OmirfiDocker-t és átadja
  neki a futtatandó parancsot az inputtal együtt, de nem fájlként, hanem
  STDIN-en. Ez a megoldás nem fog működni azoknál a paracsoknál, amik
  mindenképp fájlt várnak és nem olvasnak a STDIN-ről. A legtöbb omorfi parancs
  szerencsére nem ilyen. Példa:
    ```txt
    myuser@~/omorfidocker$ make CMD="omorfi-conllu.bash -X <data/inp >data/out2"
    myuser@~/omorfidocker$ ls data/
    inp  out1  out2
    ```
