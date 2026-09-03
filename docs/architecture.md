# Arquitetura sintética

`PAYNIGHT` e `PAYRETRY` executam o programa COBOL `PAYPROC`. O programa usa os copybooks `PAYREC`, `CLIENTE` e `STATUS`, e chama `PAYVAL`. A rotina de validação classifica montantes inválidos e moedas não suportadas como rejeições.

Este documento é deliberadamente curto: o discovery deve obter as relações principalmente a partir de código e JCL.
