@echo off
cls

set "BASE_DIR=C:\GerenciadorDeDados"
set "LOG_FILE=%BASE_DIR%\Logs\registro.log"
set "SUMARIO_FILE=%BASE_DIR%\sumario_operacao.txt"
set "DATA_HORA=%date% %time%"

echo [%DATA_HORA%] >> "%LOG_FILE%"

echo ====================================
echo INICIANDO SETUP DE DIRETORIOS
echo ====================================
mkdir "%BASE_DIR%" >nul 2>&1
mkdir "%BASE_DIR%\Arquivos" >nul 2>&1
mkdir "%BASE_DIR%\Logs" >nul 2>&1
mkdir "%BASE_DIR%\Storage" >nul 2>&1
echo [%DATA_HORA%] Estrutura de diretorios base criada. >> "%LOG_FILE%"


echo ====================================
echo CRIANDO ARQUIVOS DE DADOS
echo ====================================
echo # Relatorio Gerencial > "%BASE_DIR%\Arquivos\relatorio_gerencial.txt"
echo item;descricao;status > "%BASE_DIR%\Arquivos\inventario.csv"
echo [settings] >> "%BASE_DIR%\Arquivos\app_config.ini"
echo versao=1.0.0 >> "%BASE_DIR%\Arquivos\app_config.ini"
echo caminho_log="%LOG_FILE%" >> "%BASE_DIR%\Arquivos\app_config.ini"
echo [%DATA_HORA%] Arquivos de configuracao e dados criados. >> "%LOG_FILE%"


echo ====================================
echo EXECUTANDO ROTINA DE BACKUP
echo ====================================
xcopy "%BASE_DIR%\Arquivos" "%BASE_DIR%\Storage" /S /E /Y /I >nul
echo [%DATA_HORA%] Backup dos Arquivos concluido. >> "%LOG_FILE%"
echo [%DATA_HORA%] Log de Backup concluido. > "%BASE_DIR%\Storage\backup_timestamp.log"


echo ====================================
echo GERANDO SUMÁRIO DE EXECUÇÃO
echo ====================================
echo SUMÁRIO DE EXECUÇÃO - Rotina de Gerenciamento > "%SUMARIO_FILE%"
echo ==================================== >> "%SUMARIO_FILE%"
echo DIRETÓRIO BASE: %BASE_DIR% >> "%SUMARIO_FILE%"
echo ROTINA INICIADA EM: %DATA_HORA% >> "%SUMARIO_FILE%"
echo DIRS CRIADOS: 4 (Base, Arquivos, Logs, Storage) >> "%SUMARIO_FILE%"
echo ARQUIVOS GERADOS: 3 (relatorio_gerencial.txt, inventario.csv, app_config.ini) >> "%SUMARIO_FILE%"
echo STATUS: SUCESSO >> "%SUMARIO_FILE%"


echo ====================================
echo ROTINA DE GERENCIAMENTO CONCLUÍDA!
echo O sumário pode ser encontrado em: %SUMARIO_FILE%
echo ====================================
pause