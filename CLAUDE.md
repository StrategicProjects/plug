# plug

Pacote R (CRAN) de acesso à API do Plug: credenciais e token no `keyring`, requisições com
`httr2`, consultas SQL (Microsoft SQL Server) montadas a partir de templates.

## Estrutura

- `R/plug.R` — funções exportadas: `plug_store_credentials()`, `plug_clear_credentials()`,
  `plug_get_valid_token()`, `plug_list_credentials()`, `plug_list_tokens()`,
  `plug_execute_query()`, `plug_download_base()`.
- `R/utils.R` — internos: acesso ao keyring (`plug_key_*`), requisição e erros HTTP
  (`plug_request()`, `plug_http_error()`), construção de SQL (`sql_interpolate()`,
  `sql_quote_literal()`, `sql_quote_identifier()`, `is_sql_object_name()`).
- `tests/testthat/` — API simulada com `httr2::local_mocked_responses()` e keyring em memória
  (`local_plug_keyring()` em `helper.R`).
- `docs/` é saída do pkgdown, ignorada pelo git.

## Comandos

```bash
Rscript -e 'roxygen2::roxygenise()'   # NAMESPACE e man/ são gerados; edite o roxygen em R/
Rscript -e 'devtools::test()'
Rscript -e 'rmarkdown::render("README.Rmd", quiet = TRUE)' && rm -f README.html
R CMD build . && R CMD check --as-cran plug_*.tar.gz   # rode fora do repo (scratchpad)
```

## Armadilhas

- **Nunca rode exemplo, teste ou check que chame o keyring real.** As entradas
  `PlugAPI_Username`, `PlugAPI_Password`, `PlugAPI_Token`, `PlugAPI_Token_Expiration` e
  `PlugAPI_Token_Endpoint` (usuário `global`) ficam no keychain do macOS. Exemplos e testes usam
  `options(keyring_backend = "env")`. Um check da versão 0.1.0 (por exemplo do tarball do CRAN)
  sobrescreve as credenciais reais com `myusername`/`mypassword` — foi o que aconteceu em
  2026-09-29.
- **O backend `env` do keyring não falha ao apagar entrada inexistente**; por isso
  `plug_key_delete()` confere a existência antes.
- **Não use `glue::glue_sql(.con = NULL)`**: falha em qualquer placeholder. A interpolação é
  própria (`sql_transformer()`), com a mesma sintaxe: `{x}`, `{x*}`, `` {`x`} ``, `{I(x)}`.
- **`paste0()` com vetor de comprimento zero devolve `""`**, não `character()` —
  `sql_quote_literal()` trata o caso antes de citar.
- `plug_get_valid_token()` não lança erro por falha de rede ou credencial: mostra a mensagem e
  devolve `NULL` (política do CRAN para recursos de internet). As funções de consulta lançam erro.
- `https://monitoramento.sepe.pe.gov.br` dá timeout no check de URLs; não o use no README nem
  no DESCRIPTION (continua só no `_pkgdown.yml`).
- A NOTE "HTML Tidy" do check é local desta máquina, não aparece no CRAN.

## Submissão ao CRAN

- Nomes de software entre aspas simples no `Title`/`Description` (`'Plug'`, `'API'`, `'SQL'`).
- Atualize `Version`, `Date`, `NEWS.md` e `cran-comments.md`; o mantenedor é
  `leite@castlab.org`, que recebe o link de confirmação.
- `devtools::submit_cran()` é interativo; sem terminal interativo use
  `devtools:::upload_cran(".", "<tarball>")`, que não grava o arquivo `CRAN-SUBMISSION`.
