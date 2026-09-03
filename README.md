# core-payments-demo

Aplicação legada **100% sintética** para demonstrar catálogo, ingestão, indexação vetorial, discovery arquitetural e SDD governado.

## Estrutura

- `src/cobol/PAYPROC.cbl` — programa principal de processamento de pagamento.
- `src/cobol/PAYVAL.cbl` — rotina de validação de transação.
- `src/copybooks/PAYREC.cpy` — layout de transação.
- `src/copybooks/CLIENTE.cpy` — layout de cliente.
- `src/copybooks/STATUS.cpy` — códigos de status.
- `jcl/PAYNIGHT.jcl` — job noturno que executa `PAYPROC`.
- `jcl/PAYRETRY.jcl` — job de reprocessamento que executa `PAYPROC`.

## Fluxo demonstrado

1. O job `PAYNIGHT` recebe transações no DD `PAYIN`.
2. `PAYPROC` lê cada registro usando `PAYREC`.
3. `PAYPROC` chama `PAYVAL` para validar a transação.
4. Transações aprovadas são gravadas em `PAYOUT`; rejeições, em `PAYERR`.
5. O job `PAYRETRY` permite reprocessamento de transações previamente rejeitadas.

## Uso na POC

- **ZIP:** envie `core-payments-demo.zip` na interface da aplicação.
- **Git:** inicialize/publice este diretório em um repositório sintético permitido e registre a URL/branch `main`.

Nenhuma credencial, dado de cliente, endpoint real ou código da Fiserv está incluído.
