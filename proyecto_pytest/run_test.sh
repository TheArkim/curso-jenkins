#!/bin/bash

echo "Activando el entorno virtual"
if [ ! -d venv ]; then
    python3 -m venv venv
fi

if [ -f "venv/bin/activate" ]; then
    source venv/bin/activate
elif [ -f "venv/Scripts/activate" ]; then
    source venv/Scripts/activate
else
    echo "Error: no se pudo activar el entorno virtual"
    exit 1
fi

echo "instalando dependencias"
pip install --upgrade pip --break-system-packages
pip install -r requirements.txt --break-system-packages

mkdir -p reports

echo "Ejecutando pruebas"
venv/bin/python -m pytest tests/ --junitxml=reports/test-results.xml --html=reports/test-results.html --self-contained-html

echo "Puebas finalizadas. Reportes en reports/"